local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local PLAYERCHOICE_MAPS = {
	--[[
		Description:
			Sometimes a map needs to be part of the
			check for whether or not we need to
			process a player choice window.
	]]--
	[84] = "Stormwind City",
	[85] = "Orgrimmar",
}
local CINEMATIC_BADMAPS = {
	--[[
		Description:
			These are maps that shouldn't be
			processed by the Cinematics automation.
	]]--
	21, 	-- Silverpine Forest
	217,	-- Ruins of Gilneas
	1169,	-- Tol Dagor
}

addonTable.CINEMATIC_BADMAPS = CINEMATIC_BADMAPS
addonTable.PLAYERCHOICE_MAPS = PLAYERCHOICE_MAPS