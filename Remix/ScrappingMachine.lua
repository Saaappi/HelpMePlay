local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local button
local canDualWield = false

HelpMePlay.CreateRemixScrapButton = function()
	-- When the Scrapping Machine frame is shown, if the button
	-- hasn't been created, then create it.
		if not button then
			button = HelpMePlay.CreateWidget("ActionButton", {
				name = format("%sScrappingMachineButton", addonName),
				parent = ScrappingMachineFrame
			})

			button:ClearAllPoints()
			button:SetPoint("TOPLEFT", ScrappingMachineFrame, "TOPRIGHT", 10, 0)

			-- Create the script handlers for the button.
			button:SetScript("OnClick", function(_, btn)
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
				equippedItems[13] = GetInventoryItemLink("player", 16) or 0     -- One-Handed Weapon
				equippedItems[16] = GetInventoryItemLink("player", 16) or 0     -- Main Hand Weapon
				equippedItems[17] = GetInventoryItemLink("player", 16) or 0     -- Two-Handed Weapon
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
				for _, specID in ipairs(HelpMePlay.CanDualWield) do
					if HelpMePlay.playerSpecID == specID then
						canDualWield = true
					end
				end

				-- Iterate through the player's inventory. We're looking
				-- for armor and weapons.
				for bagID = 0, 4 do
					for slotID = 1, C_Container.GetContainerNumSlots(bagID) do
						if btn == "RightButton" and IsShiftKeyDown() then
							local item = Item:CreateFromBagAndSlot(bagID, slotID)
							if not item:IsItemEmpty() and C_Item.CanScrapItem(item:GetItemLocation()) then
								local inventoryType = item:GetInventoryType()
								if inventoryType ~= 0 then
									numScrappableItems = numScrappableItems + 1
									C_Container.UseContainerItem(bagID, slotID)
									if numScrappableItems == 9 then return true end
								end
							end
						else
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
										local isItemValid = HelpMePlay.IsWeaponRewardValidForSpecID(HelpMePlay.playerSpecID, subClassID)
										if isItemValid then
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
								if numScrappableItems == 9 then return true end
							end
						end
					end
				end
			end)
			button:SetScript("OnEnter", function(self)
				HelpMePlay.Tooltip_OnEnter(self, "Scrapping Machine", "Click to automatically fill the scrap machine with unwanted items.\n\n" ..
				"An unwanted item is any item at or below the item level of an equipped item of the same type.\n\nLeft click to scrap only the items with an item level lower than what you have equipped. Alternatively, use SHIFT+RMB to scrap all items regardless of their item level.\n\n" .. LHMP:ColorText("UNCOMMON", "It's a great idea to always double check the addon's decision!"))
			end)
			button:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
		end

		-- Set the button's icon.
		button.icon:SetTexture(134070)

		if HelpMePlayDB["ShowRemixScrapButton"] then
			button:Show()
		else
			button:Hide()
		end
end

eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
		local type = ...
		if type == 40 and PlayerGetTimerunningSeasonID() == 1 and HelpMePlayDB["ShowRemixScrapButton"] then
			HelpMePlay.CreateRemixScrapButton()
		end
	end
end)