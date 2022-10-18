local addonName, addonTable = ...
local DIALOG_CLASSIC = {
	-- Supported Maps: 12 (Kalimdor), 13 (Eastern Kingdoms)
	-- Blasted Lands
	[78423] = { -- Archmage Khadgar
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "player.faction" },
				["f"] 	= "Alliance",
			},
		},
		["c"] = true,
	},
	-- End of Blasted Lands
	-- Ironforge
	[1573] = { -- Gryth Thurden
		["g"] = {
			{
				["o"] 	= 2,
				["c"] 	= { "quests.active" },
				["q"] 	= { 26131 }, -- Reinforcements for Loch Modan
			},
		},
	},
	-- End of Ironforge
	-- Stormwind City
	[120590] = { -- Lady Jaina Proudmoore
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "level.lower" },
				["l"] 	= 50,
			},
		},
	},
	[149626] = { -- Vanguard Battlemage
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "quests.active" },
				["q"] 	= { 34398 }, -- Warlords of Draenor: The Dark Portal
			},
		},
	},
	[154169] = { -- Captain Garrick
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[171789] = { -- High Inquisitor Whitemane
		["g"] = {
			{ -- Do The Maw
				["o"] 	= 1,
				["c"] 	= { "addon.setting" },
				["s"] 	= "TheMawEnabled",
				["r"] 	= true,
			},
			{ -- Skip The Maw
				["o"] 	= 2,
				["c"] 	= { "addon.setting" },
				["s"] 	= "TheMawEnabled",
				["r"] 	= false,
			},
		},
		["c"] = true,
	},
	[107934] = { -- Recruiter Lee
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "quests.active" },
				["q"] 	= { 42782 }, -- To Be Prepared
			},
		},
		["c"] = true,
	},
	-- End of Stormwind City
	-- Orgrimmar
	[168431] = { -- Warlord Breka Grimaxe
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of Orgrimmar
	-- Silverpine Forest
	[44825] = { -- Bat Handler Maggotbreath
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "quests.active" },
				["q"] 	= { 26998 }, -- Iterating Upon Success
			},
		},
	},
	[45752] = { -- Ambermill Dimensional Portal
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of Silverpine Forest
	-- Neutral
	[167032] = { -- Chromie (present in both Stormwind and Orgrimmar)
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of Neutral
}

addonTable.DIALOG_CLASSIC = DIALOG_CLASSIC