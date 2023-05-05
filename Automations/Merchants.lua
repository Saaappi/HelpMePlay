local addonName, addon = ...
local e = CreateFrame("Frame")

local function CheckMerchant(tbl, npcID)
	for merchantID, merchantData in pairs(tbl) do
		if merchantID == npcID then
			-- We have a match! Let's check the merchant's
			-- wares for the quest item we need.
			local numMerchantItems = GetMerchantNumItems()
			for i = 1, #merchantData do
				if (C_QuestLog.IsOnQuest(merchantData[i].questID)) or (merchantData[i].questID == 0) then
					-- The player is on the quest in the table.
					for j = 1, numMerchantItems do
						if GetMerchantItemID(j) == merchantData[i].itemID then
							-- We found the quest item on the merchant's table.
							BuyMerchantItem(j, merchantData[i].itemCount)
						end
					end
					
					-- Stocking Up on Supplies (Alliance/Horde) (Exile's Reach)
					C_Timer.After(addon.CONSTANTS["HALF_SECOND"], function()
						for bagID = 0, 4 do
							for slotID = 1, C_Container.GetContainerNumSlots(bagID) do
								local containerItemInfo = C_Container.GetContainerItemInfo(bagID, slotID)
								if containerItemInfo then
									local containerItemLink = C_Item.GetItemLink(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
									if containerItemInfo.itemID == 117 then
										C_Container.UseContainerItem(bagID, slotID)
										break
									end
								end
							end
						end
					end)
				end
			end
		end
	end
end

e:RegisterEvent("MERCHANT_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "MERCHANT_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PurchaseQuestItemsEnabled == false or HelpMePlayDB.PurchaseQuestItemsEnabled == nil then return false end
		
		local GUID = UnitGUID("target")
		if GUID then
			local _, _, _, _, _, npcID = string.split("-", GUID); npcID = tonumber(npcID)
			CheckMerchant(addon.QUESTMERCHANTS, npcID)
			CheckMerchant(HelpMePlayDB.PlayerDB.Merchants, npcID)
		end
	end
end)