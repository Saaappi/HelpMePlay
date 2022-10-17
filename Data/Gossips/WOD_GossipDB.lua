local addonName, addonTable = ...
local DIALOG_WOD = {
	-- Supported Maps: 572 (Draenor)
	-- Garrison (Alliance)
	[84455] = { -- Assistant Brightstone
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[81441] = { -- Shelly Hamby
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[81103] = { -- Dungar Longdrink
		["g"] = {
			{
				["o"] 	= 2,
				["c"] 	= { "level.higher" },
				["l"] 	= 30,
			},
		},
	},
	-- End of Garrison (Alliance)
	-- Gorgrond
	[81018] = { -- Rangari Kolaan
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[81013] = { -- Rangari Rajess
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[81020] = { -- Rangari Jonaa
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[84766] = { -- Glirin
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of Gorgrond
	-- Tanaan Jungle
	[78556] = { -- Ariok
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[78568] = { -- Thaelin Darkanvil
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "quests.isActive" },
				["q"] 	= { 35747 }, -- Taking a Trip to the Top of the Tank
			},
		},
	},
	[79243] = { -- Baros Alexston
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of Tanaan Jungle
}

addonTable.DIALOG_WOD = DIALOG_WOD