local addonName, addonTable = ...
local DIALOG_BFA = {
	-- Supported Maps 875 (Zandalar), 876 (Kul Tiras)
	-- Drustvar (Horde)
	-- End of Drustvar (Horde)
	-- Stormsong Valley (Horde)
	-- End of Stormsong Valley (Horde)
	-- Tiragarde Sound (Horde)
	-- End of Tiragarde Sound (Horde)
	-- Zuldazar (Alliance)
	[143690] = { -- Captured Zandalari Troll
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[143334] = { -- Daria Smithson
		["g"] = {
			{
				["o"] 			= 1,
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
		},
	},
	-- End of Zuldazar (Horde)
	-- Vol'dun (Alliance)
	[137559] = { -- Private James
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[135383] = { -- Barnard "The Smasher" Baysworth
		["g"] = {
			{
				["o"] 			= 2,
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
				["o"] 			= 1,
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
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[137066] = { -- 7th Legion Magus
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[135612] = { -- Halford Wyrmbane
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[135681] = { -- Grand Admiral Jes-Tereth
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51308 }, -- Zuldazar Foothold
			},
			{
				["o"] 			= 1,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51088 }, -- Heart of Darkness
			},
			{
				["o"] 			= 1,
				["c"] 			= { "quests.active" },
				["q"] 			= { 51283 }, -- Voyage to the West
			},
		},
	},
	-- End of Boralus
}

addonTable.DIALOG_BFA = DIALOG_BFA