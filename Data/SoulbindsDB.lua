local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local SOULBINDS_BY_SPEC = {
	[1] = { -- Warrior
		[71] = {}, 	-- Arms (Night Fae)
		[72] = {}, 	-- Fury (Kyrian)
		[73] = {}, 	-- Protection (Kyrian)
	},
	[2] = { -- Paladin
		[65] = {}, 	-- Holy (Venthyr)
		[66] = {}, 	-- Protection (Kyrian)
		[70] = {}, 	-- Retribution (Kyrian)
	},
	[3] = { -- Hunter
		[253] = {}, 	-- Beast Mastery (Night Fae)
		[254] = {}, 	-- Marksmanship (Kyrian)
		[255] = {}, 	-- Survival (Kyrian)
	},
	[4] = { -- Rogue
		[259] = {}, 	-- Assassination (Venthyr)
		[260] = {}, 	-- Outlaw (Kyrian)
		[261] = {}, 	-- Subtlety (Venthyr)
	},
	[5] = { -- Priest
		[256] = {}, 	-- Discipline (Kyrian)
		[257] = {}, 	-- Holy (Night Fae)
		[258] = {}, 	-- Shadow (Necrolord)
	},
	[6] = { -- Death Knight
		[250] = {}, 	-- Blood (Venthyr)
		[251] = {}, 	-- Frost (Night Fae)
		[252] = {}, 	-- Unholy (Night Fae)
	},
	[7] = { -- Shaman
		[262] = {}, 	-- Elemental (Necrolord)
		[263] = {}, 	-- Enhancement (Necrolord)
		[264] = {}, 	-- Restoration (Venthyr)
	},
	[8] = { -- Mage
		[62] = {}, 	-- Arcane (Kyrian)
		[63] = {}, 	-- Fire (Night Fae)
		[64] = {}, 	-- Frost (Night Fae)
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
		[268] = {}, 	-- Brewmaster (Night Fae)
		[270] = {}, 	-- Mistweaver (Venthyr)
		[269] = {}, 	-- Windwalker (Necrolord)
	},
	[11] = { -- Druid
		[102] = {}, 	-- Balance (Night Fae)
		[103] = {}, 	-- Feral (Night Fae)
		[104] = {}, 	-- Guardian (Night Fae)
		[105] = {}, 	-- Restoration (Night Fae)
	},
	[12] = { -- Demon Hunter
		[577] = {}, 	-- Havoc (Venthyr)
		[581] = {}, 	-- Vengeance (Kyrian)
	},
	[13] = { -- Evoker
		[1467] = {}, -- Devastation (Night Fae)
		[1468] = {}, -- Preservation (Night Fae)
	},
}

addonTable.SOULBINDS_BY_SPEC = SOULBINDS_BY_SPEC