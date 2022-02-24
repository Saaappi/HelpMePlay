local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local supportedMissions = {
	[2] 	= "Gronnlings Abound",
	[66]	= "Killing the Corrupted",
}

e:RegisterEvent("GARRISON_MISSION_NPC_OPENED")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "GARRISON_MISSION_NPC_OPENED" then
		if HelpMePlayOptionsDB.GarrisonTables == false or HelpMePlayOptionsDB.GarrisonTables == nil then return end
		if C_Garrison.IsAtGarrisonMissionNPC() then
			local npc = ...
			if npc == 1 then -- Garrison Mission Table
				local missions = C_Garrison.GetAvailableMissions(1)
				local followers = C_Garrison.GetFollowers(1)
				local faction = UnitFactionGroup("player")
				if faction == "Alliance" then
					for boardIndex, mission in pairs(missions) do
						if supportedMissions[mission.missionID] then
							if mission.inProgress == false then
								-- Assigns Qiana Moonshadow to the Killing the Corrupted mission.
								C_Garrison.AddFollowerToMission(mission.missionID, followers[1].followerID)
								C_Garrison.StartMission(mission.missionID)
								C_Garrison.CloseMissionNPC()
							end
						end
					end
				else
					for boardIndex, mission in pairs(missions) do
						if supportedMissions[mission.missionID] then
							if mission.inProgress == false then
								-- Assigns Olin Umberhide to the Gronnlings Abound mission.
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