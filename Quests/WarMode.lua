local _, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")

local function ToggleWarMode()
	C_PvP.ToggleWarMode()
	eventHandler:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
end

local function OnTaxi()
    C_Timer.After(1, function()
        if UnitOnTaxi("player") then
            OnTaxi()
        else
            ToggleWarMode()
        end
    end)
end

eventHandler:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventHandler:SetScript("OnEvent", function(self, event, ...)
	if event == "ZONE_CHANGED_NEW_AREA" then
	    if HelpMePlayDB["UseWarMode"] == false then return end
		if HelpMePlay.playerLevel < HelpMePlay.Constants["CHROMIE_TIME_MAX_LEVEL"] then
			local mapID = C_Map.GetBestMapForUnit("player")
			if (mapID == 84 or mapID == 85) and (not C_PvP.IsWarModeActive()) then
				OnTaxi()
			end
		else
			eventHandler:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
		end
	end
end)