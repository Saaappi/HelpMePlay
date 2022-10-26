local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local QUESTREWARDS = {
	[55992] = { -- Darkmaul Citadel (A)
		["id"] = 2043,
		["name"] = C_Map.GetMapInfo(1609).name
	},
	[59984] = { -- Darkmaul Citadel (H)
		["id"] = 2043,
		["name"] = C_Map.GetMapInfo(1609).name
	},
}

addonTable.QUESTREWARDS = QUESTREWARDS