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
		{ -- Vengeful Retreat
			["n"] = 90942,
			["e"] = 112853,
		},
		{ -- Fel Devastation
			["n"] = 90991,
			["e"] = 112908,
		},
		{ -- Blazing Path
			["n"] = 91008,
			["e"] = 112928,
		},
		{ -- Frailty
			["n"] = 90990,
			["e"] = 112907,
		},
		{ -- Imprison
			["n"] = 91007,
			["e"] = 112927,
		},
		{ -- Fiery Brand
			["n"] = 90951,
			["e"] = 112864,
		},
		{ -- Shattered Restoration
			["n"] = 90950,
			["e"] = 112863,
		},
		{ -- Perfectly Balanced Glaive
			["n"] = 90968,
			["e"] = 112883,
		},
		{ -- Shattered Restoration
			["n"] = 90950,
			["e"] = 112863,
		},
		{ -- Deflecting Spikes
			["n"] = 90989,
			["e"] = 112906,
		},
		{ -- Improved Disrupt
			["n"] = 90938,
			["e"] = 112849,
		},
		{ -- Meteoric Strikes
			["n"] = 90953,
			["e"] = 112866,
		},
		{ -- Consume Magic
			["n"] = 91006,
			["e"] = 112926,
		},
		{ -- Fracture
			["n"] = 90970,
			["e"] = 112885,
		},
		{ -- Pursuit
			["n"] = 90940,
			["e"] = 112851,
		},
		{ -- Sigil of Silence
			["n"] = 90988,
			["e"] = 112904,
		},
		{ -- Felblade
			["n"] = 90932,
			["e"] = 112842,
		},
		{ -- Agonizing Flames
			["n"] = 90971,
			["e"] = 112887,
		},
		{ -- Charred Warblades
			["n"] = 90948,
			["e"] = 112861,
		},
		{ -- Agonizing Flames
			["n"] = 90971,
			["e"] = 112887,
		},
		{ -- Felfire Haste
			["n"] = 90939,
			["e"] = 112850,
		},
		{ -- Burning Blood
			["n"] = 90987,
			["e"] = 112903,
		},
		{ -- Rush of Chaos
			["n"] = 90933,
			["e"] = 112844,
		},
		{ -- Burning Blood
			["n"] = 90987,
			["e"] = 112903,
		},
		{ -- Chaos Nova
			["n"] = 90993,
			["e"] = 112911,
		},
		{ -- Void Reaver
			["n"] = 90977,
			["e"] = 112893,
		},
		{ -- Soul Rending
			["n"] = 90936,
			["e"] = 112847,
		},
		{ -- Fallout
			["n"] = 90972,
			["e"] = 112888,
		},
		{ -- Soul Rending
			["n"] = 90936,
			["e"] = 112847,
		},
		{ -- Volatile Flameblood
			["n"] = 90986,
			["e"] = 112902,
		},
		{ -- Infernal Armor
			["n"] = 91004,
			["e"] = 112924,
		},
		{ -- Soul Furnace
			["n"] = 90974,
			["e"] = 112890,
		},
		{ -- Infernal Armor
			["n"] = 91004,
			["e"] = 112924,
		},
		{ -- Darkglare Boon
			["n"] = 90985,
			["e"] = 112901,
		},
		{ -- Illidari Knowledge
			["n"] = 90935,
			["e"] = 112846,
		},
		{ -- Darkglare Boon
			["n"] = 90985,
			["e"] = 112901,
		},
		{ -- Illidari Knowledge
			["n"] = 90935,
			["e"] = 112846,
		},
		{ -- Fiery Demise
			["n"] = 90958,
			["e"] = 112872,
		},
		{ -- Demonic
			["n"] = 91003,
			["e"] = 112923,
		},
		{ -- Fiery Demise
			["n"] = 90958,
			["e"] = 112872,
		},
		{ -- Will of the Illidari
			["n"] = 91000,
			["e"] = 112918,
		},
		{ -- Focused Cleave
			["n"] = 90975,
			["e"] = 112891,
		},
		{ -- Will of the Illidari
			["n"] = 91000,
			["e"] = 112918,
		},
		{ -- Burning Alive
			["n"] = 90959,
			["e"] = 112873,
		},
		{ -- Internal Struggle
			["n"] = 90934,
			["e"] = 112845,
		},
		{ -- Vulnerability
			["n"] = 90981,
			["e"] = 112897,
		},
		{ -- Soul Sigils
			["n"] = 90929,
			["e"] = 112839,
		},
		{ -- Vulnerability
			["n"] = 90981,
			["e"] = 112897,
		},
		{ -- Aldrachi Design
			["n"] = 90999,
			["e"] = 112917,
		},
		{ -- Charred Flesh
			["n"] = 90962,
			["e"] = 112877,
		},
		{ -- Erratic Felheart
			["n"] = 90996,
			["e"] = 112914,
		},
		{ -- Charred Flesh
			["n"] = 90962,
			["e"] = 112877,
		},
		{ -- Erratic Felheart
			["n"] = 90996,
			["e"] = 112914,
		},
		{ -- Soulcrush
			["n"] = 90980,
			["e"] = 112896,
		},
		{ -- The Hunt
			["n"] = 90927,
			["e"] = 112837,
		},
		{ -- Soul Carver
			["n"] = 90982,
			["e"] = 112898,
		},
		{ -- Extended Sigils
			["n"] = 90998,
			["e"] = 112916,
		},
		{ -- Fodder to the Flame
			["n"] = 90960,
			["e"] = 112875,
		},
		{ -- Collective Anguish
			["n"] = 90995,
			["e"] = 112913,
		},
		{ -- Down in Flames
			["n"] = 90961,
			["e"] = 112876,
		},
		{ -- Relentless Pursuit
			["n"] = 90926,
			["e"] = 112835,
		},
	},
}

addonTable.DEMON_HUNTER_TALENTS = DEMON_HUNTER_TALENTS