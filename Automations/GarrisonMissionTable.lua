local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

--[[
	Description:
		First, verify the player is AT the Garrison mission table.
		Once confirmed, check to see if the tutorial popups are visible.
		If these are visible, try to hide them. If not, it's not a
		big deal; the player can close the frame and reopen it to
		get the automation.
		
		Get the list of available missions (should only be a list of 1).
		Get the lsit of available followers.
		Get the player's faction.
		
		Compare the list of available missions to those documented in
		the addon. If the mission ID matches what's on record, then
		add the follower to the mission, start the mission, then close
		the mission UI.
]]--
e:RegisterEvent("GARRISON_MISSION_NPC_OPENED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GARRISON_MISSION_NPC_OPENED" then
		if HelpMePlayOptionsDB.GarrisonTables == false or HelpMePlayOptionsDB.GarrisonTables == nil then return end
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