local addonName, addon = ...

local function IsProtectedCutsceneMap(mapID)
	for _, id in ipairs(addon.NoCutsceneSkipMaps) do
		if id == mapID then
			return true
		end
	end
	return false
end

CinematicFrame:HookScript("OnShow", function(self, ...)
    if HelpMePlayDB["SkipCutscenes"] == false then return false end

	if not IsProtectedCutsceneMap(addon.mapID) then
		C_Timer.After(addon.Constants["TIMER_DELAY"], CinematicFrame_CancelCinematic)
	end
end)

hooksecurefunc("MovieFrame_PlayMovie", function(self, movieID)
    if HelpMePlayDB["SkipCutscenes"] == false then return false end

	if not IsProtectedCutsceneMap(addon.mapID) then
		C_Timer.After(addon.Constants["TIMER_DELAY"], function()
			self:StopMovie(movieID)
			self:Hide()
			GameMovieFinished()
		end)
	end
end)