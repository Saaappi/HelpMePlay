local _, HelpMePlay = ...

local function IsCutsceneProtected(mapID)
	if HelpMePlay.NoCutsceneSkipMaps[mapID] then
		local questIDs = HelpMePlay.NoCutsceneSkipMaps[mapID].Conditions
		if next(questIDs) ~= nil then
			for _, questID in next, HelpMePlay.NoCutsceneSkipMaps[mapID].Conditions do
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

	if not IsCutsceneProtected(HelpMePlay.playerMapID) then
		CinematicFrame_CancelCinematic()
	end
end)

hooksecurefunc("MovieFrame_PlayMovie", function(self, movieID)
    if HelpMePlayDB["SkipCutscenes"] == false then return false end

	if not IsCutsceneProtected(HelpMePlay.playerMapID) then
		MovieFrame:Hide()
	end
end)