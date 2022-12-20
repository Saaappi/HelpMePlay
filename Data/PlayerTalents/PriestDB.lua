local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local PRIEST_TALENTS = {
	[256] = { -- Discipline
	},
	[257] = { -- Holy
	},
	[258] = { -- Shadow
	},
}

addonTable.PRIEST_TALENTS = PRIEST_TALENTS