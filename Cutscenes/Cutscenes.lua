local addonName, addon = ...

CinematicFrame:HookScript("OnShow", function(self, ...)
    if HelpMePlayDB["SkipCutscenes"] == false then return end
    if addon.NoCutsceneSkipMaps[addon.mapID] then return end
	C_Timer.After(addon.Constants["TIMER_DELAY"], CinematicFrame_CancelCinematic)
	return true
end)

hooksecurefunc("MovieFrame_PlayMovie", function(self, movieID)
    if HelpMePlayDB["SkipCutscenes"] == false then return end
    if addon.NoCutsceneSkipMaps[addon.mapID] then return end
	C_Timer.After(addon.Constants["TIMER_DELAY"], function()
		self:StopMovie(movieID)
		self:Hide()
		GameMovieFinished()
	end)
	return true
end)