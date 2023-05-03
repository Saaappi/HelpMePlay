local name, addon = ...
local e = CreateFrame("Frame")

e:RegisterEvent("TRAINER_SHOW")
e:RegisterEvent("TRAINER_UPDATE")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "TRAINER_SHOW" or event == "TRAINER_UPDATE" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.TrainersEnabled == false or HelpMePlayDB.TrainersEnabled == nil then return false end
		local numTrainerServices = GetNumTrainerServices()
		if numTrainerServices > 0 then
			for i = 1, numTrainerServices do
				if GetMoney() > (tonumber(GetTrainerServiceCost(i) + HelpMePlayDB.TrainersMinAmount)) then
					BuyTrainerService(i)
				end
			end
		end
	end
end)