local addonName, addon = ...
local e = CreateFrame("Frame")

--[[
	Description:
		If the player needs to repair, has the money to
		repair, and the merchant can repair the player's
		equipment, then automatically repair, assuming
		the Merchants automation is enabled.
		
		This automation will *NEVER* use guild repairs!
]]--
e:RegisterEvent("MERCHANT_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "MERCHANT_SHOW" then
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