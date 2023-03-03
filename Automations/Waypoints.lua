local addonName, addonTable = ...
local e = CreateFrame("Frame")

e:RegisterEvent("QUEST_ACCEPTED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "QUEST_ACCEPTED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.WaypointsEnabled == false or HelpMePlayDB.WaypointsEnabled == nil then return false end
		
		local questID = ...
		if select(2, IsAddOnLoaded("TomTom")) then
			for id, waypoint in pairs(addonTable.WAYPOINTS) do
				if id == questID then
					for _, data in ipairs(waypoint) do
						local mapID, xCoord, yCoord, title, icon, displayID, quests = data[1], data[2], data[3], data[4], data[5], data[6], data[7]
						
						local numQuests = #quests
						for i = 1, numQuests do
							if C_QuestLog.IsOnQuest(quests[i]) or C_QuestLog.IsQuestFlaggedCompleted(quests[i]) then
								numQuests = numQuests - 1
							end
						end
						
						-- If the player meets the prerequisite criteria or the
						-- number of prerequisite quests is 0, then log the waypoint.
						if numQuests == 0 or #quests == 0 then
							local opts = {
								title = title,
								persistent = nil,
								minimap = false,
								world = true,
								from = addonName,
								worldmap_icon = icon,
								worldmap_displayID = displayID,
							}
							TomTom:AddWaypoint(mapID, xCoord / 100, yCoord / 100, opts)
							TomTom:SetClosestWaypoint()
						end
					end
					break
				end
			end
		end
		
	end
end)