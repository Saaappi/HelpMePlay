local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DRUID_TALENTS = {
	[102] = { -- Balance
		{ -- Frenzied Regeneration
			["n"] = 82220,
			["e"] = 103298,
		},
		{ -- Eclipse
			["n"] = 88223,
			["e"] = 109858,
		},
		{ -- Improved Barkskin
			["n"] = 82219,
			["e"] = 103297,
		},
		{ -- Shooting Stars
			["n"] = 88225,
			["e"] = 109861,
		},
		{ -- Thrash
			["n"] = 82223,
			["e"] = 103301,
		},
		{ -- Nature's Balance
			["n"] = 88226,
			["e"] = 109862,
		},
		{ -- Swipe
			["n"] = 82226,
			["e"] = 103304,
		},
		{ -- Starfall
			["n"] = 88201,
			["e"] = 109833,
		},
		{ -- Moonkin Form
			["n"] = 82212,
			["e"] = 103290,
		},
		{ -- Lunar Shrapnel
			["n"] = 88232,
			["e"] = 109868,
		},
		{ -- Ironfur
			["n"] = 82227,
			["e"] = 103305,
		},
		{ -- Aetherial Kindling
			["n"] = 88209,
			["e"] = 109843,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Umbral Embrace
			["n"] = 88216,
			["e"] = 109850,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Umbral Embrace
			["n"] = 88216,
			["e"] = 109850,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Solstice
			["n"] = 88203,
			["e"] = 109835,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
		{ -- Solstice
			["n"] = 88203,
			["e"] = 109835,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
		{ -- Force of Nature
			["n"] = 88210,
			["e"] = 109844,
		},
		{ -- Wild Charge
			["n"] = 82198,
			["e"] = 103276,
		},
		{ -- Solar Beam
			["n"] = 88231,
			["e"] = 109867,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Stellar Flare
			["n"] = 91048,
			["e"] = 109841,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Twin Moons
			["n"] = 88208,
			["e"] = 109842,
		},
		{ -- Sunfire
			["n"] = 82208,
			["e"] = 103286,
		},
		{ -- Orbit Breaker
			["n"] = 88199,
			["e"] = 109831,
		},
		{ -- Typhoon
			["n"] = 82209,
			["e"] = 103287,
		},
		{ -- Rattle the Stars
			["n"] = 88236,
			["e"] = 109872,
		},
		{ -- Soothe
			["n"] = 82229,
			["e"] = 103307,
		},
		{ -- Waning Twilight
			["n"] = 88202,
			["e"] = 109834,
		},
		{ -- Improved Sunfire
			["n"] = 82207,
			["e"] = 103285,
		},
		{ -- Waning Twilight
			["n"] = 88202,
			["e"] = 109834,
		},
		{ -- Matted Fur
			["n"] = 82236,
			["e"] = 103314,
		},
		{ -- Celestial Alignment
			["n"] = 88215,
			["e"] = 109849,
		},
		{ -- Stampeding Roar
			["n"] = 82234,
			["e"] = 103312,
		},
		{ -- Starlord
			["n"] = 88200,
			["e"] = 109832,
		},
		{ -- Incapacitating Roar
			["n"] = 82237,
			["e"] = 103316,
		},
		{ -- Starlord
			["n"] = 88200,
			["e"] = 109832,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Nature's Grace
			["n"] = 88222,
			["e"] = 109857,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Orbital Strike
			["n"] = 88221,
			["e"] = 109856,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Soul of the Forest
			["n"] = 88212,
			["e"] = 109846,
		},
		{ -- Ursol's Vortex
			["n"] = 82242,
			["e"] = 103321,
		},
		{ -- Wild Mushroom
			["n"] = 88220,
			["e"] = 109854,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Circle of Life and Death
			["n"] = 88227,
			["e"] = 109863,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Convoke the Spirits
			["n"] = 88206,
			["e"] = 109838,
		},
		{ -- Improved Stampeding Roar
			["n"] = 82230,
			["e"] = 103308,
		},
		{ -- Fungal Growth
			["n"] = 88205,
			["e"] = 109837,
		},
		{ -- Renewal
			["n"] = 82232,
			["e"] = 103310,
		},
		{ -- Elune's Guidance
			["n"] = 88228,
			["e"] = 109864,
		},
		{ -- Innervate
			["n"] = 82243,
			["e"] = 103323,
		},
		{ -- Fury of Elune
			["n"] = 88224,
			["e"] = 109859,
		},
		{ -- Nature's Vigil
			["n"] = 82244,
			["e"] = 103324,
		},
	},
	[103] = { -- Feral
		{ -- Frenzied Regeneration
			["n"] = 82220,
			["e"] = 103298,
		},
		{ -- Tiger's Fury
			["n"] = 82124,
			["e"] = 103188,
		},
		{ -- Starfire
			["n"] = 91044,
			["e"] = 112967,
		},
		{ -- Omen of Clarity
			["n"] = 82123,
			["e"] = 103187,
		},
		{ -- Swipe
			["n"] = 82226,
			["e"] = 103304,
		},
		{ -- Primal Wrath
			["n"] = 82120,
			["e"] = 103184,
		},
		{ -- Starsurge
			["n"] = 82200,
			["e"] = 103278,
		},
		{ -- Predator
			["n"] = 82122,
			["e"] = 103186,
		},
		{ -- Rip
			["n"] = 82222,
			["e"] = 103300,
		},
		{ -- Merciless Claws
			["n"] = 82098,
			["e"] = 103159,
		},
		{ -- Moonkin Form
			["n"] = 91045,
			["e"] = 112968,
		},
		{ -- Sabertooth
			["n"] = 82102,
			["e"] = 103163,
		},
		{ -- Ironfur
			["n"] = 82227,
			["e"] = 103305,
		},
		{ -- Tireless Energy
			["n"] = 82121,
			["e"] = 103185,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Tireless Energy
			["n"] = 82121,
			["e"] = 103185,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Pouncing Strikes
			["n"] = 82119,
			["e"] = 103183,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Rampant Ferocity
			["n"] = 82099,
			["e"] = 103160,
		},
		{ -- Skull Bash
			["n"] = 82224,
			["e"] = 103302,
		},
		{ -- Berserk
			["n"] = 82101,
			["e"] = 103162,
		},
		{ -- Feline Swiftness
			["n"] = 82239,
			["e"] = 103318,
		},
		{ -- Tear Open Wounds
			["n"] = 82089,
			["e"] = 103148,
		},
		{ -- Feline Swiftness
			["n"] = 82239,
			["e"] = 103318,
		},
		{ -- Predatory Swiftness
			["n"] = 82106,
			["e"] = 103167,
		},
		{ -- Wild Charge
			["n"] = 82198,
			["e"] = 103276,
		},
		{ -- Moment of Clarity
			["n"] = 82100,
			["e"] = 103161,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Infected Wounds
			["n"] = 82103,
			["e"] = 103164,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Dreadful Bleeding
			["n"] = 82117,
			["e"] = 103181,
		},
		{ -- Primal Fury
			["n"] = 82238,
			["e"] = 103317,
		},
		{ -- Raging Fury
			["n"] = 82107,
			["e"] = 103169,
		},
		{ -- Soothe
			["n"] = 82229,
			["e"] = 103307,
		},
		{ -- Berserk: Heart of the Lion
			["n"] = 82105,
			["e"] = 103166,
		},
		{ -- Sunfire
			["n"] = 82208,
			["e"] = 103286,
		},
		{ -- Survival Instincts
			["n"] = 82116,
			["e"] = 103180,
		},
		{ -- Stampeding Roar
			["n"] = 82234,
			["e"] = 103312,
		},
		{ -- Berserk: Frenzy
			["n"] = 82090,
			["e"] = 103149,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Carnivorous Instinct
			["n"] = 82110,
			["e"] = 103173,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Carnivorous Instinct
			["n"] = 82110,
			["e"] = 103173,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Frantic Momentum
			["n"] = 82115,
			["e"] = 103179,
		},
		{ -- Ursol's Vortex
			["n"] = 82242,
			["e"] = 103321,
		},
		{ -- Frantic Momentum
			["n"] = 82115,
			["e"] = 103179,
		},
		{ -- Innervate
			["n"] = 82243,
			["e"] = 103323,
		},
		{ -- Bloodtalons
			["n"] = 82109,
			["e"] = 103171,
		},
		{ -- Nature's Vigil
			["n"] = 82244,
			["e"] = 103324,
		},
		{ -- Convoke the Spirits
			["n"] = 82114,
			["e"] = 103177,
		},
		{ -- Mighty Bash
			["n"] = 82237,
			["e"] = 103315,
		},
		{ -- Soul of the Forest
			["n"] = 82096,
			["e"] = 103157,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Feral Frenzy
			["n"] = 82108,
			["e"] = 103170,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Ashamane's Guidance
			["n"] = 82113,
			["e"] = 103176,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
		{ -- Circle of Life and Death
			["n"] = 82095,
			["e"] = 103156,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
	},
	[104] = { -- Guardian
		{ -- Improved Barkskin
			["n"] = 82219,
			["e"] = 103297,
		},
		{ -- Maul
			["n"] = 82127,
			["e"] = 103191,
		},
		{ -- Starfire
			["n"] = 91041,
			["e"] = 112964,
		},
		{ -- Gore
			["n"] = 82126,
			["e"] = 103190,
		},
		{ -- Starsurge
			["n"] = 82200,
			["e"] = 103278,
		},
		{ -- Survival Instincts
			["n"] = 82129,
			["e"] = 103193,
		},
		{ -- Rip
			["n"] = 82222,
			["e"] = 103300,
		},
		{ -- Brambles
			["n"] = 82161,
			["e"] = 103231,
		},
		{ -- Swipe
			["n"] = 82226,
			["e"] = 103304,
		},
		{ -- Ursine Adept
			["n"] = 82150,
			["e"] = 103217,
		},
		{ -- Verdant Heart
			["n"] = 82218,
			["e"] = 103296,
		},
		{ -- Mangle
			["n"] = 82131,
			["e"] = 103195,
		},
		{ -- Moonkin Form
			["n"] = 91043,
			["e"] = 112966,
		},
		{ -- Innate Resolve
			["n"] = 82160,
			["e"] = 103229,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Gory Fur
			["n"] = 82132,
			["e"] = 103196,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Berserk
			["n"] = 82149,
			["e"] = 103216,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Flashing Claws
			["n"] = 82157,
			["e"] = 103226,
		},
		{ -- Ironfur
			["n"] = 82227,
			["e"] = 103305,
		},
		{ -- Flashing Claws
			["n"] = 82157,
			["e"] = 103226,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Vulnerable Flesh
			["n"] = 82159,
			["e"] = 103228,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Vulnerable Flesh
			["n"] = 82159,
			["e"] = 103228,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Survival of the Fittest
			["n"] = 82143,
			["e"] = 103210,
		},
		{ -- Skull Bash
			["n"] = 82224,
			["e"] = 103302,
		},
		{ -- Survival of the Fittest
			["n"] = 82143,
			["e"] = 103210,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
		{ -- Tooth and Claw
			["n"] = 82133,
			["e"] = 103197,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
		{ -- After the Wildfire
			["n"] = 82140,
			["e"] = 103206,
		},
		{ -- Feline Swiftness
			["n"] = 82239,
			["e"] = 103318,
		},
		{ -- Berserk
			["n"] = 82155,
			["e"] = 103224,
		},
		{ -- Feline Swiftness
			["n"] = 82239,
			["e"] = 103318,
		},
		{ -- Fury of Nature
			["n"] = 82138,
			["e"] = 103203,
		},
		{ -- Wild Charge
			["n"] = 82198,
			["e"] = 103276,
		},
		{ -- Fury of Nature
			["n"] = 82138,
			["e"] = 103203,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Berserk
			["n"] = 82144,
			["e"] = 103211,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Circle of Life and Death
			["n"] = 82137,
			["e"] = 103202,
		},
		{ -- Soothe
			["n"] = 82229,
			["e"] = 103307,
		},
		{ -- Elune's Favored
			["n"] = 82134,
			["e"] = 103198,
		},
		{ -- Matted Fur
			["n"] = 82236,
			["e"] = 103314,
		},
		{ -- Scintillating Moonlight
			["n"] = 82146,
			["e"] = 103213,
		},
		{ -- Stampeding Roar
			["n"] = 82234,
			["e"] = 103312,
		},
		{ -- Scintillating Moonlight
			["n"] = 82146,
			["e"] = 103213,
		},
		{ -- Incapacitating Roar
			["n"] = 82237,
			["e"] = 103316,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Incarnation: Guardian of Ursoc
			["n"] = 82136,
			["e"] = 103201,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Galactic Guardian
			["n"] = 82147,
			["e"] = 103214,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Twin Moonfire
			["n"] = 82145,
			["e"] = 103212,
		},
		{ -- Improved Stampeding Roar
			["n"] = 82230,
			["e"] = 103308,
		},
		{ -- Ursoc's Guidance
			["n"] = 82135,
			["e"] = 103199,
		},
		{ -- Heart of the Wild
			["n"] = 82231,
			["e"] = 103309,
		},
		{ -- Rage of the Sleeper
			["n"] = 82141,
			["e"] = 103207,
		},
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