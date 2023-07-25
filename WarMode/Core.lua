local addonName, addon = ...
local events = CreateFrame("Frame")

events:RegisterEvent("PLAYER_LEVEL_CHANGED")
events:RegisterEvent("ZONE_CHANGED_NEW_AREA")
events:SetScript("OnEvent", function(self, event, ...)
	if ( event == "PLAYER_LEVEL_CHANGED" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.WarModeEnabled == false or HelpMePlayDB.WarModeEnabled == nil then return false end

		local _, newLevel = ...
		if ( newLevel == 20 ) then
			print(addon.CONSTANTS.COLORED_ADDON_NAME .. ": You should return to Orgrimmar (Horde) or Stormwind City (Alliance) to enable War Mode for bonus experience!")
			
			local mapID = C_Map.GetBestMapForUnit("player")
			if ( mapID == 84 or mapID == 85 and UnitLevel("player") < addon.CONSTANTS["WAR_MODE_MAX_LEVEL"] ) then
				if ( C_PvP.IsWarModeDesired() == false ) then
					C_Timer.After(addon.CONSTANTS["FIVE_SECONDS"], function()
						C_PvP.ToggleWarMode()
					end)
				end
			end

			events:UnregisterEvent("PLAYER_LEVEL_CHANGED")
		elseif ( newLevel > 20 ) then
		    if ( events:IsEventRegistered("PLAYER_LEVEL_CHANGED") ) then
		        events:UnregisterEvent("PLAYER_LEVEL_CHANGED")
            end
		end
	end
	if ( event == "ZONE_CHANGED_NEW_AREA" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.WarModeEnabled == false or HelpMePlayDB.WarModeEnabled == nil then return false end

		local mapID = C_Map.GetBestMapForUnit("player")
		if ( mapID == 84 or mapID == 85 and UnitLevel("player") < addon.CONSTANTS["WAR_MODE_MAX_LEVEL"] ) then
			if ( C_PvP.IsWarModeDesired() == false ) then
				C_Timer.After(addon.CONSTANTS["FIVE_SECONDS"], function()
					C_PvP.ToggleWarMode()
					events:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
				end)
			end
		end
	end
end)