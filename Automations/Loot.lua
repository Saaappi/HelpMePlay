local addonName, addon = ...
local e = CreateFrame("Frame")

local function EquipItem(itemLink, inventoryType)
	C_Timer.After(0.5, function()
		if (UnitLevel("player") < addon.CONSTANTS["MAX_PLAYER_LEVEL"]) then
			if (not UnitAffectingCombat("player")) then
				if (itemLink) then
					local equipSlot = 0
					local _, rewardItemID = string.split(":", itemLink); rewardItemID = tonumber(rewardItemID)
					local lootItemLevel = GetDetailedItemLevelInfo(itemLink)
					local equippedItem = 0
					local equippedItemQuality = 0
					local _, _, _, _, _, itemType, _, _, _, _, _, _, subClassID = GetItemInfo(itemLink)
					if (type(addon.CONSTANTS["SLOTS"][inventoryType]) == "table") then
						for _,invSlotID in ipairs(addon.CONSTANTS["SLOTS"][inventoryType]) do
							equippedItem = ItemLocation:CreateFromEquipmentSlot(invSlotID)
							if (equippedItem:IsValid()) then
								if (itemType == "Weapon") then return end
								local equippedItemLevel = C_Item.GetCurrentItemLevel(equippedItem)
								equippedItemQuality = C_Item.GetItemQuality(equippedItem)
								if (lootItemLevel > equippedItemLevel) then
									equipSlot = invSlotID
								end
							end
						end
					else
						equippedItem = ItemLocation:CreateFromEquipmentSlot(addon.CONSTANTS["SLOTS"][inventoryType])
						if (equippedItem:IsValid()) then
							if (itemType == "Weapon") then return end
							local equippedItemLevel = C_Item.GetCurrentItemLevel(equippedItem)
							equippedItemQuality = C_Item.GetItemQuality(equippedItem)
							if (lootItemLevel > equippedItemLevel) then
								equipSlot = addon.CONSTANTS["SLOTS"][inventoryType]
							end
						end
					end
					
					if (equipSlot > 0) then
						local equippedItemID = C_Item.GetItemID(equippedItem)
						local _, _, _, _, _, _, _, effectiveHeirloomLevel = C_Heirloom.GetHeirloomInfo(equippedItemID)
						if (effectiveHeirloomLevel) then
							if (effectiveHeirloomLevel >= UnitLevel("player")) then return end
						end
						C_Timer.After(0.5, function()
							for bagID=0,4 do
								for slotID=1,C_Container.GetContainerNumSlots(bagID) do
									local containerItemInfo = C_Container.GetContainerItemInfo(bagID, slotID)
									if (containerItemInfo) then
										local containerItemLink = C_Item.GetItemLink(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
										if (containerItemInfo.itemID == rewardItemID) then
											local isBound = C_Item.IsBound(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
											if (isBound or HelpMePlayDB.EquipLootIgnoreBindEnabled) then
												local canTransmog = 0
												if (addon.CONSTANTS["TRANSMOG_SLOTS"][inventoryType]) then
													canTransmog = C_Item.CanItemTransmogAppearance(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
												end
												if (canTransmog or canTransmog == 0) then
													local containerItemIcon = C_Item.GetItemIcon(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
													print(string.format("%s: Equipping an item upgrade. |T%s:0|t %s", addon.CONSTANTS.COLORED_ADDON_NAME, containerItemIcon, containerItemLink))
													ClearCursor()
													C_Container.PickupContainerItem(bagID, slotID)
													EquipCursorItem(equipSlot)
													if (HelpMePlayDB.JunkerEnabled) then
														HelpMePlayJunkerGlobalDB[containerItemInfo.itemID] = true
													end
													break
												end
											end
										end
									end
								end
							end
						end)
					end
				end
			else
				C_Timer.After(0.5, function()
					EquipItem(itemLink)
				end)
			end
		end
	end)
end

e:RegisterEvent("CHAT_MSG_LOOT")
e:SetScript("OnEvent", function(self, event, ...)
	if (event == "CHAT_MSG_LOOT") then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.EquipLootEnabled == false or HelpMePlayDB.EquipLootEnabled == nil then return false end
		
		local text, _, _, _, _, _, _, _, _, _, _, GUID = ...
		if (GUID == UnitGUID("player")) then
			local itemLink = string.match(text,"|%x+|Hitem:.-|h.-|h|r")
			local inventoryType = C_Item.GetItemInventoryTypeByID(itemLink)
			if (addon.CONSTANTS["SLOTS"][inventoryType]) then
				EquipItem(itemLink, inventoryType)
			end
		end
	end
end)