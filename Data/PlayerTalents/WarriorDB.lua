local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local WARRIOR_TALENTS = {
	{ -- War Machine
		["t"] = 90345,
		["e"] = 112207,
	},
	{ -- Leeching Strikes
		["t"] = 90344,
		["e"] = 112206,
	},
}

addonTable.WARRIOR_TALENTS = WARRIOR_TALENTS