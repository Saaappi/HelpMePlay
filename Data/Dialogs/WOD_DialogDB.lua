local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_WOD = {
	-- Supported Maps: 572 (Draenor)
	-- Garrison (Alliance)
	[79243] = { -- Baros Alexston
		["g"] = {
			{
				["text"] 		= L_DIALOG["Baros Alexston 1"],
				["condition"] 	= "none",
			},
		},
	},
	[84455] = { -- Assistant Brightstone
		["g"] = {
			{
				["text"] 		= L_DIALOG["Assistant Brightstone 1"],
				["condition"] 	= "none",
			},
		},
	},
	[81441] = { -- Shelly Hamby
		["g"] = {
			{
				["text"] 		= L_DIALOG["Shelly Hamby 1"],
				["condition"] 	= "none",
			},
		},
	},
	[81103] = { -- Dungar Longdrink
		["g"] = {
			{
				["text"] 		= L_DIALOG["Dungar Longdrink 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Garrison (Alliance)
	-- Garrison (Horde)
	[80225] = { -- Skaggit
		["g"] = {
			{
				["text"] 		= L_DIALOG["Skaggit 1"],
				["condition"] 	= "none",
			},
		},
	},
	[86775] = { -- Senior Peon II
		["g"] = {
			{
				["text"] 		= L_DIALOG["Senior Peon II 1"],
				["condition"] 	= "none",
			},
		},
	},
	[88228] = { -- Sergeant Grimjaw
		["g"] = {
			{
				["text"] 		= L_DIALOG["Sergeant Grimjaw 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Garrison (Horde)
	-- Gorgrond
	[81013] = { -- Rangari Rajess
		["g"] = {
			{
				["text"] 		= L_DIALOG["D'kaan is coming with help."],
				["condition"] 	= "none",
			},
		},
	},
	[81018] = { -- Rangari Kolaan
		["g"] = {
			{
				["text"] 		= L_DIALOG["D'kaan is coming with help."],
				["condition"] 	= "none",
			},
		},
	},
	[81020] = { -- Rangari Jonaa
		["g"] = {
			{
				["text"] 		= L_DIALOG["D'kaan is coming with help."],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Gorgrond
	-- Tanaan Jungle
	[78556] = { -- Ariok
		["g"] = {
			{
				["text"] 		= L_DIALOG["Ariok 1"],
				["condition"] 	= "none",
			},
		},
	},
	[78568] = { -- Thaelin Darkanvil
		["g"] = {
			{
				["text"] 		= L_DIALOG["Thaelin Darkanvil 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Tanaan Jungle
}

addonTable.DIALOG_WOD = DIALOG_WOD