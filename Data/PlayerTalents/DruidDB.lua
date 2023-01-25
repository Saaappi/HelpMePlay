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
		{ -- Rejuvenation
			["n"] = 82217,
			["e"] = 103295,
		},
		{ -- Shooting Stars
			["n"] = 88225,
			["e"] = 109861,
		},
		{ -- Improved Barkskin
			["n"] = 82219,
			["e"] = 103297,
		},
		{ -- Solar Beam
			["n"] = 88231,
			["e"] = 109867,
		},
		{ -- Sunfire
			["n"] = 82208,
			["e"] = 103286,
		},
		{ -- Starfall
			["n"] = 88201,
			["e"] = 109833,
		},
		{ -- Swiftmend
			["n"] = 82216,
			["e"] = 103294,
		},
		{ -- Solstice
			["n"] = 88203,
			["e"] = 109835,
		},
		{ -- Moonkin Form
			["n"] = 82212,
			["e"] = 103290,
		},
		{ -- Force of Nature
			["n"] = 88210,
			["e"] = 109844,
		},
		{ -- Verdant Heart
			["n"] = 82218,
			["e"] = 103296,
		},
		{ -- Twin Moons
			["n"] = 88208,
			["e"] = 109842,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Stellar Flare
			["n"] = 91048,
			["e"] = 109841,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Celestial Alignment
			["n"] = 88215,
			["e"] = 109849,
		},
		{ -- Ironfur
			["n"] = 82227,
			["e"] = 103305,
		},
		{ -- Waning Twilight
			["n"] = 88202,
			["e"] = 109834,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
		{ -- Waning Twilight
			["n"] = 88202,
			["e"] = 109834,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
		{ -- Soul of the Forest
			["n"] = 88212,
			["e"] = 109846,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Orbital Strike
			["n"] = 88221,
			["e"] = 109856,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Nature's Grace
			["n"] = 88222,
			["e"] = 109857,
		},
		{ -- Wild Charge
			["n"] = 82198,
			["e"] = 103276,
		},
		{ -- Umbral Embrace
			["n"] = 88216,
			["e"] = 109850,
		},
		{ -- Improved Sunfire
			["n"] = 82207,
			["e"] = 103285,
		},
		{ -- Umbral Embrace
			["n"] = 88216,
			["e"] = 109850,
		},
		{ -- Typhoon
			["n"] = 82209,
			["e"] = 103287,
		},
		{ -- Cosmic Rapidity
			["n"] = 88227,
			["e"] = 109863,
		},
		{ -- Soothe
			["n"] = 82229,
			["e"] = 103307,
		},
		{ -- Cosmic Rapidity
			["n"] = 88227,
			["e"] = 109863,
		},
		{ -- Matted Fur
			["n"] = 82236,
			["e"] = 103314,
		},
		{ -- Power of Goldrinn
			["n"] = 88207,
			["e"] = 109840,
		},
		{ -- Stampeding Roar
			["n"] = 82234,
			["e"] = 103312,
		},
		{ -- Power of Goldrinn
			["n"] = 88207,
			["e"] = 109840,
		},
		{ -- Ursol's Vortex
			["n"] = 82242,
			["e"] = 103321,
		},
		{ -- Wild Mushroom
			["n"] = 88220,
			["e"] = 109854,
		},
		{ -- Incapacitating Roar
			["n"] = 82237,
			["e"] = 103316,
		},
		{ -- Orbit Breaker
			["n"] = 88199,
			["e"] = 109831,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Starlord
			["n"] = 88200,
			["e"] = 109832,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Starlord
			["n"] = 88200,
			["e"] = 109832,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Balance of All Things
			["n"] = 88214,
			["e"] = 109848,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Sundered Firmament
			["n"] = 88217,
			["e"] = 109851,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Starweaver
			["n"] = 88236,
			["e"] = 109873,
		},
		{ -- Renewal
			["n"] = 82232,
			["e"] = 103310,
		},
		{ -- Fury of Elune
			["n"] = 88224,
			["e"] = 109859,
		},
		{ -- Innervate
			["n"] = 82243,
			["e"] = 103323,
		},
		{ -- Fungal Growth
			["n"] = 88205,
			["e"] = 109837,
		},
		{ -- Nature's Vigil
			["n"] = 82244,
			["e"] = 103324,
		},
		{ -- Incarnation: Chosen of Elune
			["n"] = 88206,
			["e"] = 109839,
		},
		{ -- Improved Stampeding Roar
			["n"] = 82230,
			["e"] = 103308,
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
		{ -- Thrash
			["n"] = 82223,
			["e"] = 103304,
		},
		{ -- Primal Wrath
			["n"] = 82120,
			["e"] = 103184,
		},
		{ -- Sunfire
			["n"] = 82208,
			["e"] = 103286,
		},
		{ -- Merciless Claws
			["n"] = 82098,
			["e"] = 103159,
		},
		{ -- Improved Swipe
			["n"] = 82226,
			["e"] = 103304,
		},
		{ -- Predator
			["n"] = 82122,
			["e"] = 103186,
		},
		{ -- Moonkin Form
			["n"] = 91045,
			["e"] = 112968,
		},
		{ -- Tear Open Wounds
			["n"] = 82089,
			["e"] = 103148,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Sabertooth
			["n"] = 82102,
			["e"] = 103163,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Pouncing Strikes
			["n"] = 82119,
			["e"] = 103183,
		},
		{ -- Ironfur
			["n"] = 82227,
			["e"] = 103305,
		},
		{ -- Rampant Ferocity
			["n"] = 82099,
			["e"] = 103160,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
		{ -- Survival Instincts
			["n"] = 82116,
			["e"] = 103180,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
		{ -- Infected Wounds
			["n"] = 82103,
			["e"] = 103164,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Taste for Blood
			["n"] = 82118,
			["e"] = 103182,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Predatory Swiftness
			["n"] = 82106,
			["e"] = 103167,
		},
		{ -- Feline Swiftness
			["n"] = 82239,
			["e"] = 103318,
		},
		{ -- Berserk
			["n"] = 82101,
			["e"] = 103162,
		},
		{ -- Feline Swiftness
			["n"] = 82239,
			["e"] = 103318,
		},
		{ -- Dreadful Bleeding
			["n"] = 82117,
			["e"] = 103181,
		},
		{ -- Wild Charge
			["n"] = 82198,
			["e"] = 103276,
		},
		{ -- Berserk: Frenzy
			["n"] = 82090,
			["e"] = 103149,
		},
		{ -- Skull Bash
			["n"] = 82224,
			["e"] = 103302,
		},
		{ -- Moment of Clarity
			["n"] = 82100,
			["e"] = 103161,
		},
		{ -- Soothe
			["n"] = 82229,
			["e"] = 103307,
		},
		{ -- Berserk: Heart of the Lion
			["n"] = 82105,
			["e"] = 103166,
		},
		{ -- Typhoon
			["n"] = 82209,
			["e"] = 103287,
		},
		{ -- Brutal Slash
			["n"] = 82091,
			["e"] = 103151,
		},
		{ -- Tireless Pursuit
			["n"] = 82197,
			["e"] = 103274,
		},
		{ -- Raging Fury
			["n"] = 82107,
			["e"] = 103169,
		},
		{ -- Primal Fury
			["n"] = 82238,
			["e"] = 103317,
		},
		{ -- Cat's Curiosity
			["n"] = 82094,
			["e"] = 103155,
		},
		{ -- Stampeding Roar
			["n"] = 82234,
			["e"] = 103312,
		},
		{ -- Frantic Momentum
			["n"] = 82115,
			["e"] = 103179,
		},
		{ -- Incessant Tempest
			["n"] = 92228,
			["e"] = 114298,
		},
		{ -- Frantic Momentum
			["n"] = 82115,
			["e"] = 103179,
		},
		{ -- Ursol's Vortex
			["n"] = 82242,
			["e"] = 103321,
		},
		{ -- Carnivorous Instinct
			["n"] = 82110,
			["e"] = 103173,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Lion's Strength
			["n"] = 82109,
			["e"] = 103172,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Soul of the Forest
			["n"] = 82096,
			["e"] = 103157,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Veinripper
			["n"] = 82093,
			["e"] = 103154,
		},
		{ -- Incapacitating Roar
			["n"] = 82237,
			["e"] = 103316,
		},
		{ -- Feral Frenzy
			["n"] = 82108,
			["e"] = 103170,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Apex Predator's Craving
			["n"] = 82092,
			["e"] = 103152,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Circle of Life and Death
			["n"] = 82095,
			["e"] = 103156,
		},
		{ -- Renewal
			["n"] = 82232,
			["e"] = 103310,
		},
	},
	[104] = { -- Guardian
		{ -- Starfire
			["n"] = 91041,
			["e"] = 112964,
		},
		{ -- Maul
			["n"] = 82127,
			["e"] = 103191,
		},
		{ -- Improved Barkskin
			["n"] = 82219,
			["e"] = 103297,
		},
		{ -- Gore
			["n"] = 82126,
			["e"] = 103190,
		},
		{ -- Sunfire
			["n"] = 82208,
			["e"] = 103286,
		},
		{ -- Survival Instincts
			["n"] = 82129,
			["e"] = 103193,
		},
		{ -- Improved Swipe
			["n"] = 82226,
			["e"] = 103304,
		},
		{ -- Brambles
			["n"] = 82161,
			["e"] = 103231,
		},
		{ -- Moonkin Form
			["n"] = 91043,
			["e"] = 112966,
		},
		{ -- Mangle
			["n"] = 82131,
			["e"] = 103195,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
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
		{ -- Ironfur
			["n"] = 82227,
			["e"] = 103305,
		},
		{ -- Berserk: Ravage
			["n"] = 82149,
			["e"] = 103216,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Ursoc's Endurance
			["n"] = 82130,
			["e"] = 103194,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Survival of the Fittest
			["n"] = 82143,
			["e"] = 103210,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
		{ -- Survival of the Fittest
			["n"] = 82143,
			["e"] = 103210,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
		{ -- Vulnerable Flesh
			["n"] = 82159,
			["e"] = 103228,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Vulnerable Flesh
			["n"] = 82159,
			["e"] = 103228,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Tooth and Claw
			["n"] = 82133,
			["e"] = 103197,
		},
		{ -- Wild Charge
			["n"] = 82198,
			["e"] = 103276,
		},
		{ -- Soul of the Forest
			["n"] = 92226,
			["e"] = 103208,
		},
		{ -- Skull Bash
			["n"] = 82224,
			["e"] = 103302,
		},
		{ -- After the Wildfire
			["n"] = 82140,
			["e"] = 103206,
		},
		{ -- Soothe
			["n"] = 82229,
			["e"] = 103307,
		},
		{ -- Berserk: Unchecked Aggression
			["n"] = 82155,
			["e"] = 103224,
		},
		{ -- Improved Sunfire
			["n"] = 82207,
			["e"] = 103285,
		},
		{ -- Fury of Nature
			["n"] = 82138,
			["e"] = 103203,
		},
		{ -- Matted Fur
			["n"] = 82236,
			["e"] = 103314,
		},
		{ -- Fury of Nature
			["n"] = 82138,
			["e"] = 103203,
		},
		{ -- Stampeding Roar
			["n"] = 82234,
			["e"] = 103312,
		},
		{ -- Berserk: Persistence
			["n"] = 82144,
			["e"] = 103211,
		},
		{ -- Incapacitating Roar
			["n"] = 82237,
			["e"] = 103316,
		},
		{ -- Circle of Life and Death
			["n"] = 82137,
			["e"] = 103202,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Twin Moonfire
			["n"] = 82145,
			["e"] = 103212,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Scintillating Moonlight
			["n"] = 82146,
			["e"] = 103213,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Scintillating Moonlight
			["n"] = 82146,
			["e"] = 103213,
		},
		{ -- Ursol's Vortex
			["n"] = 82242,
			["e"] = 103321,
		},
		{ -- Elune's Favored
			["n"] = 82134,
			["e"] = 103198,
		},
		{ -- Improved Stampeding Roar
			["n"] = 82230,
			["e"] = 103308,
		},
		{ -- Galactic Guardian
			["n"] = 82147,
			["e"] = 103214,
		},
		{ -- Heart of the Wild
			["n"] = 82231,
			["e"] = 103309,
		},
		{ -- Blood Frenzy
			["n"] = 82142,
			["e"] = 103209,
		},
		{ -- Renewal
			["n"] = 82232,
			["e"] = 103310,
		},
		{ -- Incarnation: Guardian of Ursoc
			["n"] = 82136,
			["e"] = 103201,
		},
		{ -- Innervate
			["n"] = 82243,
			["e"] = 103323,
		},
		{ -- Ursoc's Guidance
			["n"] = 82135,
			["e"] = 103199,
		},
		{ -- Nature's Vigil
			["n"] = 82244,
			["e"] = 103324,
		},
		{ -- Rage of the Sleeper
			["n"] = 82141,
			["e"] = 103207,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
	},
}

addonTable.DRUID_TALENTS = DRUID_TALENTS