local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local heirloomButton
local index = 1

-- Automatically equip the heirlooms as they're created for
-- a complete automated experience.
local function EquipHeirloom(itemLink)
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
                        C_Item.EquipItemByName(itemLink)
                    end
                end
            end
        end
    end
end

local function CreateHeirloom(classID)
    -- Set the flag that the heirloom button was used for the current character.
    --[[if HelpMePlayDB_Character["UsedHeirloomButton"] == nil or HelpMePlayDB_Character["UsedHeirloomButton"] == false then
        HelpMePlayDB_Character["UsedHeirloomButton"] = true
    end]]

    -- Create the heirloom at the index.
    C_Heirloom.CreateHeirloom(HelpMePlayDB["Heirlooms"][classID][index].itemID)

    C_Timer.After(1, function()
        -- Try to equip the heirloom.
        EquipHeirloom(HelpMePlayDB["Heirlooms"][classID][index].itemLink)

        -- Increment the index. Hide the button if the condition
        -- is met.
        index = index + 1
        if index == (#HelpMePlayDB["Heirlooms"][classID] + 1) then
            heirloomButton:Hide()
            return
        end

        heirloomButton:SetAttribute("type", "item")
        heirloomButton:SetAttribute("item", HelpMePlayDB["Heirlooms"][classID][index].itemID)
        heirloomButton.texture:SetTexture(C_Item.GetItemIconByID(HelpMePlayDB["Heirlooms"][classID][index].itemID))
        GameTooltip:SetHyperlink("item:" .. HelpMePlayDB["Heirlooms"][classID][index].itemID)
    end)
end

addon.CreateHeirloomButton = function(classID)
    if addon.playerLevel <= 10 then
    --if addon.playerLevel <= 10 and (not HelpMePlayDB_Character["UsedHeirloomButton"]) then
        if not heirloomButton and (#HelpMePlayDB["Heirlooms"][classID] > 0) then
            heirloomButton = {
                name = addonName .. "HeirloomSecureButton",
                texture = C_Item.GetItemIconByID(HelpMePlayDB["Heirlooms"][classID][1].itemID),
                parent = UIParent,
                anchor = "CENTER",
                relativeAnchor = "CENTER",
                oX = 100,
                oY = 0,
                width = 48,
                height = 48,
                attribute = "item",
                attributeValue = HelpMePlayDB["Heirlooms"][classID][1].itemID,
                postClick = nil,
            }
            setmetatable(heirloomButton, { __index = HelpMePlay.Button })
            heirloomButton = heirloomButton:SecureButton()
            heirloomButton:SetScript("PostClick", function(self, button, isDown)
                if not isDown then CreateHeirloom(classID) end
            end)
            heirloomButton:SetScript("OnEnter", function()
                GameTooltip:SetOwner(heirloomButton, "ANCHOR_CURSOR_RIGHT")
                GameTooltip:SetHyperlink("item:" .. HelpMePlayDB["Heirlooms"][classID][1].itemID)
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

        C_Timer.After(1, function() addon.CreateHeirloomButton(addon.playerClassID) end)
    end
end)