local addonName, addon = ...
local events = CreateFrame("Frame")

events:RegisterEvent("MERCHANT_SHOW")
events:SetScript("OnEvent", function(self, event, ...)
	if ( event == "MERCHANT_SHOW" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.RepairsEnabled == false or HelpMePlayDB.RepairsEnabled == nil then return false end

		local repairCost, needsRepair = GetRepairAllCost()
		if ( repairCost > 0 and GetMoney() > repairCost ) then
			if ( CanMerchantRepair() ) then
				RepairAllItems(false)
			end
		end
	end
end)