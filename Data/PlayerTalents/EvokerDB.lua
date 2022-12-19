local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local EVOKER_TALENTS = {
	[1467] = { -- Devastation
		{ -- Obsidian Scales
			["n"] = 68675,
			["e"] = 87702,
		},
		{ -- Pyre
			["n"] = 68644,
			["e"] = 87669,
		},
		{ -- Expunge
			["n"] = 68689,
			["e"] = 87716,
		},
		{ -- Ruby Essence Burst
			["n"] = 68645,
			["e"] = 87670,
		},
		{ -- Natural Convergence
			["n"] = 68682,
			["e"] = 87709,
		},
		{ -- Azure Essence Burst
			["n"] = 68643,
			["e"] = 87668,
		},
		{ -- Permeating Chill
			["n"] = 68676,
			["e"] = 87703,
		},
		{ -- Dense Energy
			["n"] = 68646,
			["e"] = 87671,
		},
		{ -- Verdant Embrace
			["n"] = 68688,
			["e"] = 87715,
		},
		{ -- Inner Radiance
			["n"] = 68642,
			["e"] = 87666,
		},
		{ -- Forger of Mountains
			["n"] = 68569,
			["e"] = 87584,
		},
		{ -- Eternity Surge
			["n"] = 68623,
			["e"] = 87647,
		},
		{ -- Obsidian Bulwark
			["n"] = 68674,
			["e"] = 87701,
		},
		{ -- Volatility
			["n"] = 68647,
			["e"] = 87672,
		},
		{ -- Enkindled
			["n"] = 68677,
			["e"] = 87704,
		},
		{ -- Volatility
			["n"] = 68647,
			["e"] = 87672,
		},
		{ -- Enkindled
			["n"] = 68677,
			["e"] = 87704,
		},
		{ -- Dragonrage
			["n"] = 68641,
			["e"] = 87665,
		},
		{ -- Scarlet Adaptation
			["n"] = 68687,
			["e"] = 87714,
		},
		{ -- Arcane Intensity
			["n"] = 68622,
			["e"] = 87646,
		},
		{ -- Quell
			["n"] = 68665,
			["e"] = 87692,
		},
		{ -- Arcane Intensity
			["n"] = 68622,
			["e"] = 87646,
		},
		{ -- Heavy Wingbeats
			["n"] = 68570,
			["e"] = 87586,
		},
		{ -- Engulfing Blaze
			["n"] = 68648,
			["e"] = 87673,
		},
		{ -- Tailwind
			["n"] = 68678,
			["e"] = 87705,
		},
		{ -- Animosity
			["n"] = 68640,
			["e"] = 87664,
		},
		{ -- Instinctive Arcana
			["n"] = 68666,
			["e"] = 87693,
		},
		{ -- Essence Attunement
			["n"] = 68625,
			["e"] = 87649,
		},
		{ -- Instinctive Arcana
			["n"] = 68666,
			["e"] = 87693,
		},
		{ -- Heat Wave
			["n"] = 68637,
			["e"] = 87661,
		},
		{ -- Tip the Scales
			["n"] = 68686,
			["e"] = 87713,
		},
		{ -- Heat Wave
			["n"] = 68637,
			["e"] = 87661,
		},
		{ -- Draconic Legacy
			["n"] = 68685,
			["e"] = 87712,
		},
		{ -- Eternity's Span
			["n"] = 68621,
			["e"] = 87645,
		},
		{ -- Draconic Legacy
			["n"] = 68685,
			["e"] = 87712,
		},
		{ -- Causality
			["n"] = 68617,
			["e"] = 87639,
		},
		{ -- Extended Flight
			["n"] = 68679,
			["e"] = 87706,
		},
		{ -- Catalyze
			["n"] = 68636,
			["e"] = 87660,
		},
		{ -- Extended Flight
			["n"] = 68679,
			["e"] = 87706,
		},
		{ -- Tyranny
			["n"] = 68638,
			["e"] = 87662,
		},
		{ -- Blast Furnace
			["n"] = 68667,
			["e"] = 87694,
		},
		{ -- Charged Blast
			["n"] = 68627,
			["e"] = 87651,
		},
		{ -- Blast Furnace
			["n"] = 68667,
			["e"] = 87694,
		},
		{ -- Shattering Star
			["n"] = 68618,
			["e"] = 87641,
		},
		{ -- Exuberance
			["n"] = 68573,
			["e"] = 87589,
		},
		{ -- Font of Magic
			["n"] = 68632,
			["e"] = 87656,
		},
		{ -- Walloping Blow
			["n"] = 68657,
			["e"] = 87684,
		},
		{ -- Spellweaver's Dominance
			["n"] = 68628,
			["e"] = 87652,
		},
		{ -- Panacea
			["n"] = 68680,
			["e"] = 87707,
		},
		{ -- Focusing Iris
			["n"] = 68619,
			["e"] = 87643,
		},
		{ -- Protracted Talons
			["n"] = 68661,
			["e"] = 87688,
		},
		{ -- Burnout
			["n"] = 68633,
			["e"] = 87657,
		},
		{ -- Renewing Blaze
			["n"] = 68653,
			["e"] = 87679,
		},
		{ -- Burnout
			["n"] = 68633,
			["e"] = 87657,
		},
		{ -- Leaping Flames
			["n"] = 68662,
			["e"] = 87689,
		},
		{ -- Scintillation
			["n"] = 68629,
			["e"] = 87653,
		},
		{ -- Fire Within
			["n"] = 68654,
			["e"] = 87680,
		},
		{ -- Scintillation
			["n"] = 68629,
			["e"] = 87653,
		},
		{ -- Terror of the Skies
			["n"] = 68649,
			["e"] = 87675,
		},
		{ -- Feed the Flames
			["n"] = 68615,
			["e"] = 87637,
		},
		{ -- Zephyr
			["n"] = 68655,
			["e"] = 87682,
		},
	},
	[1468] = { -- Preservation
		{ -- Obsidian Scales
			["n"] = 68675,
			["e"] = 87702,
		},
		{ -- Echo
			["n"] = 68607,
			["e"] = 87628,
		},
		{ -- Permeating Chill
			["n"] = 68676,
			["e"] = 87703,
		},
		{ -- Dream Breath
			["n"] = 68606,
			["e"] = 87627,
		},
		{ -- Verdant Embrace
			["n"] = 68688,
			["e"] = 87715,
		},
		{ -- Reversion
			["n"] = 68608,
			["e"] = 87629,
		},
		{ -- Innate Magic
			["n"] = 68683,
			["e"] = 87710,
		},
		{ -- Temporal Compression
			["n"] = 68605,
			["e"] = 87626,
		},
		{ -- Innate Magic
			["n"] = 68683,
			["e"] = 87710,
		},
		{ -- Essence Burst
			["n"] = 68609,
			["e"] = 87630,
		},
		{ -- Obsidian Bulwark
			["n"] = 68674,
			["e"] = 87701,
		},
		{ -- Rewind
			["n"] = 68593,
			["e"] = 87612,
		},
		{ -- Enkindled
			["n"] = 68677,
			["e"] = 87704,
		},
		{ -- Spiritbloom
			["n"] = 68604,
			["e"] = 87625,
		},
		{ -- Enkindled
			["n"] = 68677,
			["e"] = 87704,
		},
		{ -- Essence Attunement
			["n"] = 68610,
			["e"] = 87631,
		},
		{ -- Scarlet Adaptation
			["n"] = 68687,
			["e"] = 87714,
		},
		{ -- Time Dilation
			["n"] = 68594,
			["e"] = 87613,
		},
		{ -- Quell
			["n"] = 68665,
			["e"] = 87692,
		},
		{ -- Emerald Communion
			["n"] = 68577,
			["e"] = 87594,
		},
		{ -- Tailwind
			["n"] = 68678,
			["e"] = 87705,
		},
		{ -- Life-Giver's Flame
			["n"] = 68597,
			["e"] = 87616,
		},
		{ -- Cauterizing Flame
			["n"] = 68673,
			["e"] = 87700,
		},
		{ -- Life-Giver's Flame
			["n"] = 68597,
			["e"] = 87616,
		},
		{ -- Instinctive Arcana
			["n"] = 68666,
			["e"] = 87693,
		},
		{ -- Golden Hour
			["n"] = 68595,
			["e"] = 87614,
		},
		{ -- Instinctive Arcana
			["n"] = 68666,
			["e"] = 87693,
		},
		{ -- Dreamwalker
			["n"] = 68576,
			["e"] = 87593,
		},
		{ -- Tip the Scales
			["n"] = 68686,
			["e"] = 87713,
		},
		{ -- Attuned to the Dream
			["n"] = 68672,
			["e"] = 87699,
		},
		{ -- Lifeforce Mender
			["n"] = 68598,
			["e"] = 87617,
		},
		{ -- Attuned to the Dream
			["n"] = 68672,
			["e"] = 87699,
		},
		{ -- Lifeforce Mender
			["n"] = 68598,
			["e"] = 87617,
		},
		{ -- Draconic Legacy
			["n"] = 68685,
			["e"] = 87712,
		},
		{ -- Time Lord
			["n"] = 68596,
			["e"] = 87615,
		},
		{ -- Draconic Legacy
			["n"] = 68685,
			["e"] = 87712,
		},
		{ -- Time Lord
			["n"] = 68596,
			["e"] = 87615,
		},
		{ -- Extended Flight
			["n"] = 68679,
			["e"] = 87706,
		},
		{ -- Call of Ysera
			["n"] = 68599,
			["e"] = 87618,
		},
		{ -- Extended Flight
			["n"] = 68679,
			["e"] = 87706,
		},
		{ -- Lifebind
			["n"] = 68613,
			["e"] = 87634,
		},
		{ -- Ancient Flame
			["n"] = 68671,
			["e"] = 87698,
		},
		{ -- Punctuality
			["n"] = 68589,
			["e"] = 87607,
		},
		{ -- Blast Furnace
			["n"] = 68667,
			["e"] = 87694,
		},
		{ -- Power Nexus
			["n"] = 68581,
			["e"] = 87598,
		},
		{ -- Blast Furnace
			["n"] = 68667,
			["e"] = 87694,
		},
		{ -- Ouroboros
			["n"] = 68583,
			["e"] = 87600,
		},
		{ -- Exuberance
			["n"] = 68573,
			["e"] = 87589,
		},
		{ -- Font of Magic
			["n"] = 68579,
			["e"] = 87596,
		},
		{ -- Panacea
			["n"] = 68680,
			["e"] = 87707,
		},
		{ -- Erasure
			["n"] = 68600,
			["e"] = 87620,
		},
		{ -- Protracted Talons
			["n"] = 68661,
			["e"] = 87688,
		},
		{ -- Energy Loop
			["n"] = 68588,
			["e"] = 87606,
		},
		{ -- Oppressing Roar
			["n"] = 68668,
			["e"] = 87695,
		},
		{ -- Grace Period
			["n"] = 68601,
			["e"] = 87621,
		},
		{ -- Leaping Flames
			["n"] = 68662,
			["e"] = 87689,
		},
		{ -- Grace Period
			["n"] = 68601,
			["e"] = 87621,
		},
		{ -- Aerial Mastery
			["n"] = 68659,
			["e"] = 87686,
		},
		{ -- Timeless Magic
			["n"] = 68587,
			["e"] = 87605,
		},
		{ -- Terror of the Skies
			["n"] = 68649,
			["e"] = 87675,
		},
		{ -- Timeless Magic
			["n"] = 68587,
			["e"] = 87605,
		},
	},
}

addonTable.EVOKER_TALENTS = EVOKER_TALENTS