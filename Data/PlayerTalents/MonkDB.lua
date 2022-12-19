local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local MONK_TALENTS = {
	[268] = { -- Brewmaster
	},
	[270] = { -- Mistweaver
	},
	[269] = { -- Windwalker
	},
}

addonTable.MONK_TALENTS = MONK_TALENTS