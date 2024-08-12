local _, HelpMePlay = ...
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
    if InCombatLockdown() then C_Timer.After(1, function() CheckForQuestReward(itemLink) end) end

    -- Get the provided item link's ID. This is necessary for comparison
    -- to items in the inventory. For some reason item link comparison is
    -- busted. :)
    local itemID = C_Item.GetItemInfoInstant(itemLink)

    for bagId = 0, 4 do
        local numSlots = C_Container.GetContainerNumSlots(bagId)
        if numSlots > 0 then
            for slotId = 1, numSlots do
                local containerItemID = C_Container.GetContainerItemID(bagId, slotId)
                if containerItemID then
                    if containerItemID == itemID then
                        local containerItemLink = C_Container.GetContainerItemLink(bagId, slotId)
                        local equippedItemLink = GetInventoryItemLink("player", destSlot)
                        if C_Item.GetDetailedItemLevelInfo(containerItemLink) > C_Item.GetDetailedItemLevelInfo(equippedItemLink) then
                            if canDualWield and destSlot ~= 0 then
                                -- In cases where the player can dual wield, we want to ensure
                                -- the reward is equipped to the most optimal slot. If one slot
                                -- is a 30 item level upgrade and the second is a 10 item level
                                -- upgrade, then the 30 item level upgrade slot should be used.
                                C_Item.EquipItemByName(itemLink, destSlot)
                                destSlot = 0
                            else
                                C_Item.EquipItemByName(itemLink, destSlot)
                            end
                        end
                    end
                end
            end
        end
    end
end

HelpMePlay.IsWeaponRewardValidForSpecID = function(specID, subClassID)
    if HelpMePlay.EquipLoc[specID] then
        for _, v in ipairs(HelpMePlay.EquipLoc[specID]) do
            if subClassID == v then
                return true
            end
        end
        return false
    end
    return true
end

local function CheckItemLevelUpgrade(rewards, equippedItems, isRewardValid)
    local bestRewardItemLink = ""
    local destSlot = 0
    local bestItemLevelDifference = 0
    local bestRewardIndex = 0
    for index, itemLink in ipairs(rewards) do
        local inventorySlotID = C_Item.GetItemInventoryTypeByID(itemLink)
        if inventorySlotID then
            if HelpMePlay.InventoryType[inventorySlotID] then
                -- Get the item's class and subclass IDs. We'll use these for determining if
                -- an item is valid for the player.
                local equipLoc, _, classID, subClassID = select(4, C_Item.GetItemInfoInstant(itemLink))
                if classID == 2 then -- Weapon
                    isRewardValid = HelpMePlay.IsWeaponRewardValidForSpecID(HelpMePlay.playerSpecID, subClassID)
                end

                -- isRewardValid is always passed as TRUE to the function; however, if the item
                -- class is a weapon that isn't valid for a class/spec (e.g. Bows for a Survival Hunter),
                -- then the variable is set to FALSE and we return default values from the function.
                --
                -- These default values will prevent that reward from not being selected in situations
                -- where the player has a choice.
                if isRewardValid then
                    -- Get the actual inventory slot ID because sometimes it can be different.
                    inventorySlotID = HelpMePlay.InventoryType[inventorySlotID] or 0

                    -- Get the reward's actual item level.
                    local rewardItemLevel = C_Item.GetDetailedItemLevelInfo(itemLink) or 0

                    -- Set these variables to 0 to start. If we're dealing with weapons, rings,
                    -- or trinkets, then these values will change to the corresponding inventory
                    -- slot IDs for the loop.
                    local start, finish = 0, 0
                    if (canDualWield and classID == 2) or (classID == 4 and (equipLoc == "INVTYPE_FINGER" or equipLoc == "INVTYPE_TRINKET")) then
                        if canDualWield and classID == 2 then
                            start, finish = 16, 17
                        elseif classID == 4 and equipLoc == "INVTYPE_FINGER" then
                            start, finish = 11, 12
                        elseif classID == 4 and equipLoc == "INVTYPE_TRINKET" then
                            start, finish = 13, 14
                        end
                        for slot = start, finish do
                            if rewardItemLevel > equippedItems[slot] then
                                local itemLevelDifference = rewardItemLevel - equippedItems[slot]
                                if itemLevelDifference > bestItemLevelDifference then
                                    bestItemLevelDifference = itemLevelDifference
                                    bestRewardItemLink = itemLink
                                    destSlot = slot
                                    bestRewardIndex = index
                                end
                            end
                        end
                    else
                        -- This is for every other reward that doesn't adhere to a dual wield class/spec,
                        -- rings, or trinkets. Weapons of all varieties are still handled here, just not
                        -- for dual wield classes/specs.
                        --
                        -- The consideration for whether or not the second weapon slot (17) is 0 is important
                        -- because this section of code is for classes that don't dual wield. Therefore, slot
                        -- 17 doesn't apply.
                        --
                        -- The variable name here "inventorySlotID", when it's a table doesn't make a lot
                        -- of sense. I should probably change it, or maybe only change it when it's a table...
                        if type(inventorySlotID) == "table" then
                            for _, slotID in ipairs(inventorySlotID) do
                                if rewardItemLevel > equippedItems[slotID] and (equippedItems[slotID] ~= 0) then
                                    bestRewardItemLink = itemLink
                                    bestRewardIndex = index
                                    destSlot = slotID
                                end
                            end
                        else
                            if rewardItemLevel > equippedItems[inventorySlotID] and (equippedItems[inventorySlotID] ~= 0) then
                                bestRewardItemLink = itemLink
                                bestRewardIndex = index
                                destSlot = inventorySlotID
                            end
                        end
                    end
                end
            end
        end
    end
    return bestRewardIndex, bestRewardItemLink, destSlot
