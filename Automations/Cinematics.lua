local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local BADMAPS = addonTable.CINEMATIC_BADMAPS
local isLoadingScreen = false

-- Cinematics
--[[
	Description:
		Skip the in-game cinematics if the player has enabled the feature.
		
		Cinematics are in-game "cutscenes" using in-game assets.
]]--
CinematicFrame:HookScript("OnShow", function(self, ...)
	if HelpMePlayOptionsDB.Cinematics == false or HelpMePlayOptionsDB.Cinematics == nil then return end
	local mapId = C_Map.GetBestMapForUnit("player")
	for key, badMapId in ipairs(BADMAPS) do
		if badMapId == mapId then
			if HelpMePlayOptionsDB.Logging then
				print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Cinematic or Movie Not Skipped"])
			end
			return
		end
	end
	CinematicFrame_CancelCinematic()
end)

-- Movies
--[[
	Description:
		Skip the in-game movies if the player has enabled the feature.
		
		Movies are in-game, pre-rendered videos.
]]--
_G["MovieFrame_PlayMovie"] = function(...)
	if HelpMePlayOptionsDB.Cinematics == false or HelpMePlayOptionsDB.Cinematics == nil then return end
	local mapId = C_Map.GetBestMapForUnit("player")
	for key, badMapId in ipairs(BADMAPS) do
		if badMapId == mapId then
			if HelpMePlayOptionsDB.Logging then
				print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Cinematic or Movie Not Skipped"])
			end
			return
		end
	end
	GameMovieFinished()
	return true
end