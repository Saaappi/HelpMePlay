local addonName, addonTable = ...
local e = CreateFrame("Frame")

--[[
	Description:
		If enabled, upon entering Orgrimmar or Stormwind,
		War Mode will automatically be enabled after
		the timer expires.
		
		War Mode is often faster to use for leveling than
		without, especially for alliance.
]]--
e:RegisterEvent("PLAYER_LEVEL_CHANGED")
e:RegisterEvent("ZONE_CHANGED_NEW_AREA")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LEVEL_CHANGED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.WarModeEnabled == false or HelpMePlayDB.WarModeEnabled == nil then return false end
		local _, newLevel = ...
		if newLevel == 20 then
			print(addonTable.CONSTANTS.COLORED_ADDON_NAME .. ": You should return to Orgrimmar (Horde) or Stormwind City (Alliance) to enable War Mode for bonus experience!")
			
			local mapID = C_Map.GetBestMapForUnit("player")
			if (mapID == 84 or mapID == 85) and UnitLevel("player") < addonTable.CONSTANTS["WAR_MODE_MAX_LEVEL"] then
				if C_PvP.IsWarModeDesired() == false then
					C_Timer.After(addonTable.CONSTANTS["FIVE_SECONDS"], function()
						C_PvP.ToggleWarMode()
					end)
				end
			end
		end
	end
	if event == "ZONE_CHANGED_NEW_AREA" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.WarModeEnabled == false or HelpMePlayDB.WarModeEnabled == nil then return false end
		local mapID = C_Map.GetBestMapForUnit("player")
		if (mapID == 84 or mapID == 85) and UnitLevel("player") < addonTable.CONSTANTS["WAR_MODE_MAX_LEVEL"] then
			if C_PvP.IsWarModeDesired() == false then
				C_Timer.After(addonTable.CONSTANTS["FIVE_SECONDS"], function()
					C_PvP.ToggleWarMode()
				end)
			end
		end
	end
end)