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
		{ -- Fel Domination
			["n"] = 71931,
			["e"] = 91439,
		},
		{ -- Call Dreadstalkers
			["n"] = 72023,
			["e"] = 91543,
		},
		{ -- Burning Rush
			["n"] = 71949,
			["e"] = 91460,
		},
		{ -- Demonbolt
			["n"] = 72024,
			["e"] = 91544,
		},
		{ -- Demon Skin
			["n"] = 71952,
			["e"] = 91463,
		},
		{ -- Dreadlash
			["n"] = 72020,
			["e"] = 91539,
		},
		{ -- Demon Skin
			["n"] = 71952,
			["e"] = 91463,
		},
		{ -- Annihilan Training
			["n"] = 72022,
			["e"] = 91542,
		},
		{ -- Fel Armor
			["n"] = 71950,
			["e"] = 91461,
		},
		{ -- Demonic Knowledge
			["n"] = 72026,
			["e"] = 91546,
		},
		{ -- Fel Armor
			["n"] = 71950,
			["e"] = 91461,
		},
		{ -- Soul Strike
			["n"] = 72019,
			["e"] = 91537,
		},
		{ -- Fiendish Stride
			["n"] = 71948,
			["e"] = 91459,
		},
		{ -- Demonic Strength
			["n"] = 72021,
			["e"] = 91540,
		},
		{ -- Fiendish Stride
			["n"] = 71948,
			["e"] = 91459,
		},
		{ -- From the Shadows
			["n"] = 72015,
			["e"] = 91533,
		},
		{ -- Curses of Enfeeblement
			["n"] = 71951,
			["e"] = 91462,
		},
		{ -- Implosion
			["n"] = 72002,
			["e"] = 91520,
		},
		{ -- Mortal Coil
			["n"] = 71947,
			["e"] = 91457,
		},
		{ -- Shadow's Bite
			["n"] = 72025,
			["e"] = 91545,
		},
		{ -- Demonic Embrace
			["n"] = 71930,
			["e"] = 91438,
		},
		{ -- Carnivorous Stalkers
			["n"] = 72018,
			["e"] = 91536,
		},
		{ -- Demonic Inspiration
			["n"] = 71928,
			["e"] = 91436,
		},
		{ -- Fel and Steel
			["n"] = 72016,
			["e"] = 91534,
		},
		{ -- Wrathful Minion
			["n"] = 71946,
			["e"] = 91456,
		},
		{ -- Fel Might
			["n"] = 72014,
			["e"] = 91532,
		},
		{ -- Demonic Fortitude
			["n"] = 71922,
			["e"] = 91430,
		},
		{ -- Grimoire: Felguard
			["n"] = 72013,
			["e"] = 91531,
		},
		{ -- Desperate Pact
			["n"] = 71929,
			["e"] = 91437,
		},
		{ -- Dread Calling
			["n"] = 71999,
			["e"] = 91517,
		},
		{ -- Desperate Pact
			["n"] = 71929,
			["e"] = 91437,
		},
		{ -- Demonic Meteor
			["n"] = 72012,
			["e"] = 91530,
		},
		{ -- Sweet Souls
			["n"] = 71927,
			["e"] = 91435,
		},
		{ -- Fel Sunder
			["n"] = 72010,
			["e"] = 91528,
		},
		{ -- Demonic Gateway
			["n"] = 71955,
			["e"] = 91466,
		},
		{ -- Imp Gang Boss
			["n"] = 71998,
			["e"] = 91516,
		},
		{ -- Dark Pact
			["n"] = 71936,
			["e"] = 91444,
		},
		{ -- Imp Gang Boss
			["n"] = 71998,
			["e"] = 91516,
		},
		{ -- Dark Accord
			["n"] = 71956,
			["e"] = 91467,
		},
		{ -- Ripped through the Portal
			["n"] = 72009,
			["e"] = 91527,
		},
		{ -- Shadowfury
			["n"] = 71942,
			["e"] = 91452,
		},
		{ -- Ripped through the Portal
			["n"] = 72009,
			["e"] = 91527,
		},
		{ -- Frequent Donor
			["n"] = 71937,
			["e"] = 91445,
		},
		{ -- Summon Demonic Tyrant
			["n"] = 72030,
			["e"] = 91550,
		},
		{ -- Accrued Vitality
			["n"] = 71953,
			["e"] = 91464,
		},
		{ -- Antoran Armaments
			["n"] = 72008,
			["e"] = 91526,
		},
		{ -- Accrued Vitality
			["n"] = 71953,
			["e"] = 91464,
		},
		{ -- Soulbound Tyrant
			["n"] = 71992,
			["e"] = 91510,
		},
		{ -- Fel Synergy
			["n"] = 71918,
			["e"] = 91425,
		},
		{ -- Soulbound Tyrant
			["n"] = 71992,
			["e"] = 91510,
		},
		{ -- Soul Link
			["n"] = 71925,
			["e"] = 91433,
		},
		{ -- The Expendables
			["n"] = 71994,
			["e"] = 91512,
		},
		{ -- Grimoire of Synergy
			["n"] = 71924,
			["e"] = 91432,
		},
		{ -- Infernal Command
			["n"] = 72006,
			["e"] = 91524,
		},
		{ -- Grimoire of Synergy
			["n"] = 71924,
			["e"] = 91432,
		},
		{ -- Infernal Command
			["n"] = 72006,
			["e"] = 91524,
		},
		{ -- Soul Conduit
			["n"] = 71923,
			["e"] = 91431,
		},
		{ -- Grand Warlock's Design
			["n"] = 71991,
			["e"] = 91508,
		},
		{ -- Soul Conduit
			["n"] = 71923,
			["e"] = 91431,
		},
		{ -- Guillotine
			["n"] = 72005,
			["e"] = 91523,
		},
		{ -- Soulburn
			["n"] = 71957,
			["e"] = 91469,
		},
	},
	[267] = { -- Destruction
		{ -- Fel Domination
			["n"] = 71931,
			["e"] = 91439,
		},
		{ -- Chaos Bolt
			["n"] = 72068,
			["e"] = 91591,
		},
		{ -- Burning Rush
			["n"] = 71949,
			["e"] = 91460,
		},
		{ -- Conflagrate
			["n"] = 72067,
			["e"] = 91590,
		},
		{ -- Demon Skin
			["n"] = 71952,
			["e"] = 91463,
		},
		{ -- Reverse Entropy
			["n"] = 71980,
			["e"] = 91496,
		},
		{ -- Demon Skin
			["n"] = 71952,
			["e"] = 91463,
		},
		{ -- Rain of Fire
			["n"] = 72069,
			["e"] = 91592,
		},
		{ -- Fel Armor
			["n"] = 71950,
			["e"] = 91461,
		},
		{ -- Backdraft
			["n"] = 72066,
			["e"] = 91589,
		},
		{ -- Fel Armor
			["n"] = 71950,
			["e"] = 91461,
		},
		{ -- Havoc
			["n"] = 71979,
			["e"] = 91493,
		},
		{ -- Fiendish Stride
			["n"] = 71948,
			["e"] = 91459,
		},
		{ -- Pyrogenics
			["n"] = 71975,
			["e"] = 91489,
		},
		{ -- Fiendish Stride
			["n"] = 71948,
			["e"] = 91459,
		},
		{ -- Roaring Blaze
			["n"] = 72065,
			["e"] = 91588,
		},
		{ -- Curses of Enfeeblement
			["n"] = 71951,
			["e"] = 91462,
		},
		{ -- Explosive Potential
			["n"] = 72059,
			["e"] = 91581,
		},
		{ -- Mortal Coil
			["n"] = 71947,
			["e"] = 91457,
		},
		{ -- Channel Demonfire
			["n"] = 72064,
			["e"] = 91586,
		},
		{ -- Demonic Embrace
			["n"] = 71930,
			["e"] = 91438,
		},
		{ -- Cry Havoc
			["n"] = 71981,
			["e"] = 91497,
		},
		{ -- Demonic Inspiration
			["n"] = 71928,
			["e"] = 91436,
		},
		{ -- Cataclysm
			["n"] = 71974,
			["e"] = 91487,
		},
		{ -- Wrathful Minion
			["n"] = 71946,
			["e"] = 91456,
		},
		{ -- Shadowburn
			["n"] = 72060,
			["e"] = 91582,
		},
		{ -- Demonic Fortitude
			["n"] = 71922,
			["e"] = 91430,
		},
		{ -- Raging Demonfire
			["n"] = 72063,
			["e"] = 91585,
		},
		{ -- Sweet Souls
			["n"] = 71927,
			["e"] = 91435,
		},
		{ -- Raging Demonfire
			["n"] = 72063,
			["e"] = 91585,
		},
		{ -- Demonic Gateway
			["n"] = 71955,
			["e"] = 91466,
		},
		{ -- Flashpoint
			["n"] = 71972,
			["e"] = 91485,
		},
		{ -- Dark Pact
			["n"] = 71936,
			["e"] = 91444,
		},
		{ -- Flashpoint
			["n"] = 71972,
			["e"] = 91485,
		},
		{ -- Dark Accord
			["n"] = 71956,
			["e"] = 91467,
		},
		{ -- Eradication
			["n"] = 71984,
			["e"] = 91501,
		},
		{ -- Shadowfury
			["n"] = 71942,
			["e"] = 91452,
		},
		{ -- Eradication
			["n"] = 71984,
			["e"] = 91501,
		},
		{ -- Frequent Donor
			["n"] = 71937,
			["e"] = 91445,
		},
		{ -- Ashen Remains
			["n"] = 71969,
			["e"] = 91482,
		},
		{ -- Lifeblood
			["n"] = 71940,
			["e"] = 91449,
		},
		{ -- Ashen Remains
			["n"] = 71969,
			["e"] = 91482,
		},
		{ -- Lifeblood
			["n"] = 71940,
			["e"] = 91449,
		},
		{ -- Summon Infernal
			["n"] = 71985,
			["e"] = 91502,
		},
		{ -- Fel Synergy
			["n"] = 71918,
			["e"] = 91425,
		},
		{ -- Ritual of Ruin
			["n"] = 71970,
			["e"] = 91483,
		},
		{ -- Soul Link
			["n"] = 71925,
			["e"] = 91433,
		},
		{ -- Madness of the Azj'Aqir
			["n"] = 71967,
			["e"] = 91480,
		},
		{ -- Teachings of the Black Harvest
			["n"] = 71938,
			["e"] = 91447,
		},
		{ -- Madness of the Azj'Aqir
			["n"] = 71967,
			["e"] = 91480,
		},
		{ -- Grimoire of Synergy
			["n"] = 71924,
			["e"] = 91432,
		},
		{ -- Master Ritualist
			["n"] = 71962,
			["e"] = 91475,
		},
		{ -- Grimoire of Synergy
			["n"] = 71924,
			["e"] = 91432,
		},
		{ -- Master Ritualist
			["n"] = 71962,
			["e"] = 91475,
		},
		{ -- Soul Conduit
			["n"] = 71923,
			["e"] = 91431,
		},
		{ -- Burn to Ashes
			["n"] = 71964,
			["e"] = 91477,
		},
		{ -- Soul Conduit
			["n"] = 71923,
			["e"] = 91431,
		},
		{ -- Chaos Incarnate
			["n"] = 71966,
			["e"] = 91479,
		},
		{ -- Inquisitor's Gaze
			["n"] = 71939,
			["e"] = 91427,
		},
		{ -- Avatar of Destruction
			["n"] = 71963,
			["e"] = 91476,
		},
		{ -- Soulburn
			["n"] = 71957,
			["e"] = 91469,
		},
	},
}

addonTable.WARLOCK_TALENTS = WARLOCK_TALENTS