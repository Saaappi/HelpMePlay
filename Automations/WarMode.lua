local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

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
		local _, newLevel = ...
		if newLevel == 20 then
			if HelpMePlayOptionsDB.Logging then
				if UnitFactionGroup("player") == "Alliance" then
					print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["War Mode Reminder: Alliance"])
				else
					print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["War Mode Reminder: Horde"])
				end
			end
		end
	end
	if event == "ZONE_CHANGED_NEW_AREA" then
		if HelpMePlayOptionsDB.WarMode == false or HelpMePlayOptionsDB.WarMode == nil then return end
		local mapId = C_Map.GetBestMapForUnit("player")
		if (mapId == 84 or mapId == 85) and UnitLevel("player") < addonTable.CONSTANTS["WAR_MODE_MAX_LEVEL"] then
			if C_PvP.IsWarModeDesired() == false then
				C_Timer.After(addonTable.CONSTANTS["FIVE_SECONDS"], function()
					C_PvP.ToggleWarMode()
				end)
			end
		end
	end
end)