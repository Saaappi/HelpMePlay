local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local MAGE_TALENTS = {
	[62] = { -- Arcane
		{ -- Ice Block
			["n"] = 62122,
			["e"] = 80181,
		},
		{ -- Arcane Barrage
			["n"] = 62237,
			["e"] = 80306,
		},
		{ -- Overflowing Energy
			["n"] = 62120,
			["e"] = 80179,
		},
		{ -- Arcane Missiles
			["n"] = 62238,
			["e"] = 80307,
		},
		{ -- Invisibility
			["n"] = 62118,
			["e"] = 80177,
		},
		{ -- Arcane Orb
			["n"] = 62239,
			["e"] = 80308,
		},
		{ -- Tempest Barrier
			["n"] = 62111,
			["e"] = 80169,
		},
		{ -- Clearcasting
			["n"] = 62229,
			["e"] = 80298,
		},
		{ -- Tempest Barrier
			["n"] = 62111,
			["e"] = 80169,
		},
		{ -- Improved Arcane Missiles
			["n"] = 62240,
			["e"] = 80309,
		},
		{ -- Incantation of Swiftness
			["n"] = 62112,
			["e"] = 80170,
		},
		{ -- Improved Arcane Missiles
			["n"] = 62240,
			["e"] = 80309,
		},
		{ -- Incantation of Swiftness
			["n"] = 62112,
			["e"] = 80170,
		},
		{ -- Arcane Surge
			["n"] = 62230,
			["e"] = 80299,
		},
		{ -- Mirror Image
			["n"] = 62124,
			["e"] = 80183,
		},
		{ -- Crackling Energy
			["n"] = 62228,
			["e"] = 80297,
		},
		{ -- Rune of Power
			["n"] = 62113,
			["e"] = 80171,
		},
		{ -- Crackling Energy
			["n"] = 62228,
			["e"] = 80297,
		},
		{ -- Alter Time
			["n"] = 62115,
			["e"] = 80174,
		},
		{ -- Nether Precision
			["n"] = 62226,
			["e"] = 80295,
		},
		{ -- Quick Witted
			["n"] = 62104,
			["e"] = 80161,
		},
		{ -- Charged Orb
			["n"] = 62241,
			["e"] = 80310,
		},
		{ -- Mass Polymorph
			["n"] = 62106,
			["e"] = 80164,
		},
		{ -- Resonance
			["n"] = 62139,
			["e"] = 80200,
		},
		{ -- Master of Time
			["n"] = 62102,
			["e"] = 80159,
		},
		{ -- Arcane Power
			["n"] = 62130,
			["e"] = 80190,
		},
		{ -- Ice Nova
			["n"] = 62126,
			["e"] = 80186,
		},
		{ -- Slipstream
			["n"] = 62227,
			["e"] = 80296,
		},
		{ -- Shimmer
			["n"] = 62105,
			["e"] = 80163,
		},
		{ -- Amplification
			["n"] = 62225,
			["e"] = 80294,
		},
		{ -- Blast Wave
			["n"] = 62103,
			["e"] = 80160,
		},
		{ -- Presence of Mind
			["n"] = 62146,
			["e"] = 80208,
		},
		{ -- Tome of Rhonin
			["n"] = 62127,
			["e"] = 80187,
		},
		{ -- Arcing Cleave
			["n"] = 62140,
			["e"] = 80201,
		},
		{ -- Tome of Antonidas
			["n"] = 62098,
			["e"] = 80155,
		},
		{ -- Improved Clearcasting
			["n"] = 62224,
			["e"] = 80293,
		},
		{ -- Volatile Detonation
			["n"] = 62089,
			["e"] = 80145,
		},
		{ -- Chrono Shift
			["n"] = 62141,
			["e"] = 80202,
		},
		{ -- Energized Barriers
			["n"] = 62100,
			["e"] = 80157,
		},
		{ -- Touch of the Magi
			["n"] = 62233,
			["e"] = 80302,
		},
		{ -- Flow of Time
			["n"] = 62096,
			["e"] = 80153,
		},
		{ -- Evocation
			["n"] = 62147,
			["e"] = 80209,
		},
		{ -- Flow of Time
			["n"] = 62096,
			["e"] = 80153,
		},
		{ -- Enlightened
			["n"] = 62143,
			["e"] = 80204,
		},
		{ -- Temporal Velocity
			["n"] = 62099,
			["e"] = 80156,
		},
		{ -- Arcane Echo
			["n"] = 62131,
			["e"] = 80191,
		},
		{ -- Temporal Velocity
			["n"] = 62099,
			["e"] = 80156,
		},
		{ -- Arcane Bombardment
			["n"] = 62234,
			["e"] = 80303,
		},
		{ -- Greater Invisibility
			["n"] = 62095,
			["e"] = 80152,
		},
		{ -- Conjure Mana Gem
			["n"] = 62132,
			["e"] = 80192,
		},
		{ -- Accumulative Shielding
			["n"] = 62093,
			["e"] = 80149,
		},
		{ -- Siphon Storm
			["n"] = 62148,
			["e"] = 80210,
		},
		{ -- Accumulative Shielding
			["n"] = 62093,
			["e"] = 80149,
		},
		{ -- Prodigious Savant
			["n"] = 62137,
			["e"] = 80197,
		},
		{ -- Dragon's Breath
			["n"] = 62091,
			["e"] = 80147,
		},
		{ -- Radiant Spark
			["n"] = 62235,
			["e"] = 80304,
		},
		{ -- Time Anomaly
			["n"] = 62094,
			["e"] = 80151,
		},
		{ -- Cascading Power
			["n"] = 62133,
			["e"] = 80193,
		},
		{ -- Displacement
			["n"] = 62092,
			["e"] = 80148,
		},
		{ -- Harmonic Echo
			["n"] = 62236,
			["e"] = 80305,
		},
		{ -- Meteor
			["n"] = 62090,
			["e"] = 80146,
		},
	},
	[63] = { -- Fire
		
	},
	[64] = { -- Frost
		
	},
}

addonTable.MAGE_TALENTS = MAGE_TALENTS