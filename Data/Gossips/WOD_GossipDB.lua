local addonName, addonTable = ...
local DIALOG_WOD = {
	-- Supported Maps: 572 (Draenor)
	-- Garrison (Alliance)
	[79243] = { -- Baros Alexston
		["g"] = {
			{
				["o"] 	= 43035,
				["c"] 	= { "none" },
			},
		},
	},
	[84455] = { -- Assistant Brightstone
		["g"] = {
			{
				["o"] 	= 42666,
				["c"] 	= { "none" },
			},
		},
	},
	[81441] = { -- Shelly Hamby
		["g"] = {
			{
				["o"] 	= 42677,
				["c"] 	= { "none" },
			},
		},
	},
	[81103] = { -- Dungar Longdrink
		["g"] = {
			{
				["o"] 	= 42839,
				["c"] 	= { "level.higher" },
				["l"] 	= 30,
			},
		},
	},
	-- End of Garrison (Alliance)
	-- Garrison (Horde)
	[86775] = { -- Senior Peon II
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[80225] = { -- Skaggit
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[79407] = { -- Bron Skyhorn
		["g"] = {
			{
				["o"] 	= 2,
				["c"] 	= { "quests.active", "level.higher" },
				["q"] 	= { 36706 }, -- Ashran Appearance
				["l"] 	= 41,
			},
		},
	},
	-- End of Garrison (Horde)
	-- Gorgrond
	[81018] = { -- Rangari Kolaan
		["g"] = {
			{
				["o"] 	= 42547,
				["c"] 	= { "none" },
			},
		},
	},
	[81013] = { -- Rangari Rajess
		["g"] = {
			{
				["o"] 	= 42546,
				["c"] 	= { "none" },
			},
		},
	},
	[81020] = { -- Rangari Jonaa
		["g"] = {
			{
				["o"] 	= 42548,
				["c"] 	= { "none" },
			},
		},
	},
	[84766] = { -- Glirin
		["g"] = {
			{
				["o"] 	= 42999,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of Gorgrond
	-- Tanaan Jungle
	[78556] = { -- Ariok
		["g"] = {
			{
				["o"] 	= 43152,
				["c"] 	= { "none" },
			},
		},
	},
	[78568] = { -- Thaelin Darkanvil
		["g"] = {
			{
				["o"] 	= 42452,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of Tanaan Jungle
}

addonTable.DIALOG_WOD = DIALOG_WOD