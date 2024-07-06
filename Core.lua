local addonName, HelpMePlay = ...
local eventFrame = CreateFrame("Frame")

function HelpMePlay.GetBestMapForUnit(uiMapID)
    local mapID = uiMapID or C_Map.GetBestMapForUnit("player")
    if mapID then
        local info = C_Map.GetMapInfo(mapID)
        if info and info.mapType == 3 then
            HelpMePlay.playerMapID = mapID
        elseif info and info.mapType > 3 then
            HelpMePlay.GetBestMapForUnit(info.parentMapID)
        end
    end
end

function HelpMePlay.Print(text)
    print(text)
end

local function OnEvent(_, event, arg1)
	if event == "ADDON_LOADED" then
		if addonName == arg1 then
            eventFrame:UnregisterEvent(event)
		end
	end
    if event == "PLAYER_LOGIN" then
        HelpMePlay.playerClassName, HelpMePlay.playerClassFileName, HelpMePlay.playerClassID = UnitClass("player")
        HelpMePlay.playerClassColor = C_ClassColor.GetClassColor(HelpMePlay.playerClassFileName)
        HelpMePlay.playerLevel = UnitLevel("player")
        HelpMePlay.playerSpecID = PlayerUtil.GetCurrentSpecID()
        HelpMePlay.playerSpecName = select(2, GetSpecializationInfo(HelpMePlay.playerSpecID))
        HelpMePlay.playerGUID = UnitGUID("player")
        HelpMePlay.playerMapID = HelpMePlay.GetBestMapForUnit(C_Map.GetBestMapForUnit("player"))

        local faction = UnitFactionGroup("player")
        if faction == "Alliance" then
            HelpMePlay.playerFactionID = 1
        elseif faction == "Horde" then
            HelpMePlay.playerFactionID = 0
        elseif faction == "Neutral" then
            HelpMePlay.playerFactionID = -1
        end
        eventFrame:UnregisterEvent(event)
    end
end

eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", OnEvent)