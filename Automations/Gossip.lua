local addonName, addonTable = ...
local e = CreateFrame("Frame")
local npcID = 0
local options = ""

local function HasGossip(gossips, npcID)
	return gossips[npcID] ~= nil
end

local function GetGossips(parentMapID)
	-- Create an empty variable.
	local gossips
	
	-- Check the provided parentMapID variable. If there's a match, then assign the
	-- appropriate gossip table from the addon.
	if parentMapID == 12 or parentMapID == 13 or parentMapID == 948 then
		gossips = addonTable.DIALOG_CLASSIC
	elseif parentMapID == 572 then
		gossips = addonTable.DIALOG_WOD
	elseif parentMapID == 619 or parentMapID == 630 or parentMapID == 905 then
		gossips = addonTable.DIALOG_LEGION
	elseif parentMapID == 875 or parentMapID == 876 then
		gossips = addonTable.DIALOG_BFA
	elseif parentMapID == 1409 or parentMapID == 1550 or parentMapID == 1610 then
		gossips = addonTable.DIALOG_SL
	elseif parentMapID == 946 or parentMapID == 1978 or parentMapID == 2089 then
		gossips = addonTable.DIALOG_DF
	end
	
	-- Return the gossip table to the calling function.
	return gossips
end

local function SelectOption(options, npcID, parentMapID)
	-- Player-submitted gossip options. I need to do some work here.
	for index, gossipSubTable in ipairs(options) do
		if HelpMePlayPlayerDialogDB[npcID] then
			if HelpMePlayPlayerDialogDB[npcID]["g"] then
				for _, index in ipairs(HelpMePlayPlayerDialogDB[npcID]["g"]) do
					C_GossipInfo.SelectOption(index)
				end
			end
		end
	end
	
	-- Get the gossip table based on the current map.
	local gossips = GetGossips(parentMapID)
	if gossips ~= {} then
		if HasGossip(gossips, npcID) then
			for _, gossip in pairs(gossips[npcID]["g"]) do
				local numConditions = #gossip.c
				local numConditionsMatched = 0
				for _, condition in ipairs(gossip.c) do
					if condition == "none" then
						C_GossipInfo.SelectOption(gossip.o)
					elseif condition == "level.higher" then
						if UnitLevel("player") > gossip.l then
							numConditionsMatched = numConditionsMatched + 1
						end
					elseif condition == "level.equal" then
						if UnitLevel("player") == gossip.l then
							numConditionsMatched = numConditionsMatched + 1
						end
					elseif condition == "level.lower" then
						if UnitLevel("player") < gossip.l then
							numConditionsMatched = numConditionsMatched + 1
						end
					elseif condition == "level.between" then
						local minLevel, maxLevel = gossip.l[1], gossip.l[2]
						local playerLevel = UnitLevel("player")
						
						if playerLevel >= minLevel and playerLevel <= maxLevel then
							numConditionsMatched = numConditionsMatched + 1
						end
					elseif condition == "money.higher" then
						if GetMoney("player") > gossip.m then
							numConditionsMatched = numConditionsMatched + 1
						end
					elseif condition == "quests.active" then
						local numQuests = #gossip.q
						for i = 1, numQuests do
							if C_QuestLog.IsOnQuest(gossip.q[i]) then
								numQuests = numQuests - 1
								if numQuests == 0 then
									numConditionsMatched = numConditionsMatched + 1
								end
							end
						end
					elseif condition == "quests.notActive" then
						local numQuests = #gossip.q
						for i = 1, numQuests do
							if C_QuestLog.IsOnQuest(gossip.q[i]) == false then
								numQuests = numQuests - 1
								if numQuests == 0 then
									numConditionsMatched = numConditionsMatched + 1
								end
							end
						end
					elseif condition == "quests.complete" then
						local numQuests = #gossip.q
						for i = 1, numQuests do
							if C_QuestLog.IsQuestFlaggedCompleted(gossip.q[i]) then
								numQuests = numQuests - 1
								if numQuests == 0 then
									numConditionsMatched = numConditionsMatched + 1
								end
							end
						end
					elseif condition == "quests.notComplete" then
						local numQuests = #gossip.q
						for i = 1, numQuests do
							if C_QuestLog.IsQuestFlaggedCompleted(gossip.q[i]) == false then
								numQuests = numQuests - 1
								if numQuests == 0 then
									numConditionsMatched = numConditionsMatched + 1
								end
							end
						end
					elseif condition == "quest.obj.complete" then
						local numQuests = #gossip.objs
						for i = 1, numQuests do
							local objectives = {}
							for k, v in ipairs(gossip.objs) do
								objectives = C_QuestLog.GetQuestObjectives(v.q)
								if objectives[v.o] then
									if objectives[v.o].finished then
										numQuests = numQuests - 1
										if numQuests == 0 then
											numConditionsMatched = numConditionsMatched + 1
										end
									end
								end
							end
						end
					elseif condition == "quest.obj.notComplete" then
						local numQuests = #gossip.objs
						for i = 1, numQuests do
							local objectives = {}
							for k, v in ipairs(gossip.objs) do
								objectives = C_QuestLog.GetQuestObjectives(v.q)
								if objectives[v.o] then
									if objectives[v.o].finished == false then
										numQuests = numQuests - 1
										if numQuests == 0 then
											numConditionsMatched = numConditionsMatched + 1
										end
									end
								end
							end
						end
					elseif condition == "quest.obj.count.complete" then
						local objectives = C_QuestLog.GetQuestObjectives(gossip.q)
						if objectives[gossip.obj] then
							if objectives[gossip.obj].numFulfilled > gossip.v then
								numConditionsMatched = numConditionsMatched + 1
							end
						end
					elseif condition == "quest.obj.count.notComplete" then
						local objectives = C_QuestLog.GetQuestObjectives(gossip.q)
						if objectives[gossip.obj] then
							if objectives[gossip.obj].numFulfilled < gossip.v then
								numConditionsMatched = numConditionsMatched + 1
							end
						end
					elseif condition == "player.faction" then
						if (UnitFactionGroup("player")) == gossip.f then
							numConditionsMatched = numConditionsMatched + 1
						end
					elseif condition == "map" then
						if C_Map.GetBestMapForUnit("player") == gossip.m then
							numConditionsMatched = numConditionsMatched + 1
						end
					elseif condition == "chromieTime" then
						if UnitChromieTimeID("player") == gossip.ct then
							numConditionsMatched = numConditionsMatched + 1
						end
					elseif condition == "addon.setting" then
						if gossip.s == "BFAIntroEnabled" then
							local faction = UnitFactionGroup("player")
							if HelpMePlayDB[gossip.s][faction] == gossip.r then
								numConditionsMatched = numConditionsMatched + 1
							end
						else
							if HelpMePlayDB[gossip.s] == gossip.r then
								numConditionsMatched = numConditionsMatched + 1
							end
						end
					end
				end
				if numConditionsMatched == numConditions then
					C_GossipInfo.SelectOption(gossip.o)
				end
			end
		end
	end
