local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("ADVENTURE_MAP_OPEN")

-- TODO (Alliance)
e:SetScript("OnEvent", function(self, event, ...)
	if event == "ADVENTURE_MAP_OPEN" then
		local mapID = C_AdventureMap.GetMapID()
		if mapID == 1011 then -- Zandalar (The Great Seal)
			C_AdventureMap.StartQuest(47514) -- Zuldazar
		elseif mapID == 1014 then -- Kul Tiras (The Banshee's Wail)
			if C_QuestLog.IsQuestFlaggedCompleted(51802) == false then
				C_AdventureMap.StartQuest(51802) -- Foothold: Stormsong Valley
			elseif C_QuestLog.IsQuestFlaggedCompleted(51800) == false then
				C_AdventureMap.StartQuest(51800) -- Foothold: Tiragarde Sound
			else
				C_AdventureMap.StartQuest(51801) -- Foothold: Drustvar
			end
		end
	end
end)