local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
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
				["c"] 	= { "quests.isActive" },
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
			{
				["o"] 	= 2,
				["c"] 	= { "level.higher" },
				["l"] 	= 49,
			},
		},
	},
	[149626] = { -- Vanguard Battlemage
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "quests.isActive" },
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
	[167032] = { -- Chromie
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
	},
	-- End of Stormwind City
	-- Durotar
	-- End of Durotar
	-- Orgrimmar
	-- End of Orgrimmar
}

addonTable.DIALOG_CLASSIC = DIALOG_CLASSIC