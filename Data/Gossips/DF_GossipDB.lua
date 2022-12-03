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
	[194805] = { -- Bathoras
		["g"] = {
			{
				["o"] 	= 56408,
				["c"] 	= { "none" },
			},
		},
	},
	[192795] = { -- Scalecommander Emberthal
		["g"] = {
			{
				["o"] 	= 107399,
				["c"] 	= { "none" },
			},
		},
	},
	[186331] = { -- Fao the Relentless
		["g"] = {
			{
				["o"] 	= 55311,
				["c"] 	= { "none" },
			},
		},
	},
	[186493] = { -- Forgemaster Bazentus
		["g"] = {
			{
				["o"] 	= 55309,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 55310,
				["c"] 	= { "none" },
			},
		},
	},
	[187466] = { -- Archivist Edress
		["g"] = {
			{
				["o"] 	= 55307,
				["c"] 	= { "none" },
			},
		},
	},
	[187189] = { -- Blacktalon Assassin
		["g"] = {
			{
				["o"] 	= 54628,
				["c"] 	= { "none" },
			},
		},
	},
	[189507] = { -- Talonstalker Kavia
		["g"] = {
			{
				["o"] 	= 54996,
				["c"] 	= { "none" },
			},
		},
	},
	[186681] = { -- Wrathion
		["g"] = {
			{
				["o"] 	= 55405,
				["c"] 	= { "none" },
			},
		},
	},
	[186933] = { -- Wrathion
		["g"] = {
			{
				["o"] 	= 54627,
				["c"] 	= { "none" },
			},
		},
	},
	[187045] = { -- Wrathion
		["g"] = {
			{
				["o"] 	= 55423,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 56143,
				["c"] 	= { "none" },
			},
		},
	},
	[193464] = { -- Forgemaster Bazentus
		["g"] = {
			{
				["o"] 	= 55566,
				["c"] 	= { "none" },
			},
		},
	},
	[188158] = { -- Baskilan
		["g"] = {
			{
				["o"] 	= 55358,
				["c"] 	= { "none" },
			},
		},
	},
	[193456] = { -- Archivist Edress
		["g"] = {
			{
				["o"] 	= 55564,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 55565,
				["c"] 	= { "none" },
			},
		},
	},
	[191710] = { -- Left
		["g"] = {
			{
				["o"] 	= 55355,
				["c"] 	= { "none" },
			},
		},
	},
	[191711] = { -- Right
		["g"] = {
			{
				["o"] 	= 55356,
				["c"] 	= { "none" },
			},
		},
	},
	[191600] = { -- Talonstalker Kavia
		["g"] = {
			{
				["o"] 	= 55354,
				["c"] 	= { "none" },
			},
		},
	},
	[190937] = { -- Sabellian
		["g"] = {
			{
				["o"] 	= 55381,
				["c"] 	= { "none" },
			},
		},
	},
	[185905] = { -- Alexstrasza the Life-Binder
		["g"] = {
			{
				["o"] 	= 55380,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of The Waking Shores
	-- Ohn'ahran Plains
	[181217] = { -- Sansok Khan
		["g"] = {
			{
				["o"] 	= 56190,
				["c"] 	= { "none" },
			},
		},
	},
	[186176] = { -- Aru
		["g"] = {
			{
				["o"] 	= 55270,
				["c"] 	= { "none" },
			},
		},
	},
	[186175] = { -- Belika
		["g"] = {
			{
				["o"] 	= 54840,
				["c"] 	= { "none" },
			},
		},
	},
	[186183] = { -- Beastmaster Nuqut
		["g"] = {
			{
				["o"] 	= 55228,
				["c"] 	= { "none" },
			},
		},
	},
	[184595] = { -- Ohn Seshteng
		["g"] = {
			{
				["o"] 	= 54838,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 64063,
				["c"] 	= { "none" },
			},
		},
	},
	[185882] = { -- Scout Tomul
		["g"] = {
			{
				["o"] 	= 55267,
				["c"] 	= { "none" },
			},
		},
	},
	[187297] = { -- Nokhud Fighter
		["g"] = {
			{
				["o"] 	= 55277,
				["c"] 	= { "none" },
			},
		},
	},
	[196449] = { -- Elder Odgerel
		["g"] = {
			{
				["o"] 	= 106779,
				["c"] 	= { "none" },
			},
		},
	},
	[192080] = { -- Ohn Arasara
		["g"] = {
			{
				["o"] 	= 107074,
				["c"] 	= { "none" },
			},
		},
	},
	[196437] = { -- Provisioner Zara
		["g"] = {
			{
				["o"] 	= 107058,
				["c"] 	= { "none" },
			},
		},
	},
	[191283] = { -- Sansok Khan
		["g"] = {
			{
				["o"] 	= 56528,
				["c"] 	= { "none" },
			},
			{
				["o"] 	= 56515, -- Clan Teerai
				["c"] 	= { "quest.obj.count.notComplete" },
				["q"] 	= 66969, -- Clans of the Plains
				["obj"] = 2,
				["v"] 	= 1,
			},
			{
				["o"] 	= 56537, -- Clan Ohn'ir
				["c"] 	= { "quest.obj.count.notComplete" },
				["q"] 	= 66969, -- Clans of the Plains
				["obj"] = 2,
				["v"] 	= 2,
			},
			{
				["o"] 	= 56549, -- Clan Nokhud
				["c"] 	= { "quest.obj.count.notComplete" },
				["q"] 	= 66969, -- Clans of the Plains
				["obj"] = 2,
				["v"] 	= 3,
			},
			{
				["o"] 	= 56554, -- Clan Shikaar
				["c"] 	= { "quest.obj.count.notComplete" },
				["q"] 	= 66969, -- Clans of the Plains
				["obj"] = 2,
				["v"] 	= 4,
			},
		},
	},
	[194927] = { -- Gemisath
		["g"] = {
			{
				["o"] 	= 56585,
				["c"] 	= { "none" },
			},
		},
	},
	[186942] = { -- Khansguard Akato
		["g"] = {
			{
				["o"] 	= 54895,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of Ohn'ahran Plains
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