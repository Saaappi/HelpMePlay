local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local button
local canDualWield = false

eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
        local type = ...
        if type == 40 and PlayerGetTimerunningSeasonID() == 1 then
            -- When the Scrapping Machine frame is shown, if the button
            -- hasn't been created, then create it.
            if not button then
                button = {
                    name = addonName .. "ScrappingMachineButton",
                    parent = ScrappingMachineFrame,
                    anchor = "TOPLEFT",
                    relativeAnchor = "TOPRIGHT",
                    oX = 10,
                    oY = 0,
                    ID = nil,
                    classID = nil,
                    icon = nil,
                }
                setmetatable(button, { __index = HelpMePlay.Button })
                button = button:ActionButton()

                -- Create the script handlers for the button.
                button:SetScript("OnClick", function()
                    -- We'll use this to break from the loop later.
                    local numScrappableItems = 0

                    -- Get the item level of what the player has equipped. Not every
                    -- slot must be considered in this case.
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
                    equippedItems[16] = GetInventoryItemLink("player", 16) or 0     -- Main Hand Weapon
                    equippedItems[17] = GetInventoryItemLink("player", 17) or 0     -- Off Hand Weapon (Holdable)
                    equippedItems[20] = GetInventoryItemLink("player", 5) or 0      -- Robe (Chest)

                    -- Convert the equipped items into their item levels.
                    for inventorySlotID, value in pairs(equippedItems) do
                        if value ~= 0 then
                            local actualItemLevel = C_Item.GetDetailedItemLevelInfo(value) or 0
                            equippedItems[inventorySlotID] = actualItemLevel
                        end
                    end

                    -- Determine if the player can dual wield. The specialization IDs
                    -- are stored in Data\Quests.lua.
                    for _, specID in ipairs(addon.CanDualWield) do
                        if addon.playerSpecID == specID then
                            canDualWield = true
                        end
                    end

                    -- Iterate through the player's inventory. We're looking
                    -- for armor and weapons.
                    for bagID = 0, 4 do
                        for slotID = 1, C_Container.GetContainerNumSlots(bagID) do
                            local itemLink = C_Container.GetContainerItemLink(bagID, slotID)
                            if itemLink then
                                -- Get the actual inventory slot ID because sometimes it can be different.
                                local inventorySlotID = C_Item.GetItemInventoryTypeByID(itemLink)

                                -- Get the item's true item level.
                                local itemLevelForInventoryItem = C_Item.GetDetailedItemLevelInfo(itemLink) or 0

                                -- Get the item's equip location and classIDs. If it's armor or a weapon,
                                -- then continue.
                                local classID, subClassID = select(6, C_Item.GetItemInfoInstant(itemLink))
                                if classID == 2 or classID == 4 then
                                    -- If it's a weapon, let's check if it's valid for the player's current
                                    -- specialization.
                                    if classID == 2 then
                                        local isItemValid = addon.IsWeaponRewardValidForSpecID(addon.playerSpecID, subClassID)
                                        if isItemValid then
                                            -- Get the actual inventory slot ID because sometimes it can be different.
                                            inventorySlotID = addon.InventoryType[inventorySlotID] or 0

                                            -- Set these variables to 0 to start.
                                            local start, finish = 0, 0
                                            if canDualWield then
                                                -- The player can dual wield, so let's determine if the item is better
                                                -- than what the player has equipped. If the item is better than the first
                                                -- item, then we'll break as checking the second weapon is irrelevant.
                                                local isItemBetter = false
                                                start, finish = 16, 17
                                                for slot = start, finish do
                                                    if itemLevelForInventoryItem > equippedItems[slot] then
                                                        isItemBetter = true
                                                        break
                                                    end
                                                end

                                                -- If the item isn't better than what the player has equipped, then
                                                -- we can add it to the scrapping machine.
                                                if not isItemBetter then
                                                    C_Container.UseContainerItem(bagID, slotID)
                                                    numScrappableItems = numScrappableItems + 1
                                                end
                                            else
                                                -- This is for every other reward that doesn't adhere to a dual wield class/spec.
                                                -- Weapons of all varieties are still handled here, just not for dual wield classes/specs.
                                                if itemLevelForInventoryItem <= equippedItems[inventorySlotID] then
                                                    C_Container.UseContainerItem(bagID, slotID)
                                                    numScrappableItems = numScrappableItems + 1
                                                end
                                            end
                                        else
                                            -- It's not valid, so add it to the scrapping machine.
                                            C_Container.UseContainerItem(bagID, slotID)
                                            numScrappableItems = numScrappableItems + 1
                                        end
                                    else
                                        -- This is where all the armor items are processed.
                                        if equippedItems[inventorySlotID] then
                                            if itemLevelForInventoryItem <= equippedItems[inventorySlotID] then
                                                C_Container.UseContainerItem(bagID, slotID)
                                                numScrappableItems = numScrappableItems + 1
                                            end
                                        end
                                    end
                                end

                                -- There can only be 9 items in the scrapper at a time. If we reach 9, then
                                -- we should break from the loop.
                                if numScrappableItems == 9 then return end
                            end
                        end
                    end
                end)
                button:SetScript("OnEnter", function()
                    GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
                    GameTooltip:AddLine("Click to automatically fill the scrap machine with unwanted items.\n\n" ..
                    "It's a great idea to always double check the addon's decision!", 1, 1, 1, true)
                    GameTooltip:Show()
                end)
                button:SetScript("OnLeave", function()
                    GameTooltip:Hide()
                end)
            end

            -- Set the button's position.
            button:SetPoint("TOPLEFT", ScrappingMachineFrame, "TOPRIGHT", 10, 0)

            -- Set the button's icon.
            button.icon:SetTexture(136243)
        end
    end
end)