local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function GetMapID(mapId)
	if mapId then
		local mapInfo = C_Map.GetMapInfo(mapId)
		if mapInfo then
			if mapInfo.mapType ~= 3 then
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
	local flightPathName = ""
	for _, flightPath in pairs(addonTable.FLIGHT_PATHS[mapId]["g"]) do
		for _, condition in ipairs(flightPath.c) do
			if condition == "quests.isActive" then
				for _, id in ipairs(flightPath.q) do
					if C_QuestLog.IsOnQuest(id) then
						takeFlightPath = true
						flightPathName = flightPath.p
					else
						return
					end
				end
			elseif condition == "target.is" then
				local npcId = select(6, string.split("-", UnitGUID("target"))); npcId = tonumber(npcId)
				if npcId == flightPath.t then
					takeFlightPath = true
					flightPathName = flightPath.p
				else
					return
				end
			elseif condition == "player.faction" then
				if (UnitFactionGroup("player")) == flightPath.f then
					takeFlightPath = true
					flightPathName = flightPath.p
				else
					return
				end
			end
		end
	end
	if takeFlightPath then
		for i = 1, NumTaxiNodes() do
			local taxiNodeName = TaxiNodeName(i)
			if string.find(string.lower(taxiNodeName), string.lower(flightPathName)) then
				TakeTaxiNode(i)
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