end

local function GetParentMapIDForConfirm(mapID)
	-- Set the scope for the parentMapID variable to the entire function.
	local parentMapID = 0
	
	-- Ensure the provided mapID variable is valid before using it downstream.
	if mapID then
		-- Get information about the current map using the above ID.
		local mapInfo = C_Map.GetMapInfo(mapID)
		
		-- We need to always check if we're dealing with the highest ZONE in a map chain.
		--
		-- Example: Random Cave > Random Den > Highmountain > Broken Isles
		-- In the above example, the highest ZONE we would be dealing with is Highmountain
		-- because Random Cave and Random Den would be MICRO ZONES to Highmountain and the
		-- Broken Isles is a CONTINENT.
		--
		-- If the map's type is NOT Cosmic (0) and it's not a Continent (2), then work up
		-- in the map chain until we find a map with a type of 0 or 2.
		if mapInfo.mapType ~= 0 and mapInfo.parentMapID ~= 2 then
			GetParentMapID(mapInfo.parentMapID)
		else
			parentMapID = mapInfo.mapID
		end
	end
	
	return parentMapID
end

local function GetParentMapID(mapID)
	-- Set the scope for the parentMapID variable to the entire function.
	local parentMapID
	
	-- Ensure the provided mapID variable is valid before using it downstream.
	if mapID then
		-- Get information about the current map using the above ID.
		local mapInfo = C_Map.GetMapInfo(mapID)
		
		-- We need to always check if we're dealing with the highest ZONE in a map chain.
		--
		-- Example: Random Cave > Random Den > Highmountain > Broken Isles
		-- In the above example, the highest ZONE we would be dealing with is Highmountain
		-- because Random Cave and Random Den would be MICRO ZONES to Highmountain and the
		-- Broken Isles is a CONTINENT.
		--
		-- If the map's type is NOT Cosmic (0) and it's not a Continent (2), then work up
		-- in the map chain until we find a map with a type of 0 or 2.
		if mapInfo.mapType ~= 0 and mapInfo.mapType ~= 2 then
			GetParentMapID(mapInfo.parentMapID)
		else
			parentMapID = mapInfo.mapID
		end
	end

	-- Call the SelectOption function.
	SelectOption(options, npcID, parentMapID)
