local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DEMON_HUNTER_TALENTS = {
	[577] = { -- Havoc
		{ -- Blazing Path
			["n"] = 91008,
			["e"] = 112928,
		},
		{ -- Eye Beam
			["n"] = 91018,
			["e"] = 112939,
		},
		{ -- Sigil of Flame
			["n"] = 90943,
			["e"] = 112854,
		},
		{ -- Improved Chaos Strike
			["n"] = 91030,
			["e"] = 112953,
		},
		{ -- Unrestrained Fury
			["n"] = 90941,
			["e"] = 112852,
		},
		{ -- Demon Blades
			["n"] = 91019,
			["e"] = 112940,
		},
		{ -- Unrestrained Fury
			["n"] = 90941,
			["e"] = 112852,
		},
		{ -- Demonic Appetite
			["n"] = 90914,
			["e"] = 112823,
		},
		{ -- Imprison
			["n"] = 91007,
			["e"] = 112927,
		},
		{ -- First Blood
			["n"] = 90925,
			["e"] = 112834,
		},
		{ -- Vengeful Bonds
			["n"] = 90930,
			["e"] = 112840,
		},
		{ -- Critical Chaos
			["n"] = 91028,
			["e"] = 112951,
		},
		{ -- Improved Disrupt
			["n"] = 90938,
			["e"] = 112849,
		},
		{ -- Critical Chaos
			["n"] = 91028,
			["e"] = 112951,
		},
		{ -- Bouncing Glaives
			["n"] = 90931,
			["e"] = 112841,
		},
		{ -- Dancing with Fate
			["n"] = 91015,
			["e"] = 112936,
		},
		{ -- Consume Magic
			["n"] = 91006,
			["e"] = 112926,
		},
		{ -- Dancing with Fate
			["n"] = 91015,
			["e"] = 112936,
		},
		{ -- Pursuit
			["n"] = 90940,
			["e"] = 112851,
		},
		{ -- Initiative
			["n"] = 91027,
			["e"] = 112950,
		},
		{ -- Felblade
			["n"] = 90932,
			["e"] = 112842,
		},
		{ -- Chaotic Transformation
			["n"] = 90922,
			["e"] = 112831,
		},
		{ -- Charred Warblades
			["n"] = 90948,
			["e"] = 112861,
		},
		{ -- Fel Eruption
			["n"] = 91014,
			["e"] = 112935,
		},
		{ -- Felfire Haste
			["n"] = 90939,
			["e"] = 112850,
		},
		{ -- Trail of Ruin
			["n"] = 90915,
			["e"] = 112824,
		},
		{ -- Master of the Glaive
			["n"] = 90994,
			["e"] = 112912,
		},
		{ -- Unbound Chaos
			["n"] = 91020,
			["e"] = 112942,
		},
		{ -- Rush of Chaos
			["n"] = 90933,
			["e"] = 112844,
		},
		{ -- Unbound Chaos
			["n"] = 91020,
			["e"] = 112942,
		},
		{ -- Chaos Nova
			["n"] = 90993,
			["e"] = 112911,
		},
		{ -- Blind Fury
			["n"] = 91026,
			["e"] = 112949,
		},
		{ -- Soul Rending
			["n"] = 90936,
			["e"] = 112847,
		},
		{ -- Blind Fury
			["n"] = 91026,
			["e"] = 112949,
		},
		{ -- Soul Rending
			["n"] = 90936,
			["e"] = 112847,
		},
		{ -- Looks Can Kill
			["n"] = 90921,
			["e"] = 112830,
		},
		{ -- Unleashed Power
			["n"] = 90992,
			["e"] = 112909,
		},
		{ -- Tactical Retreat
			["n"] = 91022,
			["e"] = 112944,
		},
		{ -- Illidari Knowledge
			["n"] = 90935,
			["e"] = 112846,
		},
		{ -- Furious Gaze
			["n"] = 91025,
			["e"] = 112948,
		},
		{ -- Illidari Knowledge
			["n"] = 90935,
			["e"] = 112846,
		},
		{ -- Chaos Theory
			["n"] = 91035,
			["e"] = 112958,
		},
		{ -- Demonic
			["n"] = 91003,
			["e"] = 112923,
		},
		{ -- Inner Demon
			["n"] = 91009,
			["e"] = 112929,
		},
		{ -- Internal Struggle
			["n"] = 90934,
			["e"] = 112845,
		},
		{ -- Know Your Enemy
			["n"] = 91034,
			["e"] = 112957,
		},
		{ -- Darkness
			["n"] = 91002,
			["e"] = 112921,
		},
		{ -- Know Your Enemy
			["n"] = 91034,
			["e"] = 112957,
		},
		{ -- Soul Sigils
			["n"] = 90929,
			["e"] = 112839,
		},
		{ -- Glaive Tempest
			["n"] = 91023,
			["e"] = 112946,
		},
		{ -- Erratic Felheart
			["n"] = 90996,
			["e"] = 112914,
		},
		{ -- Cycle of Hatred
			["n"] = 91032,
			["e"] = 112955,
		},
		{ -- Erratic Felheart
			["n"] = 90996,
			["e"] = 112914,
		},
		{ -- Cycle of Hatred
			["n"] = 91032,
			["e"] = 112955,
		},
		{ -- Pitch Black
			["n"] = 91001,
			["e"] = 112919,
		},
		{ -- Fodder to the Flame
			["n"] = 91010,
			["e"] = 112931,
		},
		{ -- The Hunt
			["n"] = 90927,
			["e"] = 112837,
		},
		{ -- Essence Break
			["n"] = 91033,
			["e"] = 112956,
		},
		{ -- Collective Anguish
			["n"] = 90995,
			["e"] = 112913,
		},
		{ -- Shattered Destiny
			["n"] = 91031,
			["e"] = 112954,
		},
		{ -- Unnatural Malice
			["n"] = 90926,
			["e"] = 112836,
		},
	},
	[581] = { -- Vengeance
	},
}

addonTable.DEMON_HUNTER_TALENTS = DEMON_HUNTER_TALENTS