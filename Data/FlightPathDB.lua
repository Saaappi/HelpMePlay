local addonName, addonTable = ...

local FLIGHT_PATHS = {
	[627] = { -- Dalaran (Legion)
		["g"] = {
			{
				["p"] 	= 1673, -- Lorlathil, Val'sharah
				["c"] 	= { "quests.isComplete", "level.between", "target.is" },
				["q"] 	= { 44663 }, -- In the Blink of an Eye
				["l"] 	= { 30, 60 },
				["t"] 	= 96813, -- Aludane Whitecloud
			},
		},
	},
	[650] = { -- Highmountain
		["g"] = {
			{
				["p"] 	= 1719, -- Thunder Totem, Highmountain
				["c"] 	= { "quests.isActive", "target.is" },
				["q"] 	= { 39580 }, -- The High Chieftain
				["t"] 	= 96565, -- Chofa Nighthoof
			},
		},
	},
}

addonTable.FLIGHT_PATHS = FLIGHT_PATHS