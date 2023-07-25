local addonName, addon = ...
local events = CreateFrame("Frame")

events:RegisterEvent("TRAINER_SHOW")
events:RegisterEvent("TRAINER_UPDATE")
events:SetScript("OnEvent", function(self, event, ...)
	if ( event == "TRAINER_SHOW" or event == "TRAINER_UPDATE" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.TrainersEnabled == false or HelpMePlayDB.TrainersEnabled == nil then return false end

		local numTrainerServices = GetNumTrainerServices()
		if ( numTrainerServices > 0 ) then
			for i = 1, numTrainerServices do
				if ( GetMoney() > (tonumber(GetTrainerServiceCost(i) + HelpMePlayDB.TrainersMinAmount)) ) then
					BuyTrainerService(i)
				end
			end
		end
	end
end)