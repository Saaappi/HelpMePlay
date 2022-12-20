local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local WARLOCK_TALENTS = {
	[265] = { -- Affliction
		{ -- Fel Domination
			["n"] = 71931,
			["e"] = 91439,
		},
		{ -- Malefic Rapture
			["n"] = 72049,
			["e"] = 91570,
		},
		{ -- Burning Rush
			["n"] = 71949,
			["e"] = 91460,
		},
		{ -- Unstable Affliction
			["n"] = 72048,
			["e"] = 91569,
		},
		{ -- Demon Skin
			["n"] = 71952,
			["e"] = 91463,
		},
		{ -- Seed of Corruption
			["n"] = 72050,
			["e"] = 91571,
		},
		{ -- Demon Skin
			["n"] = 71952,
			["e"] = 91463,
		},
		{ -- Nightfall
			["n"] = 72047,
			["e"] = 91568,
		},
		{ -- Fel Armor
			["n"] = 71950,
			["e"] = 91461,
		},
		{ -- Xavian Teachings
			["n"] = 72051,
			["e"] = 91572,
		},
		{ -- Fel Armor
			["n"] = 71950,
			["e"] = 91461,
		},
		{ -- Sow the Seeds
			["n"] = 72039,
			["e"] = 91560,
		},
		{ -- Fiendish Stride
			["n"] = 71948,
			["e"] = 91459,
		},
		{ -- Harvester of Souls
			["n"] = 72043,
			["e"] = 91564,
		},
		{ -- Fiendish Stride
			["n"] = 71948,
			["e"] = 91459,
		},
		{ -- Harvester of Souls
			["n"] = 72043,
			["e"] = 91564,
		},
		{ -- Curses of Enfeeblement
			["n"] = 71951,
			["e"] = 91462,
		},
		{ -- Writhe in Agony
			["n"] = 72040,
			["e"] = 91561,
		},
		{ -- Mortal Coil
			["n"] = 71947,
			["e"] = 91457,
		},
		{ -- Writhe in Agony
			["n"] = 72040,
			["e"] = 91561,
		},
		{ -- Demonic Embrace
			["n"] = 71930,
			["e"] = 91438,
		},
		{ -- Drain Soul
			["n"] = 72045,
			["e"] = 91566,
		},
		{ -- Demonic Inspiration
			["n"] = 71928,
			["e"] = 91436,
		},
		{ -- Absolute Corruption
			["n"] = 72053,
			["e"] = 91575,
		},
		{ -- Wrathful Minion
			["n"] = 71946,
			["e"] = 91456,
		},
		{ -- Vile Taint
			["n"] = 72036,
			["e"] = 91556,
		},
		{ -- Demonic Fortitude
			["n"] = 71922,
			["e"] = 91430,
		},
		{ -- Soul Tap
			["n"] = 72042,
			["e"] = 91563,
		},
		{ -- Sweet Souls
			["n"] = 71927,
			["e"] = 91435,
		},
		{ -- Inevitable Demise
			["n"] = 72046,
			["e"] = 91567,
		},
		{ -- Demonic Gateway
			["n"] = 71955,
			["e"] = 91466,
		},
		{ -- Inevitable Demise
			["n"] = 72046,
			["e"] = 91567,
		},
		{ -- Dark Pact
			["n"] = 71936,
			["e"] = 91444,
		},
		{ -- Soul Flame
			["n"] = 72041,
			["e"] = 91562,
		},
		{ -- Dark Accord
			["n"] = 71956,
			["e"] = 91467,
		},
		{ -- Soul Flame
			["n"] = 72041,
			["e"] = 91562,
		},
		{ -- Shadowfury
			["n"] = 71942,
			["e"] = 91452,
		},
		{ -- Withering Bolt
			["n"] = 72055,
			["e"] = 91577,
		},
		{ -- Frequent Donor
			["n"] = 71937,
			["e"] = 91445,
		},
		{ -- Withering Bolt
			["n"] = 72055,
			["e"] = 91577,
		},
		{ -- Accrued Vitality
			["n"] = 71953,
			["e"] = 91464,
		},
		{ -- Sacrolash's Dark Strike
			["n"] = 72035,
			["e"] = 91555,
		},
		{ -- Accrued Vitality
			["n"] = 71953,
			["e"] = 91464,
		},
		{ -- Sacrolash's Dark Strike
			["n"] = 72035,
			["e"] = 91555,
		},
		{ -- Fel Synergy
			["n"] = 71918,
			["e"] = 91425,
		},
		{ -- Creeping Death
			["n"] = 72058,
			["e"] = 91580,
		},
		{ -- Soul Link
			["n"] = 71925,
			["e"] = 91433,
		},
		{ -- Haunt
			["n"] = 72032,
			["e"] = 91552,
		},
		{ -- Resolute Barrier
			["n"] = 71915,
			["e"] = 91421,
		},
		{ -- Summon Darkglare
			["n"] = 72034,
			["e"] = 91554,
		},
		{ -- Grimoire of Synergy
			["n"] = 71924,
			["e"] = 91432,
		},
		{ -- Soul Rot
			["n"] = 72056,
			["e"] = 91578,
		},
		{ -- Grimoire of Synergy
			["n"] = 71924,
			["e"] = 91432,
		},
		{ -- Wrath of Consumption
			["n"] = 72033,
			["e"] = 91553,
		},
		{ -- Soul Conduit
			["n"] = 71923,
			["e"] = 91431,
		},
		{ -- Soul-Eater's Gluttony
			["n"] = 71920,
			["e"] = 91428,
		},
		{ -- Soul Conduit
			["n"] = 71923,
			["e"] = 91431,
		},
		{ -- Soul-Eater's Gluttony
			["n"] = 71920,
			["e"] = 91428,
		},
		{ -- Grim Feast
			["n"] = 71926,
			["e"] = 91434,
		},
		{ -- Dark Harvest
			["n"] = 72057,
			["e"] = 91579,
		},
		{ -- Summon Soulkeeper
			["n"] = 71939,
			["e"] = 91448,
		},
	},
	[266] = { -- Demonology
	},
	[267] = { -- Destruction
	},
}

addonTable.WARLOCK_TALENTS = WARLOCK_TALENTS