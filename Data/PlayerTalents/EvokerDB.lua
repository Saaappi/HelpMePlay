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
}

addonTable.EVOKER_TALENTS = EVOKER_TALENTS