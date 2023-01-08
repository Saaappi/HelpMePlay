local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function EquipItem(itemLink, inventoryType)
	if UnitLevel("player") < addonTable.CONSTANTS["MAX_PLAYER_LEVEL"] then
		if not UnitAffectingCombat("player") then
			if itemLink then
				local equipSlot = 0
				local _, rewardItemID = string.split(":", itemLink); rewardItemID = tonumber(rewardItemID)
				local lootItemLevel = GetDetailedItemLevelInfo(itemLink)
				C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
					local equippedItem = 0
					local equippedItemQuality = 0
					if type(addonTable.SLOTS[inventoryType]) == "table" then
						for _, invSlotID in ipairs(addonTable.SLOTS[inventoryType]) do
							equippedItem = ItemLocation:CreateFromEquipmentSlot(invSlotID)
							if equippedItem:IsValid() then
								local equippedItemLevel = C_Item.GetCurrentItemLevel(equippedItem)
								equippedItemQuality = C_Item.GetItemQuality(equippedItem)
								if lootItemLevel > equippedItemLevel then
									equipSlot = invSlotID
								end
							end
						end
					else
						equippedItem = ItemLocation:CreateFromEquipmentSlot(addonTable.SLOTS[inventoryType])
						if equippedItem:IsValid() then
							local equippedItemLevel = C_Item.GetCurrentItemLevel(equippedItem)
							equippedItemQuality = C_Item.GetItemQuality(equippedItem)
							if lootItemLevel > equippedItemLevel then
								equipSlot = addonTable.SLOTS[inventoryType]
							end
						end
					end
					
					if equipSlot > 0 then
						-- If the item would replace an heirloom, and the player's level
						-- is lower than 60, then don't equip it.
						if equippedItemQuality == 7 and UnitLevel("player") <= addonTable.CONSTANTS["MAX_HEIRLOOM_LEVEL"] then return end
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
												if addonTable.TRANSMOG_SLOTS[inventoryType] then
													canTransmog = C_Item.CanItemTransmogAppearance(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
												end
												if canTransmog or canTransmog == 0 then
													local containerItemIcon = C_Item.GetItemIcon(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
													print(string.format("%s: %s |T%s:0|t %s", L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"], L_GLOBALSTRINGS["Text.Output.EquipItemUpgrade"], containerItemIcon, containerItemLink))
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
				end)
			end
		else
			EquipItem(itemLink)
		end
	end
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
			if inventoryType > 0 then
				EquipItem(itemLink, inventoryType)
			end
		end
	end
end)