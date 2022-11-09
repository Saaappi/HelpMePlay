local addonName, addonTable = ...
local DIALOG_LEGION = {
	-- Supported Maps: 619 (Broken Isles), 630 (Azsuna), 905 (Argus)
	-- Objects
	[0] = {
		["g"] = {
			{
				["o"] 			= 45050, -- Ravencrest Cemetary
				["c"] 			= { "none" },
			},
		},
	},
	-- Mardum, the Shattered Abyss
	[99914] = { -- Ashtongue Mystic
		["g"] = {
			{
				["o"] 			= 45047,
				["c"] 			= { "none" },
			},
		},
	},
	[99915] = { -- Sevis Brightflame
		["g"] = {
			{
				["o"] 			= 45048,
				["c"] 			= { "none" },
			},
			{
				["o"] 			= 45101,
				["c"] 			= { "none" },
			},
		},
	},
	[94435] = { -- Matron Mother Malevolence
		["g"] = {
			{
				["o"] 			= 44865,
				["c"] 			= { "none" },
			},
		},
	},
	[90247] = { -- Battlelord Gaardoun
		["g"] = {
			{
				["o"] 			= 42930,
				["c"] 			= { "none" },
			},
		},
	},
	[93693] = { -- Lady S'theno
		["g"] = {
			{
				["o"] 			= 44410,
				["c"] 			= { "none" },
			},
		},
	},
	[96436] = { -- Jace Darkweaver
		["g"] = {
			{
				["o"] 			= 45064,
				["c"] 			= { "none" },
			},
		},
	},
	[96655] = { -- Allari the Souleater
		["g"] = {
			{
				["o"] 			= 44405,
				["c"] 			= { "none" },
			},
		},
	},
	[96420] = { -- Cyana Nightglaive
		["g"] = {
			{
				["o"] 			= 44440,
				["c"] 			= { "none" },
			},
		},
	},
	[99045] = { -- Kor'vas Bloodthorn
		["g"] = {
			{
				["o"] 			= 44442,
				["c"] 			= { "none" },
			},
		},
	},
	[93127] = { -- Kayn Sunfury
		["g"] = {
			{
				["o"] 			= 44408,
				["c"] 			= { "none" },
			},
		},
	},
	[96652] = { -- Mannethrel Darkstar
		["g"] = {
			{
				["o"] 			= 44661,
				["c"] 			= { "none" },
			},
		},
	},
	[96653] = { -- Izal Whitemoon
		["g"] = {
			{
				["o"] 			= 44646,
				["c"] 			= { "none" },
			},
		},
	},
	[97644] = { -- Kor'vas Bloodthorn
		["g"] = {
			{
				["o"] 			= 44913,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Mardum, the Shattered Abyss
	-- Highmountain
	[98825] = { -- Spiritwalker Ebonhorn
		["g"] = {
			{
				["o"] 			= 44610,
				["c"] 			= { "none" },
			},
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
				["o"] 			= 44308,
				["c"] 			= { "none" },
			},
		},
	},
	[98773] = { -- Lasan Skyhorn
		["g"] = {
			{
				["o"] 			= 44839,
				["c"] 			= { "none" },
			},
		},
	},
	[99619] = { -- Navarrogg
		["g"] = {
			{
				["o"] 			= 44200,
				["c"] 			= { "none" },
			},
		},
	},
	[106153] = { -- Tarvim Daywalker
		["g"] = {
			{
				["o"] 			= 45373,
				["c"] 			= { "none" },
			},
		},
	},
	[106191] = { -- Old Nefu
		["g"] = {
			{
				["o"] 			= 45374,
				["c"] 			= { "none" },
			},
		},
	},
	[106115] = { -- Red Skymane
		["g"] = {
			{
				["o"] 			= 45372,
				["c"] 			= { "none" },
			},
		},
	},
	[96591] = { -- Amateur Hunter
		["g"] = {
			{
				["o"] 			= 44518,
				["c"] 			= { "none" },
			},
		},
	},
	[98804] = { -- Amateur Hunter
		["g"] = {
			{
				["o"] 			= 44518,
				["c"] 			= { "none" },
			},
		},
	},
	[94434] = { -- Addie Fizzlebog
		["g"] = {
			{
				["o"] 			= 44520,
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