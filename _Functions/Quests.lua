local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            -- How to handle completing a quest.
            function HelpMePlay.CompleteQuest()
                if HelpMePlayDB["AcceptAndCompleteQuests"] == false and HelpMePlayDB["AcceptAndCompleteAllQuests"] == false then return end

                C_Timer.After(addon.Constants["TIMER_DELAY"], function()
                    -- Check if the player is in combat. This will cause some trouble if they
                    -- are, so let's deal with it now.
                    if UnitAffectingCombat("player") then C_Timer.After(1, HelpMePlay.CompleteQuest) end

                    -- Determine if the player can dual wield. The specialization IDs
                    -- are stored in Data\Quests.lua.
                    local canDualWield = false
                    for _, specID in ipairs(addon.CanDualWield) do
                        if addon.playerSpecID == specID then
                            canDualWield = true
                        end
                    end

                    -- Collect all the player's equipped items. We'll convert these to item levels
                    -- shortly since we're only making a numeral comparison. A 0 means there isn't
                    -- an equipped item in that slot.
                    --
                    -- We intentionally ignore weapons (for now).
                    local equippedItems = {}
                    equippedItems[1] = GetInventoryItemLink("player", 1) or 0      -- Head
                    equippedItems[2] = GetInventoryItemLink("player", 2) or 0      -- Neck
                    equippedItems[3] = GetInventoryItemLink("player", 3) or 0      -- Shoulder
                    equippedItems[5] = GetInventoryItemLink("player", 5) or 0      -- Chest
                    equippedItems[6] = GetInventoryItemLink("player", 6) or 0      -- Waist
                    equippedItems[7] = GetInventoryItemLink("player", 7) or 0      -- Legs
                    equippedItems[8] = GetInventoryItemLink("player", 8) or 0      -- Feet
                    equippedItems[9] = GetInventoryItemLink("player", 9) or 0      -- Wrist
                    equippedItems[10] = GetInventoryItemLink("player", 10) or 0    -- Hands
                    equippedItems[11] = GetInventoryItemLink("player", 11) or 0    -- Finger1
                    equippedItems[12] = GetInventoryItemLink("player", 12) or 0    -- Finger2
                    equippedItems[13] = GetInventoryItemLink("player", 13) or 0    -- Trinket1
                    equippedItems[14] = GetInventoryItemLink("player", 14) or 0    -- Trinket2
                    equippedItems[15] = GetInventoryItemLink("player", 15) or 0    -- Back

                    -- Convert the equipped items into their item levels.
                    for inventorySlotID, value in pairs(equippedItems) do
                        if value ~= 0 then
                            local itemID = C_Item.GetItemInfoInstant(value)
                            local heirloomMaxLevel = select(10, C_Heirloom.GetHeirloomInfo(itemID))
                            local actualItemLevel = C_Item.GetDetailedItemLevelInfo(value)
                            if heirloomMaxLevel and (heirloomMaxLevel >= addon.playerLevel) then
                                -- If the player has an heirloom equipped in the slot, and they haven't
                                -- outleveled the heirloom, then set the itemlevel for that slot to 999
                                -- to prevent the item from being replaced.
                                actualItemLevel = 999
                            end
                            equippedItems[inventorySlotID] = actualItemLevel
                        end
                        print(inventorySlotID .. ": " .. value)
                    end

                    -- Setup a few necessary variables.
                    --[[local bestSellPrice = 0
                    local bestItemIndex = 0
                    local numQuestRewards = GetNumQuestRewards()
                    local numQuestChoices = GetNumQuestChoices()
                    if numQuestChoices > 1 or numQuestRewards > 1 then
                        if HelpMePlayDB["QuestRewardSelectionTypeID"] == 0 then return end

                        for index = 1, numQuestChoices do
                            if HelpMePlayDB["QuestRewardSelectionTypeID"] == 1 then -- Item Level
                                local itemLink = GetQuestItemLink("choice", index)
                                if itemLink then

                                end
                            elseif HelpMePlayDB["QuestRewardSelectionTypeID"] == 2 then -- Sell Price
                                local quantity = select(3, GetQuestItemInfo("choice", index))
                                local itemLink = GetQuestItemLink("choice", index)
                                if quantity and itemLink then
                                    local sellPrice = select(11, C_Item.GetItemInfo(itemLink))
                                    if sellPrice > 0 then
                                        sellPrice = sellPrice * quantity
                                        if sellPrice > bestSellPrice then
                                            bestSellPrice = sellPrice
                                            bestItemIndex = index
                                        end
                                    end
                                end
                            end
                        end

                        if bestItemIndex == 0 then
                            -- All items sell for the same value, so pick a random reward.
                            GetQuestReward(math.random(1, numQuestChoices))
                        end
                    elseif numQuestChoices == 1 or numQuestRewards == 1 then
                        GetQuestReward(1)
                    else
                        QuestFrameCompleteButton:Click()
                        QuestFrameCompleteQuestButton:Click()
                    end]]
                end)
            end

            -- Determines if an NPC is ignored or not.
            function HelpMePlay.IsQuestGiverIgnored(npcID)
                if addon.IgnoredQuestGivers[npcID] then
                    return true
                end
                return false
            end

            -- Unload the event for performance.
            eventHandler:UnregisterEvent("ADDON_LOADED")
        end
    end
end)