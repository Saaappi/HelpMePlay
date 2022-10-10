local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_LEGION = {
	-- Supported Maps: 619 (Broken Isles), 905 (Argus)
	-- Objects
	[0] = {
		["g"] = {
			{
				["o"] 			= 1, -- Ravencrest Cemetary
				["c"] 			= { "none" },
			},
		},
	},
	-- Highmountain
	-- End of Highmountain
	-- Val'sharah
	[91462] = { -- Malfurion Stormrage
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[108642] = { -- Keeper Remulos
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[91109] = { -- Malfurion Stormrage
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[92742] = { -- Ysera
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[104739] = { -- Tyrande Whisperwind
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[104799] = { -- Tyrande Whisperwind
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[92734] = { -- Penelope Heathrow
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[92620] = { -- Commander Jarod Shadowsong
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[94974] = { -- Sirius Ebonwing
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[94975] = { -- Asha Ravensong
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[94976] = { -- Cassiel Nightthorn
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Val'sharah
}

addonTable.DIALOG_LEGION = DIALOG_LEGION