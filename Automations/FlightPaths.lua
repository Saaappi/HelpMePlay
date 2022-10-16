local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function TakeFlightPath(flightPathNodeId, mapId)
	local taxiNodes = C_TaxiMap.GetAllTaxiNodes(mapId)
	for i, taxiNodeData in ipairs(taxiNodes) do
		local dest, zone = string.split(",", taxiNodeData.name); zone = zone:gsub("%s+", "")
		if taxiNodeData.nodeID == flightPathNodeId then
			if taxiNodeData.state ~= _G.Enum.FlightPathState.Reachable then return end
			if _G.IsMounted() then
				_G.Dismount()
			end
			print(string.format("%s: %s [%s]!", L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"], L_GLOBALSTRINGS["Text.Output.FlyingTo"], dest))
			TakeTaxiNode(taxiNodeData.slotIndex)
			return
		end
	end
end

local function GetFlightPathInfo(mapId)
	local takeFlightPath = false
	local flightPathNodeId = 0
	local criteriaCount = nil
	
	if addonTable.FLIGHT_PATHS[mapId] ~= nil then
		for i = 1, #addonTable.FLIGHT_PATHS[mapId]["g"] do
			local flightPath = addonTable.FLIGHT_PATHS[mapId]["g"][i]
			local criteriaCount = #flightPath.c
			
			for _, condition in ipairs(flightPath.c) do
				if condition == "level.between" then
					local minLevel, maxLevel = flightPath.l[1], flightPath.l[2]
					local playerLevel = UnitLevel("player")
					
					if playerLevel >= minLevel and playerLevel <= maxLevel then
						takeFlightPath = true
						criteriaCount = criteriaCount - 1
						flightPathNodeId = flightPath.p
					else
						return
					end
				elseif condition == "quests.isActive" then
					for _, id in ipairs(flightPath.q) do
						if C_QuestLog.IsOnQuest(id) then
							takeFlightPath = true
							criteriaCount = criteriaCount - 1
							flightPathNodeId = flightPath.p
						else
							return
						end
					end
				elseif condition == "quests.isComplete" then
					for _, id in ipairs(flightPath.q) do
						if C_QuestLog.IsQuestFlaggedCompleted(id) then
							takeFlightPath = true
							criteriaCount = criteriaCount - 1
							flightPathNodeId = flightPath.p
						else
							return
						end
					end
				elseif condition == "target.is" then
					local npcId = select(6, string.split("-", UnitGUID("target"))); npcId = tonumber(npcId)
					if npcId == flightPath.t then
						takeFlightPath = true
						criteriaCount = criteriaCount - 1
						flightPathNodeId = flightPath.p
					else
						return
					end
				elseif condition == "player.faction" then
					if (UnitFactionGroup("player")) == flightPath.f then
						takeFlightPath = true
						criteriaCount = criteriaCount - 1
						flightPathNodeId = flightPath.p
					else
						return
					end
				end
				
				if criteriaCount == 0 and takeFlightPath then
					-- We must have found a match.
					TakeFlightPath(flightPathNodeId, mapId)
				end
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