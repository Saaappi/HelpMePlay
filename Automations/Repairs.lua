local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

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
		if HelpMePlayOptionsDB.Merchants == false or HelpMePlayOptionsDB.Merchants == nil then return end
		local repairCost, needsRepair = GetRepairAllCost()
		if repairCost > 0 and GetMoney() > repairCost then
			if CanMerchantRepair() then
				RepairAllItems(false)
			end
		end
	end
end)