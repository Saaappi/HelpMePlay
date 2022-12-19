local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local HUNTER_TALENTS = {
	[253] = { -- Beast Mastery
	},
	[254] = { -- Marksmanship
	},
	[255] = { -- Survival
	},
}

addonTable.HUNTER_TALENTS = HUNTER_TALENTS