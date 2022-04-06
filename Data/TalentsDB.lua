local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local TALENTS = {
	[1] = { -- Warrior
		[71] = { -- Arms
			[15] = 316733,	-- War Machine
			[25] = 103827,	-- Double Time
			[30] = 202316,	-- Fervor of Battle
			[35] = 202163,	-- Bounding Stride
			[40] = 845,		-- Cleave
			[45] = 248621,	-- In For The Kill
			[50] = 262150,	-- Dreadnaught
		},
		[72] = { -- Fury
			[15] = 215568,	-- Fresh Meat
			[25] = 103827,	-- Double Time
			[30] = 315720,	-- Onslaught
			[35] = 202163,	-- Bounding Stride
			[40] = 215571,	-- Frothing Berserker
			[45] = 118000,	-- Dragon Roar
			[50] = 202751,	-- Reckless Abandon
		},
		[73] = { -- Protection
			[15] = 275334,	-- Punish
			[25] = 275339,	-- Rumbling Earth
			[30] = 202743,	-- Booming Voice
			[35] = 202163,	-- Bounding Stride
			[40] = 202095,	-- Indomitable
			[45] = 202603,	-- Into the Fray
			[50] = 280001,	-- Bolster
		},
	},
	[2] = { -- Paladin
		[65] = { -- Holy
			[15] = 196926,	-- Crusader's Might
			[25] = 114165,	-- Holy Prism
			[30] = 234299,	-- Fist of Justice
			[35] = 230332,	-- Cavalier
			[40] = 152262,	-- Seraphim
			[45] = 53376,	-- Sanctified Wrath
			[50] = 325966,	-- Glimmer of Light
		},
		[66] = { -- Protection
			[15] = 204019,	-- Blessed Hammer
			[25] = 203776,	-- First Avenger
			[30] = 234299,	-- Fist of Justice
			[35] = 230332,	-- Cavalier
			[40] = 223817,	-- Divine Purpose
			[45] = 204054,	-- Consecrated Ground
			[50] = 171648,	-- Sanctified Wrath
		},
		[70] = { -- Retribution
			[15] = 269569,	-- Zeal
			[25] = 231832,	-- Blade of Wrath
			[30] = 234299,	-- Fist of Justice
			[35] = 230332,	-- Cavalier
			[40] = 223817,	-- Divine Purpose
			[45] = 326734,	-- Healing Hands
			[50] = 343721,	-- Final Reckoning
		},
	},
	[3] = { -- Hunter
		[253] = { -- Beast Mastery
			[15] = 120679,	-- Dire Beast
			[25] = 193532,	-- Scent of Blood
			[30] = 199921,	-- Trailblazer
			[35] = 131894,	-- A Murder of Crows
			[40] = 109215,	-- Posthaste
			[45] = 199530,	-- Stomp
			[50] = 191384,	-- Aspect of the Beast
		},
		[254] = { -- Marksmanship
			[15] = 260309,	-- Master Marksman
			[25] = 212431,	-- Explosive Shot
			[30] = 199921,	-- Trailblazer
			[35] = 342049,	-- Chimaera Shot
			[40] = 109215,	-- Posthaste
			[45] = 260402,	-- Double Tap
			[50] = 260243,	-- Volley
		},
		[255] = { -- Survival
			[15] = 265895,	-- Terms of Engagement
			[25] = 264332,	-- Guerrilla Tactics
			[30] = 199921,	-- Trailblazer
			[35] = 131894,	-- A Murder of Crows
			[40] = 109215,	-- Posthaste
			[45] = 269751,	-- Flanking Strike
			[50] = 271014,	-- Wildfire Infusion
		},
	},
	[4] = { -- Rogue
		[259] = { -- Assassination
			[15] = 196864,	-- Master Poisoner
			[25] = 14062,	-- Nightstalker
			[30] = 14983,	-- Vigor
			[35] = 280716,	-- Leeching Poison
			[40] = 154904,	-- Internal Bleeding
			[45] = 193539,	-- Alacrity
			[50] = 255544,	-- Poison Bomb
		},
		[260] = { -- Outlaw
			[15] = 196938,	-- Quick Draw
			[25] = 196924,	-- Acrobatic Strikes
			[30] = 14983,	-- Vigor
			[35] = 31230,	-- Cheat Death
			[40] = 108216,	-- Dirty Tricks
			[45] = 193539,	-- Alacrity
			[50] = 272026,	-- Dancing Steel
		},
		[261] = { -- Subtlety
			[15] = 193537,	-- Weaponmaster
			[25] = 14062,	-- Nightstalker
			[30] = 14983,	-- Vigor
			[35] = 200759,	-- Soothing Darkness
			[40] = 277953,	-- Night Terrors
			[45] = 238104,	-- Enveloping Shadows
			[50] = 196976,	-- Master of Shadows
		},
	},
	[5] = { -- Priest
		[256] = { -- Discipline
			[15] = 193134,	-- Castigation
			[25] = 121536,	-- Angelic Feather
			[30] = 123040,	-- Mindbender
			[35] = 205367,	-- Dominant Mind
			[40] = 280391,	-- Sins of the Many
			[45] = 204197,	-- Purge the Wicked
			[50] = 238063,	-- Lenience
		},
		[257] = { -- Holy
			[15] = 193155,	-- Enlightenment
			[25] = 121536,	-- Angelic Feather
			[30] = 368275,	-- Binding Heals
			[35] = 200199,	-- Censure
			[40] = 109186,	-- Surge of Light
			[45] = 193157,	-- Benediction
			[50] = 196985,	-- Light of the Naaru
		},
		[258] = { -- Shadow
			[15] = 321291,	-- Death and Madness
			[25] = 64129,	-- Body and Soul
			[30] = 238558,	-- Misery
			[35] = 64044,	-- Psychic Horror
			[40] = 199484,	-- Psychic Link
			[45] = 341374,	-- Damnation
			[50] = 319952,	-- Surrender to Madness
		},
	},
	[6] = { -- Death Knight
		[250] = { -- Blood
			[15] = 206931,	-- Blooddrinker
			[25] = 273946,	-- Hemostasis
			[30] = 221699,	-- Blood Tap
			[35] = 206967,	-- Will of the Necropolis
			[40] = 212552,	-- Wraith Walk
			[45] = 195679,	-- Bloodworms
			[50] = 194844,	-- Bonestorm
		},
		[251] = { -- Frost
			[15] = 281208,	-- Cold Heart
			[25] = 207104,	-- Runic Attenuation
			[30] = 108194,	-- Asphyxiate
			[35] = 207230,	-- Frostscythe
			[40] = 48743,	-- Death Pact
			[45] = 194912,	-- Gathering Storm
			[50] = 207126,	-- Icecap
		},
		[252] = { -- Unholy
			[15] = 207272,	-- Infected Claws
			[25] = 207264,	-- Bursting Sores
			[30] = 108194,	-- Asphyxiate
			[35] = 343294,	-- Soul Reaper
			[40] = 48743,	-- Death Pact
			[45] = 319230,	-- Unholy Pact
			[50] = 276837,	-- Army of the Damned
		},
	},
	[7] = { -- Shaman
		[262] = { -- Elemental
			[15] = 333919,	-- Echo of the Elements
			[25] = 320125,	-- Echoing Shock
			[30] = 260878,	-- Spirit Wolf
			[35] = 16166,	-- Master of the Elements
			[40] = 30884,	-- Nature's Guardian
			[45] = 210714,	-- Icefury
			[50] = 191634,	-- Stormkeeper
		},
		[263] = { -- Enhancement
			[15] = 262647,	-- Forceful Winds
			[25] = 344357,	-- Stormflurry
			[30] = 260878,	-- Spirit Wolf
			[35] = 334195,	-- Hailstorm
			[40] = 30884,	-- Nature's Guardian
			[45] = 197214,	-- Sundering
			[50] = 262624,	-- Elemental Spirits
		},
		[264] = { -- Restoration
			[15] = 200071,	-- Undulation
			[25] = 108283,	-- Echo of the Elements
			[30] = 260878,	-- Spirit Wolf
			[35] = 198838,	-- Earthen Wall Totem
			[40] = 30884,	-- Nature's Guardian
			[45] = 280614,	-- Flash Flood
			[50] = 114052,	-- Ascendance
		},
	},
	[8] = { -- Mage
		[62] = { -- Arcane
			[15] = 236628, 	-- Amplification
			[25] = 212653, 	-- Shimmer
			[30] = 1463,	-- Incanter's Flow
			[35] = 205028,	-- Resonance
			[40] = 205036,	-- Ice Ward
			[45] = 153626,	-- Arcane Orb
			[50] = 321387,	-- Enlightened
		},
		[63] = { -- Fire
			[15] = 269644,	-- Searing Touch
			[25] = 212653, 	-- Shimmer
			[30] = 1463,	-- Incanter's Flow
			[35] = 205029,	-- Flame On
			[40] = 236058,	-- Frenetic Speed
			[45] = 44457,	-- Living Bomb
			[50] = 153561,	-- Meteor
		},
		[64] = { -- Frost
			[15] = 157997,	-- Ice Nova
			[25] = 212653, 	-- Shimmer
			[30] = 1463,	-- Incanter's Flow
			[35] = 257537,	-- Ebonbolt
			[40] = 235224,	-- Frigid Winds
			[45] = 56377,	-- Splitting Ice
			[50] = 199786,	-- Glacial Spike
		},
	},
	[9] = { -- Warlock
		[265] = { -- Affliction
			[15] = 198590,	-- Drain Soul
			[25] = 196103,	-- Absolute Corruption
			[30] = 219272,	-- Demon Skin
			[35] = 278350,	-- Vile Taint
			[40] = 6789,	-- Mortal Coil
			[45] = 32388,	-- Shadow Embrace
			[50] = 264000,	-- Creeping Death
		},
		[266] = { -- Demonology
			[15] = 267211,	-- Bilescourge Bombers
			[25] = 205145,	-- Demonic Calling
			[30] = 219272,	-- Demon Skin
			[35] = 264057,	-- Soul Strike
			[40] = 6789,	-- Mortal Coil
			[45] = 267216,	-- Inner Demons
			[50] = 267214,	-- Sacrificed Souls
		},
		[267] = { -- Destruction
			[15] = 267115,	-- Flashover
			[25] = 205148,	-- Reverse Entropy
			[30] = 219272,	-- Demon Skin
			[35] = 152108,	-- Cataclysm
			[40] = 6789,	-- Mortal Coil
			[45] = 205184,	-- Roaring Blaze
			[50] = 113858,	-- Dark Soul: Instability
		},
	},
	[10] = { -- Monk
		[268] = { -- Brewmaster
			[15] = 196607,	-- Eye of the Tiger
			[25] = 116841,	-- Tiger's Lust
			[30] = 325093,	-- Light Brewing
			[35] = 115315,	-- Summon Black Ox Statue
			[40] = 122281,	-- Healing Elixir
			[45] = 116847,	-- Rushing Jade Wind
			[50] = 196737,	-- High Tolerance
		},
		[269] = { -- Windwalker
			[15] = 123986,	-- Chi Burst
			[25] = 115173,  -- Celerity
			[30] = 261947,  -- Fist of the White Tiger
			[35] = 280195,  -- Good Karma
			[40] = 261767,  -- Inner Strength
			[45] = 325201,  -- Dance of Chi-Ji
			[50] = 152175,  -- Whirling Dragon Punch
		},
		[270] = { -- Mistweaver
			[15] = 123986,	-- Chi Burst
			[25] = 115173,	-- Celerity
			[30] = 210802,	-- Spirit of the Crane
			[35] = 264348,	-- Tiger Tail Sweep
			[40] = 122281,	-- Healing Elixir
			[45] = 325197,	-- Invoke Chi-Ji, the Red Crane
			[50] = 274909,	-- Rising Mist
		},
	},
	[11] = { -- Druid
		[102] = { -- Balance
			[15] = 205636,	-- Force of Nature
			[25] = 102401,	-- Wild Charge
			[30] = 197492,	-- Restoration Affinity
			[35] = 5211,	-- Mighty Bash
			[40] = 102560,	-- Incarnation: Chosen of Elune
			[45] = 202354,	-- Stellar Drift
			[50] = 202770,	-- Fury of Elune
		},
		[103] = { -- Feral
			[15] = 202021,	-- Predator
			[25] = 252216,	-- Tiger Dash
			[30] = 197492,	-- Restoration Affinity
			[35] = 319454,	-- Heart of the Wild
			[40] = 158476,	-- Soul of the Forest
			[45] = 285381,	-- Primal Wrath
			[50] = 274837,	-- Feral Frenzy
		},
		[104] = { -- Guardian
			[15] = 203953,	-- Brambles
			[25] = 102401,	-- Wild Charge
			[30] = 197492,	-- Restoration Affinity
			[35] = 319454,	-- Heart of the Wild
			[40] = 203964,	-- Galactic Guardian
			[45] = 203965,	-- Survival of the Fittest
			[50] = 204053,	-- Rend and Tear
		},
		[105] = { -- Restoration
			[15] = 102351,	-- Cenarion Ward
			[25] = 252216,	-- Tiger Dash
			[30] = 197490,	-- Feral Affinity
			[35] = 319454,	-- Heart of the Wild
			[40] = 200390,	-- Cultivation
			[45] = 207385,	-- Spring Blossoms
			[50] = 274902,	-- Photosynthesis
		},
	},
	[12] = { -- Demon Hunter
		[577] = { -- Havoc
			[15] = 206478,	-- Demonic Appetite
			[25] = 320374,	-- Burning Hatred
			[30] = 347461,	-- Unbound Chaos
			[35] = 204909,	-- Soul Rending
			[40] = 206416,	-- First Blood
			[45] = 211881,	-- Fel Eruption
			[50] = 213410,	-- Demonic
		},
		[581] = { -- Vengeance
			[15] = 207550,	-- Abyssal Strike
			[25] = 227174,	-- Fallout
			[30] = 247454,	-- Spirit Bomb
			[35] = 263642,	-- Fracture
			[40] = 202138,	-- Sigil of Chains
			[45] = 321453,	-- Demonic
			[50] = 320341,	-- Bulk Extraction
		},
	},
}

addonTable.TALENTS = TALENTS