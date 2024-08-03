local _, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")

local function OnTaxi()
	if UnitOnTaxi("player") then
		C_Timer.After(0.5, OnTaxi)
	else
		return false
	end
end

eventHandler:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventHandler:SetScript("OnEvent", function(self, event, ...)
	if event == "ZONE_CHANGED_NEW_AREA" then
	    if HelpMePlayDB["UseWarMode"] == false then return end
		if C_PvP.IsWarModeActive() then return end

		if HelpMePlay.playerLevel < HelpMePlay.Constants["CHROMIE_TIME_MAX_LEVEL"] then
			local mapID = C_Map.GetBestMapForUnit("player")
			if mapID == 84 or mapID == 85 then
				if not OnTaxi() then
					local isEnlisted = false
					local warModeSpells = {269083, 282559}
					for _, spellID in next, warModeSpells do
						local aura = C_UnitAuras.GetPlayerAuraBySpellID(spellID)
						if aura and aura.name then
							isEnlisted = true
							break
						end
					end
					if not isEnlisted then
						C_PvP.ToggleWarMode()
						eventHandler:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
					end
				end
			end
		else
			eventHandler:UnregisterEvent("ZONE_CHANGED_NEW_AREA")
		end
	end
end)