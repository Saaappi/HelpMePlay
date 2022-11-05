local addonName, addonTable = ...
local DIALOG_CLASSIC = {
	-- Supported Maps: 12 (Kalimdor), 13 (Eastern Kingdoms)
	-- Blasted Lands
	[78423] = { -- Archmage Khadgar
		["g"] = {
			{
				["o"] 	= 43231,
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
				["o"] 	= 31712,
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
				["o"] 	= 47615,
				["c"] 	= { "level.lower" },
				["l"] 	= 50,
			},
			{
				["o"] 	= 47616,
				["c"] 	= { "level.higher" },
				["l"] 	= 49,
			},
		},
		["c"] = true,
	},
	[154169] = { -- Captain Garrick
		["g"] = {
			{
				["o"] 	= 51396,
				["c"] 	= { "none" },
			},
		},
	},
	[171789] = { -- High Inquisitor Whitemane
		["g"] = {
			{ -- Do The Maw
				["o"] 	= 52724,
				["c"] 	= { "addon.setting" },
				["s"] 	= "TheMawEnabled",
				["r"] 	= true,
			},
			{ -- Skip The Maw
				["o"] 	= 52725,
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
				["o"] 	= 47484,
				["c"] 	= { "quests.active" },
				["q"] 	= { 42782 }, -- To Be Prepared
			},
		},
		["c"] = true,
	},
	-- End of Stormwind City
	-- Durotar
	[4311] = { -- Holgar Stormaxe
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "quests.active" },
				["q"] 	= { 44281 }, -- To Be Prepared
			},
		},
		["c"] = true,
	},
	-- End of Durotar
	-- Orgrimmar
	[168431] = { -- Warlord Breka Grimaxe
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[135205] = { -- Nathanos Blightcaller
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
	-- Hillsbrad Foothills
	[47444] = { -- Dumass
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[47443] = { -- Kingslayer Orkus
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[47442] = { -- Johnny Awesome
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[48218] = { -- Kingslayer Orkus
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[48503] = { -- Kingslayer Orkus
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[48922] = { -- Instructor Rufus
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[48923] = { -- Drill Sergeant Magnus
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	-- Eastern Plaguelands (Death Knight)
	[28406] = { -- Death Knight Initiate
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of Eastern Plaguelands (Death Knight)
	-- End of Hillsbrad Foothills
	-- Neutral
	[149626] = { -- Vanguard Battlemage (present in both Stormwind and Orgrimmar)
		["g"] = {
			{
				["o"] 	= 51033,
				["c"] 	= { "quests.active" },
				["q"] 	= { 34398 }, -- Warlords of Draenor: The Dark Portal
			},
		},
	},
	[167032] = { -- Chromie (present in both Stormwind and Orgrimmar)
		["g"] = {
			{
				["o"] 	= 51901,
				["c"] 	= { "chromieTime" },
				["ct"] 	= 0, -- not in Chromie Time (default timeline)
			},
		},
	},
	-- End of Neutral
}

addonTable.DIALOG_CLASSIC = DIALOG_CLASSIC