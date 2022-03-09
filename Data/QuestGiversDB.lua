local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local IGNORED_QUESTGIVERS = {
	[52824] = "General Taldris Moonfall",
}

addonTable.IGNORED_QUESTGIVERS = IGNORED_QUESTGIVERS