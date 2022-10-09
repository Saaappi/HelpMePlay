local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function GetParentMapID(mapId)
	--[[
		Description:
			Gets the parent map ID of the current map, if available.
			For example, Neltharion's Vault in Highmountain, is a child
			map whose parent map ID would be that of Highmountain.
			
			This function will end the moment it detects a continent.
			Example: Neltharion's Vault (OK) > Highmountain (OK) > Broken Isles (X)
			
			In the above example, the last "OK" wins the return.
	]]--
	if mapId then
		local mapInfo = C_Map.GetMapInfo(mapId)
		if mapInfo.mapType ~= 2 and mapInfo.parentMapID ~= 0 then
			GetParentMapID(mapInfo.parentMapID)
		else
			parentMapId = mapInfo.mapID
		end
	end
	return parentMapId
end

local function GetDialogTable(parentMapId)
	local dialogTable
	if parentMapId == 12 or parentMapId == 13 or parentMapId == 948 then
		dialogTable = addonTable.DIALOG_CLASSIC
	elseif parentMapId == 101 then
		dialogTable = addonTable.DIALOG_TBC
	elseif parentMapId == 113 then
		dialogTable = addonTable.DIALOG_WOTLK
	elseif parentMapId == 424 then
		dialogTable = addonTable.DIALOG_MOP
	elseif parentMapId == 572 then
		dialogTable = addonTable.DIALOG_WOD
	elseif parentMapId == 619 or parentMapId == 905 then
		dialogTable = addonTable.DIALOG_LEGION
	elseif parentMapId == 875 or parentMapId == 876 then
		dialogTable = addonTable.DIALOG_BFA
	elseif parentMapId == 946 or parentMapId == 947 then
		dialogTable = addonTable.DIALOG_COSMIC
	elseif parentMapId == 1409 or parentMapId == 1550 or parentMapId == 1610 then
		dialogTable = addonTable.DIALOG_SL
	elseif parentMapId == 1978 then
		dialogTable = addonTable.DIALOG_DF
	end
	return dialogTable
end

local function SelectGossipOption(options, npcId, parentMapId)
	for index, gossipSubTable in ipairs(options) do
		if HelpMePlayPlayerDialogDB[npcId] then
			if HelpMePlayPlayerDialogDB[npcId]["g"] then
				for _, index in ipairs(HelpMePlayPlayerDialogDB[npcId]["g"]) do
					C_GossipInfo.SelectOption(index)
				end
			end
		end
	end
	
	local dialogTable = GetDialogTable(parentMapId)
	if dialogTable[npcId] then
		local useDialog = false
		for index, gossipSubTable in ipairs(options) do
			for _, gossip in pairs(dialogTable[npcId]["g"]) do
				for _, condition in ipairs(gossip.c) do
					if condition == "none" then
						C_GossipInfo.SelectOption(gossip.o)
					elseif condition == "level.higher" then
						if UnitLevel("player") > gossip.l then
							useDialog = true
						else
							return
						end
					elseif condition == "level.equal" then
						if UnitLevel("player") == gossip.l then
							useDialog = true
						else
							return
						end
					elseif condition == "level.lower" then
						if UnitLevel("player") < gossip.l then
							useDialog = true
						else
							return
						end
					elseif condition == "money.higher" then
						if GetMoney("player") > gossip.m then
							useDialog = true
						else
							return
						end
					elseif condition == "quests.isActive" then
						for _, id in ipairs(gossip.q) do
							if C_QuestLog.IsOnQuest(id) then
								useDialog = true
							else
								return
							end
						end
					elseif condition == "quests.notActive" then
						for _, id in ipairs(gossip.q) do
							if C_QuestLog.IsOnQuest(id) == false then
								useDialog = true
							else
								return
							end
						end
					elseif condition == "quest.obj.isComplete" then
						local objectives = C_QuestLog.GetQuestObjectives(gossip.q)
						if objectives[gossip.obj].finished then
							useDialog = true
						else
							return
						end
					elseif condition == "quest.obj.isNotComplete" then
						local objectives = C_QuestLog.GetQuestObjectives(gossip.q)
						if objectives[gossip.obj].finished == false then
							useDialog = true
						else
							return
						end
					elseif condition == "player.faction" then
						if (UnitFactionGroup("player")) == gossip.f then
							useDialog = true
						else
							return
						end
					elseif condition == "addon.setting" then
						if HelpMePlayDB[gossip.s] == gossip.r then
							useDialog = true
						else
							return
						end
					end
				end
				if useDialog then
					C_GossipInfo.SelectOption(gossip.o)
					return
				end
			end
		end
	end
end

local function ProcessDialogTree(parentMapId)
	local index = 1
	local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
	local gossipOptions = C_GossipInfo.GetOptions()
	if unitGUID then
		local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
		if HelpMePlayIgnoredCreaturesDB[npcId] then return end
		SelectGossipOption(gossipOptions, npcId, parentMapId)
	else
		SelectGossipOption(gossipOptions, 0, parentMapId)
	end
end

local function ConfirmConfirmationMessage(message, npcId, parentMapId)
	if HelpMePlayPlayerDialogDB[npcId] then
		if HelpMePlayPlayerDialogDB[npcId]["c"] then
			StaticPopup1Button1:Click("LeftButton")
			return
		end
	end
	
	local dialogTable = GetDialogTable(parentMapId)
	if dialogTable[npcId] then
		if dialogTable[npcId]["c"] then
			StaticPopup1Button1:Click("LeftButton")
			return
		end
	end
end

e:RegisterEvent("GOSSIP_CONFIRM")
e:RegisterEvent("GOSSIP_CONFIRM_CANCEL")
e:RegisterEvent("GOSSIP_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_CONFIRM" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.DialogEnabled == false or HelpMePlayDB.DialogEnabled == nil then return false end
		local _, message = ...
		local index = 1
		local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
		if unitGUID then
			local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
			if HelpMePlayIgnoredCreaturesDB[npcId] then return end
			
			local parentMapId = GetParentMapID(C_Map.GetBestMapForUnit("player"))
			ConfirmConfirmationMessage(message, npcId, parentMapId)
		end
	end
	if event == "GOSSIP_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.DialogEnabled == false or HelpMePlayDB.DialogEnabled == nil then return end
		
		local parentMapId = GetParentMapID(C_Map.GetBestMapForUnit("player"))
		local availableQuests = C_GossipInfo.GetAvailableQuests()
		local activeQuests = C_GossipInfo.GetActiveQuests()
		if HelpMePlayDB.AcceptQuestsEnabled then
			if next(activeQuests) then
				if #activeQuests == 1 then
					if activeQuests[1].isComplete then
						HMP_CompleteQuest()
					else
						ProcessDialogTree(parentMapId)
					end
				else
					for i = 1, #activeQuests do
						if activeQuests[i].isComplete then
							HMP_CompleteQuest()
						end
					end
					ProcessDialogTree(parentMapId)
				end
			elseif next(availableQuests) then
				for i = 1, #availableQuests do
					if addonTable.IGNORED_QUESTS[availableQuests[i].questID] == false then
						C_GossipInfo.SelectAvailableQuest(i)
					end
				end
				print(parentMapId)
				ProcessDialogTree(parentMapId)
			else
				ProcessDialogTree(parentMapId)
			end
		else
			ProcessDialogTree(parentMapId)
		end
	end
end)