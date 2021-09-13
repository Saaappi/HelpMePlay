local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("ADVENTURE_MAP_OPEN")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "ADVENTURE_MAP_OPEN" then
		local faction = UnitFactionGroup("player")
		local mapId = C_AdventureMap.GetMapID()
		if mapId == 1011 then
			-- Zandalar
			-- This map ID is used for both the Alliance map for footholds
			-- and for the Horde zone map.
			if faction == "Alliance" then
				if C_QuestLog.IsQuestFlaggedCompleted(51570) == false then
					C_AdventureMap.StartQuest(51570) -- Foothold: Zuldazar
				elseif C_QuestLog.IsQuestFlaggedCompleted(51571) == false then
					C_AdventureMap.StartQuest(51571) -- Foothold: Nazmir
				else
					C_AdventureMap.StartQuest(51572) -- Foothold: Vol'dun
				end
			else
				C_AdventureMap.StartQuest(47514) -- Zuldazar
			end
		end
		if mapId == 1014 then
			-- Kul Tiras
			-- This map ID is used for both the Horde map for footholds
			-- and for the Alliance zone map.
			if faction == "Alliance" then
				C_AdventureMap.StartQuest(47960) -- Tiragarde Sound
			else
				if C_QuestLog.IsQuestFlaggedCompleted(51802) == false then
					C_AdventureMap.StartQuest(51802) -- Foothold: Stormsong Valley
				elseif C_QuestLog.IsQuestFlaggedCompleted(51800) == false then
					C_AdventureMap.StartQuest(51800) -- Foothold: Tiragarde Sound
				else
					C_AdventureMap.StartQuest(51801) -- Foothold: Drustvar
				end
			end
		end
		if mapId == 1647 then
			-- Shadowlands
			if C_QuestLog.IsQuestFlaggedCompleted(62275) == false then
				C_AdventureMap.StartQuest(62275) -- Bastion
			elseif C_QuestLog.IsQuestFlaggedCompleted(62278) == false then
				C_AdventureMap.StartQuest(62278) -- Maldraxxus
			elseif C_QuestLog.IsQuestFlaggedCompleted(62277) == false then
				C_AdventureMap.StartQuest(62277) -- Ardenweald
			else
				C_AdventureMap.StartQuest(62279) -- Revendreth
			end
		end
	end
end)