local addonName, addonTable = ...
local e = CreateFrame("Frame")

local function AddWaypoint(mapID, x, y, title, icon, displayID)
	local opts = {
		title = title,
		persistent = nil,
		minimap = false,
		world = true,
		from = addonName,
		worldmap_icon = icon,
		worldmap_displayID = displayID,
	}
	TomTom:AddWaypoint(mapID, x / 100, y / 100, opts)
	TomTom:SetClosestWaypoint()
end

e:RegisterEvent("QUEST_ACCEPTED")
e:RegisterEvent("QUEST_TURNED_IN")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "QUEST_ACCEPTED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.WaypointsEnabled == false or HelpMePlayDB.WaypointsEnabled == nil then return false end
		
		local questID = ...
		if select(2, IsAddOnLoaded("TomTom")) then
			for id, waypoint in pairs(addonTable.WAYPOINTS) do
				if id == questID then
					for _, data in ipairs(waypoint) do
						local mapID, x, y, title, icon, displayID, quests, plotCondition = data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8]
						
						if plotCondition == "accept" then
							local numQuests = #quests
							for i = 1, numQuests do
								if C_QuestLog.IsOnQuest(quests[i]) or C_QuestLog.IsQuestFlaggedCompleted(quests[i]) then
									numQuests = numQuests - 1
								end
							end
							
							-- If the player meets the prerequisite criteria or the
							-- number of prerequisite quests is 0, then log the waypoint.
							if numQuests == 0 or #quests == 0 then
								AddWaypoint(mapID, x, y, title, icon, displayID)
							end
						end
					end
					break
				end
			end
		end
	end
	if event == "QUEST_TURNED_IN" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.WaypointsEnabled == false or HelpMePlayDB.WaypointsEnabled == nil then return false end
		
		local questID = ...
		if select(2, IsAddOnLoaded("TomTom")) then
			for id, waypoint in pairs(addonTable.WAYPOINTS) do
				if id == questID then
					for _, data in ipairs(waypoint) do
						local mapID, x, y, title, icon, displayID, quests, plotCondition = data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8]
						
						if plotCondition == "complete" then
							local numQuests = #quests
							for i = 1, numQuests do
								if C_QuestLog.IsOnQuest(quests[i]) or C_QuestLog.IsQuestFlaggedCompleted(quests[i]) then
									numQuests = numQuests - 1
								end
							end
							
							-- If the player meets the prerequisite criteria or the
							-- number of prerequisite quests is 0, then log the waypoint.
							if numQuests == 0 or #quests == 0 then
								AddWaypoint(mapID, x, y, title, icon, displayID)
							end
						end
					end
					break
				end
			end
		end
	end
end)