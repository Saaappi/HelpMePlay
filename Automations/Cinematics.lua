local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

-- Normal Cinematics
CinematicFrame:HookScript("OnShow", function(self, ...)
	if HelpMePlayOptionsDB.Cinematics == false or HelpMePlayOptionsDB.Cinematics == nil then return end
	local mapId = C_Map.GetBestMapForUnit("player")
	for key, badMapId in ipairs(addonTable.CINEMATIC_BADMAPS) do
		if badMapId == mapId then
			if HelpMePlayOptionsDB.Logging then
				print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " ..L_GLOBALSTRINGS["Cinematic or Movie Not Skipped"])
			end
			return
		end
	end
	CinematicFrame_CancelCinematic()
end)

-- In-Game Movies
_G["MovieFrame_PlayMovie"] = function(...)
	if HelpMePlayOptionsDB.Cinematics == false or HelpMePlayOptionsDB.Cinematics == nil then return end
	local mapId = C_Map.GetBestMapForUnit("player")
	for key, badMapId in ipairs(addonTable.CINEMATIC_BADMAPS) do
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