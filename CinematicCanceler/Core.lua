local addonName, addon = ...

CinematicFrame:HookScript("OnShow", function(self, ...)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.CinematicsEnabled == false or HelpMePlayDB.CinematicsEnabled == nil then return false end
	
	local mapID = C_Map.GetBestMapForUnit("player")
	for key, badMapID in ipairs(addon.CINEMATIC_BADMAPS) do
		if ( badMapID == mapID ) then
			return false
		end
	end
	
	C_Timer.After(0.5, CinematicFrame_CancelCinematic)
	return true
end)

hooksecurefunc("MovieFrame_PlayMovie", function(self, movieId)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.CinematicsEnabled == false or HelpMePlayDB.CinematicsEnabled == nil then return false end
	
	local mapID = C_Map.GetBestMapForUnit("player")
	for key, badMapID in ipairs(addon.CINEMATIC_BADMAPS) do
		if ( badMapID == mapID ) then
			return false
		end
	end
	
	C_Timer.After(0.5, function()
		self:StopMovie(movieId)
		self:Hide()
		GameMovieFinished()
	end)
	return true
end)