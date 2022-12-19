local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DEATH_KNIGHT_TALENTS = {
	[250] = { -- Blood
	},
	[251] = { -- Frost
	},
	[252] = { -- Unholy
	},
}

addonTable.DEATH_KNIGHT_TALENTS = DEATH_KNIGHT_TALENTS