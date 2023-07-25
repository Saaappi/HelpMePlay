local addonName, addon = ...
local events = CreateFrame("Frame")

events:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
events:SetScript("OnEvent", function(self, event, ...)
	if ( event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.ChromieTimeID == 99 or HelpMePlayDB.ChromieTimeID == nil then return false end
		
		local type = ...
		local chromieTimeID = UnitChromieTimeID("player")
		local playerLevel = UnitLevel("player")
		if ( type == 45 ) then
			if IsShiftKeyDown() == false then
				if ( playerLevel < addon.CONSTANTS["CHROMIE_TIME_MAX_LEVEL"] ) then
					if ( chromieTimeID ~= HelpMePlayDB.ChromieTimeID ) then
						C_ChromieTime.SelectChromieTimeOption(HelpMePlayDB.ChromieTimeID)
						events:UnregisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
					end
				end
			end
		end

		if ( chromieTimeID == HelpMePlayDB.ChromieTimeID or playerLevel >= addon.CONSTANTS["CHROMIE_TIME_MAX_LEVEL"] ) then
		    if ( events:IsEventRegistered("PLAYER_INTERACTION_MANAGER_FRAME_SHOW") ) then
		        events:UnregisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
		    end
		end
	end
end)