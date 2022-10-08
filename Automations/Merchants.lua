local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("MERCHANT_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "MERCHANT_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PurchaseQuestItemsEnabled == false or HelpMePlayDB.PurchaseQuestItemsEnabled == nil then return false end
		local guid = UnitGUID("target") or UnitGUID("mouseover")
		local numMerchantItems = GetMerchantNumItems()
		for i = 1, numMerchantItems do
			local merchantItemLink = GetMerchantItemLink(i)
			if merchantItemLink then
				local _, _, _, _, _, itemType = GetItemInfo(itemLink)
				if itemType == "Quest" then
					BuyMerchantItem(i, 1)
					break
				end
			end
		end
	end
end)