local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local badMaps = {
	-- These are maps that shouldn't have
	-- their cinematics or movies cancelled.
	21, 	-- Silverpine Forest
	217,	-- Ruins of Gilneas
	1169,	-- Tol Dagor
}

-- Normal Cinematics
CinematicFrame:HookScript("OnShow", function(self, ...)
	if HelpMePlayOptionsDB.Cinematics == false or HelpMePlayOptionsDB.Cinematics == nil then return end
	local mapId = C_Map.GetBestMapForUnit("player")
	for key, badMapId in ipairs(badMaps) do
		if badMapId == mapId then
			print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " ..L_GLOBALSTRINGS["Cinematic or Movie Not Skipped"])
			return
		end
	end
	CinematicFrame_CancelCinematic()
end)

-- In-Game Movies
_G["MovieFrame_PlayMovie"] = function(...)
	if HelpMePlayOptionsDB.Cinematics == false or HelpMePlayOptionsDB.Cinematics == nil then return end
	local mapId = C_Map.GetBestMapForUnit("player")
	for key, badMapId in ipairs(badMaps) do
		if badMapId == mapId then
			print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Cinematic or Movie Not Skipped"])
			return
		end
	end
	GameMovieFinished()
	return true
end