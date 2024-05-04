local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local canDualWield = false

-- Iterates through the player's inventory to check for the
-- quest reward they just received. If it's found, then equip
-- the item.
local function CheckForQuestReward(itemLink, destSlot)
    -- The item reward we received should be equippable. If it's not,
    -- then don't bother iterating the player's inventory.
    if not C_Item.IsEquippableItem(itemLink) then return end

    -- In case the player enters combat after completing the quest
    -- but before this function is called, then trigger a timer.
    if UnitAffectingCombat("player") then C_Timer.After(1, function() CheckForQuestReward(itemLink) end) end

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
                        if canDualWield and destSlot ~= 0 then
                            -- In cases where the player can dual wield, we want to ensure
                            -- the reward is equipped to the most optimal slot. If one slot
                            -- is a 30 item level upgrade and the second is a 10 item level
                            -- upgrade, then the 30 item level upgrade slot should be used.
                            C_Item.EquipItemByName(itemLink, destSlot)
                            destSlot = 0
                        else
                            C_Item.EquipItemByName(itemLink)
                        end
                    end
                end
            end
        end
    end
end

local function IsWeaponRewardValidForSpecID(specID, subClassID)
    if addon.EquipLoc[specID] then
        for _, v in ipairs(addon.EquipLoc[specID]) do
            if subClassID == v then
                return true
            end
        end
        return false
    end
    return true
end

local function CheckItemLevelUpgrade(itemLink, equippedItems, classID, subClassID, rewardIndex)
    local bestRewardItemLink = ""
    local destSlot = 0
    local bestItemLevelDifference = 0
    local bestRewardIndex = 0
    local inventorySlotID = C_Item.GetItemInventoryTypeByID(itemLink)
    if inventorySlotID then
        if addon.InventoryType[inventorySlotID] then
            -- Get the actual inventory slot ID because sometimes it can be different.
            inventorySlotID = addon.InventoryType[inventorySlotID] or 0
            local rewardItemLevel = C_Item.GetDetailedItemLevelInfo(itemLink) or 0
            if canDualWield and classID == 2 then
                -- Handle weapon logic for dual wield classes, such as Rogues
                -- and Fury Warriors.
                for slot = 16, 17 do
                    if rewardItemLevel > equippedItems[slot] then
                        local itemLevelDifference = rewardItemLevel - equippedItems[slot]
                        if itemLevelDifference > bestItemLevelDifference then
                            bestItemLevelDifference = itemLevelDifference
                            bestRewardItemLink = itemLink
                            destSlot = slot
                            bestRewardIndex = rewardIndex
                        end
                    end
                end
            else
                if rewardItemLevel > equippedItems[inventorySlotID] then
                    bestRewardItemLink = itemLink
                    bestRewardIndex = rewardIndex
                    destSlot = inventorySlotID
                end
            end
        end
        return bestRewardIndex, bestRewardItemLink, destSlot
    end
    return 0, "", 0
