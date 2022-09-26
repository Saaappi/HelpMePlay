local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local MERCHANTS = {
	[100437] = { -- Lanna Skyspark
		{ -- 1
			["itemID"] = 132247, 		-- Bottle of Airspark
			["quantity"] = 1,
			["extendedCost"] = {},
		},
	},
	[160601] = { -- Caretaker Mirene
		{ -- 1
			["itemID"] = 178891, 		-- Elysian Thread
			["quantity"] = 1,
			["extendedCost"] = {},
		},
	},
	[166640] = { -- Au'larrynar
		{ -- 1
			["itemID"] = 177957, 		-- Necessary Enhancers
			["quantity"] = 1,
			["extendedCost"] = {},
		},
	},
}

addonTable.MERCHANTS = MERCHANTS