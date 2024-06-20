local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local heirloomButton
local index = 1
local numMaxHeirlooms = 12

local slotCounts = {
    [1] = 1,
    [2] = 1,
    [3] = 1,
    [5] = 1,
    [7] = 1,
    [11] = 2,
    [12] = 2,
    [13] = 2,
    [14] = 1,
    [16] = 1,
    [17] = 2,
}

local function GetTypeCount(typeID)
    local count = 0
    for _, heirloom in next, HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID] do
        local inventoryTypeID = C_Item.GetItemInventoryTypeByID(heirloom.itemID)
        if inventoryTypeID == typeID then
            count = count + 1
        end
    end
    return count
end

addon.CreateHeirloomButton = function()
    if PlayerGetTimerunningSeasonID() ~= 1 then
        if not heirloomButton and (LHMP:GetTableSize(HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID]) > 0) then
            -- Create the secure button...obviously.
            heirloomButton = addon.CreateSecureButton({
                name = format("%s%s", addonName, "HeirloomButton"),
                parent = UIParent,
                anchor = "CENTER",
                relativeAnchor = "CENTER",
                xOff = 100,
                yOff = 0,
                icon = C_Item.GetItemIconByID(HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID][index].itemLink)
            })

            -- Set the attributes of the secure button.
            heirloomButton:SetAttribute("type", "item")
            heirloomButton:SetAttribute("item", HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID][index].itemLink)

            heirloomButton:SetScript("PostClick", function(self, button, isDown)
                -- This code is fired after Blizzard executes their secure button
                -- code.
                if not isDown then
                    if index <= numMaxHeirlooms then
                        -- Create the heirloom.
                        C_Heirloom.CreateHeirloom(HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID][index].itemID)

                        -- Increment the index to get the next heirloom.
                        index = index + 1

                        if HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID][index] then
                            if HelpMePlayDB_Character["UsedHeirloomButton"] == nil or HelpMePlayDB_Character["UsedHeirloomButton"] == false then
                                HelpMePlayDB_Character["UsedHeirloomButton"] = true
                            end

                            -- Set the attributes of the secure button.
                            heirloomButton:SetAttribute("type", "item")
                            heirloomButton:SetAttribute("item", HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID][index].itemLink)

                            -- Set the button's icon.
                            heirloomButton.icon:SetTexture(C_Item.GetItemIconByID(HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID][index].itemLink))

                            -- Set the button's item link.
                            GameTooltip:SetHyperlink(HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID][index].itemLink)

                            if index == (numMaxHeirlooms + 1) then
                                heirloomButton:Hide()
                            end
                        else
                            heirloomButton:Hide()
                        end
                    else
                        heirloomButton:Hide()
                    end
                end
            end)
            heirloomButton:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
                GameTooltip:SetHyperlink(HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID][index].itemLink)
            end)
            heirloomButton:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)
        end
    end
end

eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:RegisterEvent("TRADE_SKILL_ITEM_CRAFTED_RESULT")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        -- Unregister the event for performance.
        eventHandler:UnregisterEvent("PLAYER_LOGIN")

        C_Timer.After(1, function()
            if LHMP:IsNewCharacter(addon.playerLevel, addon.playerClassID, addon.playerGUID, HelpMePlayDB["Characters"]) and HelpMePlayDB["UseHeirloomAutomation"] then
                C_Timer.After(1, function() addon.CreateHeirloomButton() end)
            end
        end)
    end
    if event == "TRADE_SKILL_ITEM_CRAFTED_RESULT" then
        local data = ...
        if data then
            if C_Heirloom.IsItemHeirloom(data.itemID) then
                local inventoryTypeID = C_Item.GetItemInventoryTypeByID(data.itemID)
                local numType = GetTypeCount(inventoryTypeID)
                if numType < slotCounts[inventoryTypeID] then
                    table.insert(HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID], {itemLink = data.hyperlink, itemID = data.itemID})
                end
            end
        end
    end
end)