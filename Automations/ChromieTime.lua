local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local ctMaxLevel = 60

e:RegisterEvent("CHROMIE_TIME_OPEN")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHROMIE_TIME_OPEN" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.ChromieTimeId == 99 or HelpMePlayDB.ChromieTimeId == nil then return false end
		if IsShiftKeyDown() == false then
			C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
				local playerLevel = UnitLevel("player")
				if playerLevel < ctMaxLevel then
					if UnitChromieTimeID("player") ~= HelpMePlayDB.ChromieTimeId then
						C_ChromieTime.SelectChromieTimeOption(HelpMePlayDB.ChromieTimeId)
					end
				end
			end)
		end
	end
end)