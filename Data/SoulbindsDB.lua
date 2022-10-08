local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local SOULBINDS_BY_SPEC = {
	[1] = { -- Warrior
		[71] = 4, 	-- Arms (Night Fae)
		[72] = 1, 	-- Fury (Kyrian)
		[73] = 1, 	-- Protection (Kyrian)
	},
	[2] = { -- Paladin
		[65] = 2, 	-- Holy (Venthyr)
		[66] = 1, 	-- Protection (Kyrian)
		[70] = 1, 	-- Retribution (Kyrian)
	},
	[3] = { -- Hunter
		[253] = 4, 	-- Beast Mastery (Night Fae)
		[254] = 1, 	-- Marksmanship (Kyrian)
		[255] = 1, 	-- Survival (Kyrian)
	},
	[4] = { -- Rogue
		[259] = 2, 	-- Assassination (Venthyr)
		[260] = 1, 	-- Outlaw (Kyrian)
		[261] = 2, 	-- Subtlety (Venthyr)
	},
	[5] = { -- Priest
		[256] = 1, 	-- Discipline (Kyrian)
		[257] = 4, 	-- Holy (Night Fae)
		[258] = 3, 	-- Shadow (Necrolord)
	},
	[6] = { -- Death Knight
		[250] = 2, 	-- Blood (Venthyr)
		[251] = 4, 	-- Frost (Night Fae)
		[252] = 4, 	-- Unholy (Night Fae)
	},
	[7] = { -- Shaman
		[262] = 3, 	-- Elemental (Necrolord)
		[263] = 3, 	-- Enhancement (Necrolord)
		[264] = 2, 	-- Restoration (Venthyr)
	},
	[8] = { -- Mage
		[62] = 1, 	-- Arcane (Kyrian)
		[63] = 4, 	-- Fire (Night Fae)
		[64] = 4, 	-- Frost (Night Fae)
	},
	[9] = { -- Warlock
		[265] = 4, 	-- Affliction (Night Fae)
		[266] = { 	-- Demonology (Night Fae)
			["soulbind"] = 2, -- Dreamweaver
			
		},
		[267] = 4, 	-- Destruction (Night Fae)
	},
	[10] = { -- Monk
		[268] = 4, 	-- Brewmaster (Night Fae)
		[270] = 2, 	-- Mistweaver (Venthyr)
		[269] = 3, 	-- Windwalker (Necrolord)
	},
	[11] = { -- Druid
		[102] = 4, 	-- Balance (Night Fae)
		[103] = 4, 	-- Feral (Night Fae)
		[104] = 4, 	-- Guardian (Night Fae)
		[105] = 4, 	-- Restoration (Night Fae)
	},
	[12] = { -- Demon Hunter
		[577] = 2, 	-- Havoc (Venthyr)
		[581] = 1, 	-- Vengeance (Kyrian)
	},
	[13] = { -- Evoker
		[1467] = 4, -- Devastation (Night Fae)
		[1468] = 4, -- Preservation (Night Fae)
	},
}

addonTable.SOULBINDS_BY_SPEC = SOULBINDS_BY_SPEC