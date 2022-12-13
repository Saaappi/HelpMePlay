local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("ADVENTURE_MAP_OPEN")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "ADVENTURE_MAP_OPEN" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.AdventureMapsEnabled == false or HelpMePlayDB.AdventureMapsEnabled == nil then return false end
		local faction = UnitFactionGroup("player")
		local mapID = C_AdventureMap.GetMapID()
		if mapID == 1011 then
			-- Zandalar
				-- Alliance: Footholds
				-- Horde: Leveling
			if faction == "Alliance" then
				if C_QuestLog.IsQuestFlaggedCompleted(51570) == false then
					C_AdventureMap.StartQuest(51570) -- Foothold: Zuldazar
				elseif C_QuestLog.IsQuestFlaggedCompleted(51571) == false then
					C_AdventureMap.StartQuest(51571) -- Foothold: Nazmir
				else
					C_AdventureMap.StartQuest(51572) -- Foothold: Vol'dun
				end
			else
				if HelpMePlayDB.ZoneId_BFA[faction] == 0 or HelpMePlayDB.ZoneId_BFA[faction] == false or HelpMePlayDB.ZoneId_BFA[faction] == nil then return false end
				if C_QuestLog.IsQuestFlaggedCompleted(HelpMePlayDB.ZoneId_BFA[faction]) == false then
					C_AdventureMap.StartQuest(HelpMePlayDB.ZoneId_BFA[faction])
				else
					for _, questID in ipairs(addonTable.ADVENTURE_MAP_QUESTS["BFA_Horde"]) do
						if C_QuestLog.IsQuestFlaggedCompleted(questID) == false then
							C_AdventureMap.StartQuest(questID)
						end
					end
				end
			end
		end
		if mapID == 1014 then
			-- Kul Tiras
				-- Alliance: Leveling
				-- Horde: Footholds
			if faction == "Alliance" then
				if HelpMePlayDB.ZoneId_BFA[faction] == 0 or HelpMePlayDB.ZoneId_BFA[faction] == false or HelpMePlayDB.ZoneId_BFA[faction] == nil then return false end
				if C_QuestLog.IsQuestFlaggedCompleted(HelpMePlayDB.ZoneId_BFA[faction]) == false then
					C_AdventureMap.StartQuest(HelpMePlayDB.ZoneId_BFA[faction])
				else
					for _, questID in ipairs(addonTable.ADVENTURE_MAP_QUESTS["BFA_Alliance"]) do
						if C_QuestLog.IsQuestFlaggedCompleted(questID) == false then
							C_AdventureMap.StartQuest(questID)
						end
					end
				end
			else
				if C_QuestLog.IsQuestFlaggedCompleted(51801) == false then
					C_AdventureMap.StartQuest(51801) -- Foothold: Drustvar
				elseif C_QuestLog.IsQuestFlaggedCompleted(51800) == false then
					C_AdventureMap.StartQuest(51800) -- Foothold: Tiragarde Sound
				else
					C_AdventureMap.StartQuest(51802) -- Foothold: Stormsong Valley
				end
			end
		end
		if mapID == 1647 then
			-- The Shadowlands
			if HelpMePlayDB.ZoneId_SL == 0 or HelpMePlayDB.ZoneId_SL == false or HelpMePlayDB.ZoneId_SL == nil then return false end
			if C_QuestLog.IsQuestFlaggedCompleted(HelpMePlayDB.ZoneId_SL) == false then
				C_AdventureMap.StartQuest(HelpMePlayDB.ZoneId_SL)
			else
				for _, questID in ipairs(addonTable.ADVENTURE_MAP_QUESTS["SL"]) do
					if C_QuestLog.IsQuestFlaggedCompleted(questID) == false then
						C_AdventureMap.StartQuest(questID)
						return
					end
				end
			end
		end
		
		if mapID == 2057 then
			-- Dragon Isles
			if HelpMePlayDB.ZoneID_DF == 0 or HelpMePlayDB.ZoneID_DF == false or HelpMePlayDB.ZoneID_DF == nil then return false end
			if C_QuestLog.IsQuestFlaggedCompleted(HelpMePlayDB.ZoneID_DF) == false then
				C_AdventureMap.StartQuest(HelpMePlayDB.ZoneID_DF)
			else
				for _, questID in ipairs(addonTable.ADVENTURE_MAP_QUESTS["DF"]) do
					if C_QuestLog.IsQuestFlaggedCompleted(questID) == false then
						C_AdventureMap.StartQuest(questID)
						return
					end
				end
			end
		end
	end
end)