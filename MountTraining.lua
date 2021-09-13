local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("TRAINER_SHOW")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "TRAINER_SHOW" then
		if HelpMePlayOptionsDB.MountTraining == false then return end
		local numTrainerServices = GetNumTrainerServices()
		if numTrainerServices > 0 then
			for i = 1, numTrainerServices do
				if GetTrainerServiceSkillLine(i) == L["Riding"] then
					if GetMoney() > (tonumber(GetTrainerServiceCost(i)+3000000)) or GetMoney() > (tonumber(GetTrainerServiceCost(i)*2)) then
						-- If the player has at least twice the amount of cost for the Riding training, then buy it.
						BuyTrainerService(i)
					end
				end
			end
		end
	end
end)