end

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            -- How to handle completing a quest.
            function HelpMePlay.CompleteQuest()
                if HelpMePlayDB["AcceptAndCompleteQuests"] == false and HelpMePlayDB["AcceptAndCompleteAllQuests"] == false then return end

                -- Show and hide the character paperdoll frame to cache the player's equipped
                -- items.
                ShowUIPanel(CharacterFrame); HideUIPanel(CharacterFrame)

                C_Timer.After(1, function()
                    -- Check if the player is in combat. This will cause some trouble if they
                    -- are, so let's deal with it now.
                    if UnitAffectingCombat("player") then C_Timer.After(1, HelpMePlay.CompleteQuest) end

                    -- Determine if the player can dual wield. The specialization IDs
                    -- are stored in Data\Quests.lua.
                    for _, specID in ipairs(addon.CanDualWield) do
                        if addon.playerSpecID == specID then
                            canDualWield = true
                        end
                    end

                    -- Collect all the player's equipped items. We'll convert these to item levels
                    -- shortly since we're only making a numeral comparison. A 0 means there isn't
                    -- an equipped item in that slot.
                    --
                    -- The value in the bracket is from Enum.InventoryType.
                    local equippedItems = {}
                    equippedItems[1] = GetInventoryItemLink("player", 1) or 0       -- Head
                    equippedItems[2] = GetInventoryItemLink("player", 2) or 0       -- Neck
                    equippedItems[3] = GetInventoryItemLink("player", 3) or 0       -- Shoulder
                    equippedItems[5] = GetInventoryItemLink("player", 5) or 0       -- Chest
                    equippedItems[6] = GetInventoryItemLink("player", 6) or 0       -- Waist
                    equippedItems[7] = GetInventoryItemLink("player", 7) or 0       -- Legs
                    equippedItems[8] = GetInventoryItemLink("player", 8) or 0       -- Feet
                    equippedItems[9] = GetInventoryItemLink("player", 9) or 0       -- Wrist
                    equippedItems[10] = GetInventoryItemLink("player", 10) or 0     -- Hands
                    equippedItems[11] = GetInventoryItemLink("player", 11) or 0     -- Finger1
                    equippedItems[12] = GetInventoryItemLink("player", 12) or 0     -- Finger2
                    equippedItems[13] = GetInventoryItemLink("player", 13) or 0     -- Trinket1
                    equippedItems[14] = GetInventoryItemLink("player", 14) or 0     -- Trinket2
                    equippedItems[15] = GetInventoryItemLink("player", 15) or 0     -- Back
                    equippedItems[16] = GetInventoryItemLink("player", 16) or 0     -- Main Hand Weapon
                    equippedItems[17] = GetInventoryItemLink("player", 17) or 0     -- Off Hand Weapon (Holdable)

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
                    --local numQuestChoices = GetNumQuestChoices()
                    local numQuestChoices = 2
                    if numQuestChoices > 1 then
                        if HelpMePlayDB["QuestRewardSelectionTypeID"] == 0 then return end -- Do not process quest rewards.

                        local itemLinks = {
                            "|cff0070dd|Hitem:193716::::::::70:72::1:1:3524:1:28:2155:::::|h[Algeth'ar Hedgecleaver]|h|r",
                            "|cffffffff|Hitem:2489::::::::70:72::14::1:28:73:::::|h[Two-Handed Sword]|h|r",
                        }

                        local bestRewardIndex = 0
                        local bestSellPrice = 0
                        local bestRewardItemLink = ""
                        local destSlot = 0
                        if HelpMePlayDB["QuestRewardSelectionTypeID"] == 1 then -- ITEM LEVEL.
                            for rewardIndex = 1, numQuestChoices do
                                local isRewardValid = true
                                --local itemLink = GetQuestItemLink("choice", rewardIndex)
                                local itemLink = itemLinks[rewardIndex]
                                if itemLink then
                                    C_Item.RequestLoadItemDataByID(itemLink)
                                    -- Let's check if the reward is a weapon. If it's a weapon, then
                                    -- let's ensure it's a supported weapon for the class/spec. For example,
                                    -- a Survival Hunter shouldn't take a bow over a polearm.
                                    C_Timer.After(1, function()
                                        local classID, subClassID = select(12, C_Item.GetItemInfo(itemLink))
                                        if classID == 2 then -- Weapon
                                            isRewardValid = IsWeaponRewardValidForSpecID(addon.playerSpecID, subClassID)
                                        end
                                        if isRewardValid then
                                            bestRewardIndex, bestRewardItemLink, destSlot = CheckItemLevelUpgrade(itemLink, equippedItems, classID, subClassID, rewardIndex)
                                            if bestRewardItemLink ~= "" and destSlot ~= 0 then
                                                print(destSlot .. ": " .. bestRewardItemLink)
                                            else
                                                return
                                            end
                                        end
                                    end)
                                end
                            end
                        elseif HelpMePlayDB["QuestRewardSelectionTypeID"] == 2 then -- SELL PRICE.
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
                            --GetQuestReward(bestRewardIndex)

                            -- Check the player's inventory for the quest reward they just acquired.
                            --C_Timer.After(1, function() CheckForQuestReward(bestRewardItemLink, destSlot) end)
                        end
                    elseif numQuestChoices == 1 then
                        local itemLink = GetQuestItemLink("choice", 1)
                        if itemLink then
                            local classID, subClassID = select(12, C_Item.GetItemInfo(itemLink))
                            local bestRewardItemLink, destSlot = select(2, CheckItemLevelUpgrade(itemLink, equippedItems, classID, 1))
                            if bestRewardItemLink ~= "" and destSlot ~= 0 then
                                -- There is only one decision to be made, so let the addon
                                -- make it for the player regardless of their settings.
                                GetQuestReward(1)

                                -- Check the player's inventory for the quest reward they just acquired.
                                C_Timer.After(1, function() CheckForQuestReward(bestRewardItemLink, destSlot) end)
                            else
                                return
                            end
                        end
                    else
                        -- There are either no rewards available, or there are only quest rewards
                        -- (not choices) available.
                        local numQuestRewards = GetNumQuestRewards()
                        if numQuestRewards > 0 then
                            for rewardIndex = 1, numQuestRewards do
                                local itemLink = GetQuestItemLink("reward", rewardIndex)
                                if itemLink then
                                    local classID, subClassID = select(12, C_Item.GetItemInfo(itemLink))
                                    local bestRewardItemLink, destSlot = select(2, CheckItemLevelUpgrade(itemLink, equippedItems, classID, rewardIndex))
                                    if bestRewardItemLink ~= "" and destSlot ~= 0 then
                                        -- Check the player's inventory for the quest reward they just acquired.
                                        C_Timer.After(1, function() CheckForQuestReward(bestRewardItemLink, destSlot) end)
                                    else
                                        return
                                    end
                                end
                            end
                        end
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