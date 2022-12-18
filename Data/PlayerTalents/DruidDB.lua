local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DRUID_TALENTS = {
	[102] = { -- Balance
		{
			["n"] = ,
			["e"] = ,
		},
	},
	[103] = { -- Feral
	},
	[104] = { -- Guardian
	},
	[105] = { -- Restoration
		{ -- Rake
			["n"] = 82199,
			["e"] = 103277,
		},
		{ -- Lifebloom
			["n"] = 82049,
			["e"] = 103100,
		},
		{ -- Starfire
			["n"] = 91040,
			["e"] = 112963,
		},
		{ -- Ysera's Gift
			["n"] = 82048,
			["e"] = 103099,
		},
		{ -- Thrash
			["n"] = 82223,
			["e"] = 103301,
		},
		{ -- Nature's Swiftness
			["n"] = 82050,
			["e"] = 103101,
		},
		{ -- Starsurge
			["n"] = 82200,
			["e"] = 103278,
		},
		{ -- Omen of Clarity
			["n"] = 82084,
			["e"] = 103143,
		},
		{ -- Rip
			["n"] = 82222,
			["e"] = 103300,
		},
		{ -- Swiftmend
			["n"] = 82216,
			["e"] = 103294,
		},
		{ -- Swipe
			["n"] = 82226,
			["e"] = 103304,
		},
		{ -- Flash of Clarity
			["n"] = 82083,
			["e"] = 103142,
		},
		{ -- Improved Nature's Cure
			["n"] = 82203,
			["e"] = 103281,
		},
		{ -- Improved Regrowth
			["n"] = 82055,
			["e"] = 103109,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Cenarion Ward
			["n"] = 82052,
			["e"] = 103104,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Efflorescence
			["n"] = 82057,
			["e"] = 103111,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Ironbark
			["n"] = 82082,
			["e"] = 103141,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Tranquility
			["n"] = 82054,
			["e"] = 103108,
		},
		{ -- Skull Bash
			["n"] = 82224,
			["e"] = 103302,
		},
		{ -- Soul of the Forest
			["n"] = 82059,
			["e"] = 103113,
		},
		{ -- Natural Recovery
			["n"] = 82206,
			["e"] = 103284,
		},
		{ -- Cultivation
			["n"] = 82056,
			["e"] = 103110,
		},
		{ -- Natural Recovery
			["n"] = 82206,
			["e"] = 103284,
		},
		{ -- Stonebark
			["n"] = 82081,
			["e"] = 103140,
		},
		{ -- Feline Swiftness
			["n"] = 82239,
			["e"] = 103318,
		},
		{ -- Verdancy
			["n"] = 82060,
			["e"] = 103114,
		},
		{ -- Feline Swiftness
			["n"] = 82239,
			["e"] = 103318,
		},
		{ -- Rampant Growth
			["n"] = 82058,
			["e"] = 103112,
		},
		{ -- Sunfire
			["n"] = 82208,
			["e"] = 103286,
		},
		{ -- Harmonious Blooming
			["n"] = 82065,
			["e"] = 103121,
		},
		{ -- Soothe
			["n"] = 82229,
			["e"] = 103307,
		},
		{ -- Harmonious Blooming
			["n"] = 82065,
			["e"] = 103121,
		},
		{ -- Primal Fury
			["n"] = 82238,
			["e"] = 103317,
		},
		{ -- Unstoppable Growth
			["n"] = 82080,
			["e"] = 103138,
		},
		{ -- Wild Growth
			["n"] = 82241,
			["e"] = 103320,
		},
		{ -- Unstoppable Growth
			["n"] = 82080,
			["e"] = 103138,
		},
		{ -- Improved Sunfire
			["n"] = 82207,
			["e"] = 103285,
		},
		{ -- Convoke the Spirits
			["n"] = 82064,
			["e"] = 103119,
		},
		{ -- Stampeding Roar
			["n"] = 82234,
			["e"] = 103312,
		},
		{ -- Adaptive Swarm
			["n"] = 82067,
			["e"] = 103123,
		},
		{ -- Incapacitating Roar
			["n"] = 82237,
			["e"] = 103316,
		},
		{ -- Unbridled Swarm
			["n"] = 82066,
			["e"] = 103122,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Circle of Life and Death
			["n"] = 82074,
			["e"] = 103130,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Photosynthesis
			["n"] = 82073,
			["e"] = 103129,
		},
		{ -- Protector of the Pack
			["n"] = 82245,
			["e"] = 103325,
		},
	},
}

addonTable.DRUID_TALENTS = DRUID_TALENTS