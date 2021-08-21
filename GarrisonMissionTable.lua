local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local supportedMissions = {
	[2] 	= "Gronnlings Abound",
}

e:RegisterEvent("GARRISON_MISSION_NPC_OPENED")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "GARRISON_MISSION_NPC_OPENED" then
		if C_Garrison.IsAtGarrisonMissionNPC() then
			local missions = C_Garrison.GetAvailableMissions(1)
			local faction = UnitFactionGroup("player")
			if faction == "Alliance" then
				-- TODO
			else
				for boardIndex, mission in pairs(missions) do
					if supportedMissions[mission.missionID] then
						if mission.inProgress == false then
							-- Assigns Olin Umberhide to the Gronnlings Abound mission.
							C_Garrison.AddFollowerToMission(mission.missionID, "0x0000000028D6715B")
							C_Garrison.StartMission(mission.missionID)
							C_Garrison.CloseMissionNPC()
						end
					end
				end
			end
		end
	end
end)