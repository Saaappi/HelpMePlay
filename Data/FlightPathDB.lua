local addonName, addonTable = ...

local FLIGHT_PATHS = {
	[993] = { -- Broken Isles
		["g"] = {
			{
				["p"] 	= 1673, -- Lorlathil, Val'sharah
				["c"] 	= { "quests.complete", "level.between" },
				["q"] 	= { 44663 }, -- In the Blink of an Eye
				["l"] 	= { 30, 32 },
			},
			{
				["p"] 	= 1777, -- Sylvan Falls, Highmountain
				["c"] 	= { "level.between", "quests.complete" },
				["l"] 	= { 38, 40 },
				["t"] 	= { 38721 }, -- Lieutenant of the Tower
			},
			{
				["p"] 	= 1719, -- Thunder Totem, Highmountain
				["c"] 	= { "quests.active" },
				["q"] 	= { 39580 }, -- The High Chieftain
			},
		},
	},
	[1014] = { -- Kul Tiras
		["g"] = {
			{
				["p"] 	= 2127, -- Anyport, Drustvar
				["c"] 	= { "quests.active" },
				["q"] 	= { 51985 }, -- Return to Zuldazar
			},
		},
	},
	[1208] = { -- Eastern Kingdoms
		["g"] = {
			{
				["p"] 	= 6, -- Ironforge, Dun Morogh
				["c"] 	= { "quests.active", "level.between" },
				["q"] 	= { 34398 }, -- Warlords of Draenor: The Dark Portal
				["l"] 	= { 10, 11 },
			},
			{
				["p"] 	= 645, -- Forsaken High Command, Silverpine Forest
				["c"] 	= { "quests.active" },
				["q"] 	= { 27096 }, -- Orcs are in Order
			},
			{
				["p"] 	= 10, -- The Sepulcher, Silverpine Forest
				["c"] 	= { "quests.active" },
				["q"] 	= { 27476 }, -- Dalar Dawnweaver
			},
			{
				["p"] 	= 654, -- The Forsaken Front, Silverpine Forest
				["c"] 	= { "quests.active" },
				["q"] 	= { 27484 }, -- Only One May Enter
			},
		},
	},
	[1922] = { -- Warlords of Draenor
		["g"] = {
			{
				["p"] 	= 1518, -- Wildwood Wash, Gorgrond
				["c"] 	= { "quests.active", "map" },
				["q"] 	= { 35556 }, -- The Secrets of Gorgrond
				["m"] 	= 622, -- Stormshield, Ashran
			},
		},
	},
}

addonTable.FLIGHT_PATHS = FLIGHT_PATHS