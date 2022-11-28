local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("PARTY_INVITE_REQUEST")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PARTY_INVITE_REQUEST" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.RepairsEnabled == false or HelpMePlayDB.RepairsEnabled == nil then return false end
		local repairCost, needsRepair = GetRepairAllCost()
		if repairCost > 0 and GetMoney() > repairCost then
			if CanMerchantRepair() then
				RepairAllItems(false)
			end
		end
	end
end)