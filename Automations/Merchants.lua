local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function GetQuantity(itemName)
	local _, numQuests = C_QuestLog.GetNumQuestLogEntries()
	for i=1, numQuests do
		local questInfo = C_QuestLog.GetInfo(i)
		if questInfo.questID > 0 then
			local objectives = C_QuestLog.GetQuestObjectives(questInfo.questID)
			for i=1, #objectives do
				local objective = objectives[i]
				if string.find(objective.text, itemName) then
					return objective.numRequired
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
		
		local guid = UnitGUID("target") or UnitGUID("mouseover")
		local numMerchantItems = GetMerchantNumItems()
		for i=1, numMerchantItems do
			local itemLink = GetMerchantItemLink(i)
			if itemLink then
				local itemName, _, _, _, _, itemType = GetItemInfo(itemLink)
				if itemType == "Quest" then
					local quantity = GetQuantity(itemName)
					BuyMerchantItem(i, quantity)
					break
				end
			end
		end
	end
end)