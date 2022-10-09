local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local SOULBINDS_BY_SPEC = {
	[1] = { -- Warrior
		[71] = nil, 	-- Arms (Night Fae)
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
		[260] = nil, 	-- Outlaw (Kyrian)
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
		[263] = nil, 	-- Enhancement (Necrolord)
		[264] = nil, 	-- Restoration (Venthyr)
	},
	[8] = { -- Mage
		[62] = nil, 	-- Arcane (Kyrian)
		[63] = nil, 	-- Fire (Night Fae)
		[64] = nil, 	-- Frost (Night Fae)
	},
	[9] = { -- Warlock
		[265] = {}, 	-- Affliction (Night Fae)
		[266] = { 	-- Demonology (Night Fae)
			["id"] 		= 2, -- Dreamweaver
			["tree"] 	= 275,
			["conduits"] = {
				{ -- 1
					["n"] = 870,
					["c"] = 160, -- Resolute Barrier
				},
				{ -- 2
					["n"] = 836,
					["c"] = 204, -- Borne of Blood
				},
				{ -- 3
					["n"] = 827,
					["c"] = 0, 
				},
				{ -- 4
					["n"] = 830,
					["c"] = 205, -- Carnivorous Stalkers
				},
				{ -- 5
					["n"] = 832,
					["c"] = 222, -- Diabolic Bloodstone
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
					["c"] = 207, -- Fel Commando
				},
				{ -- 9
					["n"] = 1845,
					["c"] = 0,
				},
				{ -- 10
					["n"] = 1847,
					["c"] = 168, -- Shade of Terror
				},
				{ -- 11
					["n"] = 1848,
					["c"] = 0,
				},
			}
		},
		[267] = {}, 	-- Destruction (Night Fae)
	},
	[10] = { -- Monk
		[268] = nil, 	-- Brewmaster (Night Fae)
		[270] = nil, 	-- Mistweaver (Venthyr)
		[269] = nil, 	-- Windwalker (Necrolord)
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