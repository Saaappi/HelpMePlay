local name, addon = ...
local e = CreateFrame("Frame")

local function TakeFlightPath(flightPathNodeId, mapId)
	local taxiNodes = C_TaxiMap.GetAllTaxiNodes(mapId)
	for i, taxiNodeData in ipairs(taxiNodes) do
		local dest, zone = string.split(",", taxiNodeData.name); zone = zone:gsub("%s+", "")
		if taxiNodeData.nodeID == flightPathNodeId then
			if taxiNodeData.state ~= _G.Enum.FlightPathState.Reachable then return end
			if _G.IsMounted() then
				_G.Dismount()
			end
			print(string.format("%s: Flying to: [|cffFFD100%s|r]!", addon.CONSTANTS.COLORED_ADDON_NAME, dest))
			TakeTaxiNode(taxiNodeData.slotIndex)
			return
		end
	end
end

local function GetFlightPathInfo(mapId)
	if addon.FLIGHT_PATHS[mapId] ~= nil then
		for i = 1, #addon.FLIGHT_PATHS[mapId]["g"] do
			local flightPath = addon.FLIGHT_PATHS[mapId]["g"][i]
			local numConditions = #flightPath.c
			local numConditionsMatched = 0
			for _, condition in ipairs(flightPath.c) do
				if condition == "level.between" then
					local minLevel, maxLevel = flightPath.l[1], flightPath.l[2]
					local playerLevel = UnitLevel("player")
					if playerLevel >= minLevel and playerLevel <= maxLevel then
						numConditionsMatched = numConditionsMatched + 1
					end
				elseif condition == "quests.active" then
					for _, id in ipairs(flightPath.q) do
						if C_QuestLog.IsOnQuest(id) then
							numConditionsMatched = numConditionsMatched + 1
						end
					end
				elseif condition == "quests.complete" then
					local numQuests = #flightPath.q
					for i = 1, numQuests do
						if C_QuestLog.IsQuestFlaggedCompleted(flightPath.q[i]) == false then
							numQuests = numQuests - 1
							if numQuests == 0 then
								numConditionsMatched = numConditionsMatched + 1
							end
						end
					end
				elseif condition == "quests.notComplete" then
					local numQuests = #flightPath.q
					for i = 1, numQuests do
						if C_QuestLog.IsQuestFlaggedCompleted(flightPath.q[i]) == false then
							numQuests = numQuests - 1
							if numQuests == 0 then
								numConditionsMatched = numConditionsMatched + 1
							end
						end
					end
				elseif condition == "target.is" then
					local npcId = select(6, string.split("-", UnitGUID("target"))); npcId = tonumber(npcId)
					if npcId == flightPath.t then
						numConditionsMatched = numConditionsMatched + 1
					end
				elseif condition == "player.faction" then
					if (UnitFactionGroup("player")) == flightPath.f then
						numConditionsMatched = numConditionsMatched + 1
					end
				elseif condition == "map" then
					if C_Map.GetBestMapForUnit("player") == flightPath.m then
						numConditionsMatched = numConditionsMatched + 1
					end
				end
			end
			if numConditionsMatched == numConditions then
				TakeFlightPath(flightPath.p, mapId)
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
			GetFlightPathInfo(GetTaxiMapID())
		end
	end
end)