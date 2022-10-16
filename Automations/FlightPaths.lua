local addonName, addonTable = ...
local e = CreateFrame("Frame")

local function GetMapID(mapId)
	if mapId then
		local mapInfo = C_Map.GetMapInfo(mapId)
		if mapInfo then
			if mapInfo.mapType ~= 3 and mapInfo.mapType ~= 4 then
				GetMapID(mapInfo.parentMapID)
			else
				mapId = mapInfo.mapID
			end
		end
	end
	return mapId
end

local function TakeFlightPath(mapId)
	local takeFlightPath = false
	local flightPathNodeId = 0
	if next(addonTable.FLIGHT_PATHS[mapId]) then
		for _, flightPath in pairs(addonTable.FLIGHT_PATHS[mapId]["g"]) do
			for _, condition in ipairs(flightPath.c) do
				if condition == "level.between" then
					local minLevel, maxLevel = flightPath.l[1], flightPath.l[2]
					local playerLevel = UnitLevel("player")
					
					if playerLevel >= minLevel and playerLevel <= maxLevel then
						takeFlightPath = true
						flightPathNodeId = flightPath.p
					else
						return
					end
				elseif condition == "quests.isActive" then
					for _, id in ipairs(flightPath.q) do
						if C_QuestLog.IsOnQuest(id) then
							takeFlightPath = true
							flightPathNodeId = flightPath.p
						else
							return
						end
					end
				elseif condition == "quests.isComplete" then
					for _, id in ipairs(flightPath.q) do
						if C_QuestLog.IsQuestFlaggedCompleted(id) then
							takeFlightPath = true
							flightPathNodeId = flightPath.p
						else
							return
						end
					end
				elseif condition == "target.is" then
					local npcId = select(6, string.split("-", UnitGUID("target"))); npcId = tonumber(npcId)
					if npcId == flightPath.t then
						takeFlightPath = true
						flightPathNodeId = flightPath.p
					else
						return
					end
				elseif condition == "player.faction" then
					if (UnitFactionGroup("player")) == flightPath.f then
						takeFlightPath = true
						flightPathNodeId = flightPath.p
					else
						return
					end
				end
			end
		end
	end
	if takeFlightPath then
		local flightPaths = C_TaxiMap.GetTaxiNodesForMap(mapId)
		for i = 1, NumTaxiNodes() do
			if flightPaths[i].nodeID == flightPathNodeId then
				TakeTaxiNode(i)
				return
			end
		end
	end
end

e:RegisterEvent("TAXIMAP_OPENED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "TAXIMAP_OPENED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.FlightPathsEnabled == false or HelpMePlayDB.FlightPathsEnabled == nil then return false end
		
		local system = ...
		if system == 2 then
			-- 2 is the "Adventure" taxi map.
			local mapId = GetMapID(C_Map.GetBestMapForUnit("player"))
			TakeFlightPath(mapId)
		end
	end
end)