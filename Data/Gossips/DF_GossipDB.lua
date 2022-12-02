local addonName, addonTable = ...
local DIALOG_DF = {
	-- Supported Maps: 1978 (Dragon Isles)
	[0] = {
		["g"] = {
			{ -- Embassy Visitor Log
				["o"] 	= 55746,
				["c"] 	= { "none" },
			},
			{ -- Embassy Visitor Log
				["o"] 	= 55748,
				["c"] 	= { "none" },
			},
			{ -- Embassy Visitor Log
				["o"] 	= 55759,
				["c"] 	= { "none" },
			},
			{ -- Embassy Visitor Log
				["o"] 	= 55776,
				["c"] 	= { "none" },
			},
		},
	},
	-- The Waking Shores
	[193362] = { -- Sendrax
		["g"] = {
			{
				["o"] 	= 55636,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 55637,
				["c"] 	= { "none" },
			},
		},
	},
	[193393] = { -- Ambassador Fastrasz
		["g"] = {
			{
				["o"] 	= 55674,
				["c"] 	= { "none" },
			},
		},
	},
	[193372] = { -- Majordomo Selistra
		["g"] = {
			{
				["o"] 	= 55872,
				["c"] 	= { "none" },
			},
		},
	},
	[193363] = { -- Sendrax
		["g"] = {
			{
				["o"] 	= 55900,
				["c"] 	= { "none" },
			},
		},
	},
	[190564] = { -- Right
		["g"] = {
			{
				["o"] 	= 55298,
				["c"] 	= { "none" },
			},
		},
	},
	[190563] = { -- Left
		["g"] = {
			{
				["o"] 	= 55296,
				["c"] 	= { "none" },
			},
		},
	},
	[188299] = { -- Talonstalker Kavia
		["g"] = {
			{
				["o"] 	= 55335,
				["c"] 	= { "none" },
			},
		},
	},
	[187406] = { -- Sendrax
		["g"] = {
			{
				["o"] 	= 55225,
				["c"] 	= { "none" },
			},
		},
	},
	[190269] = { -- Sendrax
		["g"] = {
			{
				["o"] 	= 55259,
				["c"] 	= { "none" },
			},
		},
	},
	[186795] = { -- Majordomo Selistra
		["g"] = {
			{
				["o"] 	= 54941,
				["c"] 	= { "none" },
			},
		},
	},
	[187290] = { -- Alexstrasza the Life-Binder
		["g"] = {
			{
				["o"] 	= 107094,
				["c"] 	= { "none" },
			},
		},
	},
	[189261] = { -- Xius
		["g"] = {
			{
				["o"] 	= 55288,
				["c"] 	= { "none" },
			},
		},
	},
	[189262] = { -- Akxall
		["g"] = {
			{
				["o"] 	= 55289,
				["c"] 	= { "none" },
			},
		},
	},
	[193987] = { -- Valdestrasz
		["g"] = {
			{
				["o"] 	= 56425,
				["c"] 	= { "none" },
			},
		},
	},
	[198605] = { -- Tirastrasza
		["g"] = {
			{
				["o"] 	= 56428,
				["c"] 	= { "none" },
			},
		},
	},
	[193995] = { -- Rathestrasz
		["g"] = {
			{
				["o"] 	= 56424,
				["c"] 	= { "none" },
			},
		},
	},
	[185904] = { -- Mother Elion
		["g"] = {
			{
				["o"] 	= 55258,
				["c"] 	= { "none" },
			},
		},
	},
	[189260] = { -- Zahkrana
		["g"] = {
			{
				["o"] 	= 55290,
				["c"] 	= { "none" },
			},
		},
	},
	[193287] = { -- Lord Andestrasz
		["g"] = {
			{
				["o"] 	= 55643,
				["c"] 	= { "none" },
			},
		},
	},
	[194076] = { -- Veritistrasz
		["g"] = {
			{
				["o"] 	= 63853,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 63862,
				["c"] 	= { "none" },
			},
		},
	},
	[198040] = { -- Celormu
		["g"] = {
			{
				["o"] 	= 107284,
				["c"] 	= { "none" },
			},
		},
	},
	[192574] = { -- Thomas Bright
		["g"] = {
			{
				["o"] 	= 54961,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 55059,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 55061,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 55062,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 55066,
				["c"] 	= { "none" },
			},
		},
	},
	[187278] = { -- Majordomo Selistra
		["g"] = {
			{
				["o"] 	= 107159,
				["c"] 	= { "none" },
			},
		},
	},
	[193500] = { -- Iyali
		["g"] = {
			{
				["o"] 	= 55294,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 106986,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 106987,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 106988,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 106990,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 106994,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 106995,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 106996,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 107622,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 107707,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 107710,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 107292,
				["c"] 	= { "none" },
			},
		},
	},
	[192298] = { -- Tyrgon
		["g"] = {
			{
				["o"] 	= 107424,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 107421,
				["c"] 	= { "none" },
			},
		},
	},
	[189089] = { -- Beleaguered Explorer
		["g"] = {
			{
				["o"] 	= 54942,
				["c"] 	= { "none" },
			},
		},
	},
	[190334] = { -- Scout Ri'tal
		["g"] = {
			{
				["o"] 	= 55167,
				["c"] 	= { "none" },
			},
		},
	},
	[190423] = { -- Scout Francisco
		["g"] = {
			{
				["o"] 	= 55168,
				["c"] 	= { "none" },
			},
		},
	},
	[190352] = { -- Elementalist Taiyang
		["g"] = {
			{
				["o"] 	= 54908,
				["c"] 	= { "none" },
			},
		},
	},
	[194805] = { -- Celormu
		["g"] = {
			{
				["o"] 	= 106935,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of The Waking Shores
	-- The Forbidden Reach
	[182317] = { -- Scalecommander Cindrethresh
		["g"] = {
			{
				["o"] 	= 54978,
				["c"] 	= { "none" },
			},
		},
	},
	[182610] = { -- Scalecommander Viridia
		["g"] = {
			{
				["o"] 	= 51849,
				["c"] 	= { "none" },
			},
		},
	},
	[182611] = { -- Scalecommander Sarkareth
		["g"] = {
			{
				["o"] 	= 51850,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of The Forbidden Reach
}

addonTable.DIALOG_DF = DIALOG_DF