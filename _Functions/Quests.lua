local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

-- Iterates through the player's inventory to check for the
-- quest reward they just received. If it's found, then equip
-- the item.
local function CheckForQuestReward(itemLink)
    -- The item reward we received should be equippable. If it's not,
    -- then don't bother iterating the player's inventory.
    if not C_Item.IsEquippableItem(itemLink) then return end

    -- In case the player enters combat after completing the quest
    -- but before this function is called, then trigger a timer.
    if UnitAffectingCombat("player") then C_Timer.After(1, function() CheckForQuestReward(itemLink) end) end

    for bagID = 0, 4 do
        local numSlots = C_Container.GetContainerNumSlots(bagID)
        if numSlots > 0 then
            for slotID = 1, numSlots do
                local containerItemLink = C_Container.GetContainerItemLink(bagID, slotID)
                if containerItemLink then
                    if containerItemLink == itemLink then
                        print("WE FOUND A MATCH! HOORAY!")
                    else
                        print(containerItemLink)
                    end
                    --if containerItemLink == itemLink then
                        --C_Item.EquipItemByName(containerItemLink)
                        --C_Timer.After(0.5, function() C_Item.EquipItemByName(containerItemLink) end)
                    --end
                end
            end
        end
    end
end

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
                            local actualItemLevel = C_Item.GetDetailedItemLevelInfo(value) or 0
                            if heirloomMaxLevel and (heirloomMaxLevel >= addon.playerLevel) then
                                -- If the player has an heirloom equipped in the slot, and they haven't
                                -- outleveled the heirloom, then set the itemlevel for that slot to 999
                                -- to prevent the item from being replaced.
                                actualItemLevel = 999
                            end
                            equippedItems[inventorySlotID] = actualItemLevel
                        end
                    end

                    -- Check the number of quest rewards and choices from the opened quest.
                    --
                    -- A quest "reward" is something given to the player without their decision,
                    -- whereas a quest "choice" is a reward the player can choose.
                    local numQuestChoices, numQuestRewards = GetNumQuestChoices(), GetNumQuestRewards()
                    if numQuestChoices > 1 or numQuestRewards > 1 then
                        if HelpMePlayDB["QuestRewardSelectionTypeID"] == 0 then return end -- Do not process quest rewards.

                        local bestRewardIndex = 0
                        local bestRewardItemLink = ""
                        local bestSellPrice = 0
                        if HelpMePlayDB["QuestRewardSelectionTypeID"] == 1 then -- Process quest rewards by ITEM LEVEL.
                            for rewardIndex = 1, numQuestChoices do
                                local itemLink = GetQuestItemLink("choice", rewardIndex)
                                if itemLink then
                                    local inventorySlotID = C_Item.GetItemInventoryTypeByID(itemLink)
                                    if inventorySlotID then
                                        local rewardItemLevel = C_Item.GetDetailedItemLevelInfo(itemLink) or 0
                                        if rewardItemLevel > equippedItems[inventorySlotID] then
                                            bestRewardItemLink = itemLink
                                            bestRewardIndex = rewardIndex
                                        end
                                    end
                                end
                            end
                        elseif HelpMePlayDB["QuestRewardSelectionTypeID"] == 2 then -- Process quest rewards by SELL PRICE.
                            for rewardIndex = 1, numQuestChoices do
                                local quantity = select(3, GetQuestItemInfo("choice", rewardIndex))
                                local itemLink = GetQuestItemLink("choice", rewardIndex)
                                if quantity and itemLink then
                                    local sellPrice = select(11, C_Item.GetItemInfo(itemLink))
                                    if sellPrice > 0 then
                                        sellPrice = sellPrice * quantity
                                        if sellPrice > bestSellPrice then
                                            bestRewardItemLink = itemLink
                                            bestSellPrice = sellPrice
                                            bestRewardIndex = rewardIndex
                                        end
                                    end
                                end
                            end
                        end

                        -- If no item is found to be better based on the player's settings, then
                        -- choose an item randomly.
                        if bestRewardIndex == 0 then
                            GetQuestReward(math.random(1, numQuestChoices))
                        else
                            print(bestRewardItemLink)
                            GetQuestReward(bestRewardIndex)
                        end
                    elseif numQuestChoices == 1 or numQuestRewards == 1 then
                        local bestRewardItemLink = ""
                        local bestRewardIndex = 0

                        local itemLink = GetQuestItemLink("choice", 1)
                        if itemLink then
                            local inventorySlotID = C_Item.GetItemInventoryTypeByID(itemLink)
                            if inventorySlotID then
                                local rewardItemLevel = C_Item.GetDetailedItemLevelInfo(itemLink) or 0
                                if rewardItemLevel > equippedItems[inventorySlotID] then
                                    bestRewardItemLink = itemLink
                                    bestRewardIndex = 1
                                end
                            end
                        end

                        -- There is only one decision to be made, so let the addon
                        -- make it for the player regardless of their settings.
                        GetQuestReward(bestRewardIndex)

                        -- Check the player's inventory for the quest reward they just acquired.
                        C_Timer.After(1, function() CheckForQuestReward(bestRewardItemLink) end)
                    else
                        -- No rewards available, so just complete the quest.
                        QuestFrameCompleteButton:Click("LeftButton")
                        QuestFrameCompleteQuestButton:Click("LeftButton")
                    end
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