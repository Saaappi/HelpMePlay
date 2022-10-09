local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local ctMaxLevel = 50

--[[
	Description:
		If the player has selected an expansion for Chromie Time,
		and their level is less than Chromie Time's max level, then
		choose that expansion for the player when Chromie Time is
		opened.
]]--
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