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
	local mapId = C_Map.GetBestMapForUnit("player")
	for key, badMapId in ipairs(addonTable.CINEMATIC_BADMAPS) do
		if badMapId == mapId then
			if HelpMePlayOptionsDB.Logging then
				print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Cinematic or Movie Not Skipped"])
			end
			return
		end
	end
	
	if HelpMePlayOptionsDB.Cinematics then
		C_Timer.After(1.5, CinematicFrame_CancelCinematic)
		C_Timer.After(3, CinematicFrame_CancelCinematic)
	end
end)

-- Movies
--[[
	Description:
		Skip the in-game movies if the player has enabled the feature.
		
		Movies are in-game, pre-rendered videos.
]]--
_G["MovieFrame_PlayMovie"] = function(self, movieId)
	local mapId = C_Map.GetBestMapForUnit("player")
	for key, badMapId in ipairs(addonTable.CINEMATIC_BADMAPS) do
		if badMapId == mapId then
			if HelpMePlayOptionsDB.Logging then
				print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Cinematic or Movie Not Skipped"])
			end
			return false
		end
	end
	
	if HelpMePlayOptionsDB.Cinematics then
		C_Timer.After(0.5, GameMovieFinished)
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