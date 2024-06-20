local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local heirloomButton
local index = 1

local function CreateHeirloom(itemID)
    -- Set the flag that the heirloom button was used for the current character.
    --[[if HelpMePlayDB_Character["UsedHeirloomButton"] == nil or HelpMePlayDB_Character["UsedHeirloomButton"] == false then
        HelpMePlayDB_Character["UsedHeirloomButton"] = true
    end]]
end

addon.CreateHeirloomButton = function()
    if addon.playerLevel <= 10 and (not HelpMePlayDB_Character["UsedHeirloomButton"]) and (PlayerGetTimerunningSeasonID() ~= 1) then
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
                    if index <= LHMP:GetTableSize(HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID]) then
                        -- Create the heirloom.
                        C_Heirloom.CreateHeirloom(HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID][index].itemID)

                        -- Increment the index to get the next heirloom.
                        index = index + 1

                        if HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID][index] then
                            -- Set the attributes of the secure button.
                            heirloomButton:SetAttribute("type", "item")
                            heirloomButton:SetAttribute("item", HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID][index].itemLink)

                            -- Set the button's icon.
                            heirloomButton.icon:SetTexture(C_Item.GetItemIconByID(HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID][index].itemLink))

                            -- Set the button's item link.
                            GameTooltip:SetHyperlink(HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID][index].itemLink)
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

        C_Timer.After(1, function() addon.CreateHeirloomButton() end)
    end
    if event == "TRADE_SKILL_ITEM_CRAFTED_RESULT" then
        local data = ...
        if data then
            if C_Heirloom.IsItemHeirloom(data.itemID) then
                local numHeirlooms = LHMP:GetTableSize(HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID])
                if numHeirlooms and numHeirlooms <= 12 then
                    print("A")
                    -- If the player hasn't filled up their heirloom table for a given specialization, then
                    -- allow the item to be added to the end of the table.
                    table.insert(HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID], {itemLink = data.hyperlink, itemID = data.itemID})
                end
            end
        end
    end
end)