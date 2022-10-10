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
	[98825] = { -- Spiritwalker Ebonhorn
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[99745] = { -- Snazzle Shinyfinder
		["g"] = {
			{
				["o"] 			= 2,
				["c"] 			= { "none" },
			},
		},
	},
	[99746] = { -- Trytooth Hardchisel
		["g"] = {
			{
				["o"] 			= 2,
				["c"] 			= { "none" },
			},
		},
	},
	[99747] = { -- Kindle Candlecrafter
		["g"] = {
			{
				["o"] 			= 2,
				["c"] 			= { "none" },
			},
		},
	},
	[99748] = { -- Kindle Candlecrafter
		["g"] = {
			{
				["o"] 			= 2,
				["c"] 			= { "none" },
			},
		},
	},
	[99781] = { -- Snazzle Shinyfinder
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[99782] = { -- Trytooth Hardchisel
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[99784] = { -- Kindle Candlecrafter
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[95403] = { -- Windmaster Julan
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[96286] = { -- Navarrogg
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
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