local addonName, addon = ...
local e = CreateFrame("Frame")

local function CheckMerchant(tbl, npcID)
	for merchantID,merchantData in pairs(tbl) do
		if (merchantID == npcID) then
			local numMerchantItems = GetMerchantNumItems()
			for i=1,#merchantData do
				if (C_QuestLog.IsOnQuest(merchantData[i].questID) or merchantData[i].questID == 0) then
					for item=1,numMerchantItems do
						if (GetMerchantItemID(item) == merchantData[i].itemID) then
							BuyMerchantItem(item, merchantData[i].itemCount)
						end
					end
					--test
					C_Timer.After(0.5, function()
						for bagID=0,4 do
							for slotID=1,C_Container.GetContainerNumSlots(bagID) do
								local containerItemInfo = C_Container.GetContainerItemInfo(bagID, slotID)
								if (containerItemInfo) then
									local containerItemLink = C_Item.GetItemLink(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
									if (containerItemInfo.itemID == 117) then
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