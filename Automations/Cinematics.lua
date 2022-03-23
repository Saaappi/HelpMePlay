local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local BADMAPS = addonTable.CINEMATIC_BADMAPS

-- Normal Cinematics
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

-- In-Game Movies
MovieFrame:HookScript("OnShow", function(self, ...)
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
	self:Hide()
	--[[MovieFrameSubtitleString:Hide()
	GameMovieFinished()
	CinematicFrame:Hide()
	GlobalFXDialogModelScene:Hide()
	GlobalFXMediumModelScene:Hide()
	GlobalFXBackgroundModelScene:Hide()
	TimerTracker:Hide()
	WorldFrame:Show()
	UIParent:Show()
	self.uiParentShown = UIParent:IsVisible()
	SetUIVisibility(true)]]
end)