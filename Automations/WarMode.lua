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
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.WarModeEnabled == false or HelpMePlayDB.WarModeEnabled == nil then return false end
		local _, newLevel = ...
		if newLevel == 20 then
			if UnitFactionGroup("player") == "Alliance" then
				addonTable.Print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Notifications.WarModeReminder.Alliance"])
			else
				addonTable.Print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Notifications.WarModeReminder.Horde"])
			end
		end
	end
	if event == "ZONE_CHANGED_NEW_AREA" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.WarModeEnabled == false or HelpMePlayDB.WarModeEnabled == nil then return false end
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