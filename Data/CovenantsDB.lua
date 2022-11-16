local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local COVENANTS_BY_SPEC = {
	[1] = { -- Warrior
		[71] = 1, 	-- Arms (Kyrian)
		[72] = 1, 	-- Fury (Kyrian)
		[73] = 3, 	-- Protection (Necrolord)
	},
	[2] = { -- Paladin
		[65] = 2, 	-- Holy (Venthyr)
		[66] = 1, 	-- Protection (Kyrian)
		[70] = 1, 	-- Retribution (Kyrian)
	},
	[3] = { -- Hunter
		[253] = 4, 	-- Beast Mastery (Night Fae)
		[254] = 4, 	-- Marksmanship (Night Fae)
		[255] = 1, 	-- Survival (Kyrian)
	},
	[4] = { -- Rogue
		[259] = 2, 	-- Assassination (Venthyr)
		[260] = 2, 	-- Outlaw (Venthyr)
		[261] = 1, 	-- Subtlety (Kyrian)
	},
	[5] = { -- Priest
		[256] = 1, 	-- Discipline (Kyrian)
		[257] = 4, 	-- Holy (Night Fae)
		[258] = 3, 	-- Shadow (Necrolord)
	},
	[6] = { -- Death Knight
		[250] = 4, 	-- Blood (Night Fae)
		[251] = 4, 	-- Frost (Night Fae)
		[252] = 3, 	-- Unholy (Necrolord)
	},
	[7] = { -- Shaman
		[262] = 4, 	-- Elemental (Night Fae)
		[263] = 3, 	-- Enhancement (Necrolord)
		[264] = 1, 	-- Restoration (Kyrian)
	},
	[8] = { -- Mage
		[62] = 1, 	-- Arcane (Kyrian)
		[63] = 4, 	-- Fire (Night Fae)
		[64] = 4, 	-- Frost (Night Fae)
	},
	[9] = { -- Warlock
		[265] = 4, 	-- Affliction (Night Fae)
		[266] = 3, 	-- Demonology (Necrolord)
		[267] = 4, 	-- Destruction (Night Fae)
	},
	[10] = { -- Monk
		[268] = 1, 	-- Brewmaster (Kyrian)
		[270] = 2, 	-- Mistweaver (Venthyr)
		[269] = 3, 	-- Windwalker (Necrolord)
	},
	[11] = { -- Druid
		[102] = 2, 	-- Balance (Venthyr)
		[103] = 4, 	-- Feral (Night Fae)
		[104] = 2, 	-- Guardian (Venthyr)
		[105] = 3, 	-- Restoration (Necrolord)
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

addonTable.COVENANTS_BY_SPEC = COVENANTS_BY_SPEC