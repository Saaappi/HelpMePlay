local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local PALADIN_TALENTS = {
	[65] = { -- Holy
	},
	[66] = { -- Protection
		{ -- Blessing of Freedom
			["n"] = 81600,
			["e"] = 102587,
		},
		{ -- Avenger's Shield
			["n"] = 81502,
			["e"] = 102471,
		},
		{ -- Hammer of Wrath
			["n"] = 81510,
			["e"] = 102479,
		},
		{ -- Blessed Hammer
			["n"] = 81469,
			["e"] = 102430,
		},
		{ -- Auras of Swift Vengeance
			["n"] = 81601,
			["e"] = 102588,
		},
		{ -- Redoubt
			["n"] = 81494,
			["e"] = 102462,
		},
		{ -- Blinding Light
			["n"] = 81598,
			["e"] = 102584,
		},
		{ -- Holy Shield
			["n"] = 81489,
			["e"] = 102455,
		},
		{ -- Divine Steed
			["n"] = 81632,
			["e"] = 102625,
		},
		{ -- Grand Crusader
			["n"] = 81487,
			["e"] = 102453,
		},
		{ -- Fist of Justice
			["n"] = 81602,
			["e"] = 102589,
		},
		{ -- Shining Light
			["n"] = 81498,
			["e"] = 102467,
		},
		{ -- Fist of Justice
			["n"] = 81602,
			["e"] = 102589,
		},
		{ -- Cleanse Toxins
			["n"] = 81507,
			["e"] = 102476,
		},
		{ -- Inspiring Vanguard
			["n"] = 81476,
			["e"] = 102439,
		},
		{ -- Cavalier
			["n"] = 81605,
			["e"] = 102592,
		},
		{ -- Ardent Defender
			["n"] = 81481,
			["e"] = 102445,
		},
		{ -- Seasoned Warhorse
			["n"] = 81631,
			["e"] = 102624,
		},
		{ -- Consecration in Flame
			["n"] = 81470,
			["e"] = 102432,
		},
		{ -- Greater Judgment
			["n"] = 81603,
			["e"] = 102590,
		},
		{ -- Bulwark of Order
			["n"] = 81499,
			["e"] = 102468,
		},
		{ -- Avenging Wrath - CHECK
			["n"] = 81606,
			["e"] = 102593,
		},
		{ -- Bulwark of Order
			["n"] = 81499,
			["e"] = 102468,
		},
		{ -- Rebuke
			["n"] = 81604,
			["e"] = 102591,
		},
		{ -- Strength in Adversity
			["n"] = 81493,
			["e"] = 102461,
		},
		{ -- Holy Aegis
			["n"] = 81609,
			["e"] = 102597,
		},
		{ -- Avenging Wrath - CHECK
			["n"] = 81483,
			["e"] = 102448,
		},
		{ -- Holy Aegis
			["n"] = 81609,
			["e"] = 102597,
		},
		{ -- Relentless Inquisitor
			["n"] = 81506,
			["e"] = 102475,
		},
		{ -- Judgment of Light
			["n"] = 81608,
			["e"] = 102596,
		},
		{ -- Tyr's Enforcer
			["n"] = 81474,
			["e"] = 102437,
		},
		{ -- Blessing of Protection
			["n"] = 81616,
			["e"] = 102604,
		},
		{ -- Tyr's Enforcer
			["n"] = 81474,
			["e"] = 102437,
		},
		{ -- Seal of Reprisal
			["n"] = 81629,
			["e"] = 102621,
		},
		{ -- Strength of Conviction
			["n"] = 81485,
			["e"] = 102450,
		},
		{ -- Seal of Reprisal
			["n"] = 81629,
			["e"] = 102621,
		},
		{ -- Strength of Conviction
			["n"] = 81485,
			["e"] = 102450,
		},
		{ -- Unbreakable Spirit
			["n"] = 81615,
			["e"] = 102603,
		},
		{ -- Bastion of Light
			["n"] = 81488,
			["e"] = 102454,
		},
		{ -- Incandescence
			["n"] = 81628,
			["e"] = 102620,
		},
		{ -- Guardian of Ancient Kings
			["n"] = 81490,
			["e"] = 102456,
		},
		{ -- Divine Purpose
			["n"] = 81618,
			["e"] = 102608,
		},
		{ -- Crusader's Judgment
			["n"] = 81473,
			["e"] = 102436,
		},
		{ -- Seal of Might
			["n"] = 81621,
			["e"] = 102612,
		},
		{ -- Soaring Shield
			["n"] = 81472,
			["e"] = 102434,
		},
		{ -- Seal of Might
			["n"] = 81621,
			["e"] = 102612,
		},
		{ -- Eye of Tyr
			["n"] = 81497,
			["e"] = 102466,
		},
		{ -- Seal of Alacrity
			["n"] = 81619,
			["e"] = 102609,
		},
		{ -- Righteous Protector
			["n"] = 81477,
			["e"] = 102440,
		},
		{ -- Seal of Alacrity
			["n"] = 81619,
			["e"] = 102609,
		},
		{ -- Righteous Protector
			["n"] = 81477,
			["e"] = 102440,
		},
		{ -- Ferren Marcus's Fervor
			["n"] = 81482,
			["e"] = 102446,
		},
		{ -- Seal of the Crusader
			["n"] = 81626,
			["e"] = 102617,
		},
		{ -- Ferren Marcus's Fervor
			["n"] = 81482,
			["e"] = 102446,
		},
		{ -- Seal of the Crusader
			["n"] = 81626,
			["e"] = 102617,
		},
		{ -- Divine Toll
			["n"] = 81496,
			["e"] = 102465,
		},
		{ -- Sanctuary - CHECK
			["n"] = 81486,
			["e"] = 102451,
		},
		{ -- Bulwark of Righteous Fury
			["n"] = 81491,
			["e"] = 102457,
		},
		{ -- Zealot's Paragon
			["n"] = 81625,
			["e"] = 102616,
		},
		{ -- Divine Resonance
			["n"] = 81479,
			["e"] = 102443,
		},
	},
	[70] = { -- Retribution
	},
}

addonTable.PALADIN_TALENTS = PALADIN_TALENTS