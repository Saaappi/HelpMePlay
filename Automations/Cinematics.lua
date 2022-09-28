local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

-- Cinematics
--[[
	Description:
		Skip the in-game cinematics if the player has enabled the feature.
		
		Cinematics are in-game "cutscenes" using in-game assets.
]]--
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
--[[
	Description:
		Skip the in-game movies if the player has enabled the feature.
		
		Movies are in-game, pre-rendered videos.
]]--
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