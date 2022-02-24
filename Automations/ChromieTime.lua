local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("CHROMIE_TIME_OPEN")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHROMIE_TIME_OPEN" then
		local playerLevel = UnitLevel("player")
		if playerLevel <= 49 then
			if UnitChromieTimeID("player") ~= HelpMePlayOptionsDB.ChromieTimeExpansion then
				-- Select Legion for the player.
				C_ChromieTime.SelectChromieTimeOption(HelpMePlayOptionsDB.ChromieTimeExpansion)
			end
		end
	end
end)