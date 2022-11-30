local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local WARRIOR_TALENTS = {
	[73] = { -- Protection
		{ -- War Machine
			["n"] = 90345,
			["e"] = 112207,
			["r"] = 1,
		},
		{ -- Leeching Strikes
			["n"] = 90344,
			["e"] = 112206,
			["r"] = 1,
		},
	},
}

addonTable.WARRIOR_TALENTS = WARRIOR_TALENTS