local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_CLASSIC = {
	-- Supported Maps: 12 (Kalimdor), 13 (Eastern Kingdoms)
	-- Blasted Lands
	-- End of Blasted Lands
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