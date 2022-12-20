local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local SHAMAN_TALENTS = {
	[262] = { -- Elemental
	},
	[263] = { -- Enhancement
	},
	[264] = { -- Restoration
	},
}

addonTable.SHAMAN_TALENTS = SHAMAN_TALENTS