local addonName, addonTable = ...

local FLIGHT_PATHS = {
	[993] = { -- Broken Isles
		["g"] = {
			{
				["p"] 	= 1673, -- Lorlathil, Val'sharah
				["c"] 	= { "quests.isComplete", "level.between" },
				["q"] 	= { 44663 }, -- In the Blink of an Eye
				["l"] 	= { 30, 32 },
			},
			{
				["p"] 	= 1719, -- Thunder Totem, Highmountain
				["c"] 	= { "quests.isActive" },
				["q"] 	= { 39580 }, -- The High Chieftain
			},
		},
	},
}

addonTable.FLIGHT_PATHS = FLIGHT_PATHS