local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("MERCHANT_SHOW")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "MERCHANT_SHOW" then
		if HelpMePlayOptionsDB.Merchants == false then return end
		-- Check if the player needs to repair.
		-- If the player needs repairs, check
		-- if the merchant can repair, then repair
		-- if the player has enough money.
		--
		-- Does NOT use guild repair.
		local repairCost, needsRepair = GetRepairAllCost()
		if repairCost > 0 and GetMoney() > repairCost then
			if CanMerchantRepair() then
				RepairAllItems(false)
			end
		end
	end
end)