end

local function GetHighestSellingQuestReward(rewards)
    local bestSellPrice = 0
    local bestRewardItemLink = ""
    local bestRewardIndex = 0
    for index = 1, #rewards do
        local reward = rewards[index]
        if reward then
            local sellPrice = select(11, C_Item.GetItemInfo(reward.itemLink))
            if sellPrice > 0 then
                sellPrice = sellPrice * reward.quantity
                if sellPrice > bestSellPrice then
                    bestSellPrice = sellPrice
                    bestRewardIndex = index
                    bestRewardItemLink = reward.itemLink
                end
            end
        end
    end
    return bestRewardIndex, bestRewardItemLink
end

HelpMePlay.CompleteQuest = function()
    if HelpMePlayDB["AcceptAndCompleteQuests"] == false and HelpMePlayDB["AcceptAndCompleteAllQuests"] == false then return end

    -- Show and hide the character paperdoll frame to cache the player's equipped
    -- items.
    --ShowUIPanel(CharacterFrame); HideUIPanel(CharacterFrame)

    C_Timer.After(0.1, function()
        -- Check if the player is in combat. This will cause some trouble if they
        -- are, so let's deal with it now.
        if InCombatLockdown() then C_Timer.After(1, HelpMePlay.CompleteQuest) end

        -- Determine if the player can dual wield. The specialization IDs
        -- are stored in Data\Quests.lua.
        for _, specID in ipairs(HelpMePlay.CanDualWield) do
            if HelpMePlay.playerSpecID == specID then
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
                if heirloomMaxLevel and (heirloomMaxLevel >= HelpMePlay.playerLevel) then
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
        local numQuestChoices = GetNumQuestChoices()
        if numQuestChoices > 1 then
            if HelpMePlayDB["QuestRewardSelectionTypeID"] == 0 then return end -- Do not process quest rewards.

            local bestRewardIndex = 0
            local bestSellPrice = 0
            local bestRewardItemLink = ""
            local destSlot = 0
            if HelpMePlayDB["QuestRewardSelectionTypeID"] == 1 then -- ITEM LEVEL
                local rewards = {}
                for rewardIndex = 1, numQuestChoices do
                    local itemLink = GetQuestItemLink("choice", rewardIndex)
                    if itemLink then
                        table.insert(rewards, itemLink)
                    end
                end
                bestRewardIndex, bestRewardItemLink, destSlot = CheckItemLevelUpgrade(rewards, equippedItems, true)
            elseif HelpMePlayDB["QuestRewardSelectionTypeID"] == 2 then -- SELL PRICE
                local rewards = {}
                for rewardIndex = 1, numQuestChoices do
                    local quantity = select(3, GetQuestItemInfo("choice", rewardIndex))
                    local itemLink = GetQuestItemLink("choice", rewardIndex)
                    if quantity and itemLink then
                        table.insert(rewards, { ["itemLink"] = itemLink, ["quantity"] = quantity })
                    end
                end
                bestRewardIndex, bestRewardItemLink = GetHighestSellingQuestReward(rewards)
            end

            -- If the bestRewardIndex variable is unchanged from its default of 0,
            -- then no valid reward was found.
            if bestRewardIndex == 0 then
                if HelpMePlayDB["QuestRewardSelectionTypeID"] == 1 then -- ITEM LEVEL
                    -- If no valid reward was found by item level, then let's use
                    -- sell price as a fallback option.
                    local rewards = {}
                    for rewardIndex = 1, numQuestChoices do
                        local quantity = select(3, GetQuestItemInfo("choice", rewardIndex))
                        local itemLink = GetQuestItemLink("choice", rewardIndex)
                        if quantity and itemLink then
                            table.insert(rewards, { ["itemLink"] = itemLink, ["quantity"] = quantity })
                        end
                    end
                    bestRewardIndex, bestRewardItemLink = GetHighestSellingQuestReward(rewards)

                    -- If the bestRewardIndex is STILL 0, then both options failed
                    -- to find a valid reward. Pick something random.
                    if bestRewardIndex == 0 then
                        GetQuestReward(math.random(1, numQuestChoices))
                    end
                    GetQuestReward(bestRewardIndex)
                elseif HelpMePlayDB["QuestRewardSelectionTypeID"] == 2 then -- SELL PRICE
                    -- Since the setting is already set to Sell Price, we don't
                    -- want to get stuck checking for sell price a second time.
                    -- Therefore, if the bestRewardIndex is still 0 and the setting
                    -- is for Sell Price, then pick a random reward.
                    GetQuestReward(math.random(1, numQuestChoices))
                end
            else
                if bestRewardItemLink ~= "" and destSlot ~= 0 then
                    GetQuestReward(bestRewardIndex)

                    -- Check the player's inventory for the quest reward they just acquired.
                    C_Timer.After(1, function() CheckForQuestReward(bestRewardItemLink, destSlot) end)
                end
            end
        elseif numQuestChoices == 1 then
            local itemLink = GetQuestItemLink("choice", 1)
            if itemLink then
                local rewards = { itemLink }
                local bestRewardItemLink, destSlot = select(2, CheckItemLevelUpgrade(rewards, equippedItems, true))
                -- There is only one decision to be made, so let the addon
                -- make it for the player regardless of their settings.
                GetQuestReward(1)

                -- Check the player's inventory for the quest reward they just acquired.
                C_Timer.After(1, function() CheckForQuestReward(bestRewardItemLink, destSlot) end)
            end
        else
            -- There are either no rewards available, or there are only quest rewards
            -- (not choices) available.
            local numQuestRewards = GetNumQuestRewards()
            if numQuestRewards > 0 then
                local rewards = {}
                for rewardIndex = 1, numQuestRewards do
                    local itemLink = GetQuestItemLink("reward", rewardIndex)
                    if itemLink then
                        table.insert(rewards, itemLink)
                    end
                end
                local bestRewardItemLink, destSlot = select(2, CheckItemLevelUpgrade(rewards, equippedItems, true))
                if bestRewardItemLink ~= "" and destSlot ~= 0 then
                    -- Check the player's inventory for the quest reward they just acquired.
                    C_Timer.After(1, function() CheckForQuestReward(bestRewardItemLink, destSlot) end)
                end
            end
            QuestFrameCompleteButton:Click("LeftButton")
            QuestFrameCompleteQuestButton:Click("LeftButton")
        end
    end)
end