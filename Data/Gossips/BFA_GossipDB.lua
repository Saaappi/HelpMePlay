local addonName, addonTable = ...
local DIALOG_BFA = {
	-- Supported Maps 875 (Zandalar), 876 (Kul Tiras)
	-- Drustvar
	-- End of Drustvar
	-- Stormsong Valley
	-- End of Stormsong Valley
	-- Tiragarde Sound
	-- End of Tiragarde Sound
	-- Zuldazar
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
				["c"] 			= { "quests.isActive" },
				["q"] 			= { 51968 }, -- Return to Boralus
			},
		},
	},
	-- End of Zuldazar
	-- Vol'dun
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
				["c"] 			= { "quests.isActive" },
				["q"] 			= { 51969 }, -- Return to Boralus
			},
		},
	},
	-- End of Vol'dun
	-- Nazmir
	[139620] = { -- Desha Stormwallow
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "quests.isActive" },
				["q"] 			= { 51967 }, -- Return to Boralus
			},
		},
	},
	-- End of Nazmir
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
				["c"] 			= { "quests.isActive" },
				["q"] 			= { 51308 }, -- Zuldazar Foothold
			},
			{
				["o"] 			= 1,
				["c"] 			= { "quests.isActive" },
				["q"] 			= { 51088 }, -- Heart of Darkness
			},
			{
				["o"] 			= 1,
				["c"] 			= { "quests.isActive" },
				["q"] 			= { 51283 }, -- Voyage to the West
			},
		},
	},
	-- End of Boralus
}

addonTable.DIALOG_BFA = DIALOG_BFA