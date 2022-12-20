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
		{ -- Dispel Magic
			["n"] = 82715,
			["e"] = 103867,
		},
		{ -- Holy Word: Serenity
			["n"] = 82638,
			["e"] = 103775,
		},
		{ -- Shadowfiend
			["n"] = 82713,
			["e"] = 103865,
		},
		{ -- Prayer of Healing
			["n"] = 82631,
			["e"] = 103766,
		},
		{ -- Improved Flash Heal
			["n"] = 82714,
			["e"] = 103866,
		},
		{ -- Guardian Spirit
			["n"] = 82637,
			["e"] = 103774,
		},
		{ -- Psychic Voice
			["n"] = 82695,
			["e"] = 103845,
		},
		{ -- Holy Word: Chastise
			["n"] = 82639,
			["e"] = 103776,
		},
		{ -- Shadow Word: Death
			["n"] = 82712,
			["e"] = 103864,
		},
		{ -- Holy Word: Sanctify
			["n"] = 82632,
			["e"] = 103767,
		},
		{ -- Holy Nova
			["n"] = 82701,
			["e"] = 103851,
		},
		{ -- Guardian Angel
			["n"] = 82636,
			["e"] = 103773,
		},
		{ -- Protective Light
			["n"] = 82707,
			["e"] = 103858,
		},
		{ -- Censure
			["n"] = 82619,
			["e"] = 103753,
		},
		{ -- Angelic Feather
			["n"] = 82703,
			["e"] = 103853,
		},
		{ -- Burning Vehemence
			["n"] = 82640,
			["e"] = 103777,
		},
		{ -- Phantasm
			["n"] = 82556,
			["e"] = 103834,
		},
		{ -- Cosmic Ripple
			["n"] = 82630,
			["e"] = 103765,
		},
		{ -- Death and Madness
			["n"] = 82711,
			["e"] = 103863,
		},
		{ -- Renewed Faith
			["n"] = 82620,
			["e"] = 103754,
		},
		{ -- Blessed Recovery
			["n"] = 82720,
			["e"] = 103677,
		},
		{ -- Empyreal Blaze
			["n"] = 82607,
			["e"] = 103739,
		},
		{ -- Rhapsody
			["n"] = 82700,
			["e"] = 103850,
		},
		{ -- Trail of Light
			["n"] = 82634,
			["e"] = 103770,
		},
		{ -- Void Tendrils
			["n"] = 82708,
			["e"] = 103859,
		},
		{ -- Trail of Light
			["n"] = 82634,
			["e"] = 103770,
		},
		{ -- Words of the Pious
			["n"] = 82721,
			["e"] = 103873,
		},
		{ -- Enlightenment
			["n"] = 82618,
			["e"] = 103752,
		},
		{ -- Power Infusion
			["n"] = 82694,
			["e"] = 103844,
		},
		{ -- Everlasting Light
			["n"] = 82622,
			["e"] = 103756,
		},
		{ -- Tithe Evasion
			["n"] = 82688,
			["e"] = 103838,
		},
		{ -- Symbol of Hope
			["n"] = 82617,
			["e"] = 103751,
		},
		{ -- Inspiration
			["n"] = 82696,
			["e"] = 103846,
		},
		{ -- Crisis Management
			["n"] = 82627,
			["e"] = 103762,
		},
		{ -- Void Shield
			["n"] = 82692,
			["e"] = 103842,
		},
		{ -- Crisis Management
			["n"] = 82627,
			["e"] = 103762,
		},
		{ -- Unwavering Will
			["n"] = 82697,
			["e"] = 103847,
		},
		{ -- Prismatic Echoes
			["n"] = 82614,
			["e"] = 103748,
		},
		{ -- Unwavering Will
			["n"] = 82697,
			["e"] = 103847,
		},
		{ -- Prismatic Echoes
			["n"] = 82614,
			["e"] = 103748,
		},
		{ -- Twist of Fate
			["n"] = 82684,
			["e"] = 103833,
		},
		{ -- Apotheosis
			["n"] = 82610,
			["e"] = 103743,
		},
		{ -- Twist of Fate
			["n"] = 82684,
			["e"] = 103833,
		},
		{ -- Empowered Renew
			["n"] = 82612,
			["e"] = 103746,
		},
		{ -- Throes of Pain
			["n"] = 82709,
			["e"] = 103861,
		},
		{ -- Light of the Naaru
			["n"] = 82629,
			["e"] = 103764,
		},
		{ -- Throes of Pain
			["n"] = 82709,
			["e"] = 103861,
		},
		{ -- Light of the Naaru
			["n"] = 82629,
			["e"] = 103764,
		},
		{ -- Divine Star
			["n"] = 82682,
			["e"] = 103831,
		},
		{ -- Harmonious Apparatus
			["n"] = 82611,
			["e"] = 103744,
		},
		{ -- Translucent Image
			["n"] = 82685,
			["e"] = 103835,
		},
		{ -- Harmonious Apparatus
			["n"] = 82611,
			["e"] = 103744,
		},
		{ -- Mindgames
			["n"] = 82687,
			["e"] = 103837,
		},
		{ -- Searing Light
			["n"] = 82606,
			["e"] = 103738,
		},
		{ -- Crystalline Reflection
			["n"] = 82681,
			["e"] = 103829,
		},
		{ -- Searing Light
			["n"] = 82606,
			["e"] = 103738,
		},
		{ -- Crystalline Reflection
			["n"] = 82681,
			["e"] = 103829,
		},
		{ -- Divine Word
			["n"] = 82554,
			["e"] = 103675,
		},
		{ -- Improved Fade
			["n"] = 82686,
			["e"] = 103836,
		},
		{ -- Miracle Worker
			["n"] = 82605,
			["e"] = 103737,
		},
		{ -- Improved Fade
			["n"] = 82686,
			["e"] = 103836,
		},
	},
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
		{ -- Vampiric Embrace
			["n"] = 82691,
			["e"] = 103841,
		},
		{ -- Harnessed Shadows
			["n"] = 82647,
			["e"] = 103786,
		},
		{ -- Tithe Evasion
			["n"] = 82688,
			["e"] = 103838,
		},
		{ -- Improved Mass Dispel
			["n"] = 82698,
			["e"] = 103848,
		},
		{ -- Shadowy Insight
			["n"] = 82662,
			["e"] = 103805,
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
		{ -- Ancient Madness
			["n"] = 82656,
			["e"] = 103798,
		},
		{ -- Twist of Fate
			["n"] = 82684,
			["e"] = 103833,
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
		{ -- Dark Evangelism
			["n"] = 82660,
			["e"] = 103802,
		},
		{ -- Halo
			["n"] = 82680,
			["e"] = 103827,
		},
		{ -- Auspicious Spirits
			["n"] = 82667,
			["e"] = 103811,
		},
		{ -- Translucent Image
			["n"] = 82685,
			["e"] = 103835,
		},
		{ -- Mindbender
			["n"] = 82648,
			["e"] = 103788,
		},
		{ -- Mindgames
			["n"] = 82687,
			["e"] = 103837,
		},
		{ -- Mind Flay: Insanity
			["n"] = 82558,
			["e"] = 103681,
		},
		{ -- Crystalline Reflection
			["n"] = 82681,
			["e"] = 103829,
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
		{ -- Inescapable Torment
			["n"] = 82644,
			["e"] = 103783,
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
		{ -- Mind Devourer
			["n"] = 82561,
			["e"] = 103684,
		},
		{ -- Angelic Bulwark
			["n"] = 82675,
			["e"] = 103821,
		},
		{ -- Idol of Y'Shaarj
			["n"] = 82553,
			["e"] = 103787,
		},
		{ -- Shattered Perceptions
			["n"] = 82673,
			["e"] = 103819,
		},
		{ -- Idol of Yogg-Saron
			["n"] = 82555,
			["e"] = 103817,
		},
	},
}

addonTable.PRIEST_TALENTS = PRIEST_TALENTS