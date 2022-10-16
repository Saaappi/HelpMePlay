local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local SOULBINDS_BY_SPEC = {
	[1] = { -- Warrior
		[71] = { 		-- Arms (Night Fae)
			["id"] 		= 6, 		-- Korayn
			["tree"] 	= 334,
			["conduits"] = {
				{ -- 1
					["n"] = 1209,
					["c"] = 190, 	-- Destructive Reverberations
				},
				{ -- 2
					["n"] = 1204,
					["c"] = 0,
				},
				{ -- 3
					["n"] = 1210,
					["c"] = 8, 		-- Inspiring Presence
				},
				{ -- 4
					["n"] = 1216,
					["c"] = 0,
				},
				{ -- 5
					["n"] = 1215,
					["c"] = 5, 		-- Stalwart Guardian
				},
				{ -- 6
					["n"] = 1213,
					["c"] = 10, 	-- Fueled by Violence
				},
				{ -- 7
					["n"] = 1206,
					["c"] = 0,
				},
				{ -- 8
					["n"] = 1849,
					["c"] = 12, 	-- Crash the Ramparts
				},
				{ -- 9
					["n"] = 1850,
					["c"] = 0,
				},
				{ -- 10
					["n"] = 1852,
					["c"] = 283, 	-- Condensed Anima Sphere
				},
				{ -- 11
					["n"] = 1848,
					["c"] = 0,
				},
			},
		},
		[72] = nil, 	-- Fury (Kyrian)
		[73] = nil, 	-- Protection (Kyrian)
	},
	[2] = { -- Paladin
		[65] = nil, 	-- Holy (Venthyr)
		[66] = nil, 	-- Protection (Kyrian)
		[70] = nil, 	-- Retribution (Kyrian)
	},
	[3] = { -- Hunter
		[253] = nil, 	-- Beast Mastery (Night Fae)
		[254] = nil, 	-- Marksmanship (Kyrian)
		[255] = nil, 	-- Survival (Kyrian)
	},
	[4] = { -- Rogue
		[259] = nil, 	-- Assassination (Venthyr)
		[260] = { 		-- Outlaw (Kyrian)
			["id"] 		= 18, 		-- Forgelite Prime Mikanikos
			["tree"] 	= 365,
			["conduits"] = {
				{ -- 1
					["n"] = 1381,
					["c"] = 244, 	-- Count the Odds
				},
				{ -- 2
					["n"] = 1408,
					["c"] = 0,
				},
				{ -- 3
					["n"] = 1379,
					["c"] = 233, 	-- Quick Decisions
				},
				{ -- 4
					["n"] = 1417,
					["c"] = 0,
				},
				{ -- 5
					["n"] = 1380,
					["c"] = 231, 	-- Recuperator
				},
				{ -- 6
					["n"] = 1415,
					["c"] = 243, 	-- Sleight of Hand
				},
				{ -- 7
					["n"] = 1412,
					["c"] = 0,
				},
				{ -- 8
					["n"] = 1831,
					["c"] = 225, 	-- Reverberation
				},
				{ -- 9
					["n"] = 1832,
					["c"] = 0,
				},
				{ -- 10
					["n"] = 1834,
					["c"] = 230, 	-- Nimble Fingers
				},
				{ -- 11
					["n"] = 1836,
					["c"] = 0,
				},
			},
		},
		[261] = nil, 	-- Subtlety (Venthyr)
	},
	[5] = { -- Priest
		[256] = nil, 	-- Discipline (Kyrian)
		[257] = nil, 	-- Holy (Night Fae)
		[258] = nil, 	-- Shadow (Necrolord)
	},
	[6] = { -- Death Knight
		[250] = nil, 	-- Blood (Venthyr)
		[251] = nil, 	-- Frost (Night Fae)
		[252] = nil, 	-- Unholy (Night Fae)
	},
	[7] = { -- Shaman
		[262] = nil, 	-- Elemental (Necrolord)
		[263] = { 		-- Enhancement (Necrolord)
			["id"] 		= 10, 		-- Bonesmith Heirmir
			["tree"] 	= 349,
			["conduits"] = {
				{ -- 1
					["n"] = 1265,
					["c"] = 110, 	-- Focused Lightning
				},
				{ -- 2
					["n"] = 1267,
					["c"] = 0,
				},
				{ -- 3
					["n"] = 1276,
					["c"] = 95, 	-- Thunderous Paws
				},
				{ -- 4
					["n"] = 1270,
					["c"] = 0,
				},
				{ -- 5
					["n"] = 1263,
					["c"] = 94, 	-- Vital Accretion
				},
				{ -- 6
					["n"] = 1264,
					["c"] = 111, 	-- Magma Fist
				},
				{ -- 7
					["n"] = 1269,
					["c"] = 0,
				},
				{ -- 8
					["n"] = 1805,
					["c"] = 147, 	-- Tumbling Waves
				},
				{ -- 9
					["n"] = 1806,
					["c"] = 0,
				},
				{ -- 10
					["n"] = 1808,
					["c"] = 283, 	-- Condensed Anima Sphere
				},
				{ -- 11
					["n"] = 1810,
					["c"] = 0,
				},
			},
		},
		[264] = nil, 	-- Restoration (Venthyr)
	},
	[8] = { -- Mage
		[62] = nil, 	-- Arcane (Kyrian)
		[63] = nil, 	-- Fire (Night Fae)
		[64] = nil, 	-- Frost (Night Fae)
	},
	[9] = { -- Warlock
		[265] = {}, 	-- Affliction (Night Fae)
		[266] = { 		-- Demonology (Night Fae)
			["id"] 		= 2, 		-- Dreamweaver
			["tree"] 	= 275,
			["conduits"] = {
				{ -- 1
					["n"] = 870,
					["c"] = 160, 	-- Resolute Barrier
				},
				{ -- 2
					["n"] = 836,
					["c"] = 204, 	-- Borne of Blood
				},
				{ -- 3
					["n"] = 827,
					["c"] = 0, 
				},
				{ -- 4
					["n"] = 830,
					["c"] = 205, 	-- Carnivorous Stalkers
				},
				{ -- 5
					["n"] = 832,
					["c"] = 222, 	-- Diabolic Bloodstone
				},
				{ -- 6
					["n"] = 834,
					["c"] = 0,
				},
				{ -- 7
					["n"] = 824,
					["c"] = 0,
				},
				{ -- 8
					["n"] = 1843,
					["c"] = 207, 	-- Fel Commando
				},
				{ -- 9
					["n"] = 1845,
					["c"] = 0,
				},
				{ -- 10
					["n"] = 1847,
					["c"] = 168, 	-- Shade of Terror
				},
				{ -- 11
					["n"] = 1848,
					["c"] = 0,
				},
			},
		},
		[267] = {}, 	-- Destruction (Night Fae)
	},
	[10] = { -- Monk
		[268] = nil, 	-- Brewmaster (Night Fae)
		[270] = nil, 	-- Mistweaver (Venthyr)
		[269] = { 		-- Windwalker (Necrolord)
			["id"] 		= 5, 		-- Emeni
			["tree"] 	= 330,
			["conduits"] = {
				{ -- 1
					["n"] = 1168,
					["c"] = 22, 	-- Coordinated Offensive
				},
				{ -- 2
					["n"] = 1163,
					["c"] = 0,
				},
				{ -- 3
					["n"] = 1767,
					["c"] = 42, 	-- Tumbling Technique
				},
				{ -- 4
					["n"] = 1156,
					["c"] = 0,
				},
				{ -- 5
					["n"] = 1167,
					["c"] = 15, 	-- Harm Denial
				},
				{ -- 6
					["n"] = 1164,
					["c"] = 60, 	-- Bone Marrow Hops
				},
				{ -- 7
					["n"] = 1158,
					["c"] = 0,
				},
				{ -- 8
					["n"] = 1799,
					["c"] = 19, 	-- Calculated Strikes
				},
				{ -- 9
					["n"] = 1800,
					["c"] = 0,
				},
				{ -- 10
					["n"] = 1801,
					["c"] = 25, 	-- Grounding Breath
				},
				{ -- 11
					["n"] = 1802,
					["c"] = 0,
				},
			},
		},
	},
	[11] = { -- Druid
		[102] = nil, 	-- Balance (Night Fae)
		[103] = nil, 	-- Feral (Night Fae)
		[104] = nil, 	-- Guardian (Night Fae)
		[105] = nil, 	-- Restoration (Night Fae)
	},
	[12] = { -- Demon Hunter
		[577] = nil, 	-- Havoc (Venthyr)
		[581] = nil, 	-- Vengeance (Kyrian)
	},
	[13] = { -- Evoker
		[1467] = nil, -- Devastation (Night Fae)
		[1468] = nil, -- Preservation (Night Fae)
	},
}

addonTable.SOULBINDS_BY_SPEC = SOULBINDS_BY_SPEC