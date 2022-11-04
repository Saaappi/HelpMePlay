local addonName, addonTable = ...
local DIALOG_BFA = {
	-- Supported Maps 875 (Zandalar), 876 (Kul Tiras)
	-- Drustvar (Horde)
	[137613] = { -- Hobart Grapplehammer
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[137397] = { -- Wormhole
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[139519] = { -- Swellthrasher
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51985 }, -- Return to Zuldazar
			},
		},
	},
	-- End of Drustvar (Horde)
	-- Stormsong Valley (Horde)
	[138137] = { -- Huelo
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[138097] = { -- Muka Stormbreaker
		["g"] = {
			{
				["o"] 			= 2,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51986 }, -- Return to Zuldazar
			},
		},
	},
	-- End of Stormsong Valley (Horde)
	-- Tiragarde Sound (Horde)
	[137675] = { -- Shadow Hunter Ty'jin
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[137807] = { -- Navigator Swink
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[137798] = { -- Boatswain Taryn
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[137800] = { -- Quartermaster Killian
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[139524] = { -- Erul Dawnbrook
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51984 }, -- Return to Zuldazar
			},
		},
	},
	-- End of Tiragarde Sound (Horde)
	-- Zuldazar (Alliance)
	[143690] = { -- Captured Zandalari Troll
		["g"] = {
			{
				["o"] 			= 49408,
				["c"] 			= { "none" },
			},
		},
	},
	[143334] = { -- Daria Smithson
		["g"] = {
			{
				["o"] 			= 49161,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51968 }, -- Return to Boralus
			},
		},
	},
	-- End of Zuldazar (Alliance)
	-- Zuldazar (Horde)
	[120169] = { -- Princess Talanji
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[143913] = { -- Eitrigg
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51340 }, -- Drustvar Ho!
			},
		},
	},
	[135690] = { -- Dread-Admiral Tattersail
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51340 }, -- Drustvar Ho!
			},
			{
				["o"] 			= 1,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51421 }, -- Shiver Me Timbers
			},
			{
				["o"] 			= 1,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51532 }, -- Storming In
			},
		},
	},
	-- End of Zuldazar (Horde)
	-- Vol'dun (Alliance)
	[137559] = { -- Private James
		["g"] = {
			{
				["o"] 			= 48674,
				["c"] 			= { "none" },
			},
		},
	},
	[135383] = { -- Barnard "The Smasher" Baysworth
		["g"] = {
			{
				["o"] 			= 49007,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51969 }, -- Return to Boralus
			},
		},
	},
	-- End of Vol'dun (Alliance)
	-- Nazmir (Alliance)
	[139620] = { -- Desha Stormwallow
		["g"] = {
			{
				["o"] 			= 48827,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51967 }, -- Return to Boralus
			},
		},
	},
	-- End of Nazmir (Alliance)
	-- Boralus
	[122370] = { -- Cyrus Crestfall
		["g"] = {
			{
				["o"] 			= 48242,
				["c"] 			= { "none" },
			},
		},
	},
	[137066] = { -- 7th Legion Magus
		["g"] = {
			{
				["o"] 			= 48276,
				["c"] 			= { "none" },
			},
		},
	},
	[135612] = { -- Halford Wyrmbane
		["g"] = {
			{
				["o"] 			= 49384,
				["c"] 			= { "none" },
			},
		},
	},
	[135681] = { -- Grand Admiral Jes-Tereth
		["g"] = {
			{
				["o"] 			= 48168,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51308 }, -- Zuldazar Foothold
			},
			{
				["o"] 			= 48164,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51088 }, -- Heart of Darkness
			},
			{
				["o"] 			= 48162,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51283 }, -- Voyage to the West
			},
		},
	},
	-- End of Boralus
}

addonTable.DIALOG_BFA = DIALOG_BFA