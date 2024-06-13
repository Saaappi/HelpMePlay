local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local heirloomButton
local index = 1

-- Automatically equip the heirlooms as they're created for
-- a complete automated experience.
local function EquipHeirloom(itemLink, slot)
    -- In case the player enters combat after creating an heirloom
    -- but before this function is called, then trigger a timer.
    if UnitAffectingCombat("player") then C_Timer.After(1, function() EquipHeirloom(itemLink) end) end

    -- Get the provided item link's ID. This is necessary for comparison
    -- to items in the inventory. For some reason item link comparison is
    -- busted. :)
    local itemID = C_Item.GetItemInfoInstant(itemLink)

    for bagID = 0, 4 do
        local numSlots = C_Container.GetContainerNumSlots(bagID)
        if numSlots > 0 then
            for slotID = 1, numSlots do
                local containerItemID = C_Container.GetContainerItemID(bagID, slotID)
                if containerItemID then
                    if containerItemID == itemID then
                        C_Item.EquipItemByName(itemLink, slot)
                    end
                end
            end
        end
    end
end

local function CreateHeirloom(classID)
    -- Set the flag that the heirloom button was used for the current character.
    if HelpMePlayDB_Character["UsedHeirloomButton"] == nil or HelpMePlayDB_Character["UsedHeirloomButton"] == false then
        HelpMePlayDB_Character["UsedHeirloomButton"] = true
    end

    -- Create the heirloom at the index.
    C_Heirloom.CreateHeirloom(HelpMePlayDB["Heirlooms"][classID][index].itemID)

    C_Timer.After(1.25, function()
        -- Try to equip the heirloom.
        EquipHeirloom(HelpMePlayDB["Heirlooms"][classID][index].itemLink, HelpMePlayDB["Heirlooms"][classID][index].slot)

        -- Increment the index. Hide the button if the condition
        -- is met.
        index = index + 1
        if index == (#HelpMePlayDB["Heirlooms"][classID] + 1) then
            heirloomButton:Hide()
            return
        end

        heirloomButton:SetAttribute("type", "item")
        heirloomButton:SetAttribute("item", HelpMePlayDB["Heirlooms"][classID][index].itemLink)
        heirloomButton.texture:SetTexture(C_Item.GetItemIconByID(HelpMePlayDB["Heirlooms"][classID][index].itemLink))
        GameTooltip:SetHyperlink(HelpMePlayDB["Heirlooms"][classID][index].itemLink)
    end)
end

addon.CreateHeirloomButton = function(classID)
    if addon.playerLevel <= 10 and (not HelpMePlayDB_Character["UsedHeirloomButton"]) and (PlayerGetTimerunningSeasonID() ~= 1) then
        if not heirloomButton and (#HelpMePlayDB["Heirlooms"][classID] > 0) then
            heirloomButton = CreateFrame("Button", addonName .. "HeirloomSecureButton", UIParent, "SecureActionButtonTemplate")
            heirloomButton:ClearAllPoints()
            heirloomButton:SetSize(48, 48)
            heirloomButton:SetPoint("CENTER", UIParent, "CENTER", 100, 0)

            heirloomButton.texture = heirloomButton:CreateTexture()
            heirloomButton.texture:SetTexture(C_Item.GetItemIconByID(HelpMePlayDB["Heirlooms"][classID][1].itemID))
            heirloomButton.texture:SetAllPoints()

            heirloomButton.highlightTexture = heirloomButton:CreateTexture()
            heirloomButton.highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
            heirloomButton.highlightTexture:SetSize(48, 48)
            heirloomButton:SetHighlightTexture(heirloomButton.highlightTexture, "ADD")

            heirloomButton.pushedTexture = heirloomButton:CreateTexture()
            heirloomButton.pushedTexture:SetTexture("Interface\\Buttons\\UI-Quickslot-Depress")
            heirloomButton.pushedTexture:SetSize(48, 48)
            heirloomButton:SetPushedTexture(heirloomButton.pushedTexture)

            heirloomButton:RegisterForClicks("AnyUp", "AnyDown")
            heirloomButton:SetMouseClickEnabled(true)
            heirloomButton:SetAttribute("type", "item")
            heirloomButton:SetAttribute("item", HelpMePlayDB["Heirlooms"][classID][1].itemLink)

            heirloomButton:SetScript("PreClick", function(self, button, isDown)
                if not isDown then CreateHeirloom(classID) end
            end)
            heirloomButton:SetScript("OnEnter", function()
                GameTooltip:SetOwner(heirloomButton, "ANCHOR_CURSOR_RIGHT")
                GameTooltip:SetHyperlink(HelpMePlayDB["Heirlooms"][classID][index].itemLink)
            end)
            heirloomButton:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)
        end
    end
end

eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        -- Unregister the event for performance.
        eventHandler:UnregisterEvent("PLAYER_LOGIN")

        --C_Timer.After(1, function() addon.CreateHeirloomButton(addon.playerClassID) end)
    end
end)