local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local PALADIN_TALENTS = {
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
		{ -- Avenging Wrath
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
		{ -- Avenging Wrath
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
		{ -- Sanctified Wrath
			["n"] = 81620,
			["e"] = 102611,
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
		{ -- Lay on Hands
			["n"] = 81597,
			["e"] = 102583,
		},
		{ -- Blade of Justice
			["n"] = 81526,
			["e"] = 102498,
		},
		{ -- Blinding Light
			["n"] = 81598,
			["e"] = 102584,
		},
		{ -- Divine Storm
			["n"] = 81529,
			["e"] = 102501,
		},
		{ -- Divine Steed
			["n"] = 81632,
			["e"] = 102625,
		},
		{ -- Art of War
			["n"] = 81547,
			["e"] = 102523,
		},
		{ -- Fist of Justice
			["n"] = 81602,
			["e"] = 102589,
		},
		{ -- Improved Crusader Strike
			["n"] = 81528,
			["e"] = 102500,
		},
		{ -- Fist of Justice
			["n"] = 81602,
			["e"] = 102589,
		},
		{ -- Holy Crusader
			["n"] = 81527,
			["e"] = 102499,
		},
		{ -- Cavalier
			["n"] = 81605,
			["e"] = 102592,
		},
		{ -- Holy Blade
			["n"] = 81546,
			["e"] = 102522,
		},
		{ -- Seasoned Warhorse
			["n"] = 81631,
			["e"] = 102624,
		},
		{ -- Empyrean Power
			["n"] = 81532,
			["e"] = 102504,
		},
		{ -- Greater Judgment
			["n"] = 81603,
			["e"] = 102590,
		},
		{ -- Shield of Vengeance
			["n"] = 81545,
			["e"] = 102521,
		},
		{ -- Holy Aegis
			["n"] = 81609,
			["e"] = 102597,
		},
		{ -- Blade of Wrath
			["n"] = 81521,
			["e"] = 102491,
		},
		{ -- Holy Aegis
			["n"] = 81609,
			["e"] = 102597,
		},
		{ -- Highlord's Judgment
			["n"] = 81533,
			["e"] = 102505,
		},
		{ -- Avenging Wrath
			["n"] = 81606,
			["e"] = 102593,
		},
		{ -- Highlord's Judgment
			["n"] = 81533,
			["e"] = 102505,
		},
		{ -- Rebuke
			["n"] = 81604,
			["e"] = 102591,
		},
		{ -- Sanctify
			["n"] = 81544,
			["e"] = 102519,
		},
		{ -- Golden Path
			["n"] = 81610,
			["e"] = 102598,
		},
		{ -- Wake of Ashes
			["n"] = 81524,
			["e"] = 102495,
		},
		{ -- Judgment of Light
			["n"] = 81608,
			["e"] = 102596,
		},
		{ -- Consecrated Blade
			["n"] = 81553,
			["e"] = 102531,
		},
		{ -- Blessing of Protection
			["n"] = 81616,
			["e"] = 102604,
		},
		{ -- Boundless Judgment
			["n"] = 81534,
			["e"] = 102506,
		},
		{ -- Seal of Reprisal
			["n"] = 81629,
			["e"] = 102621,
		},
		{ -- Sanctification
			["n"] = 81543,
			["e"] = 102518,
		},
		{ -- Seal of Reprisal
			["n"] = 81629,
			["e"] = 102621,
		},
		{ -- Radiant Decree
			["n"] = 81523,
			["e"] = 102493,
		},
		{ -- Afterimage
			["n"] = 81613,
			["e"] = 102601,
		},
		{ -- Avenging Wrath
			["n"] = 81525,
			["e"] = 102497,
		},
		{ -- Unbreakable Spirit
			["n"] = 81615,
			["e"] = 102603,
		},
		{ -- Zeal
			["n"] = 81552,
			["e"] = 102530,
		},
		{ -- Incandescence
			["n"] = 81628,
			["e"] = 102620,
		},
		{ -- Exorcism
			["n"] = 81542,
			["e"] = 102516,
		},
		{ -- Aspiration of Divinity
			["n"] = 81622,
			["e"] = 102613,
		},
		{ -- Healing Hands
			["n"] = 81551,
			["e"] = 102527,
		},
		{ -- Aspiration of Divinity
			["n"] = 81622,
			["e"] = 102613,
		},
		{ -- Tempest of the Lightbringer
			["n"] = 81512,
			["e"] = 102481,
		},
		{ -- Divine Purpose
			["n"] = 81618,
			["e"] = 102608,
		},
		{ -- Ashes to Ashes
			["n"] = 81550,
			["e"] = 102526,
		},
		{ -- Hallowed Ground
			["n"] = 81509,
			["e"] = 102478,
		},
		{ -- Ashes to Ashes
			["n"] = 81550,
			["e"] = 102526,
		},
		{ -- Of Dusk and Dawn
			["n"] = 81624,
			["e"] = 102615,
		},
		{ -- Divine Toll
			["n"] = 81539,
			["e"] = 102513,
		},
		{ -- Seal of Might
			["n"] = 81621,
			["e"] = 102612,
		},
		{ -- Empyrean Legacy
			["n"] = 81511,
			["e"] = 102480,
		},
		{ -- Seal of Might
			["n"] = 81621,
			["e"] = 102612,
		},
		{ -- Virtuous Command
			["n"] = 81549,
			["e"] = 102525,
		},
		{ -- Seal of Alacrity
			["n"] = 81619,
			["e"] = 102609,
		},
		{ -- Virtuous Command
			["n"] = 81549,
			["e"] = 102525,
		},
		{ -- Seal of Alacrity
			["n"] = 81619,
			["e"] = 102609,
		},
		{ -- Divine Resonance
			["n"] = 81538,
			["e"] = 102512,
		},
		{ -- Seal of Order
			["n"] = 81623,
			["e"] = 102614,
		},
		{ -- Final Reckoning
			["n"] = 81548,
			["e"] = 102524,
		},
		{ -- Sanctified Wrath
			["n"] = 81620,
			["e"] = 102611,
		},
	},
}

addonTable.PALADIN_TALENTS = PALADIN_TALENTS