end

local function GetNPCID()
	if IsShiftKeyDown() then
		C_Timer.After(addonTable.CONSTANTS["GOSSIP_SHOW_CALLBACK_DELAY"], function()
			-- If the SHIFT key is down, then delay using the callback delay timer.
			GetNPCID()
		end)
	else
		local GUID = UnitGUID("target") or UnitGUID("mouseover")
		if GUID then
			-- Get the GUID of the target or mouseover unit and convert it into an
			-- NPC ID and cast it as a number value.
			--
			-- Check a couple tables for an entry matching the NPC ID. If one is found,
			-- then we need to exit the function because we shouldn't process gossip for this NPC.
			npcID = select(6, strsplit("-", GUID)); npcID = tonumber(npcID)
			if HelpMePlayIgnoredCreaturesDB[npcID] then return end
			if addonTable.IGNORED_GOSSIP_NPC[npcID] then return end
		end
		
		-- Get the player's current map ID, then call the GetParentMapID function.
		GetParentMapID(C_Map.GetBestMapForUnit("player"))
	end
end

e:RegisterEvent("CONFIRM_BINDER")
e:RegisterEvent("GOSSIP_CONFIRM")
e:RegisterEvent("GOSSIP_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "CONFIRM_BINDER" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.GossipEnabled == false or HelpMePlayDB.GossipEnabled == nil then return false end
		
		-- Get the GUID of the targeted NPC.
		local GUID = UnitGUID("target")
		if GUID then
			-- If the GUID is valid, then split the GUID, get the NPC ID and cast it as a number.
			local _, _, _, _, _, npcID = strsplit("-", GUID); npcID = tonumber(npcID)
			
			-- If the NPC should be ignored, then let's disregard the request to handle automatically
			-- setting the hearthstone location.
			if HelpMePlayIgnoredCreaturesDB[npcID] then return end
			
			if HelpMePlayPlayerDialogDB[npcID] then
				if HelpMePlayPlayerDialogDB[npcID]["c"] then
					StaticPopup1Button1:Click("LeftButton")
				end
			else
				-- Get the parent map ID of the player's current map, then call the ConfirmConfirmationMessage
				-- function.
				local parentMapID = GetParentMapIDForConfirm(C_Map.GetBestMapForUnit("player"))
				local gossipTable = GetGossipTable(parentMapID)
				if gossipTable[npcID] then
					if gossipTable[npcID]["c"] then
						StaticPopup1Button1:Click("LeftButton")
					end
				end
			end
		end
	end
	if event == "GOSSIP_CONFIRM" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.GossipEnabled == false or HelpMePlayDB.GossipEnabled == nil then return false end
		
		-- Get the GUID of the targeted NPC.
		local GUID = UnitGUID("target")
		if GUID then
			-- If the GUID is valid, then split the GUID, get the NPC ID and cast it as a number.
			local _, _, _, _, _, npcID = string.split("-", GUID); npcID = tonumber(npcID)
			
			-- If the NPC should be ignored, then let's disregard the request to handle confirmation.
			if HelpMePlayIgnoredCreaturesDB[npcID] then return end
			
			if HelpMePlayPlayerDialogDB[npcID] then
				if HelpMePlayPlayerDialogDB[npcID]["c"] then
					StaticPopup1Button1:Click("LeftButton")
				end
			else
				-- Get the parent map ID of the player's current map, then call the ConfirmConfirmationMessage
				-- function.
				local parentMapID = GetParentMapIDForConfirm(C_Map.GetBestMapForUnit("player"))
				local gossipTable = GetGossipTable(parentMapID)
				if gossipTable[npcID] then
					if gossipTable[npcID]["c"] then
						StaticPopup1Button1:Click("LeftButton")
					end
				end
			end
		end
	end
	if event == "GOSSIP_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.GossipEnabled == false or HelpMePlayDB.GossipEnabled == nil then return end
		
		-- Before anything is done, if Developer Mode is enabled, print out the
		-- gossip options.
		local GUID = UnitGUID("target")
		local npcID = select(6, strsplit("-", GUID)); npcID = tonumber(npcID)
		options = C_GossipInfo.GetOptions()
		if HelpMePlayDB.DevModeEnabled then
			local numOptions = #options
			for index = 1, numOptions do
				print(npcID .. " | " .. UnitName("target") .. " | " .. "(" .. index .. ") " .. options[index].name .. " | " .. options[index].gossipOptionID)
			end
		end
		
		GetNPCID()
	end
end)