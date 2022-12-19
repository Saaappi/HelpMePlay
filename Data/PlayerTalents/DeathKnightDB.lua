local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DEATH_KNIGHT_TALENTS = {
	[250] = { -- Blood
		{ -- Chains of Ice
			["n"] = 76081,
			["e"] = 96210,
		},
		{ -- Heart Strike
			["n"] = 76169,
			["e"] = 96304,
		},
		{ -- Raise Dead
			["n"] = 76072,
			["e"] = 96201,
		},
		{ -- Marrowrend
			["n"] = 76168,
			["e"] = 96303,
		},
		{ -- Mind Freeze
			["n"] = 76082,
			["e"] = 96211,
		},
		{ -- Blood Boil
			["n"] = 76170,
			["e"] = 96305,
		},
		{ -- Cleaving Strikes
			["n"] = 76073,
			["e"] = 96202,
		},
		{ -- Crimson Scourge
			["n"] = 76171,
			["e"] = 96306,
		},
		{ -- Anti-Magic Shell
			["n"] = 76070,
			["e"] = 96199,
		},
		{ -- Vampiric Blood
			["n"] = 76173,
			["e"] = 96308,
		},
		{ -- Permafrost
			["n"] = 76083,
			["e"] = 96212,
		},
		{ -- Ossuary
			["n"] = 76144,
			["e"] = 96277,
		},
		{ -- Improved Death Strike
			["n"] = 76067,
			["e"] = 96196,
		},
		{ -- Improved Heart Strike
			["n"] = 76126,
			["e"] = 96257,
		},
		{ -- March of Darkness
			["n"] = 76069,
			["e"] = 96198,
		},
		{ -- Improved Heart Strike
			["n"] = 76126,
			["e"] = 96257,
		},
		{ -- Enfeeble
			["n"] = 76060,
			["e"] = 96189,
		},
		{ -- Death's Caress
			["n"] = 76146,
			["e"] = 96279,
		},
		{ -- Icebound Fortitude
			["n"] = 76084,
			["e"] = 96213,
		},
		{ -- Heartbreaker
			["n"] = 76135,
			["e"] = 96266,
		},
		{ -- Veteran of the Third War
			["n"] = 76068,
			["e"] = 96197,
		},
		{ -- Heartbreaker
			["n"] = 76135,
			["e"] = 96266,
		},
		{ -- Veteran of the Third War
			["n"] = 76068,
			["e"] = 96197,
		},
		{ -- Dancing Rune Weapon
			["n"] = 76138,
			["e"] = 96269,
		},
		{ -- Brittle
			["n"] = 76061,
			["e"] = 96190,
		},
		{ -- Hemostasis
			["n"] = 76137,
			["e"] = 96268,
		},
		{ -- Merciless Strikes
			["n"] = 76085,
			["e"] = 96214,
		},
		{ -- Relish in Blood
			["n"] = 76147,
			["e"] = 96280,
		},
		{ -- Might of Thassarian
			["n"] = 76076,
			["e"] = 96205,
		},
		{ -- Leeching Strike
			["n"] = 76166,
			["e"] = 96301,
		},
		{ -- Gloom Ward
			["n"] = 76052,
			["e"] = 96180,
		},
		{ -- Improved Bone Shield
			["n"] = 76042,
			["e"] = 96170,
		},
		{ -- Asphyxiate
			["n"] = 76064,
			["e"] = 96193,
		},
		{ -- Insatiable Blade
			["n"] = 76129,
			["e"] = 96260,
		},
		{ -- Death's Reach
			["n"] = 76057,
			["e"] = 96186,
		},
		{ -- Rapid Decomposition
			["n"] = 76141,
			["e"] = 96273,
		},
		{ -- Unholy Endurance
			["n"] = 76063,
			["e"] = 96192,
		},
		{ -- Blood Tap
			["n"] = 76142,
			["e"] = 96274,
		},
		{ -- Runic Attenuation
			["n"] = 76087,
			["e"] = 96216,
		},
		{ -- Everlasting Bond
			["n"] = 76130,
			["e"] = 96261,
		},
		{ -- Unholy Ground
			["n"] = 76058,
			["e"] = 96187,
		},
		{ -- Voracious
			["n"] = 76043,
			["e"] = 96171,
		},
		{ -- Insidious Chill
			["n"] = 76088,
			["e"] = 96217,
		},
		{ -- Bloodworms
			["n"] = 76174,
			["e"] = 96309,
		},
		{ -- Will of the Necropolis
			["n"] = 76054,
			["e"] = 96182,
		},
		{ -- Coagulopathy
			["n"] = 76038,
			["e"] = 96166,
		},
		{ -- Will of the Necropolis
			["n"] = 76054,
			["e"] = 96182,
		},
		{ -- Tombstone
			["n"] = 76139,
			["e"] = 96270,
		},
		{ -- Death's Echo
			["n"] = 76056,
			["e"] = 96184,
		},
		{ -- Sanguine Ground
			["n"] = 76041,
			["e"] = 96169,
		},
		{ -- Icy Talons
			["n"] = 76051,
			["e"] = 96179,
		},
		{ -- Shattering Bone
			["n"] = 76128,
			["e"] = 96259,
		},
		{ -- Icy Talons
			["n"] = 76051,
			["e"] = 96179,
		},
		{ -- Shattering Bone
			["n"] = 76128,
			["e"] = 96259,
		},
		{ -- Rune Mastery
			["n"] = 76080,
			["e"] = 96209,
		},
		{ -- Heartrend
			["n"] = 76131,
			["e"] = 96262,
		},
		{ -- Rune Mastery
			["n"] = 76080,
			["e"] = 96209,
		},
		{ -- Iron Heart
			["n"] = 76172,
			["e"] = 96307,
		},
		{ -- Empower Rune Weapon
			["n"] = 76050,
			["e"] = 96178,
		},
		{ -- Bloodshot
			["n"] = 76125,
			["e"] = 96256,
		},
		{ -- Abomination Limb
			["n"] = 76049,
			["e"] = 96177,
		},
	},
	[251] = { -- Frost
	},
	[252] = { -- Unholy
	},
}

addonTable.DEATH_KNIGHT_TALENTS = DEATH_KNIGHT_TALENTS