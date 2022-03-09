local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("CHROMIE_TIME_OPEN")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHROMIE_TIME_OPEN" then
		local playerLevel = UnitLevel("player")
		if playerLevel <= 49 then
			if UnitChromieTimeID("player") ~= HelpMePlayOptionsDB.ChromieTimeExpansion then
				C_ChromieTime.SelectChromieTimeOption(HelpMePlayOptionsDB.ChromieTimeExpansion)
			end
		end
	end
end)