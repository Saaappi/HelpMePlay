local addonName, addonTable = ...
local e = CreateFrame("Frame")
local currentMapId = 0

local function GetParentMapID(mapID)
	currentMapId = C_Map.GetBestMapForUnit("player")
	if mapID then
		local mapInfo = C_Map.GetMapInfo(mapID)
		if mapInfo.mapType ~= 2 and mapInfo.parentMapID ~= 0 then
			GetParentMapID(mapInfo.parentMapID)
		else
			parentMapID = mapInfo.mapID
		end
	end
	return parentMapID
end

local function GetGossipTable(parentMapID)
	local gossipTable
	if parentMapID == 12 or parentMapID == 13 or parentMapID == 948 then
		gossipTable = addonTable.DIALOG_CLASSIC
	elseif parentMapID == 572 then
		gossipTable = addonTable.DIALOG_WOD
	elseif parentMapID == 619 or parentMapID == 630 or parentMapID == 905 then
		gossipTable = addonTable.DIALOG_LEGION
	elseif parentMapID == 875 or parentMapID == 876 then
		gossipTable = addonTable.DIALOG_BFA
	elseif parentMapID == 1409 or parentMapID == 1550 or parentMapID == 1610 then
		gossipTable = addonTable.DIALOG_SL
	elseif parentMapID == 946 or parentMapID == 1978 or parentMapID == 2089 then
		gossipTable = addonTable.DIALOG_DF
	end
	return gossipTable
end

local function SelectGossipOption(options, npcId, parentMapID)
	for index, gossipSubTable in ipairs(options) do
		if HelpMePlayPlayerDialogDB[npcId] then
			if HelpMePlayPlayerDialogDB[npcId]["g"] then
				for _, index in ipairs(HelpMePlayPlayerDialogDB[npcId]["g"]) do
					C_GossipInfo.SelectOption(index)
				end
			end
		end
	end
	
	local gossipTable = GetGossipTable(parentMapID)
	if gossipTable[npcId] then
		for index, gossipSubTable in ipairs(options) do
			for _, gossip in pairs(gossipTable[npcId]["g"]) do
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
					return
				end
			end
		end
	end
end

local function ProcessDialogTree(parentMapID)
	local index = 1
	local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
	local gossipOptions = C_GossipInfo.GetOptions()
	if unitGUID then
		local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
		if HelpMePlayIgnoredCreaturesDB[npcId] then return end
		
		if HelpMePlayDB.DevModeEnabled then
			for k, v in ipairs(gossipOptions) do
				print(npcId .. " | " .. UnitName("target") .. " | " .. v.name .. " | " .. v.gossipOptionID)
			end
		end
		
		SelectGossipOption(gossipOptions, npcId, parentMapID)
	else
		SelectGossipOption(gossipOptions, 0, parentMapID)
	end
end

local function ConfirmConfirmationMessage(message, npcId, parentMapID)
	if HelpMePlayPlayerDialogDB[npcId] then
		if HelpMePlayPlayerDialogDB[npcId]["c"] then
			StaticPopup1Button1:Click("LeftButton")
			return
		end
	end
	
	local gossipTable = GetGossipTable(parentMapID)
	if gossipTable[npcId] then
		if gossipTable[npcId]["c"] then
			StaticPopup1Button1:Click("LeftButton")
			return
		end
	end
end

local function GOSSIP_SHOW()
	if IsShiftKeyDown() then
		C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
			GOSSIP_SHOW()
		end)
	else
		local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
		if unitGUID then
			local _, _, _, _, _, npcID = strsplit("-", unitGUID); npcID = tonumber(npcID)
			if HelpMePlayIgnoredCreaturesDB[npcID] then return end
		end
		
		local parentMapID = GetParentMapID(C_Map.GetBestMapForUnit("player"))
		ProcessDialogTree(parentMapID)
	end
end

e:RegisterEvent("GOSSIP_CONFIRM")
e:RegisterEvent("GOSSIP_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_CONFIRM" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.GossipEnabled == false or HelpMePlayDB.GossipEnabled == nil then return false end
		
		local _, message = ...
		local index = 1
		local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
		if unitGUID then
			local _, _, _, _, _, npcID = strsplit("-", unitGUID); npcID = tonumber(npcID)
			if HelpMePlayIgnoredCreaturesDB[npcID] then return end
			
			local parentMapID = GetParentMapID(C_Map.GetBestMapForUnit("player"))
			ConfirmConfirmationMessage(message, npcID, parentMapID)
		end
	end
	if event == "GOSSIP_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.GossipEnabled == false or HelpMePlayDB.GossipEnabled == nil then return end
		
		GOSSIP_SHOW()
	end
end)