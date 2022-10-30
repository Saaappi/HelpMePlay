local addonName, addonTable = ...
local DIALOG_LEGION = {
	-- Supported Maps: 619 (Broken Isles), 905 (Argus)
	-- Objects
	[0] = {
		["g"] = {
			{
				["o"] 			= 45050, -- Ravencrest Cemetary
				["c"] 			= { "none" },
			},
		},
	},
	-- Highmountain
	[98825] = { -- Spiritwalker Ebonhorn
		["g"] = {
			{
				["o"] 			= 44611,
				["c"] 			= { "none" },
			},
		},
	},
	[99745] = { -- Snazzle Shinyfinder
		["g"] = {
			{
				["o"] 			= 44447,
				["c"] 			= { "none" },
			},
		},
	},
	[99746] = { -- Trytooth Hardchisel
		["g"] = {
			{
				["o"] 			= 44347,
				["c"] 			= { "none" },
			},
		},
	},
	[99747] = { -- Kindle Candlecrafter
		["g"] = {
			{
				["o"] 			= 45092,
				["c"] 			= { "none" },
			},
		},
	},
	[99748] = { -- Dug Digger
		["g"] = {
			{
				["o"] 			= 45094,
				["c"] 			= { "none" },
			},
		},
	},
	[99781] = { -- Snazzle Shinyfinder
		["g"] = {
			{
				["o"] 			= 45095,
				["c"] 			= { "none" },
			},
		},
	},
	[99782] = { -- Trytooth Hardchisel
		["g"] = {
			{
				["o"] 			= 45096,
				["c"] 			= { "none" },
			},
			{
				["o"] 			= 45097,
				["c"] 			= { "none" },
			},
		},
	},
	[99784] = { -- Kindle Candlecrafter
		["g"] = {
			{
				["o"] 			= 45098,
				["c"] 			= { "none" },
			},
		},
	},
	[95403] = { -- Windmaster Julan
		["g"] = {
			{
				["o"] 			= 44135,
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
	[98773] = { -- Lasan Skyhorn
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[99619] = { -- Navarrogg
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[106153] = { -- Tarvim Daywalker
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[106191] = { -- Old Nefu
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[106115] = { -- Red Skymane
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[96591] = { -- Amateur Hunter
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[98804] = { -- Amateur Hunter
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[94434] = { -- Addie Fizzlebog
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
				["o"] 			= 44675,
				["c"] 			= { "none" },
			},
		},
	},
	[108642] = { -- Keeper Remulos
		["g"] = {
			{
				["o"] 			= 45772,
				["c"] 			= { "none" },
			},
		},
	},
	[91109] = { -- Malfurion Stormrage
		["g"] = {
			{
				["o"] 			= 44789,
				["c"] 			= { "none" },
			},
		},
	},
	[92742] = { -- Ysera
		["g"] = {
			{
				["o"] 			= 44776,
				["c"] 			= { "none" },
			},
		},
	},
	[104739] = { -- Tyrande Whisperwind
		["g"] = {
			{
				["o"] 			= 45498,
				["c"] 			= { "none" },
			},
		},
	},
	[104799] = { -- Tyrande Whisperwind
		["g"] = {
			{
				["o"] 			= 45380,
				["c"] 			= { "none" },
			},
		},
	},
	[92734] = { -- Penelope Heathrow
		["g"] = {
			{
				["o"] 			= 44454,
				["c"] 			= { "none" },
			},
		},
	},
	[92620] = { -- Commander Jarod Shadowsong
		["g"] = {
			{
				["o"] 			= 44726,
				["c"] 			= { "none" },
			},
		},
	},
	[94974] = { -- Sirius Ebonwing
		["g"] = {
			{
				["o"] 			= 44302,
				["c"] 			= { "none" },
			},
		},
	},
	[94975] = { -- Asha Ravensong
		["g"] = {
			{
				["o"] 			= 44306,
				["c"] 			= { "none" },
			},
		},
	},
	[94976] = { -- Cassiel Nightthorn
		["g"] = {
			{
				["o"] 			= 44304,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Val'sharah
}

addonTable.DIALOG_LEGION = DIALOG_LEGION