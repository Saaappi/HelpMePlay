local addonName, addon = ...
local e = CreateFrame("Frame")
local gossips = {}

local function SelectOption(npcID)
	-- Get the list of gossip options from the targeted NPC.
	local options = C_GossipInfo.GetOptions()
	
	-- Before we select an option, let's print out the options the NPC has
	-- if the player has Developer Mode enabled.
	if HelpMePlayDB.DevModeEnabled then
		local numOptions = #options
		if npcID > 0 then
			for index = 1, numOptions do
				print(npcID .. " | " .. UnitName("target") .. " | " .. "(" .. index .. ") " .. options[index].name .. " | " .. options[index].gossipOptionID)
			end
		else
			for index = 1, numOptions do
				print("0 | <GameObject> | " .. "(" .. index .. ") " .. options[index].name .. " | " .. options[index].gossipOptionID)
			end
		end
	end
	
	-- Player-submitted gossip options. I need to do some work here.
	for index, gossipSubTable in ipairs(options) do
		if HelpMePlayDB.PlayerDialogs[npcID] then
			if HelpMePlayDB.PlayerDialogs[npcID]["g"] then
				for _, index in ipairs(HelpMePlayDB.PlayerDialogs[npcID]["g"]) do
					C_GossipInfo.SelectOption(index)
				end
			end
		end
	end
	
	-- Get the gossip table based on the current map.
	gossips = addon.GOSSIP
	if gossips then
		if gossips[npcID] then
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
	
	if npcID == nil then
		-- We may be dealing with an object that has gossip options.
		for _, option in ipairs(options) do
			for _, gossip in ipairs(gossips[0]["g"]) do
				if gossip.o == option.gossipOptionID then
					C_GossipInfo.SelectOption(gossip.o)
				end
			end
		end
	end
end

local function GetNPCID()
	local npcID = 0
	if IsShiftKeyDown() then
		C_Timer.After(addon.CONSTANTS["GOSSIP_SHOW_CALLBACK_DELAY"], function()
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
			if HelpMePlayDB.IgnoredCreatures[npcID] then return end
			if addon.IGNORED_GOSSIP_NPC[npcID] then return end
		end
		
		-- Get the player's current map ID, then call the GetParentMapID function.
		--GetParentMapID(C_Map.GetBestMapForUnit("player"))
		SelectOption(npcID)
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
			if HelpMePlayDB.IgnoredCreatures[npcID] then return end
			
			if HelpMePlayDB.PlayerDialogs[npcID] then
				if HelpMePlayDB.PlayerDialogs[npcID]["c"] then
					StaticPopup1Button1:Click("LeftButton")
				end
			else
				-- If the targeted NPC is in the table and is flagged for confirmation, then click the
				-- popup.
				if gossips[npcID] then
					if gossips[npcID]["c"] then
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
			if HelpMePlayDB.IgnoredCreatures[npcID] then return end
			
			if HelpMePlayDB.PlayerDialogs[npcID] then
				if HelpMePlayDB.PlayerDialogs[npcID]["c"] then
					StaticPopup1Button1:Click("LeftButton")
				end
			else
				-- If the targeted NPC is in the table and is flagged for confirmation, then click the
				-- popup.
				if gossips[npcID] then
					if gossips[npcID]["c"] then
						StaticPopup1Button1:Click("LeftButton")
					end
				end
			end
		end
	end
	if event == "GOSSIP_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.GossipEnabled == false or HelpMePlayDB.GossipEnabled == nil then return end
		
		-- Call the GetNPCID() function.
		GetNPCID()
	end
end)