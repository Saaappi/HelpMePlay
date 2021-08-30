local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local playerLevel = 50

e:RegisterEvent("PLAYER_UPDATE_RESTING")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_UPDATE_RESTING" then
		if C_PvP.CanToggleWarModeInArea() and UnitLevel("player") < playerLevel then
			-- Player is in Stormwind City or Orgrimmar
			C_PvP.ToggleWarMode()
		end
	end
end)