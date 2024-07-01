local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

local function ToggleWarMode()
    C_Timer.After(addon.Constants["TIMER_DELAY"], function()
        C_PvP.ToggleWarMode()
        eventHandler:UnregisterEvent("PLAYER_LOGIN")
        eventHandler:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
    end)
end

local function OnTaxi()
    C_Timer.After(addon.Constants["TIMER_DELAY"] + 0.9, function()
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
		if UnitLevel("player") < addon.Constants["CHROMIE_TIME_MAX_LEVEL"] then
            local isEnlisted = addon.EvaluateConditions({"WAR_MODE_INACTIVE"})
			if isEnlisted then
				eventHandler:UnregisterEvent("PLAYER_LOGIN")
				eventHandler:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
				return true
			end
			local mapID = C_Map.GetBestMapForUnit("player")
			if mapID == 84 or mapID == 85 then
			    OnTaxi()
			end
		else
			eventHandler:UnregisterEvent("PLAYER_LOGIN")
			eventHandler:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
		end
	end
end)