local addonName, addon = ...

local function IsCutsceneProtected(mapID)
	if addon.NoCutsceneSkipMaps[mapID] then
		local questIDs = addon.NoCutsceneSkipMaps[mapID].Conditions
		if next(questIDs) ~= nil then
			for _, questID in next, addon.NoCutsceneSkipMaps[mapID].Conditions do
				if C_QuestLog.IsOnQuest(questID) then
					return true
				end
			end
		end
		return false
	end
end

CinematicFrame:HookScript("OnShow", function(self, ...)
    if HelpMePlayDB["SkipCutscenes"] == false then return false end

	if not IsCutsceneProtected(addon.playerMapID) then
		CinematicFrame_CancelCinematic()
	end
end)

hooksecurefunc("MovieFrame_PlayMovie", function(self, movieID)
    if HelpMePlayDB["SkipCutscenes"] == false then return false end

	if not IsCutsceneProtected(addon.playerMapID) then
		MovieFrame:Hide()
	end
end)