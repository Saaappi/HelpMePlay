local addonName, addon = ...
local events = CreateFrame("Frame")

local function TakeFlightPath(nodeID, mapID)
	local taxiNodes = C_TaxiMap.GetAllTaxiNodes(mapID)
	for i, taxiNodeData in ipairs(taxiNodes) do
		local dest, zone = string.split(",", taxiNodeData.name); zone = zone:gsub("%s+", "")
		if ( taxiNodeData.nodeID == nodeID ) then
			if taxiNodeData.state ~= _G.Enum.FlightPathState.Reachable then return end
			if ( IsMounted() ) then
				Dismount()
			end
			print(string.format("%s: Flying to: [|cffFFD100%s|r]!", addon.CONSTANTS.COLORED_ADDON_NAME, dest))
			TakeTaxiNode(taxiNodeData.slotIndex)
			return
		end
	end
end

local function GetFlightPathInfo(mapID)
    for i = 1, #addon.FLIGHT_PATHS[mapID]["g"] do
        local flightPath = addon.FLIGHT_PATHS[mapID]["g"][i]
        local numConditions = #flightPath.c
        local numConditionsMatched = 0
        for _, condition in ipairs(flightPath.c) do
            if ( condition == "level.between" ) then
                local minLevel, maxLevel = flightPath.l[1], flightPath.l[2]
                local playerLevel = UnitLevel("player")
                if ( playerLevel >= minLevel and playerLevel <= maxLevel ) then
                    numConditionsMatched = numConditionsMatched + 1
                end
            elseif ( condition == "quests.active" ) then
                for _, id in ipairs(flightPath.q) do
                    if ( C_QuestLog.IsOnQuest(id) ) then
                        numConditionsMatched = numConditionsMatched + 1
                    end
                end
            elseif ( condition == "quests.complete" ) then
                local numQuests = #flightPath.q
                for i = 1, numQuests do
                    if ( C_QuestLog.IsQuestFlaggedCompleted(flightPath.q[i]) == false ) then
                        numQuests = numQuests - 1
                        if ( numQuests == 0 ) then
                            numConditionsMatched = numConditionsMatched + 1
                        end
                    end
                end
            elseif ( condition == "quests.notComplete" ) then
                local numQuests = #flightPath.q
                for i = 1, numQuests do
                    if ( C_QuestLog.IsQuestFlaggedCompleted(flightPath.q[i]) == false ) then
                        numQuests = numQuests - 1
                        if ( numQuests == 0 ) then
                            numConditionsMatched = numConditionsMatched + 1
                        end
                    end
                end
            elseif ( condition == "target.is" ) then
                local npcId = select(6, string.split("-", UnitGUID("target"))); npcId = tonumber(npcId)
                if ( npcId == flightPath.t ) then
                    numConditionsMatched = numConditionsMatched + 1
                end
            elseif ( condition == "player.faction" ) then
                if ( UnitFactionGroup("player") == flightPath.f ) then
                    numConditionsMatched = numConditionsMatched + 1
                end
            elseif ( condition == "map" ) then
                if ( C_Map.GetBestMapForUnit("player") == flightPath.m ) then
                    numConditionsMatched = numConditionsMatched + 1
                end
            end
        end
        if ( numConditionsMatched == numConditions ) then
            TakeFlightPath(flightPath.p, mapId)
        end
    end
end

events:RegisterEvent("TAXIMAP_OPENED")
events:SetScript("OnEvent", function(self, event, ...)
	if ( event == "TAXIMAP_OPENED" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.FlightPathsEnabled == false or HelpMePlayDB.FlightPathsEnabled == nil then return false end
		
		local system = ...
		if ( system == 2 ) then
		    local taxiMapID = GetTaxiMapID()
		    if ( taxiMapID and addon.FLIGHT_PATHS[taxiMapID] ) then
			    GetFlightPathInfo(taxiMapID)
		    end
		end
	end
end)