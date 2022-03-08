local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("TRAINER_SHOW")
e:RegisterEvent("TRAINER_UPDATE")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "TRAINER_SHOW" or event == "TRAINER_UPDATE" then
		if HelpMePlayOptionsDB.Trainers == false or HelpMePlayOptionsDB.Trainers == nil then return end
		local numTrainerServices = GetNumTrainerServices()
		if numTrainerServices > 0 then
			for i=1,numTrainerServices do
				if GetMoney() > (tonumber(GetTrainerServiceCost(i)+3000000)) or GetMoney() > (tonumber(GetTrainerServiceCost(i)*2)) then
					-- If the player has at least twice the
					-- amount of cost for the training, then
					-- buy it.
					BuyTrainerService(i)
				end
			end
		end
	end
end)