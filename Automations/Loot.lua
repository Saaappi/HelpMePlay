local addonName, addonTable = ...
local e = CreateFrame("Frame")

local function InvertTable(tbl)
	local temp = {}
	for k,v in pairs(tbl) do
		temp[v] = k
	end
	return temp
end

local function EquipItem(itemLink, inventoryType)
	C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
		if UnitLevel("player") < addonTable.CONSTANTS["MAX_PLAYER_LEVEL"] then
			if not UnitAffectingCombat("player") then
				if itemLink then
					local equipSlot = 0
					local _, rewardItemID = string.split(":", itemLink); rewardItemID = tonumber(rewardItemID)
					local lootItemLevel = GetDetailedItemLevelInfo(itemLink)
					local equippedItem = 0
					local equippedItemQuality = 0
					local _, _, _, _, _, itemType, _, _, _, _, _, _, subClassID = GetItemInfo(itemLink)
					if type(addonTable.CONSTANTS["SLOTS"][inventoryType]) == "table" then
						for _, invSlotID in ipairs(addonTable.CONSTANTS["SLOTS"][inventoryType]) do
							equippedItem = ItemLocation:CreateFromEquipmentSlot(invSlotID)
							if equippedItem:IsValid() then
								if itemType == "Weapon" then
									local equippedItemItemLink = C_Item.GetItemLink(equippedItem)
									local equippedItemSubClassID = select(13, GetItemInfo(equippedItemItemLink))
									if equippedItemSubClassID ~= subClassID then return end
								end
								local equippedItemLevel = C_Item.GetCurrentItemLevel(equippedItem)
								equippedItemQuality = C_Item.GetItemQuality(equippedItem)
								if lootItemLevel > equippedItemLevel then
									equipSlot = invSlotID
								end
							end
						end
					else
						equippedItem = ItemLocation:CreateFromEquipmentSlot(addonTable.CONSTANTS["SLOTS"][inventoryType])
						if equippedItem:IsValid() then
							if itemType == "Weapon" then
								for _, invSlotID in ipairs(addonTable.CONSTANTS["SLOTS"][inventoryType]) do
									if itemType == "Weapon" then
										local equippedItemItemLink = C_Item.GetItemLink(equippedItem)
										local equippedItemSubClassID = select(13, GetItemInfo(equippedItemItemLink))
										if equippedItemSubClassID ~= subClassID then return end
									end
								end
							end
							local equippedItemLevel = C_Item.GetCurrentItemLevel(equippedItem)
							equippedItemQuality = C_Item.GetItemQuality(equippedItem)
							if lootItemLevel > equippedItemLevel then
								equipSlot = addonTable.CONSTANTS["SLOTS"][inventoryType]
							end
						end
					end
					
					if equipSlot > 0 then
						-- If the item would replace an heirloom, and the player's level
						-- is lower than the heirloom's effective level, then don't equip it.
						if equippedItemQuality == 7 then
							local equippedItemID = C_Item.GetItemID(equippedItem)
							local _, _, _, _, _, _, _, effectiveHeirloomLevel = C_Heirloom.GetHeirloomInfo(equippedItemID)
							if UnitLevel("player") < effectiveHeirloomLevel then
								return
							end
						end
						C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
							for bagID = 0, 4 do
								for slotID = 1, C_Container.GetContainerNumSlots(bagID) do
									local containerItemInfo = C_Container.GetContainerItemInfo(bagID, slotID)
									if containerItemInfo then
										local containerItemLink = C_Item.GetItemLink(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
										if containerItemInfo.itemID == rewardItemID then
											local isBound = C_Item.IsBound(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
											if isBound or HelpMePlayDB.EquipLootIgnoreBindEnabled then
												local canTransmog = 0
												if addonTable.CONSTANTS["TRANSMOG_SLOTS"][inventoryType] then
													canTransmog = C_Item.CanItemTransmogAppearance(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
												end
												if canTransmog or canTransmog == 0 then
													local containerItemIcon = C_Item.GetItemIcon(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
													print(string.format("%s: Equipping an item upgrade. |T%s:0|t %s", addonTable.CONSTANTS.COLORED_ADDON_NAME, containerItemIcon, containerItemLink))
													ClearCursor()
													C_Container.PickupContainerItem(bagID, slotID)
													EquipCursorItem(equipSlot)
													if HelpMePlayDB.JunkerEnabled then
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
				C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
					EquipItem(itemLink)
				end)
			end
		end
	end)
end

e:RegisterEvent("CHAT_MSG_LOOT")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_LOOT" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.EquipLootEnabled == false or HelpMePlayDB.EquipLootEnabled == nil then return false end
		
		local text, _, _, _, _, _, _, _, _, _, _, GUID = ...
		if GUID == UnitGUID("player") then
			local itemLink = string.match(text,"|%x+|Hitem:.-|h.-|h|r")
			local inventoryType = C_Item.GetItemInventoryTypeByID(itemLink)
			if addonTable.CONSTANTS["SLOTS"][inventoryType] then
				EquipItem(itemLink, inventoryType)
			end
		end
	end
end)