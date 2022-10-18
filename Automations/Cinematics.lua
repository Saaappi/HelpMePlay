local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

-- Cinematics
CinematicFrame:HookScript("OnShow", function(self, ...)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	local mapId = C_Map.GetBestMapForUnit("player")
	for key, badMapId in ipairs(addonTable.CINEMATIC_BADMAPS) do
		if badMapId == mapId then
			return false
		end
	end
	
	if HelpMePlayDB.CinematicsEnabled then
		C_Timer.After(0.5, CinematicFrame_CancelCinematic)
		return true
	end
end)

-- Movies
_G["MovieFrame_PlayMovie"] = function(self, movieId)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	local mapId = C_Map.GetBestMapForUnit("player")
	for key, badMapId in ipairs(addonTable.CINEMATIC_BADMAPS) do
		if badMapId == mapId then
			return false
		end
	end
	
	if HelpMePlayDB.CinematicsEnabled then
		C_Timer.After(0.5, GameMovieFinished)
		return true
	else
		self:Show()
		self.CloseDialog:Hide()
		local playSuccess, errorCode = self:StartMovie(movieId)
		if ( not playSuccess ) then
			StaticPopup_Show("ERROR_CINEMATIC")
			self:Hide()
			GameMovieFinished()
		end
	end
end