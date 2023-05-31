local addonName, addon = ...

addon.GetCombatStatus = function(unit)
	C_Timer.After(0.5, function()
		if UnitAffectingCombat(unit) then
			GetCombatStatus(unit)
		end
		return false
	end)
end

addon.EquipItem = function(itemLink)
	if (itemLink) then
		if (UnitLevel("player") == addon.CONSTANTS["MAX_PLAYER_LEVEL"]) then
			return
		end
		
		local equipSlotID = 0
		local rewardItemID = GetItemInfoInstant(itemLink)
		local rewardItemItemLevel = GetDetailedItemLevelInfo(itemLink)
		local isInCombat = addon.GetCombatStatus("player")
		if (not isInCombat) then
			local itemType, itemSubType = select(6, GetItemInfo(itemLink))
			if (itemType == "Weapon") or (itemType == "Armor" and itemSubType == "Miscellaneous") then
				return
			end
			
			local rewardItemType = C_Item.GetItemInventoryTypeByID(itemLink)
			if (rewardItemType > 0) and ((rewardItemType ~= 4) or (rewardItemType ~= 19)) then
				local slotOrSlots = addon.CONSTANTS["SLOTS"][rewardItemType]
				if (type(slotOrSlots) == "table") then
					for _,invSlotID in ipairs(slotOrSlots) do
						local currentItem = ItemLocation:CreateFromEquipmentSlot(invSlotID)
						if (currentItem:IsValid()) then
							local currentItemItemLevel = C_Item.GetCurrentItemLevel(currentItem)
							local currentItemItemID = C_Item.GetItemID(currentItem)
							if (rewardItemItemLevel > currentItemItemLevel) then
								local effectiveHeirloomLevel = select(8, C_Heirloom.GetHeirloomInfo(currentItemItemID))
								if (effectiveHeirloomLevel and effectiveHeirloomLevel < UnitLevel("player")) then
									equipSlotID = invSlotI
								end
							end
						else
							equipSlotID = invSlotID
						end
					end
				else
					local currentItem = ItemLocation:CreateFromEquipmentSlot(slotOrSlots)
					if (currentItem:IsValid()) then
						local currentItemItemLevel = C_Item.GetCurrentItemLevel(currentItem)
						local currentItemItemID = C_Item.GetItemID(currentItem)
						if (rewardItemItemLevel > currentItemItemLevel) then
							local effectiveHeirloomLevel = select(8, C_Heirloom.GetHeirloomInfo(currentItemItemID))
							if (effectiveHeirloomLevel and effectiveHeirloomLevel >= UnitLevel("player")) then
								return
							end
							equipSlotID = slotOrSlots
						end
					else
						equipSlotID = slotOrSlots
					end
				end
			end
			if (equipSlotID > 0) then
				C_Timer.After(0.1, function()
					for bagID=0,4 do
						for slotID=1,C_Container.GetContainerNumSlots(bagID) do
							local containerItemInfo = C_Container.GetContainerItemInfo(bagID, slotID)
							if (containerItemInfo) then
								local containerItemLink = C_Item.GetItemLink(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
								if (containerItemInfo.itemID == rewardItemID) then
									local isBound = C_Item.IsBound(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
									if (isBound) then
										local containerItemIcon = C_Item.GetItemIcon(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
										print(string.format("%s: Equipping an item upgrade. |T%s:0|t %s", addon.CONSTANTS.COLORED_ADDON_NAME, containerItemIcon, containerItemLink))
										ClearCursor()
										C_Container.PickupContainerItem(bagID, slotID)
										EquipCursorItem(equipSlotID)
										if (HelpMePlayDB.JunkerEnabled) then
											HelpMePlayDB.Junker.GlobalDB[containerItemInfo.itemID] = true
										end
										break
									end
								end
							end
						end
					end
				end)
			end
		else
			C_Timer.After(1, function()
				addon.EquipItem(itemLink)
			end)
		end
	else
		C_Timer.After(1, function()
			addon.EquipItem(itemLink)
		end)
	end
end