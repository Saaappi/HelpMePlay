local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local delay = 1.5
local playerLevel = 50

e:RegisterEvent("PLAYER_LEVEL_CHANGED")
e:RegisterEvent("ZONE_CHANGED_NEW_AREA")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LEVEL_CHANGED" then
		local _, newLevel = ...
		if newLevel == 20 then
			print(L["Colored Addon Name"] .. ": " .. L["War Mode Reminder"])
		end
	end
	if event == "ZONE_CHANGED_NEW_AREA" then
		if HelpMePlayOptionsDB.WarMode == false or HelpMePlayOptionsDB.WarMode == nil then return end
		C_Timer.After(0, function()
			C_Timer.After(delay, function()
				local mapId = C_Map.GetBestMapForUnit("player")
				if (mapId == 84 or mapId == 85) and UnitLevel("player") < playerLevel then
					if C_PvP.IsWarModeDesired() == false then
						C_PvP.ToggleWarMode()
					end
				end
			end)
		end)
	end
end)