local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local MONK_TALENTS = {
	[268] = { -- Brewmaster
		{ -- Soothing Mist
			["n"] = 80691,
			["e"] = 101509,
		},
		{ -- Keg Smash
			["n"] = 80637,
			["e"] = 101451,
		},
		{ -- Rising Sun Kick
			["n"] = 80690,
			["e"] = 101508,
		},
		{ -- Stagger
			["n"] = 80640,
			["e"] = 101454,
		},
		{ -- Improved Roll
			["n"] = 80712,
			["e"] = 101531,
		},
		{ -- Purifying Brew
			["n"] = 80639,
			["e"] = 101453,
		},
		{ -- Calming Presence
			["n"] = 80693,
			["e"] = 101511,
		},
		{ -- Shuffle
			["n"] = 80641,
			["e"] = 101455,
		},
		{ -- Vigorous Expulsion
			["n"] = 80711,
			["e"] = 101530,
		},
		{ -- Hit Scheme
			["n"] = 80647,
			["e"] = 101461,
		},
		{ -- Paralysis
			["n"] = 80688,
			["e"] = 101506,
		},
		{ -- Gift of the Ox
			["n"] = 80638,
			["e"] = 101452,
		},
		{ -- Vivacious Vivification
			["n"] = 80695,
			["e"] = 101513,
		},
		{ -- Gift of the Ox
			["n"] = 80638,
			["e"] = 101452,
		},
		{ -- Ferocity of Xuen
			["n"] = 80706,
			["e"] = 101524,
		},
		{ -- Healing Elixir
			["n"] = 80644,
			["e"] = 101458,
		},
		{ -- Ferocity of Xuen
			["n"] = 80706,
			["e"] = 101524,
		},
		{ -- Rushing Jade Wind
			["n"] = 80727,
			["e"] = 101549,
		},
		{ -- Improved Paralysis
			["n"] = 80687,
			["e"] = 101505,
		},
		{ -- Celestial Brew
			["n"] = 80649,
			["e"] = 101463,
		},
		{ -- Transcendence
			["n"] = 80694,
			["e"] = 101512,
		},
		{ -- Zen Meditation
			["n"] = 80726,
			["e"] = 101547,
		},
		{ -- Spear Hand Strike
			["n"] = 80686,
			["e"] = 101504,
		},
		{ -- Breath of Fire
			["n"] = 80650,
			["e"] = 101464,
		},
		{ -- Fortifying Brew
			["n"] = 80680,
			["e"] = 101496,
		},
		{ -- Improved Celestial Brew
			["n"] = 80648,
			["e"] = 101462,
		},
		{ -- Chi Wave
			["n"] = 80709,
			["e"] = 101528,
		},
		{ -- Improved Purifying Brew
			["n"] = 80655,
			["e"] = 101471,
		},
		{ -- Hasty Provocation
			["n"] = 80696,
			["e"] = 101514,
		},
		{ -- Gai Plin's Imperial Brew
			["n"] = 80725,
			["e"] = 101545,
		},
		{ -- Ring of Peace
			["n"] = 80698,
			["e"] = 101516,
		},
		{ -- Shadowboxing Treads
			["n"] = 80632,
			["e"] = 101444,
		},
		{ -- Fast Feet
			["n"] = 80705,
			["e"] = 101523,
		},
		{ -- Sal'salabim's Strength
			["n"] = 80652,
			["e"] = 101467,
		},
		{ -- Fast Feet
			["n"] = 80705,
			["e"] = 101523,
		},
		{ -- Bob and Weave
			["n"] = 80636,
			["e"] = 101449,
		},
		{ -- Chi Torpedo
			["n"] = 80685,
			["e"] = 101502,
		},
		{ -- Invoke Niuzao, the Black Ox
			["n"] = 80724,
			["e"] = 101544,
		},
		{ -- Expeditious Fortification
			["n"] = 80681,
			["e"] = 101497,
		},
		{ -- Light Brewing
			["n"] = 80635,
			["e"] = 101448,
		},
		{ -- Profound Rebuttal
			["n"] = 80708,
			["e"] = 101526,
		},
		{ -- Charred Passions
			["n"] = 80651,
			["e"] = 101465,
		},
		{ -- Diffuse Magic
			["n"] = 80697,
			["e"] = 101515,
		},
		{ -- High Tolerance
			["n"] = 80653,
			["e"] = 101469,
		},
		{ -- Dampen Harm
			["n"] = 80704,
			["e"] = 101522,
		},
		{ -- High Tolerance
			["n"] = 80653,
			["e"] = 101469,
		},
		{ -- Strength of Spirit
			["n"] = 80682,
			["e"] = 101499,
		},
		{ -- Elusive Footwork
			["n"] = 80602,
			["e"] = 101412,
		},
		{ -- Fatal Touch
			["n"] = 80703,
			["e"] = 101521,
		},
		{ -- Elusive Footwork
			["n"] = 80602,
			["e"] = 101412,
		},
		{ -- Fatal Touch
			["n"] = 80703,
			["e"] = 101521,
		},
		{ -- Bonedust Brew
			["n"] = 80729,
			["e"] = 101552,
		},
		{ -- Resonant Fists
			["n"] = 80702,
			["e"] = 101520,
		},
		{ -- Exploding Keg
			["n"] = 80722,
			["e"] = 101542,
		},
		{ -- Resonant Fists
			["n"] = 80702,
			["e"] = 101520,
		},
		{ -- Weapons of Order
			["n"] = 80719,
			["e"] = 101539,
		},
		{ -- Bounce Back
			["n"] = 80717,
			["e"] = 101536,
		},
		{ -- Stormstout's Last Keg
			["n"] = 80721,
			["e"] = 101541,
		},
		{ -- Bounce Back
			["n"] = 80717,
			["e"] = 101536,
		},
		{ -- Chi Surge
			["n"] = 80718,
			["e"] = 101537,
		},
		{ -- Summon White Tiger Statue
			["n"] = 80701,
			["e"] = 101519,
		},
	},
	[270] = { -- Mistweaver
		{ -- Rising Sun Kick
			["n"] = 80690,
			["e"] = 101508,
		},
		{ -- Enveloping Mist
			["n"] = 80568,
			["e"] = 101370,
		},
		{ -- Improved Roll
			["n"] = 80712,
			["e"] = 101531,
		},
		{ -- Essence Font
			["n"] = 80597,
			["e"] = 101406,
		},
		{ -- Calming Presence
			["n"] = 80693,
			["e"] = 101511,
		},
		{ -- Renewing Mist
			["n"] = 80588,
			["e"] = 101394,
		},
		{ -- Vigorous Expulsion
			["n"] = 80711,
			["e"] = 101530,
		},
		{ -- Life Cocoon
			["n"] = 80584,
			["e"] = 101390,
		},
		{ -- Improved Vivify
			["n"] = 80692,
			["e"] = 101510,
		},
		{ -- Thunder Focus Tea
			["n"] = 80600,
			["e"] = 101410,
		},
		{ -- Improved Vivify
			["n"] = 80692,
			["e"] = 101510,
		},
		{ -- Invigorating Mists
			["n"] = 80559,
			["e"] = 101358,
		},
		{ -- Improved Detox
			["n"] = 81634,
			["e"] = 102627,
		},
		{ -- Teachings of the Monastery
			["n"] = 80595,
			["e"] = 101403,
		},
		{ -- Grace of the Crane
			["n"] = 80710,
			["e"] = 101529,
		},
		{ -- Revival
			["n"] = 80574,
			["e"] = 101378,
		},
		{ -- Grace of the Crane
			["n"] = 80710,
			["e"] = 101529,
		},
		{ -- Mastery of Mist
			["n"] = 80589,
			["e"] = 101395,
		},
		{ -- Vivacious Vivification
			["n"] = 80695,
			["e"] = 101513,
		},
		{ -- Spirit of the Crane
			["n"] = 80562,
			["e"] = 101361,
		},
		{ -- Ferocity of Xuen
			["n"] = 80706,
			["e"] = 101524,
		},
		{ -- Mists of Life
			["n"] = 80567,
			["e"] = 101369,
		},
		{ -- Ferocity of Xuen
			["n"] = 80706,
			["e"] = 101524,
		},
		{ -- Zen Pulse
			["n"] = 80566,
			["e"] = 101368,
		},
		{ -- Spear Hand Strike
			["n"] = 80686,
			["e"] = 101504,
		},
		{ -- Overflowing Mists
			["n"] = 80581,
			["e"] = 101387,
		},
		{ -- Chi Wave
			["n"] = 80709,
			["e"] = 101528,
		},
		{ -- Overflowing Mists
			["n"] = 80581,
			["e"] = 101387,
		},
		{ -- Hasty Provocation
			["n"] = 80696,
			["e"] = 101514,
		},
		{ -- Invoke Chi-Ji, the Red Crane
			["n"] = 80590,
			["e"] = 101396,
		},
		{ -- Fast Feet
			["n"] = 80705,
			["e"] = 101523,
		},
		{ -- Echoing Reverberation
			["n"] = 80564,
			["e"] = 101365,
		},
		{ -- Fast Feet
			["n"] = 80705,
			["e"] = 101523,
		},
		{ -- Rapid Diffusion
			["n"] = 80579,
			["e"] = 101385,
		},
		{ -- Celerity
			["n"] = 80685,
			["e"] = 101503,
		},
		{ -- Rapid Diffusion
			["n"] = 80579,
			["e"] = 101385,
		},
		{ -- Profound Rebuttal
			["n"] = 80708,
			["e"] = 101526,
		},
		{ -- Yu'lon's Whisper
			["n"] = 80578,
			["e"] = 101384,
		},
		{ -- Dampen Harm
			["n"] = 80704,
			["e"] = 101522,
		},
		{ -- Enveloping Breath
			["n"] = 80582,
			["e"] = 101388,
		},
		{ -- Improved Touch of Death
			["n"] = 80684,
			["e"] = 101501,
		},
		{ -- Faeline Stomp
			["n"] = 80560,
			["e"] = 101359,
		},
		{ -- Close to Heart
			["n"] = 80707,
			["e"] = 101525,
		},
		{ -- Ancient Teachings
			["n"] = 80598,
			["e"] = 101408,
		},
		{ -- Close to Heart
			["n"] = 80707,
			["e"] = 101525,
		},
		{ -- Gift of the Celestials
			["n"] = 80576,
			["e"] = 101381,
		},
		{ -- Fatal Touch
			["n"] = 80703,
			["e"] = 101521,
		},
		{ -- Bonedust Brew
			["n"] = 80586,
			["e"] = 101392,
		},
		{ -- Fatal Touch
			["n"] = 80703,
			["e"] = 101521,
		},
		{ -- Ancient Concordance
			["n"] = 80569,
			["e"] = 101371,
		},
		{ -- Resonant Fists
			["n"] = 80702,
			["e"] = 101520,
		},
		{ -- Ancient Concordance
			["n"] = 80569,
			["e"] = 101371,
		},
		{ -- Resonant Fists
			["n"] = 80702,
			["e"] = 101520,
		},
		{ -- Secret Infusion
			["n"] = 80570,
			["e"] = 101372,
		},
		{ -- Bounce Back
			["n"] = 80717,
			["e"] = 101536,
		},
		{ -- Secret Infusion
			["n"] = 80570,
			["e"] = 101372,
		},
		{ -- Bounce Back
			["n"] = 80717,
			["e"] = 101536,
		},
		{ -- Awakened Faeline
			["n"] = 80577,
			["e"] = 101383,
		},
		{ -- Summon White Tiger Statue
			["n"] = 80701,
			["e"] = 101519,
		},
		{ -- Invoker's Delight
			["n"] = 80571,
			["e"] = 101373,
		},
		{ -- Summon Black Ox Statue
			["n"] = 80716,
			["e"] = 101535,
		},
	},
	[269] = { -- Windwalker
	},
}

addonTable.MONK_TALENTS = MONK_TALENTS