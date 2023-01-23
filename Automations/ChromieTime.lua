local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local ctMaxLevel = 60

e:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.ChromieTimeId == 99 or HelpMePlayDB.ChromieTimeId == nil then return false end
		
		local type = ...
		if type == 45 then
			if IsShiftKeyDown() == false then
				local playerLevel = UnitLevel("player")
				if playerLevel < ctMaxLevel then
					if UnitChromieTimeID("player") ~= HelpMePlayDB.ChromieTimeId then
						C_ChromieTime.SelectChromieTimeOption(HelpMePlayDB.ChromieTimeId)
					end
				end
			end
		end
	end
end)