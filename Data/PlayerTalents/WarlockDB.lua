local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local WARLOCK_TALENTS = {
	[265] = { -- Affliction
	},
	[266] = { -- Demonology
	},
	[267] = { -- Destruction
	},
}

addonTable.WARLOCK_TALENTS = WARLOCK_TALENTS