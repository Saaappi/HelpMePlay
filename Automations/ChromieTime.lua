local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.ChromieTimeID == 99 or HelpMePlayDB.ChromieTimeID == nil then return false end
		
		local type = ...
		if type == 45 then
			if IsShiftKeyDown() == false then
				local playerLevel = UnitLevel("player")
				if playerLevel < addonTable.CONSTANTS["CHROMIE_TIME_MAX_LEVEL"] then
					if UnitChromieTimeID("player") ~= HelpMePlayDB.ChromieTimeID then
						C_ChromieTime.SelectChromieTimeOption(HelpMePlayDB.ChromieTimeID)
					end
				end
			end
		end
	end
end)