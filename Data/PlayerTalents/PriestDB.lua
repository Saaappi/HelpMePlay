local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local PRIEST_TALENTS = {
	[258] = { -- Shadow
		{ -- Dispel Magic
			["n"] = 82715,
			["e"] = 103867,
		},
		{ -- Devouring Plague
			["n"] = 82665,
			["e"] = 103808,
		},
		{ -- Improved Flash Heal
			["n"] = 82714,
			["e"] = 103866,
		},
		{ -- Dispersion
			["n"] = 82663,
			["e"] = 103806,
		},
		{ -- Psychic Voice
			["n"] = 82695,
			["e"] = 103845,
		},
		{ -- Shadowy Apparitions
			["n"] = 82666,
			["e"] = 103809,
		},
		{ -- Protective Light
			["n"] = 82707,
			["e"] = 103858,
		},
		{ -- Silence
			["n"] = 82651,
			["e"] = 103792,
		},
		{ -- Angelic Feather
			["n"] = 82703,
			["e"] = 103853,
		},
		{ -- Misery
			["n"] = 82650,
			["e"] = 103791,
		},
		{ -- Phantasm
			["n"] = 82556,
			["e"] = 103834,
		},
		{ -- Coalescing Shadows
			["n"] = 82653,
			["e"] = 103795,
		},
		{ -- Death and Madness
			["n"] = 82711,
			["e"] = 103863,
		},
		{ -- Mind Sear
			["n"] = 82664,
			["e"] = 103807,
		},
		{ -- Leap of Faith
			["n"] = 82716,
			["e"] = 103868,
		},
		{ -- Mind Spike
			["n"] = 82668,
			["e"] = 103812,
		},
		{ -- Void Tendrils
			["n"] = 82708,
			["e"] = 103859,
		},
		{ -- Puppet Master
			["n"] = 82646,
			["e"] = 103785,
		},
		{ -- Mass Dispel
			["n"] = 82699,
			["e"] = 103849,
		},
		{ -- Dark Ascension
			["n"] = 82657,
			["e"] = 103680,
		},
		{ -- Power Infusion
			["n"] = 82694,
			["e"] = 103844,
		},
		{ -- Surge of Darkness
			["n"] = 82669,
			["e"] = 103813,
		},
		{ -- Sanguine Teachings
			["n"] = 82691,
			["e"] = 114735,
		},
		{ -- Harnessed Shadows
			["n"] = 82647,
			["e"] = 103786,
		},
		{ -- Tithe Evasion
			["n"] = 82688,
			["e"] = 103838,
		},
		{ -- Shadowy Insight
			["n"] = 82662,
			["e"] = 103805,
		},
		{ -- Improved Mass Dispel
			["n"] = 82698,
			["e"] = 103848,
		},
		{ -- Ancient Madness
			["n"] = 82656,
			["e"] = 103798,
		},
		{ -- Twins of the Sun Priestess
			["n"] = 82683,
			["e"] = 103832,
		},
		{ -- Ancient Madness
			["n"] = 82656,
			["e"] = 103798,
		},
		{ -- San'layn
			["n"] = 82690,
			["e"] = 103840,
		},
		{ -- Shadow Crash
			["n"] = 82557,
			["e"] = 103803,
		},
		{ -- Twist of Fate
			["n"] = 82684,
			["e"] = 103833,
		},
		{ -- Mind Melt
			["n"] = 82559,
			["e"] = 103682,
		},
		{ -- Twist of Fate
			["n"] = 82684,
			["e"] = 103833,
		},
		{ -- Dark Evangelism
			["n"] = 82660,
			["e"] = 103802,
		},
		{ -- Throes of Pain
			["n"] = 82709,
			["e"] = 103861,
		},
		{ -- Dark Evangelism
			["n"] = 82660,
			["e"] = 103802,
		},
		{ -- Throes of Pain
			["n"] = 82709,
			["e"] = 103861,
		},
		{ -- Auspicious Spirits
			["n"] = 82667,
			["e"] = 103811,
		},
		{ -- Halo
			["n"] = 82680,
			["e"] = 103827,
		},
		{ -- Mindbender
			["n"] = 82648,
			["e"] = 103788,
		},
		{ -- Translucent Image
			["n"] = 82685,
			["e"] = 103835,
		},
		{ -- Mind Flay: Insanity
			["n"] = 82558,
			["e"] = 103681,
		},
		{ -- Mindgames
			["n"] = 82687,
			["e"] = 103837,
		},
		{ -- Encroaching Shadows
			["n"] = 82562,
			["e"] = 103685,
		},
		{ -- Crystalline Reflection
			["n"] = 82681,
			["e"] = 103829,
		},
		{ -- Void Torrent
			["n"] = 82654,
			["e"] = 103679,
		},
		{ -- Crystalline Reflection
			["n"] = 82681,
			["e"] = 103829,
		},
		{ -- Inescapable Torment
			["n"] = 82644,
			["e"] = 103783,
		},
		{ -- Improved Fade
			["n"] = 82686,
			["e"] = 103836,
		},
		{ -- Inescapable Torment
			["n"] = 82644,
			["e"] = 103783,
		},
		{ -- Improved Fade
			["n"] = 82686,
			["e"] = 103836,
		},
		{ -- Mind Devourer
			["n"] = 82561,
			["e"] = 103684,
		},
		{ -- Manipulation
			["n"] = 82672,
			["e"] = 103818,
		},
		{ -- Mind Devourer
			["n"] = 82561,
			["e"] = 103684,
		},
		{ -- Manipulation
			["n"] = 82672,
			["e"] = 103818,
		},
		{ -- Idol of Y'Shaarj
			["n"] = 82553,
			["e"] = 103787,
		},
		{ -- Angelic Bulwark
			["n"] = 82675,
			["e"] = 103821,
		},
		{ -- Idol of Yogg-Saron
			["n"] = 82555,
			["e"] = 103817,
		},
		{ -- Shattered Perceptions
			["n"] = 82673,
			["e"] = 103819,
		},
	},
}

addonTable.PRIEST_TALENTS = PRIEST_TALENTS