local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

-- Architect Table
e:RegisterEvent("GARRISON_ARCHITECT_OPENED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GARRISON_ARCHITECT_OPENED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.ArchitectTableEnabled == false or HelpMePlayDB.ArchitectTableEnabled == nil then return false end
		local garrisonLevel = C_Garrison.GetGarrisonInfo(2)
		if garrisonLevel == 1 then
			local plotsForBuilding = C_Garrison.GetPlotsForBuilding(26)
			if HelpMePlaySavesDB["isGarrisonBarracksPlaced"] == false or HelpMePlaySavesDB["isGarrisonBarracksPlaced"] == nil then
				for i = 1, #plotsForBuilding do
					local buildingId = C_Garrison.GetOwnedBuildingInfo(plotsForBuilding[i])
					if buildingId ~= nil then
						HelpMePlaySavesDB["isGarrisonBarracksPlaced"] = true
						return
					end
					C_Garrison.PlaceBuilding(plotsForBuilding[i], 26)
					PlaySound(SOUNDKIT.UI_GARRISON_ARCHITECT_TABLE_UPGRADE_START)
					GarrisonBuildingFrame.CloseButton:Click()
					HelpMePlaySavesDB["isGarrisonBarracksPlaced"] = true
				end
			end
		end
	end
end)

-- Mission Table
e:RegisterEvent("GARRISON_MISSION_NPC_OPENED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GARRISON_MISSION_NPC_OPENED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.MissionTableEnabled == false or HelpMePlayDB.MissionTableEnabled == nil then return false end
		if C_Garrison.IsAtGarrisonMissionNPC() then
			local npc = ...
			if npc == 1 then
				if GarrisonMissionTutorialFrame:IsVisible() then
					GarrisonMissionTutorialFrame:Hide()
				end
				local missions = C_Garrison.GetAvailableMissions(1)
				local followers = C_Garrison.GetFollowers(1)
				local faction = UnitFactionGroup("player")
				if faction == "Alliance" then
					for boardIndex, mission in pairs(missions) do
						if addonTable.GARRISON_MISSIONS[mission.missionID] then
							if mission.inProgress == false then
								C_Garrison.AddFollowerToMission(mission.missionID, followers[1].followerID)
								C_Garrison.StartMission(mission.missionID)
								C_Garrison.CloseMissionNPC()
							end
						end
					end
				else
					for boardIndex, mission in pairs(missions) do
						if addonTable.GARRISON_MISSIONS[mission.missionID] then
							if mission.inProgress == false then
								C_Garrison.AddFollowerToMission(mission.missionID, followers[1].followerID)
								C_Garrison.StartMission(mission.missionID)
								C_Garrison.CloseMissionNPC()
							end
						end
					end
				end
			end
		end
	end
end)

-- Outposts
e:RegisterEvent("PLAYER_CHOICE_UPDATE")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_CHOICE_UPDATE" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.GarrisonOutpostsEnabled == false or HelpMePlayDB.GarrisonOutpostsEnabled == nil then return false end
		if PlayerChoiceFrame:IsVisible() then
			local mapId = C_Map.GetBestMapForUnit("player")
			local choiceInfo = C_PlayerChoice.GetCurrentPlayerChoiceInfo()
			if choiceInfo then
				local _, _, _, _, _, id = string.split("-", choiceInfo.objectGUID); id = tonumber(id)
				if id then
					if id == addonTable.PLAYERCHOICE["Drafting Table: Gorgrond"] then
						SendPlayerChoiceResponse(choiceInfo.options[2].buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					end
				end
			end
		end
	end
end)