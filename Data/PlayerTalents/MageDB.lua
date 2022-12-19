local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local MAGE_TALENTS = {
	[62] = { -- Arcane
	},
	[63] = { -- Fire
	},
	[64] = { -- Frost
	},
}

addonTable.MAGE_TALENTS = MAGE_TALENTS