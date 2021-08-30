local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local playerLevel = 50

e:RegisterEvent("CHAT_MSG_CHANNEL_JOIN")
e:RegisterEvent("PLAYER_LOGIN")
e:RegisterEvent("PLAYER_UPDATE_RESTING")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_UPDATE_RESTING" or event == "CHAT_MSG_CHANNEL_JOIN" then
		local mapId = C_Map.GetBestMapForUnit("player")
		if (mapId == 84 or mapId == 85) and UnitLevel("player") < playerLevel then
			if C_PvP.IsWarModeActive() == false then
				C_PvP.ToggleWarMode()
			end
		end
	end
	if event == "PLAYER_LOGIN" then
		C_Timer.After(0, function()
			C_Timer.After(2.5, function()
				local mapId = C_Map.GetBestMapForUnit("player")
				if (mapId == 84 or mapId == 85) and UnitLevel("player") < playerLevel then
					if C_PvP.IsWarModeActive() == false then
						C_PvP.ToggleWarMode()
					end
				end
			end)
		end)
	end
end)