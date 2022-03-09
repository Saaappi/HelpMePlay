local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local CINEMATIC_BADMAPS = {
			-- These are maps that shouldn't have
			-- their cinematics or movies cancelled.
	21, 	-- Silverpine Forest
	217,	-- Ruins of Gilneas
	1169,	-- Tol Dagor
}

addonTable.CINEMATIC_BADMAPS = CINEMATIC_BADMAPS