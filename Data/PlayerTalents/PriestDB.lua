local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local PRIEST_TALENTS = {
	[256] = { -- Discipline
		{ -- Improved Flash Heal
			["n"] = 82714,
			["e"] = 103866,
		},
		{ -- Atonement
			["n"] = 82594,
			["e"] = 103723,
		},
		{ -- Psychic Voice
			["n"] = 82695,
			["e"] = 103845,
		},
		{ -- Power Word: Radiance
			["n"] = 82593,
			["e"] = 103722,
		},
		{ -- Shadow Word: Death
			["n"] = 82712,
			["e"] = 103864,
		},
		{ -- Pain Suppression
			["n"] = 82587,
			["e"] = 103713,
		},
		{ -- Holy Nova
			["n"] = 82701,
			["e"] = 103851,
		},
		{ -- Power of the Dark Side
			["n"] = 82595,
			["e"] = 103724,
		},
		{ -- Protective Light
			["n"] = 82707,
			["e"] = 103858,
		},
		{ -- Light's Promise
			["n"] = 82592,
			["e"] = 103721,
		},
		{ -- Angelic Feather
			["n"] = 82703,
			["e"] = 103853,
		},
		{ -- Make Amends
			["n"] = 92225,
			["e"] = 108225,
		},
		{ -- Death and Madness
			["n"] = 82711,
			["e"] = 103863,
		},
		{ -- Dark Indulgence
			["n"] = 82596,
			["e"] = 103725,
		},
		{ -- Blessed Recovery
			["n"] = 82720,
			["e"] = 103677,
		},
		{ -- Schism
			["n"] = 82579,
			["e"] = 103704,
		},
		{ -- Rhapsody
			["n"] = 82700,
			["e"] = 103850,
		},
		{ -- Bright Pupil
			["n"] = 82591,
			["e"] = 103720,
		},
		{ -- Void Tendrils
			["n"] = 82708,
			["e"] = 103859,
		},
		{ -- Shield Discipline
			["n"] = 82589,
			["e"] = 103717,
		},
		{ -- Words of the Pious
			["n"] = 82721,
			["e"] = 103873,
		},
		{ -- Power Word: Barrier
			["n"] = 82564,
			["e"] = 103687,
		},
		{ -- Power Infusion
			["n"] = 82694,
			["e"] = 103844,
		},
		{ -- Painful Punishment
			["n"] = 82597,
			["e"] = 103726,
		},
		{ -- Tithe Evasion
			["n"] = 82688,
			["e"] = 103838,
		},
		{ -- Purge the Wicked
			["n"] = 82590,
			["e"] = 103718,
		},
		{ -- Body and Soul
			["n"] = 82706,
			["e"] = 103856,
		},
		{ -- Rapture
			["n"] = 82598,
			["e"] = 103727,
		},
		{ -- Void Shield
			["n"] = 82692,
			["e"] = 103842,
		},
		{ -- Revel in Purity
			["n"] = 82566,
			["e"] = 103690,
		},
		{ -- Unwavering Will
			["n"] = 82697,
			["e"] = 103847,
		},
		{ -- Pain and Suffering
			["n"] = 82578,
			["e"] = 103703,
		},
		{ -- Unwavering Will
			["n"] = 82697,
			["e"] = 103847,
		},
		{ -- Pain and Suffering
			["n"] = 82578,
			["e"] = 103703,
		},
		{ -- Twist of Fate
			["n"] = 82684,
			["e"] = 103833,
		},
		{ -- Castigation
			["n"] = 82577,
			["e"] = 103702,
		},
		{ -- Twist of Fate
			["n"] = 82684,
			["e"] = 103833,
		},
		{ -- Stolen Psyche
			["n"] = 82583,
			["e"] = 103709,
		},
		{ -- Throes of Pain
			["n"] = 82709,
			["e"] = 103861,
		},
		{ -- Stolen Psyche
			["n"] = 82583,
			["e"] = 103709,
		},
		{ -- Throes of Pain
			["n"] = 82709,
			["e"] = 103861,
		},
		{ -- Lenience
			["n"] = 82567,
			["e"] = 103692,
		},
		{ -- Angel's Mercy
			["n"] = 82678,
			["e"] = 103825,
		},
		{ -- Mindbender
			["n"] = 82584,
			["e"] = 103710,
		},
		{ -- Divine Star
			["n"] = 82682,
			["e"] = 103831,
		},
		{ -- Harsh Discipline
			["n"] = 82572,
			["e"] = 103697,
		},
		{ -- Translucent Image
			["n"] = 82685,
			["e"] = 103835,
		},
		{ -- Harsh Discipline
			["n"] = 82572,
			["e"] = 103697,
		},
		{ -- Mindgames
			["n"] = 82687,
			["e"] = 103837,
		},
		{ -- Expiation
			["n"] = 82585,
			["e"] = 103711,
		},
		{ -- Crystalline Reflection
			["n"] = 82681,
			["e"] = 103829,
		},
		{ -- Expiation
			["n"] = 82585,
			["e"] = 103711,
		},
		{ -- Crystalline Reflection
			["n"] = 82681,
			["e"] = 103829,
		},
		{ -- Inescapable Torment
			["n"] = 82586,
			["e"] = 103712,
		},
		{ -- Manipulation
			["n"] = 82672,
			["e"] = 103818,
		},
		{ -- Inescapable Torment
			["n"] = 82586,
			["e"] = 103712,
		},
		{ -- Manipulation
			["n"] = 82672,
			["e"] = 103818,
		},
		{ -- Twilight Equilibrium
			["n"] = 82571,
			["e"] = 103696,
		},
		{ -- Angelic Bulwark
			["n"] = 82675,
			["e"] = 103821,
		},
		{ -- Void Summoner
			["n"] = 82570,
			["e"] = 103695,
		},
		{ -- Shattered Perceptions
			["n"] = 82673,
			["e"] = 103819,
		},
	},
	[257] = { -- Holy
	},
	[258] = { -- Shadow
	},
}

addonTable.PRIEST_TALENTS = PRIEST_TALENTS