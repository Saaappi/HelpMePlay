local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local parentMapId = 0
local loadedDialogTable = {}

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
end

local function SelectGossipOption(options, npcId, parentMapId)
	--[[
		Description:
			Dialogs are loaded by expansion so the addon doesn't have to
			read the entire dialog table anytime GOSSIP_SHOW is called.
	]]--
	if parentMapId == 12 or parentMapId == 13 or parentMapId == 948 then
		loadedDialogTable = addonTable.DIALOG_CLASSIC
	elseif parentMapId == 101 then
		loadedDialogTable = addonTable.DIALOG_TBC
	elseif parentMapId == 113 then
		loadedDialogTable = addonTable.DIALOG_WOTLK
	elseif parentMapId == 424 then
		loadedDialogTable = addonTable.DIALOG_MOP
	elseif parentMapId == 572 then
		loadedDialogTable = addonTable.DIALOG_WOD
	elseif parentMapId == 619 or parentMapId == 905 then
		loadedDialogTable = addonTable.DIALOG_LEGION
	elseif parentMapId == 875 or parentMapId == 876 then
		loadedDialogTable = addonTable.DIALOG_BFA
	elseif parentMapId == 946 or parentMapId == 947 then
		loadedDialogTable = addonTable.DIALOG_COSMIC
	elseif parentMapId == 1409 or parentMapId == 1550 then
		loadedDialogTable = addonTable.DIALOG_SL
	end
	
	--[[
		Description:
			First, iterate through the player-controlled dialog table
			for a submitted dialog that matches the provided dialog text.
			
			If nothing matches from the player-controlled dialog table,
			then check the addon's dialog table next.
	]]--
	for index, gossipSubTable in ipairs(options) do
		if HelpMePlayPlayerDialogDB[npcId] then
			if HelpMePlayPlayerDialogDB[npcId]["g"] then
				for _, text in ipairs(HelpMePlayPlayerDialogDB[npcId]["g"]) do
					if string.find(string.lower(gossipSubTable["name"]), string.lower(text)) then
						C_GossipInfo.SelectOption(index)
						return
					end
				end
			end
		else
			for _, text in ipairs(HelpMePlayPlayerDialogDB) do
				if string.find(string.lower(gossipSubTable["name"]), string.lower(text)) then
					C_GossipInfo.SelectOption(index)
					return
				end
			end
		end
	end
	
	--[[
		Description:
			Dialogs documented in the addon support conditions. Conditions include:
				- Level: Higher
				- Level: Equal
				- Level: Lower
				- Money: Higher (The money condition is always a "higher" check
	]]--
	if loadedDialogTable[npcId] then
		for index, gossipSubTable in ipairs(options) do
			for id, gossip in pairs(loadedDialogTable[npcId]["g"]) do
				if gossip.condition == "none" then
					if string.find(string.lower(gossipSubTable["name"]), string.lower(gossip.text)) then
						C_GossipInfo.SelectOption(index)
						return
					end
				elseif gossip.condition == "level.higher" then
					if UnitLevel("player") > gossip.level then
						C_GossipInfo.SelectOption(index)
						return
					end
				elseif gossip.condition == "level.equal" then
					if UnitLevel("player") == gossip.level then
						C_GossipInfo.SelectOption(gossip.index)
						return
					end
				elseif gossip.condition == "level.lower" then
					if UnitLevel("player") < gossip.level then
						C_GossipInfo.SelectOption(index)
						return
					end
				elseif gossip.condition == "money.greaterThan" then
					if GetMoney("player") > gossip.money then
						C_GossipInfo.SelectOption(index)
						return
					end
				elseif gossip.condition == "quest.active" then
					if C_QuestLog.IsOnQuest(gossip.questId) then
						C_GossipInfo.SelectOption(gossip.index)
						return
					end
				end
			end
		end
	end
	
	loadedDialogTable = {}
end

--[[
	Description:
		Determine if the target or mouseover (target) are supported
		by the addon, either through a player entry or an addon entry.
		
		There will be times where dialogs are associated to objects without
		a GUID. If this is the case, pass a 0 to load the "ID-less" NPC table
		for the given parent map ID. Example: The gate to exit the Darkpens in
		Val'sharah.
		
		Players can ignore an NPC. Ignored NPCs don't have their dialog
		processed.
]]--
local function ProcessDialogTree()
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

--[[
	Description:
		Active quests are quests the player has already accepted
		from a quest giver. These are normally represented by a
		greyed out or gold-filled "?" icon.
		
		Active quests can be loaded on Blizzard's end as a gossip
		table. In these cases, we must process them the same way.
		Active quests are processed above all else.
		
		The first check is whether or not the active quests are
		complete. If they are, then complete the quests by calling
		the HMP_CompleteQuest function. If not, then call the
		ProcessDialogTree function.
]]--
local function CheckActiveQuests(activeQuests)
	if #activeQuests == 1 then
		if activeQuests[1].isComplete then
			HMP_CompleteQuest()
		else
			ProcessDialogTree()
		end
	else
		for i=1,#activeQuests do
			if activeQuests[i].isComplete then
				HMP_CompleteQuest()
			end
		end
		ProcessDialogTree()
	end
end

--[[
	Description:
		Confirms are handled *exactly* the same way as dialogs.
		Please see the SelectGossipOption function above for
		more information.
]]--
local function ConfirmConfirmationMessage(message, npcId)
	if parentMapId == 12 or parentMapId == 13 or parentMapId == 948 then
		loadedDialogTable = addonTable.DIALOG_CLASSIC
	elseif parentMapId == 101 then
		loadedDialogTable = addonTable.DIALOG_TBC
	elseif parentMapId == 113 then
		loadedDialogTable = addonTable.DIALOG_WOTLK
	elseif parentMapId == 424 then
		loadedDialogTable = addonTable.DIALOG_MOP
	elseif parentMapId == 572 then
		loadedDialogTable = addonTable.DIALOG_WOD
	elseif parentMapId == 619 or parentMapId == 905 then
		loadedDialogTable = addonTable.DIALOG_LEGION
	elseif parentMapId == 875 or parentMapId == 876 then
		loadedDialogTable = addonTable.DIALOG_BFA
	elseif parentMapId == 946 or parentMapId == 947 then
		loadedDialogTable = addonTable.DIALOG_COSMIC
	elseif parentMapId == 1409 or parentMapId == 1550 then
		loadedDialogTable = addonTable.DIALOG_SL
	end
	
	if HelpMePlayPlayerDialogDB[npcId] then
		if HelpMePlayPlayerDialogDB[npcId]["c"] then
			for _, text in ipairs(HelpMePlayPlayerDialogDB[npcId]["c"]) do
				if string.find(string.lower(message), string.lower(text)) then
					StaticPopup1Button1:Click("LeftButton")
					return
				end
			end
		end
	else
		for _, text in ipairs(HelpMePlayPlayerDialogDB) do
			if string.find(string.lower(message), string.lower(text)) then
				StaticPopup1Button1:Click("LeftButton")
				return
			end
		end
	end
	
	if loadedDialogTable[npcId] then
		for id, gossip in pairs(loadedDialogTable[npcId]["c"]) do
			if gossip.condition == "none" then
				if string.find(string.lower(message), string.lower(gossip.text)) then
					StaticPopup1Button1:Click("LeftButton")
					return
				end
			elseif gossip.condition == "level.higher" then
				if UnitLevel("player") > gossip.level then
					StaticPopup1Button1:Click("LeftButton")
					return
				end
			elseif gossip.condition == "level.equal" then
				if UnitLevel("player") == gossip.level then
					StaticPopup1Button1:Click("LeftButton")
					return
				end
			elseif gossip.condition == "level.lower" then
				if UnitLevel("player") < gossip.level then
					StaticPopup1Button1:Click("LeftButton")
					return
				end
			elseif gossip.condition == "money.greaterThan" then
				if GetMoney("player") > gossip.money then
					StaticPopup1Button1:Click("LeftButton")
					return
				end
			elseif gossip.condition == "quest.active" then
				if C_QuestLog.IsOnQuest(gossip.questId) then
					C_GossipInfo.SelectOption(index)
					return
				end
			end
		end
	end
end

--[[
	Description:
		Available quests are those the player has yet to select.
		There are times these quests are presented from a gossip
		table. If that's the case, iterate through each of them
		and accept the quests.
		
		The quests checks will only occur if the Quests automation
		is enabled.
]]--
e:RegisterEvent("GOSSIP_CONFIRM")
e:RegisterEvent("GOSSIP_CONFIRM_CANCEL")
e:RegisterEvent("GOSSIP_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_CONFIRM" then
		local _, message = ...
		if HelpMePlayOptionsDB.Dialog == false or HelpMePlayOptionsDB.Dialog == nil then return end
		local index = 1
		local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
		if unitGUID then
			local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
			if HelpMePlayIgnoredCreaturesDB[npcId] then return end
			ConfirmConfirmationMessage(message, npcId)
		end
	end
	if event == "GOSSIP_SHOW" then
		if HelpMePlayOptionsDB.Dialog == false or HelpMePlayOptionsDB.Dialog == nil then return end
		GetParentMapID(C_Map.GetBestMapForUnit("player"))
		local numAvailableQuests = C_GossipInfo.GetNumAvailableQuests()
		local activeQuests = C_GossipInfo.GetActiveQuests()
		if HelpMePlayOptionsDB.Quests then
			if next(activeQuests) then
				CheckActiveQuests(activeQuests)
			elseif numAvailableQuests > 0 then
				for i=1,numAvailableQuests do
					SelectAvailableQuest(i)
				end
			else
				ProcessDialogTree()
			end
		else
			ProcessDialogTree()
		end
	end
end)