local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local MERCHANTS = {
	[1247] = { -- Innkeeper Belm
		{ -- 1
			["itemID"] = 2894, 			-- Rhapsody Malt
			["quantity"] = 1,
			["extendedCost"] = {},
		},
	},
	[156800] = { -- Quartermaster Richter
		{ -- 1
			["itemID"] = 117, 			-- Tough Jerky
			["quantity"] = 1,
			["extendedCost"] = {},
		},
	},
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
	[162804] = { -- Ve'nari
		{ -- 1
			["itemID"] = 180817, 		-- Cypher of Relocation
			["quantity"] = 1,
			["extendedCost"] = {
				["currencyId"] = 1767,	-- Stygia
				["amount"] = 60,
				["checkForTransactionItem"] = true,
			},
		},
		{ -- 2
			["itemID"] = 181324, 		-- Anima Supricifer
			["quantity"] = 1,
			["extendedCost"] = {
				["currencyId"] = 1767,	-- Stygia
				["amount"] = 50,
				["checkForTransactionItem"] = true,
			},
		},
	},
}

addonTable.MERCHANTS = MERCHANTS