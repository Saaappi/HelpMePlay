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
		{ -- Ice Block
			["n"] = 62122,
			["e"] = 80181,
		},
		{ -- Pyroblast
			["n"] = 62215,
			["e"] = 80283,
		},
		{ -- Overflowing Energy
			["n"] = 62120,
			["e"] = 80179,
		},
		{ -- Fire Blast
			["n"] = 62214,
			["e"] = 80282,
		},
		{ -- Invisibility
			["n"] = 62118,
			["e"] = 80177,
		},
		{ -- Fervent Flickering
			["n"] = 62216,
			["e"] = 80284,
		},
		{ -- Spellsteal
			["n"] = 62084,
			["e"] = 80140,
		},
		{ -- Scorch
			["n"] = 62213,
			["e"] = 80281,
		},
		{ -- Incantation of Swiftness
			["n"] = 62112,
			["e"] = 80170,
		},
		{ -- Phoenix Flames
			["n"] = 62217,
			["e"] = 80285,
		},
		{ -- Incantation of Swiftness
			["n"] = 62112,
			["e"] = 80170,
		},
		{ -- Flamestrike
			["n"] = 62192,
			["e"] = 80258,
		},
		-- START HERE --
		{ -- Remove Curse
			["n"] = 62116,
			["e"] = 80175,
		},
		{ -- Searing Touch
			["n"] = 62212,
			["e"] = 80280,
		},
		{ -- Mirror Image
			["n"] = 62124,
			["e"] = 80183,
		},
		{ -- Improved Flamestrike
			["n"] = 62191,
			["e"] = 80257,
		},
		{ -- Rune of Power
			["n"] = 62113,
			["e"] = 80171,
		},
		{ -- Critical Mass
			["n"] = 62219,
			["e"] = 80287,
		},
		{ -- Alter Time
			["n"] = 62115,
			["e"] = 80174,
		},
		{ -- Critical Mass
			["n"] = 62219,
			["e"] = 80287,
		},
		{ -- Cryo-Freeze
			["n"] = 62107,
			["e"] = 80165,
		},
		{ -- Cauterize
			["n"] = 62206,
			["e"] = 80274,
		},
		{ -- Cryo-Freeze
			["n"] = 62107,
			["e"] = 80165,
		},
		{ -- Flame On
			["n"] = 62190,
			["e"] = 80256,
		},
		{ -- Quick Witted
			["n"] = 62104,
			["e"] = 80161,
		},
		{ -- Flame On
			["n"] = 62190,
			["e"] = 80256,
		},
		{ -- Slow
			["n"] = 62097,
			["e"] = 80154,
		},
		{ -- Flame Patch
			["n"] = 62193,
			["e"] = 80259,
		},
		{ -- Ice Nova
			["n"] = 62126,
			["e"] = 80186,
		},
		{ -- From the Ashes
			["n"] = 62220,
			["e"] = 80289,
		},
		{ -- Shimmer
			["n"] = 62105,
			["e"] = 80163,
		},
		{ -- Combustion
			["n"] = 62207,
			["e"] = 80275,
		},
		{ -- Mass Slow
			["n"] = 62109,
			["e"] = 80167,
		},
		{ -- Call of the Sun King
			["n"] = 62210,
			["e"] = 80278,
		},
		{ -- Blast Wave
			["n"] = 62103,
			["e"] = 80160,
		},
		{ -- Tempered Flames
			["n"] = 62201,
			["e"] = 80268,
		},
		{ -- Tome of Rhonin
			["n"] = 62127,
			["e"] = 80187,
		},
		{ -- Feel the Burn
			["n"] = 62195,
			["e"] = 80261,
		},
		{ -- Tome of Antonidas
			["n"] = 62098,
			["e"] = 80155,
		},
		{ -- Feel the Burn
			["n"] = 62195,
			["e"] = 80261,
		},
		{ -- Volatile Detonation
			["n"] = 62089,
			["e"] = 80145,
		},
		{ -- Pyroclasm
			["n"] = 62209,
			["e"] = 80277,
		},
		{ -- Frigid Winds
			["n"] = 62128,
			["e"] = 80188,
		},
		{ -- Flame Accelerant
			["n"] = 62200,
			["e"] = 80267,
		},
		{ -- Frigid Winds
			["n"] = 62128,
			["e"] = 80188,
		},
		{ -- Flame Accelerant
			["n"] = 62200,
			["e"] = 80267,
		},
		{ -- Flow of Time
			["n"] = 62096,
			["e"] = 80153,
		},
		{ -- Master of Flame
			["n"] = 62196,
			["e"] = 80262,
		},
		{ -- Flow of Time
			["n"] = 62096,
			["e"] = 80153,
		},
		{ -- Controlled Destruction
			["n"] = 62204,
			["e"] = 80272,
		},
		{ -- Temporal Velocity
			["n"] = 62099,
			["e"] = 80156,
		},
		{ -- Controlled Destruction
			["n"] = 62204,
			["e"] = 80272,
		},
		{ -- Ice Ward
			["n"] = 62086,
			["e"] = 80142,
		},
		{ -- Fevered Incantation
			["n"] = 62187,
			["e"] = 80253,
		},
		{ -- Greater Invisibility
			["n"] = 62095,
			["e"] = 80152,
		},
		{ -- Fevered Incantation
			["n"] = 62187,
			["e"] = 80253,
		},
		{ -- Shifting Power
			["n"] = 62085,
			["e"] = 80141,
		},
		{ -- Sun King's Blessing
			["n"] = 62205,
			["e"] = 80273,
		},
		{ -- Freezing Cold
			["n"] = 62087,
			["e"] = 80143,
		},
		{ -- Hyperthermia
			["n"] = 62186,
			["e"] = 80252,
		},
		{ -- Time Anomaly
			["n"] = 62094,
			["e"] = 80151,
		},
	},
	[64] = { -- Frost
		{ -- Ice Block
			["n"] = 62122,
			["e"] = 80181,
		},
		{ -- Ice Lance
			["n"] = 62176,
			["e"] = 80241,
		},
		{ -- Overflowing Energy
			["n"] = 62120,
			["e"] = 80179,
		},
		{ -- Frozen Orb
			["n"] = 62177,
			["e"] = 80242,
		},
		{ -- Invisibility
			["n"] = 62118,
			["e"] = 80177,
		},
		{ -- Blizzard
			["n"] = 62175,
			["e"] = 80240,
		},
		{ -- Spellsteal
			["n"] = 62084,
			["e"] = 80140,
		},
		{ -- Fingers of Frost
			["n"] = 62164,
			["e"] = 80227,
		},
		{ -- Incantation of Swiftness
			["n"] = 62112,
			["e"] = 80170,
		},
		{ -- Flurry
			["n"] = 62178,
			["e"] = 80243,
		},
		{ -- Incantation of Swiftness
			["n"] = 62112,
			["e"] = 80170,
		},
		{ -- Shatter
			["n"] = 62165,
			["e"] = 80228,
		},
		{ -- Mirror Image
			["n"] = 62124,
			["e"] = 80183,
		},
		{ -- Brain Freeze
			["n"] = 62179,
			["e"] = 80244,
		},
		{ -- Rune of Power
			["n"] = 62113,
			["e"] = 80171,
		},
		{ -- Everlasting Frost
			["n"] = 81468,
			["e"] = 102429,
		},
		{ -- Alter Time
			["n"] = 62115,
			["e"] = 80174,
		},
		{ -- Cold Snap
			["n"] = 62174,
			["e"] = 80239,
		},
		{ -- Quick Witted
			["n"] = 62104,
			["e"] = 80161,
		},
		{ -- Piercing Cold
			["n"] = 62166,
			["e"] = 80229,
		},
		{ -- Master of Time
			["n"] = 62102,
			["e"] = 80159,
		},
		{ -- Perpetual Winter
			["n"] = 62181,
			["e"] = 80247,
		},
		{ -- Ring of Frost
			["n"] = 62088,
			["e"] = 80144,
		},
		{ -- Lonely Winter
			["n"] = 62173,
			["e"] = 80238,
		},
		{ -- Ice Nova
			["n"] = 62126,
			["e"] = 80186,
		},
		{ -- Ice Caller
			["n"] = 62169,
			["e"] = 80233,
		},
		{ -- Shimmer
			["n"] = 62105,
			["e"] = 80163,
		},
		{ -- Bone Chilling
			["n"] = 62167,
			["e"] = 80230,
		},
		{ -- Blast Wave
			["n"] = 62103,
			["e"] = 80160,
		},
		{ -- Wintertide
			["n"] = 62172,
			["e"] = 80236,
		},
		{ -- Rigid Ice
			["n"] = 62110,
			["e"] = 80168,
		},
		{ -- Wintertide
			["n"] = 62172,
			["e"] = 80236,
		},
		{ -- Tome of Rhonin
			["n"] = 62127,
			["e"] = 80187,
		},
		{ -- Flash Freeze
			["n"] = 62168,
			["e"] = 80231,
		},
		{ -- Tome of Antonidas
			["n"] = 62098,
			["e"] = 80155,
		},
		{ -- Icy Veins
			["n"] = 62171,
			["e"] = 80235,
		},
		{ -- Volatile Detonation
			["n"] = 62089,
			["e"] = 80145,
		},
		{ -- Splintering Cold
			["n"] = 62162,
			["e"] = 80225,
		},
		{ -- Energized Barriers
			["n"] = 62100,
			["e"] = 80157,
		},
		{ -- Splintering Cold
			["n"] = 62162,
			["e"] = 80225,
		},
		{ -- Frigid Winds
			["n"] = 62128,
			["e"] = 80188,
		},
		{ -- Freezing Rain
			["n"] = 62150,
			["e"] = 80212,
		},
		{ -- Frigid Winds
			["n"] = 62128,
			["e"] = 80188,
		},
		{ -- Icy Propulsion
			["n"] = 62154,
			["e"] = 80217,
		},
		{ -- Flow of Time
			["n"] = 62096,
			["e"] = 80153,
		},
		{ -- Splitting Ice
			["n"] = 62161,
			["e"] = 80224,
		},
		{ -- Flow of Time
			["n"] = 62096,
			["e"] = 80153,
		},
		{ -- Snap Freeze
			["n"] = 62152,
			["e"] = 80215,
		},
		{ -- Temporal Velocity
			["n"] = 62099,
			["e"] = 80156,
		},
		{ -- Slick Ice
			["n"] = 62153,
			["e"] = 80216,
		},
		{ -- Ice Ward
			["n"] = 62086,
			["e"] = 80142,
		},
		{ -- Chain Reaction
			["n"] = 62155,
			["e"] = 80218,
		},
		{ -- Time Manipulation
			["n"] = 62129,
			["e"] = 80189,
		},
		{ -- Hailstones
			["n"] = 62158,
			["e"] = 80221,
		},
		{ -- Time Manipulation
			["n"] = 62129,
			["e"] = 80189,
		},
		{ -- Hailstones
			["n"] = 62158,
			["e"] = 80221,
		},
		{ -- Greater Invisibility
			["n"] = 62095,
			["e"] = 80152,
		},
		{ -- Freezing Winds
			["n"] = 62151,
			["e"] = 80214,
		},
		{ -- Shifting Power
			["n"] = 62085,
			["e"] = 80141,
		},
		{ -- Thermal Void
			["n"] = 62156,
			["e"] = 80219,
		},
		{ -- Temporal Warp
			["n"] = 62094,
			["e"] = 80150,
		},
	},
}

addonTable.MAGE_TALENTS = MAGE_TALENTS