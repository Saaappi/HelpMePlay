local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local WARRIOR_TALENTS = {
	[71] = { -- Arms
		{ -- War Machine
			["n"] = 90328,
			["e"] = 112185,
			["r"] = 1,
		},
		{ -- Mortal Strike
			["n"] = 90270,
			["e"] = 112122,
			["r"] = 1,
		},
		{ -- Leeching Strikes
			["n"] = 90344,
			["e"] = 112206,
			["r"] = 1,
		},
		{ -- Overpower
			["n"] = 90271,
			["e"] = 112123,
			["r"] = 1,
		},
		{ -- Fast Footwork
			["n"] = 90371,
			["e"] = 112238,
			["r"] = 1,
		},
		{ -- Improved Execute
			["n"] = 90273,
			["e"] = 112125,
			["r"] = 1,
		},
		{ -- Spell Reflection
			["n"] = 90385,
			["e"] = 112253,
			["r"] = 1,
		},
		{ -- Die by the Sword
			["n"] = 90276,
			["e"] = 112128,
			["r"] = 1,
		},
		{ -- Frothing Berserker
			["n"] = 90352,
			["e"] = 112216,
			["r"] = 1,
		},
		{ -- Martial Prowess
			["n"] = 90278,
			["e"] = 112130,
			["r"] = 1,
		},
		{ -- Furious Blows
			["n"] = 90336,
			["e"] = 112197,
			["r"] = 1,
		},
		{ -- Improved Overpower
			["n"] = 90279,
			["e"] = 112131,
			["r"] = 1,
		},
		{ -- Heroic Leap
			["n"] = 90346,
			["e"] = 112208,
			["r"] = 1,
		},
		{ -- Fueled by Violence
			["n"] = 90275,
			["e"] = 112157,
			["r"] = 1,
		},
		{ -- Thunder Clap
			["n"] = 92224,
			["e"] = 114296,
			["r"] = 1,
		},
		{ -- Sudden Death
			["n"] = 90274,
			["e"] = 112126,
			["r"] = 1,
		},
		{ -- Pain and Gain
			["n"] = 90353,
			["e"] = 112217,
			["r"] = 1,
		},
		{ -- Colossus Smash
			["n"] = 90290,
			["e"] = 112144,
			["r"] = 1,
		},
		{ -- Overwhelming Rage
			["n"] = 90378,
			["e"] = 112245,
			["r"] = 1,
		},
		{ -- Impale
			["n"] = 90292,
			["e"] = 112146,
			["r"] = 1,
		},
		{ -- Overwhelming Rage
			["n"] = 90378,
			["e"] = 112245,
			["r"] = 1,
		},
		{ -- Tactician
			["n"] = 90282,
			["e"] = 112134,
			["r"] = 1,
		},
		{ -- Sidearm
			["n"] = 90333,
			["e"] = 112192,
			["r"] = 1,
		},
		{ -- Massacre
			["n"] = 90291,
			["e"] = 112145,
			["r"] = 1,
		},
		{ -- Crushing Force
			["n"] = 90347,
			["e"] = 112209,
			["r"] = 2,
		},
		{ -- Anger Management
			["n"] = 90289,
			["e"] = 112143,
			["r"] = 1,
		},
		{ -- Crushing Force
			["n"] = 90347,
			["e"] = 112209,
			["r"] = 2,
		},
		{ -- Rend
			["n"] = 90284,
			["e"] = 112136,
			["r"] = 1,
		},
		{ -- Blood and Thunder
			["n"] = 90342,
			["e"] = 112204,
			["r"] = 1,
		},
		{ -- Sweeping Strikes
			["n"] = 90268,
			["e"] = 112120,
			["r"] = 2,
		},
		{ -- Barbaric Training
			["n"] = 92221,
			["e"] = 114293,
			["r"] = 1,
		},
		{ -- Dreadnaught
			["n"] = 90285,
			["e"] = 112137,
			["r"] = 1,
		},
		{ -- Bounding Stride
			["n"] = 90355,
			["e"] = 112219,
			["r"] = 1,
		},
		{ -- Storm of Swords
			["n"] = 90267,
			["e"] = 112119,
			["r"] = 1,
		},
		{ -- Reinforced Plates
			["n"] = 90368,
			["e"] = 112235,
			["r"] = 1,
		},
		{ -- Bloodborne
			["n"] = 90283,
			["e"] = 112135,
			["r"] = 1,
		},
		{ -- Double Time
			["n"] = 90382,
			["e"] = 112249,
			["r"] = 1,
		},
		{ -- Bloodborne
			["n"] = 90283,
			["e"] = 112135,
			["r"] = 1,
		},
		{ -- Seismic Reverberation
			["n"] = 90340,
			["e"] = 112201,
			["r"] = 1,
		},
		{ -- Warbreaker
			["n"] = 90287,
			["e"] = 112139,
			["r"] = 1,
		},
		{ -- Armored to the Teeth
			["n"] = 90366,
			["e"] = 112233,
			["r"] = 2,
		},
		{ -- Critical Thinking
			["n"] = 90444,
			["e"] = 112317,
			["r"] = 1,
		},
		{ -- Armored to the Teeth
			["n"] = 90366,
			["e"] = 112233,
			["r"] = 2,
		},
		{ -- Critical Thinking
			["n"] = 90444,
			["e"] = 112317,
			["r"] = 1,
		},
		{ -- Two-Handed Weapon Specialization
			["n"] = 90322,
			["e"] = 112179,
			["r"] = 1,
		},
		{ -- Deft Experience
			["n"] = 90437,
			["e"] = 112309,
			["r"] = 1,
		},
		{ -- Wild Strikes
			["n"] = 90360,
			["e"] = 112224,
			["r"] = 2,
		},
		{ -- Deft Experience
			["n"] = 90437,
			["e"] = 112309,
			["r"] = 1,
		},
		{ -- Wild Strikes
			["n"] = 90360,
			["e"] = 112224,
			["r"] = 2,
		},
		{ -- Valor in Victory
			["n"] = 90442,
			["e"] = 112315,
			["r"] = 1,
		},
		{ -- Cruel Strikes
			["n"] = 90381,
			["e"] = 112248,
			["r"] = 1,
		},
		{ -- Valor in Victory
			["n"] = 90442,
			["e"] = 112315,
			["r"] = 1,
		},
		{ -- Avatar
			["n"] = 90365,
			["e"] = 112232,
			["r"] = 1,
		},
		{ -- Bladestorm
			["n"] = 90441,
			["e"] = 112314,
			["r"] = 1,
		},
		{ -- Blademaster's Torment
			["n"] = 90363,
			["e"] = 112229,
			["r"] = 2,
		},
		{ -- Sharpened Blades
			["n"] = 90447,
			["e"] = 112320,
			["r"] = 1,
		},
		{ -- Thunderous Roar
			["n"] = 90359,
			["e"] = 112223,
			["r"] = 1,
		},
		{ -- Unhinged
			["n"] = 90440,
			["e"] = 112313,
			["r"] = 2,
		},
		{ -- Uproar
			["n"] = 90357,
			["e"] = 112221,
			["r"] = 1,
		},
		{ -- Merciless Bonegrinder
			["n"] = 90266,
			["e"] = 112117,
			["r"] = 2,
		},
		{ -- Thunderous Words
			["n"] = 90358,
			["e"] = 112222,
			["r"] = 1,
		},
	},
	[72] = { -- Fury
	},
	[73] = { -- Protection
		{ -- War Machine
			["n"] = 90345,
			["e"] = 112207,
			["r"] = 1,
		},
		{ -- Ignore Pain
			["n"] = 90295,
			["e"] = 112149,
			["r"] = 1,
		},
		{ -- Leeching Strikes
			["n"] = 90344,
			["e"] = 112206,
			["r"] = 1,
		},
		{ -- Revenge
			["n"] = 90298,
			["e"] = 112152,
			["r"] = 1,
		},
		{ -- Impending Victory
			["n"] = 90326,
			["e"] = 112183,
			["r"] = 1,
		},
		{ -- Demoralizing Shout
			["n"] = 90305,
			["e"] = 112159,
			["r"] = 1,
		},
		{ -- Fast Footwork
			["n"] = 90371,
			["e"] = 112238,
			["r"] = 1,
		},
		{ -- Best Served Cold
			["n"] = 90304,
			["e"] = 112158,
			["r"] = 1,
		},
		{ -- Frothing Berserker
			["n"] = 90370,
			["e"] = 112237,
			["r"] = 1,
		},
		{ -- Devastator
			["n"] = 90299,
			["e"] = 112153,
			["r"] = 1,
		},
		{ -- Heroic Leap
			["n"] = 90346,
			["e"] = 112208,
			["r"] = 1,
		},
		{ -- Strategist
			["n"] = 90303,
			["e"] = 112157,
			["r"] = 1,
		},
		{ -- Thunder Clap
			["n"] = 90343,
			["e"] = 112205,
			["r"] = 1,
		},
		{ -- Last Stand
			["n"] = 90297,
			["e"] = 112151,
			["r"] = 1,
		},
		{ -- Furious Blows
			["n"] = 90336,
			["e"] = 112197,
			["r"] = 1,
		},
		{ -- Brace For Impact
			["n"] = 90296,
			["e"] = 112150,
			["r"] = 1,
		},
		{ -- Spell Reflection
			["n"] = 90385,
			["e"] = 112253,
			["r"] = 1,
		},
		{ -- Rend
			["n"] = 90302,
			["e"] = 112156,
			["r"] = 1,
		},
		{ -- Rallying Cry
			["n"] = 90331,
			["e"] = 112188,
			["r"] = 1,
		},
		{ -- Brutal Vitality
			["n"] = 90451,
			["e"] = 112325,
			["r"] = 1,
		},
		{ -- Pain and Gain
			["n"] = 90353,
			["e"] = 112217,
			["r"] = 1,
		},
		{ -- Bloodsurge
			["n"] = 90300,
			["e"] = 112154,
			["r"] = 1,
		},
		{ -- Storm Bolt
			["n"] = 90337,
			["e"] = 112198,
			["r"] = 1,
		},
		{ -- Challenging Shout
			["n"] = 90309,
			["e"] = 112163,
			["r"] = 1,
		},
		{ -- Crushing Force
			["n"] = 90369,
			["e"] = 112236,
			["r"] = 2,
		},
		{ -- Show of Force
			["n"] = 90320,
			["e"] = 112177,
			["r"] = 1,
		},
		{ -- Crushing Force
			["n"] = 90369,
			["e"] = 112236,
			["r"] = 2,
		},
		{ -- Thunderlord
			["n"] = 90308,
			["e"] = 112162,
			["r"] = 1,
		},
		{ -- Blood and Thunder
			["n"] = 90342,
			["e"] = 112204,
			["r"] = 1,
		},
		{ -- Tough as Nails
			["n"] = 90450,
			["e"] = 112324,
			["r"] = 1,
		},
		{ -- Reinforced Plates
			["n"] = 90368,
			["e"] = 112235,
			["r"] = 1,
		},
		{ -- Shield Wall
			["n"] = 90312,
			["e"] = 112167,
			["r"] = 1,
		},
		{ -- Bounding Stride
			["n"] = 90355,
			["e"] = 112219,
			["r"] = 1,
		},
		{ -- Into the Fray
			["n"] = 90319,
			["e"] = 112175,
			["r"] = 1,
		},
		{ -- Double Time
			["n"] = 90382,
			["e"] = 112249,
			["r"] = 1,
		},
		{ -- Enduring Defenses
			["n"] = 90313,
			["e"] = 112169,
			["r"] = 1,
		},
		{ -- Seismic Reverberation
			["n"] = 90340,
			["e"] = 112201,
			["r"] = 1,
		},
		{ -- Anger Management
			["n"] = 90311,
			["e"] = 112166,
			["r"] = 1,
		},
		{ -- Bitter Immunity
			["n"] = 90356,
			["e"] = 112220,
			["r"] = 1,
		},
		{ -- Punish
			["n"] = 90449,
			["e"] = 112323,
			["r"] = 1,
		},
		{ -- One-Handed Weapon Specialization
			["n"] = 90324,
			["e"] = 112181,
			["r"] = 1,
		},
		{ -- Focused Vigor
			["n"] = 90318,
			["e"] = 112174,
			["r"] = 1,
		},
		{ -- Armored to the Teeth
			["n"] = 90259,
			["e"] = 112109,
			["r"] = 2,
		},
		{ -- Enduring Alacrity
			["n"] = 90433,
			["e"] = 112305,
			["r"] = 1,
		},
		{ -- Armored to the Teeth
			["n"] = 90259,
			["e"] = 112109,
			["r"] = 2,
		},
		{ -- Endurance Training
			["n"] = 90339,
			["e"] = 112200,
			["r"] = 1,
		},
		{ -- Shield Specialization
			["n"] = 90315,
			["e"] = 112171,
			["r"] = 2,
		},
		{ -- Wild Strikes
			["n"] = 90360,
			["e"] = 112224,
			["r"] = 2,
		},
		{ -- Shield Specialization
			["n"] = 90315,
			["e"] = 112171,
			["r"] = 2,
		},
		{ -- Wild Strikes
			["n"] = 90360,
			["e"] = 112224,
			["r"] = 2,
		},
		{ -- Ravager
			["n"] = 90432,
			["e"] = 112304,
			["r"] = 1,
		},
		{ -- Avatar
			["n"] = 90365,
			["e"] = 112232,
			["r"] = 1,
		},
		{ -- Indomitable
			["n"] = 90434,
			["e"] = 112306,
			["r"] = 1,
		},
		{ -- Thunderous Roar
			["n"] = 90359,
			["e"] = 112223,
			["r"] = 1,
		},
		{ -- Booming Voice
			["n"] = 90314,
			["e"] = 112170,
			["r"] = 1,
		},
		{ -- Unstoppable Force
			["n"] = 90364,
			["e"] = 112230,
			["r"] = 1,
		},
		{ -- Shield Charge
			["n"] = 90317,
			["e"] = 112173,
			["r"] = 1,
		},
		{ -- Uproar
			["n"] = 90357,
			["e"] = 112221,
			["r"] = 1,
		},
		{ -- Violent Outburst
			["n"] = 90265,
			["e"] = 112116,
			["r"] = 1,
		},
		{ -- Thunderous Words
			["n"] = 90358,
			["e"] = 112222,
			["r"] = 1,
		},
		{ -- Champion's Bulwark
			["n"] = 90316,
			["e"] = 112172,
			["r"] = 1,
		},
	},
}

addonTable.WARRIOR_TALENTS = WARRIOR_TALENTS