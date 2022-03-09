local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_COSMIC = {
	-- Supported Maps: 946 (Cosmic), 947 (Azeroth)
	-- Darkmoon Faire
	[67370] = { -- Jeremy Feasel
		["g"] = {
			L_DIALOG["I challenge you to a pet battle!"],
		},
	},
	[85519] = { -- Christoph VonFeasel
		["g"] = {
			L_DIALOG["I challenge you to a pet battle!"],
		},
	},
	-- End of Darkmoon Faire
	-- Nazjatar
	[155941] = { -- Tamer Orami
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[150101] = { -- Lady Jaina Proudmoore
		["g"] = {
			L_DIALOG["Lady Jaina Proudmoore 5"],
		},
	},
	-- End of Nazjatar
}

addonTable.DIALOG_COSMIC = DIALOG_COSMIC