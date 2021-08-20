local addonName, addonTable = ...
local e = CreateFrame("Frame")

e:RegisterEvent("GARRISON_MISSION_NPC_OPENED")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "GARRISON_MISSION_NPC_OPENED" then
		if C_Garrison.IsAtGarrisonMissionNPC() then
			local faction = UnitFactionGroup("player")
			if faction == "Alliance" then
			
			else
				-- Assigns Olin Umberhide to the Gronnlings Abound mission.
				C_Garrison.AddFollowerToMission(2, 34)
				C_Garrison.StartMission(2)
				--C_Garrison.CloseMissionNPC()
			end
		end
	end
end)