local _, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
		local type = ...
		if type == 5 then -- Merchant
			if CanMerchantRepair() then
                if HelpMePlayDB["shouldAutomaticRepair"] == false then return end

			    local repairCost = GetRepairAllCost()
                if repairCost then
                    if GetMoney() > repairCost and repairCost > 0 then
                        HelpMePlay.Print("Repaired for " .. C_CurrencyInfo.GetCoinTextureString(repairCost))
                        RepairAllItems(false)
                    end
                end
			end
		end
	end
end)