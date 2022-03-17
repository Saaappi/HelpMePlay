local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local parentMapId = 0
local loadedDialogTable = {}

local function GetParentMapID(mapId)
	-- Get the parent map ID, then check
	-- to see if it's a continent.
	--
	-- If not a continent, then recursively
	-- scan the map relationship until the
	-- first continent is found.
	local mapInfo = C_Map.GetMapInfo(mapId)
	if mapInfo.mapType ~= 2 and mapInfo.parentMapID ~= 0 then
		GetParentMapID(mapInfo.parentMapID)
	else
		parentMapId = mapInfo.mapID
	end
end

local function SelectGossipOption(options, npcId, parentMapId)
	-- Use the parent map ID to determine
	-- which populated table to use.
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
	
	if loadedDialogTable[npcId] then
		-- The NPC is in the database. Let's check
		-- if the gossip subtable uses the new or
		-- old format.
		if type(loadedDialogTable[npcId]["g"][1]) == "table" then
			-- NEW FORMAT
			--
			-- Player-controlled dialogs ignore the
			-- new format. So, they don't support
			-- conditions!
			--
			-- Let's iterate the gossip subtable for
			-- a match.
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
				
				-- If not in the player-controlled dialog
				-- table, then let's check the system table
				-- we were told to load.
				for id, gossip in pairs(loadedDialogTable[npcId]["g"]) do
					-- First, we have to make sure there
					-- isn't a condition. And if there is
					-- we have to ensure the player meets
					-- that condition.
					if gossip.condition == "none" then
						if string.find(string.lower(gossipSubTable["name"]), string.lower(gossip.text)) then
							C_GossipInfo.SelectOption(index)
							return
						end
					elseif gossip.condition == "level_higher" then
						-- TODO
					elseif gossip.condition == "level_lower" then
						-- TODO
					elseif gossip.condition == "money" then
						-- TODO
					end
				end
			end
		else
			-- OLD FORMAT
			for index, gossipSubTable in ipairs(options) do
				-- First check if the dialog is in
				-- the player-controlled table.
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
				
				-- If not in the player-controlled dialog
				-- table, then let's check the system table
				-- we were told to load.
				for id, _ in pairs(loadedDialogTable) do
					if id == npcId then
						-- We found a match in the table
						-- so let's move forward.
						for i=1, #loadedDialogTable[id]["g"] do
							--- DEBUG ---
							-- Only enable these if dialogs aren't being
							-- selected when they should be.
							--print(string.lower(gossipSubTable["name"]))
							--print(string.lower(loadedDialogTable[id]["g"][i]))
							if string.find(string.lower(gossipSubTable["name"]), string.lower(loadedDialogTable[id]["g"][i])) then
								C_GossipInfo.SelectOption(index)
								return
							end
						end
					end
				end
			end
		end
	end
	
	-- Reset the loaded dialog table.
	loadedDialogTable = {}
end

local function ProcessDialogTree()
	local index = 1
	local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
	local gossipOptions = C_GossipInfo.GetOptions()
	if unitGUID then
		local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
		SelectGossipOption(gossipOptions, npcId, parentMapId)
	else
		-- This must be an object with a
		-- dialog table.
		SelectGossipOption(gossipOptions, 0, parentMapId)
	end
end

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

local function ConfirmConfirmationMessage(message, npcId)
	-- Use the parent map ID to determine
	-- which populated table to use.
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
	
	if loadedDialogTable[npcId] then
		-- The NPC is in the database. Let's check
		-- if the gossip subtable uses the new or
		-- old format.
		if type(loadedDialogTable[npcId]["c"][1]) == "table" then
			-- NEW FORMAT
			--
			-- Player-controlled confirms ignore the
			-- new format. So, they don't support
			-- conditions!
			--
			-- Let's iterate the confirm subtable for
			-- a match.
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
				
			-- If not in the player-controlled confirms
			-- table, then let's check the system table
			-- we were told to load.
			for id, gossip in pairs(loadedDialogTable[npcId]["c"]) do
				-- First, we have to make sure there
				-- isn't a condition. And if there is
				-- we have to ensure the player meets
				-- that condition.
				if gossip.condition == "none" then
					if string.find(string.lower(message), string.lower(gossip.text)) then
						StaticPopup1Button1:Click("LeftButton")
						return
					end
				elseif gossip.condition == "level_higher" then
					-- TODO
				elseif gossip.condition == "level_lower" then
					-- TODO
				elseif gossip.condition == "money" then
					-- TODO
				end
			end
		else
			-- OLD FORMAT
			--
			-- First check if the confirm is in
			-- the player-controlled table.
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
				
			-- If not in the player-controlled confirm
			-- table, then let's check the system table
			-- we were told to load.
			for id, _ in pairs(loadedDialogTable) do
				if id == npcId then
					-- We found a match in the table
					-- so let's move forward.
					for i=1, #loadedDialogTable[id]["c"] do
						--- DEBUG ---
						-- Only enable these if dialogs aren't being
						-- selected when they should be.
						--print(string.lower(gossipSubTable["name"]))
						--print(string.lower(loadedDialogTable[id]["c"][i]))
						if string.find(string.lower(message), string.lower(loadedDialogTable[id]["c"][i])) then
							StaticPopup1Button1:Click("LeftButton")
							return
						end
					end
				end
			end
		end
	end
end

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