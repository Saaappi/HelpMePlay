local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local ROGUE_TALENTS = {
	[259] = { -- Assassination
	},
	[260] = { -- Outlaw
	},
	[261] = { -- Subtlety
	},
}

addonTable.ROGUE_TALENTS = ROGUE_TALENTS