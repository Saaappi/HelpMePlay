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
	-- Grizzly Hills
	[33224] = { -- Maiden of Ashwood Lake
		["g"] = {
			L_DIALOG["Maiden of Ashwood Lake 1"],
		},
	},
	-- End of Grizzly Hills
}

addonTable.DIALOG_WOTLK = DIALOG_WOTLK