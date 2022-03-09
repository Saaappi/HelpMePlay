local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_WOTLK = {
	-- Supported Maps: 113 (Northrend)
	-- Borean Tundra
	[26044] = { -- Durkot Wolfbrother
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[27194] = { -- Trapper Saghani
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Borean Tundra
	-- Zul'Drak
	[28790] = { -- Fala Softhoof
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Zul'Drak
}

addonTable.DIALOG_WOTLK = DIALOG_WOTLK