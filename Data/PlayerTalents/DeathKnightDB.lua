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
		{ -- Death Strike
			["n"] = 76071,
			["e"] = 96200,
		},
		{ -- Frost Strike
			["n"] = 76115,
			["e"] = 96245,
		},
		{ -- Raise Dead
			["n"] = 76072,
			["e"] = 96201,
		},
		{ -- Obliterate
			["n"] = 76116,
			["e"] = 96246,
		},
		{ -- Mind Freeze
			["n"] = 76082,
			["e"] = 96211,
		},
		{ -- Howling Blast
			["n"] = 76114,
			["e"] = 96244,
		},
		{ -- Cleaving Strikes
			["n"] = 76073,
			["e"] = 96202,
		},
		{ -- Killing Machine
			["n"] = 76117,
			["e"] = 96247,
		},
		{ -- Anti-Magic Shell
			["n"] = 76070,
			["e"] = 96199,
		},
		{ -- Rime
			["n"] = 76113,
			["e"] = 96243,
		},
		{ -- Blinding Sleet
			["n"] = 76044,
			["e"] = 96172,
		},
		{ -- Unleashed Frenzy
			["n"] = 76118,
			["e"] = 96248,
		},
		{ -- Improved Death Strike
			["n"] = 76067,
			["e"] = 96196,
		},
		{ -- Improved Frost Strike
			["n"] = 76103,
			["e"] = 96233,
		},
		{ -- March of Darkness
			["n"] = 76069,
			["e"] = 96198,
		},
		{ -- Improved Frost Strike
			["n"] = 76103,
			["e"] = 96233,
		},
		{ -- Enfeeble
			["n"] = 76060,
			["e"] = 96189,
		},
		{ -- Remorseless Winter
			["n"] = 76112,
			["e"] = 96242,
		},
		{ -- Icebound Fortitude
			["n"] = 76084,
			["e"] = 96213,
		},
		{ -- Improved Obliterate
			["n"] = 76119,
			["e"] = 96249,
		},
		{ -- Veteran of the Third War
			["n"] = 76068,
			["e"] = 96197,
		},
		{ -- Glacial Advance
			["n"] = 76092,
			["e"] = 96221,
		},
		{ -- Veteran of the Third War
			["n"] = 76068,
			["e"] = 96197,
		},
		{ -- Pillar of Frost
			["n"] = 76104,
			["e"] = 96234,
		},
		{ -- Brittle
			["n"] = 76061,
			["e"] = 96190,
		},
		{ -- Improved Rime
			["n"] = 76111,
			["e"] = 96241,
		},
		{ -- Merciless Strikes
			["n"] = 76085,
			["e"] = 96214,
		},
		{ -- Frigid Executioner
			["n"] = 76120,
			["e"] = 96251,
		},
		{ -- Might of Thassarian
			["n"] = 76076,
			["e"] = 96205,
		},
		{ -- Cold Heart
			["n"] = 76035,
			["e"] = 96163,
		},
		{ -- Proliferating Chill
			["n"] = 76086,
			["e"] = 96215,
		},
		{ -- Frostreaper
			["n"] = 76089,
			["e"] = 96218,
		},
		{ -- Gloom Ward
			["n"] = 76052,
			["e"] = 96180,
		},
		{ -- Frostwhelp's Aid
			["n"] = 76106,
			["e"] = 96236,
		},
		{ -- Death's Reach
			["n"] = 76057,
			["e"] = 96186,
		},
		{ -- Frostwhelp's Aid
			["n"] = 76106,
			["e"] = 96236,
		},
		{ -- Runic Attenuation
			["n"] = 76087,
			["e"] = 96216,
		},
		{ -- Biting Cold
			["n"] = 76036,
			["e"] = 96164,
		},
		{ -- Unholy Ground
			["n"] = 76058,
			["e"] = 96187,
		},
		{ -- Murderous Efficiency
			["n"] = 76121,
			["e"] = 96252,
		},
		{ -- Blood Draw
			["n"] = 76079,
			["e"] = 96208,
		},
		{ -- Inexorable Assault
			["n"] = 76037,
			["e"] = 96165,
		},
		{ -- Blood Draw
			["n"] = 76079,
			["e"] = 96208,
		},
		{ -- Icecap
			["n"] = 76034,
			["e"] = 96162,
		},
		{ -- Death's Echo
			["n"] = 76056,
			["e"] = 96184,
		},
		{ -- Gathering Storm
			["n"] = 76109,
			["e"] = 96239,
		},
		{ -- Icy Talons
			["n"] = 76051,
			["e"] = 96179,
		},
		{ -- Might of the Frozen Wastes
			["n"] = 76090,
			["e"] = 96219,
		},
		{ -- Icy Talons
			["n"] = 76051,
			["e"] = 96179,
		},
		{ -- Avalanche
			["n"] = 76105,
			["e"] = 96235,
		},
		{ -- Rune Mastery
			["n"] = 76080,
			["e"] = 96209,
		},
		{ -- Icebreaker
			["n"] = 76033,
			["e"] = 96161,
		},
		{ -- Rune Mastery
			["n"] = 76080,
			["e"] = 96209,
		},
		{ -- Icebreaker
			["n"] = 76033,
			["e"] = 96161,
		},
		{ -- Unholy Bond
			["n"] = 76055,
			["e"] = 96183,
		},
		{ -- Everfrost
			["n"] = 76107,
			["e"] = 96237,
		},
		{ -- Unholy Bond
			["n"] = 76055,
			["e"] = 96183,
		},
		{ -- Frostwyrm's Fury
			["n"] = 76095,
			["e"] = 96224,
		},
		{ -- Empower Rune Weapon
			["n"] = 76099,
			["e"] = 96229,
		},
		{ -- Absolute Zero
			["n"] = 76094,
			["e"] = 96223,
		},
		{ -- Abomination Limb
			["n"] = 76049,
			["e"] = 96177,
		},
	},
	[252] = { -- Unholy
		{ -- Chains of Ice
			["n"] = 76081,
			["e"] = 96210,
		},
		{ -- Festering Strike
			["n"] = 76189,
			["e"] = 96326,
		},
		{ -- Death Strike
			["n"] = 76071,
			["e"] = 96200,
		},
		{ -- Scourge Strike
			["n"] = 76190,
			["e"] = 96327,
		},
		{ -- Mind Freeze
			["n"] = 76082,
			["e"] = 96211,
		},
		{ -- Raise Dead - CHECK
			["n"] = 76072,
			["e"] = 96201,
		},
		{ -- Cleaving Strikes
			["n"] = 76073,
			["e"] = 96202,
		},
		{ -- Outbreak
			["n"] = 76191,
			["e"] = 96328,
		},
		{ -- Anti-Magic Shell
			["n"] = 76070,
			["e"] = 96199,
		},
		{ -- Dark Transformation
			["n"] = 76187,
			["e"] = 96324,
		},
		{ -- Coldthirst
			["n"] = 76045,
			["e"] = 96173,
		},
		{ -- Unholy Blight
			["n"] = 76162,
			["e"] = 96296,
		},
		{ -- Improved Death Strike
			["n"] = 76067,
			["e"] = 96196,
		},
		{ -- Improved Festering Strike
			["n"] = 76192,
			["e"] = 96329,
		},
		{ -- March of Darkness
			["n"] = 76069,
			["e"] = 96198,
		},
		{ -- Improved Festering Strike
			["n"] = 76192,
			["e"] = 96329,
		},
		{ -- Enfeeble
			["n"] = 76060,
			["e"] = 96189,
		},
		{ -- Infected Claws
			["n"] = 76182,
			["e"] = 96318,
		},
		{ -- Icebound Fortitude
			["n"] = 76084,
			["e"] = 96213,
		},
		{ -- Epidemic
			["n"] = 76161,
			["e"] = 96295,
		},
		{ -- Veteran of the Third War
			["n"] = 76068,
			["e"] = 96197,
		},
		{ -- Replenishing Wounds
			["n"] = 76163,
			["e"] = 96297,
		},
		{ -- Veteran of the Third War
			["n"] = 76068,
			["e"] = 96197,
		},
		{ -- Plaguebringer
			["n"] = 76183,
			["e"] = 96319,
		},
		{ -- Brittle
			["n"] = 76061,
			["e"] = 96190,
		},
		{ -- Sudden Doom
			["n"] = 76179,
			["e"] = 96314,
		},
		{ -- Merciless Strikes
			["n"] = 76085,
			["e"] = 96214,
		},
		{ -- Ebon Fever
			["n"] = 76164,
			["e"] = 96298,
		},
		{ -- Might of Thassarian
			["n"] = 76076,
			["e"] = 96205,
		},
		{ -- Unholy Command
			["n"] = 76194,
			["e"] = 96331,
		},
		{ -- Gloom Ward
			["n"] = 76052,
			["e"] = 96180,
		},
		{ -- Unholy Command
			["n"] = 76194,
			["e"] = 96331,
		},
		{ -- Asphyxiate
			["n"] = 76064,
			["e"] = 96193,
		},
		{ -- Improved Death Coil
			["n"] = 76184,
			["e"] = 96321,
		},
		{ -- Death's Reach
			["n"] = 76057,
			["e"] = 96186,
		},
		{ -- Improved Death Coil
			["n"] = 76184,
			["e"] = 96321,
		},
		{ -- Runic Attenuation
			["n"] = 76087,
			["e"] = 96216,
		},
		{ -- Rotten Touch
			["n"] = 76178,
			["e"] = 96313,
		},
		{ -- Unholy Ground
			["n"] = 76058,
			["e"] = 96187,
		},
		{ -- Unholy Pact
			["n"] = 76180,
			["e"] = 96316,
		},
		{ -- Blood Draw
			["n"] = 76079,
			["e"] = 96208,
		},
		{ -- Eternal Agony
			["n"] = 76195,
			["e"] = 96332,
		},
		{ -- Blood Draw
			["n"] = 76079,
			["e"] = 96208,
		},
		{ -- Coil of Devastation
			["n"] = 76156,
			["e"] = 96290,
		},
		{ -- Death's Echo
			["n"] = 76056,
			["e"] = 96184,
		},
		{ -- Army of the Dead
			["n"] = 76196,
			["e"] = 96333,
		},
		{ -- Icy Talons
			["n"] = 76051,
			["e"] = 96179,
		},
		{ -- Summon Gargoyle
			["n"] = 76176,
			["e"] = 96311,
		},
		{ -- Icy Talons
			["n"] = 76051,
			["e"] = 96179,
		},
		{ -- Ghoulish Frenzy
			["n"] = 76154,
			["e"] = 96288,
		},
		{ -- Rune Mastery
			["n"] = 76080,
			["e"] = 96209,
		},
		{ -- Ghoulish Frenzy
			["n"] = 76154,
			["e"] = 96288,
		},
		{ -- Rune Mastery
			["n"] = 76080,
			["e"] = 96209,
		},
		{ -- Army of the Damned
			["n"] = 76153,
			["e"] = 96287,
		},
		{ -- Unholy Bond
			["n"] = 76055,
			["e"] = 96183,
		},
		{ -- Morbidity
			["n"] = 76197,
			["e"] = 96334,
		},
		{ -- Unholy Bond
			["n"] = 76055,
			["e"] = 96183,
		},
		{ -- Morbidity
			["n"] = 76197,
			["e"] = 96334,
		},
		{ -- Empower Rune Weapon
			["n"] = 76050,
			["e"] = 96178,
		},
		{ -- Superstrain
			["n"] = 76155,
			["e"] = 96289,
		},
		{ -- Abomination Limb
			["n"] = 76049,
			["e"] = 96177,
		},
	},
}

addonTable.DEATH_KNIGHT_TALENTS = DEATH_KNIGHT_TALENTS