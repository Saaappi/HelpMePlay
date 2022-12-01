local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local WARRIOR_TALENTS = {
	[71] = { -- Arms
		{ -- War Machine
			["n"] = 90328,
			["e"] = 112185,
		},
		{ -- Mortal Strike
			["n"] = 90270,
			["e"] = 112122,
		},
		{ -- Leeching Strikes
			["n"] = 90344,
			["e"] = 112206,
		},
		{ -- Overpower
			["n"] = 90271,
			["e"] = 112123,
		},
		{ -- Fast Footwork
			["n"] = 90371,
			["e"] = 112238,
		},
		{ -- Improved Execute
			["n"] = 90273,
			["e"] = 112125,
		},
		{ -- Spell Reflection
			["n"] = 90385,
			["e"] = 112253,
		},
		{ -- Die by the Sword
			["n"] = 90276,
			["e"] = 112128,
		},
		{ -- Frothing Berserker
			["n"] = 90352,
			["e"] = 112216,
		},
		{ -- Martial Prowess
			["n"] = 90278,
			["e"] = 112130,
		},
		{ -- Furious Blows
			["n"] = 90336,
			["e"] = 112197,
		},
		{ -- Improved Overpower
			["n"] = 90279,
			["e"] = 112131,
		},
		{ -- Heroic Leap
			["n"] = 90346,
			["e"] = 112208,
		},
		{ -- Fueled by Violence
			["n"] = 90275,
			["e"] = 112157,
		},
		{ -- Thunder Clap
			["n"] = 92224,
			["e"] = 114296,
		},
		{ -- Sudden Death
			["n"] = 90274,
			["e"] = 112126,
		},
		{ -- Pain and Gain
			["n"] = 90353,
			["e"] = 112217,
		},
		{ -- Colossus Smash
			["n"] = 90290,
			["e"] = 112144,
		},
		{ -- Overwhelming Rage
			["n"] = 90378,
			["e"] = 112245,
		},
		{ -- Impale
			["n"] = 90292,
			["e"] = 112146,
		},
		{ -- Overwhelming Rage
			["n"] = 90378,
			["e"] = 112245,
		},
		{ -- Tactician
			["n"] = 90282,
			["e"] = 112134,
		},
		{ -- Sidearm
			["n"] = 90333,
			["e"] = 112192,
		},
		{ -- Massacre
			["n"] = 90291,
			["e"] = 112145,
		},
		{ -- Crushing Force
			["n"] = 90347,
			["e"] = 112209,
		},
		{ -- Anger Management
			["n"] = 90289,
			["e"] = 112143,
		},
		{ -- Crushing Force
			["n"] = 90347,
			["e"] = 112209,
		},
		{ -- Rend
			["n"] = 90284,
			["e"] = 112136,
		},
		{ -- Blood and Thunder
			["n"] = 90342,
			["e"] = 112204,
		},
		{ -- Sweeping Strikes
			["n"] = 90268,
			["e"] = 112120,
		},
		{ -- Barbaric Training
			["n"] = 92221,
			["e"] = 114293,
		},
		{ -- Dreadnaught
			["n"] = 90285,
			["e"] = 112137,
		},
		{ -- Bounding Stride
			["n"] = 90355,
			["e"] = 112219,
		},
		{ -- Storm of Swords
			["n"] = 90267,
			["e"] = 112119,
		},
		{ -- Reinforced Plates
			["n"] = 90368,
			["e"] = 112235,
		},
		{ -- Bloodborne
			["n"] = 90283,
			["e"] = 112135,
		},
		{ -- Double Time
			["n"] = 90382,
			["e"] = 112249,
		},
		{ -- Bloodborne
			["n"] = 90283,
			["e"] = 112135,
		},
		{ -- Seismic Reverberation
			["n"] = 90340,
			["e"] = 112201,
		},
		{ -- Warbreaker
			["n"] = 90287,
			["e"] = 112139,
		},
		{ -- Armored to the Teeth
			["n"] = 90366,
			["e"] = 112233,
		},
		{ -- Critical Thinking
			["n"] = 90444,
			["e"] = 112317,
		},
		{ -- Armored to the Teeth
			["n"] = 90366,
			["e"] = 112233,
		},
		{ -- Critical Thinking
			["n"] = 90444,
			["e"] = 112317,
		},
		{ -- Two-Handed Weapon Specialization
			["n"] = 90322,
			["e"] = 112179,
		},
		{ -- Deft Experience
			["n"] = 90437,
			["e"] = 112309,
		},
		{ -- Wild Strikes
			["n"] = 90360,
			["e"] = 112224,
		},
		{ -- Deft Experience
			["n"] = 90437,
			["e"] = 112309,
		},
		{ -- Wild Strikes
			["n"] = 90360,
			["e"] = 112224,
		},
		{ -- Valor in Victory
			["n"] = 90442,
			["e"] = 112315,
		},
		{ -- Cruel Strikes
			["n"] = 90381,
			["e"] = 112248,
		},
		{ -- Valor in Victory
			["n"] = 90442,
			["e"] = 112315,
		},
		{ -- Avatar
			["n"] = 90365,
			["e"] = 112232,
		},
		{ -- Bladestorm
			["n"] = 90441,
			["e"] = 112314,
		},
		{ -- Blademaster's Torment
			["n"] = 90363,
			["e"] = 112229,
		},
		{ -- Sharpened Blades
			["n"] = 90447,
			["e"] = 112320,
		},
		{ -- Thunderous Roar
			["n"] = 90359,
			["e"] = 112223,
		},
		{ -- Unhinged
			["n"] = 90440,
			["e"] = 112313,
		},
		{ -- Uproar
			["n"] = 90357,
			["e"] = 112221,
		},
		{ -- Merciless Bonegrinder
			["n"] = 90266,
			["e"] = 112117,
		},
		{ -- Thunderous Words
			["n"] = 90358,
			["e"] = 112222,
		},
	},
	[72] = { -- Fury
	},
	[73] = { -- Protection
		{ -- War Machine
			["n"] = 90345,
			["e"] = 112207,
		},
		{ -- Ignore Pain
			["n"] = 90295,
			["e"] = 112149,
		},
		{ -- Leeching Strikes
			["n"] = 90344,
			["e"] = 112206,
		},
		{ -- Revenge
			["n"] = 90298,
			["e"] = 112152,
		},
		{ -- Impending Victory
			["n"] = 90326,
			["e"] = 112183,
		},
		{ -- Demoralizing Shout
			["n"] = 90305,
			["e"] = 112159,
		},
		{ -- Fast Footwork
			["n"] = 90371,
			["e"] = 112238,
		},
		{ -- Best Served Cold
			["n"] = 90304,
			["e"] = 112158,
		},
		{ -- Frothing Berserker
			["n"] = 90370,
			["e"] = 112237,
		},
		{ -- Devastator
			["n"] = 90299,
			["e"] = 112153,
		},
		{ -- Heroic Leap
			["n"] = 90346,
			["e"] = 112208,
		},
		{ -- Strategist
			["n"] = 90303,
			["e"] = 112157,
		},
		{ -- Thunder Clap
			["n"] = 90343,
			["e"] = 112205,
		},
		{ -- Last Stand
			["n"] = 90297,
			["e"] = 112151,
		},
		{ -- Furious Blows
			["n"] = 90336,
			["e"] = 112197,
		},
		{ -- Brace For Impact
			["n"] = 90296,
			["e"] = 112150,
		},
		{ -- Spell Reflection
			["n"] = 90385,
			["e"] = 112253,
		},
		{ -- Rend
			["n"] = 90302,
			["e"] = 112156,
		},
		{ -- Rallying Cry
			["n"] = 90331,
			["e"] = 112188,
		},
		{ -- Brutal Vitality
			["n"] = 90451,
			["e"] = 112325,
		},
		{ -- Pain and Gain
			["n"] = 90353,
			["e"] = 112217,
		},
		{ -- Bloodsurge
			["n"] = 90300,
			["e"] = 112154,
		},
		{ -- Storm Bolt
			["n"] = 90337,
			["e"] = 112198,
		},
		{ -- Challenging Shout
			["n"] = 90309,
			["e"] = 112163,
		},
		{ -- Crushing Force
			["n"] = 90369,
			["e"] = 112236,
		},
		{ -- Show of Force
			["n"] = 90320,
			["e"] = 112177,
		},
		{ -- Crushing Force
			["n"] = 90369,
			["e"] = 112236,
		},
		{ -- Thunderlord
			["n"] = 90308,
			["e"] = 112162,
		},
		{ -- Blood and Thunder
			["n"] = 90342,
			["e"] = 112204,
		},
		{ -- Tough as Nails
			["n"] = 90450,
			["e"] = 112324,
		},
		{ -- Reinforced Plates
			["n"] = 90368,
			["e"] = 112235,
		},
		{ -- Shield Wall
			["n"] = 90312,
			["e"] = 112167,
		},
		{ -- Bounding Stride
			["n"] = 90355,
			["e"] = 112219,
		},
		{ -- Into the Fray
			["n"] = 90319,
			["e"] = 112175,
		},
		{ -- Double Time
			["n"] = 90382,
			["e"] = 112249,
		},
		{ -- Enduring Defenses
			["n"] = 90313,
			["e"] = 112169,
		},
		{ -- Seismic Reverberation
			["n"] = 90340,
			["e"] = 112201,
		},
		{ -- Anger Management
			["n"] = 90311,
			["e"] = 112166,
		},
		{ -- Bitter Immunity
			["n"] = 90356,
			["e"] = 112220,
		},
		{ -- Punish
			["n"] = 90449,
			["e"] = 112323,
		},
		{ -- One-Handed Weapon Specialization
			["n"] = 90324,
			["e"] = 112181,
		},
		{ -- Focused Vigor
			["n"] = 90318,
			["e"] = 112174,
		},
		{ -- Armored to the Teeth
			["n"] = 90259,
			["e"] = 112109,
		},
		{ -- Enduring Alacrity
			["n"] = 90433,
			["e"] = 112305,
		},
		{ -- Armored to the Teeth
			["n"] = 90259,
			["e"] = 112109,
		},
		{ -- Endurance Training
			["n"] = 90339,
			["e"] = 112200,
		},
		{ -- Shield Specialization
			["n"] = 90315,
			["e"] = 112171,
		},
		{ -- Wild Strikes
			["n"] = 90360,
			["e"] = 112224,
		},
		{ -- Shield Specialization
			["n"] = 90315,
			["e"] = 112171,
		},
		{ -- Wild Strikes
			["n"] = 90360,
			["e"] = 112224,
		},
		{ -- Ravager
			["n"] = 90432,
			["e"] = 112304,
		},
		{ -- Avatar
			["n"] = 90365,
			["e"] = 112232,
		},
		{ -- Indomitable
			["n"] = 90434,
			["e"] = 112306,
		},
		{ -- Thunderous Roar
			["n"] = 90359,
			["e"] = 112223,
		},
		{ -- Booming Voice
			["n"] = 90314,
			["e"] = 112170,
		},
		{ -- Unstoppable Force
			["n"] = 90364,
			["e"] = 112230,
		},
		{ -- Shield Charge
			["n"] = 90317,
			["e"] = 112173,
		},
		{ -- Uproar
			["n"] = 90357,
			["e"] = 112221,
		},
		{ -- Violent Outburst
			["n"] = 90265,
			["e"] = 112116,
		},
		{ -- Thunderous Words
			["n"] = 90358,
			["e"] = 112222,
		},
		{ -- Champion's Bulwark
			["n"] = 90316,
			["e"] = 112172,
		},
	},
}

addonTable.WARRIOR_TALENTS = WARRIOR_TALENTS