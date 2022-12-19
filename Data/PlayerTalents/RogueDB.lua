local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local ROGUE_TALENTS = {
	[259] = { -- Assassination
		{ -- Blind
			["n"] = 90684,
			["e"] = 112572,
		},
		{ -- Deadly Poison
			["n"] = 90783,
			["e"] = 112676,
		},
		{ -- Sap
			["n"] = 90685,
			["e"] = 112573,
		},
		{ -- Improved Shiv
			["n"] = 90628,
			["e"] = 112513,
		},
		{ -- Evasion
			["n"] = 90764,
			["e"] = 112657,
		},
		{ -- Venomous Wounds
			["n"] = 90635,
			["e"] = 112520,
		},
		{ -- Feint
			["n"] = 90742,
			["e"] = 112632,
		},
		{ -- Shadowstep - CHECK
			["n"] = 90695,
			["e"] = 112583,
		},
		{ -- Cloak of Shadows
			["n"] = 90697,
			["e"] = 112585,
		},
		{ -- Cut to the Chase
			["n"] = 90629,
			["e"] = 112514,
		},
		{ -- Master Poisoner
			["n"] = 90636,
			["e"] = 112521,
		},
		{ -- Elaborate Planning
			["n"] = 90627,
			["e"] = 112512,
		},
		{ -- Nimble Fingers
			["n"] = 90745,
			["e"] = 112635,
		},
		{ -- Elaborate Planning
			["n"] = 90627,
			["e"] = 112512,
		},
		{ -- Gouge
			["n"] = 90741,
			["e"] = 112631,
		},
		{ -- Bloody Mess
			["n"] = 90625,
			["e"] = 112510,
		},
		{ -- Blackjack
			["n"] = 90696,
			["e"] = 112584,
		},
		{ -- Bloody Mess
			["n"] = 90625,
			["e"] = 112510,
		},
		{ -- Shadowrunner
			["n"] = 90687,
			["e"] = 112575,
		},
		{ -- Internal Bleeding
			["n"] = 90781,
			["e"] = 112674,
		},
		{ -- Fleet Footed
			["n"] = 90762,
			["e"] = 112654,
		},
		{ -- Lightweight Shiv
			["n"] = 90633,
			["e"] = 112518,
		},
		{ -- Iron Stomach
			["n"] = 90744,
			["e"] = 112634,
		},
		{ -- Improved Garrote
			["n"] = 90780,
			["e"] = 112673,
		},
		{ -- Shadowstep - CHECK
			["n"] = 90782,
			["e"] = 112675,
		},
		{ -- Crimson Tempest
			["n"] = 90632,
			["e"] = 112517,
		},
		{ -- Virulent Poisons
			["n"] = 90761,
			["e"] = 112653,
		},
		{ -- Deathmark
			["n"] = 90769,
			["e"] = 112662,
		},
		{ -- Deadened Nerves
			["n"] = 90743,
			["e"] = 112633,
		},
		{ -- Master Assassin
			["n"] = 90623,
			["e"] = 112508,
		},
		{ -- Elusiveness
			["n"] = 90747,
			["e"] = 112638,
		},
		{ -- Flying Daggers
			["n"] = 90631,
			["e"] = 112516,
		},
		{ -- Deadly Precision
			["n"] = 90760,
			["e"] = 112652,
		},
		{ -- Lethal Dose
			["n"] = 90624,
			["e"] = 112509,
		},
		{ -- Deadly Precision
			["n"] = 90760,
			["e"] = 112652,
		},
		{ -- Lethal Dose
			["n"] = 90624,
			["e"] = 112509,
		},
		{ -- Thief's Versatility
			["n"] = 90753,
			["e"] = 112645,
		},
		{ -- Iron Wire
			["n"] = 90778,
			["e"] = 112671,
		},
		{ -- Thief's Versatility
			["n"] = 90753,
			["e"] = 112645,
		},
		{ -- Systemic Failure
			["n"] = 90771,
			["e"] = 112664,
		},
		{ -- Vigor
			["n"] = 90759,
			["e"] = 112651,
		},
		{ -- Twist the Knife
			["n"] = 90768,
			["e"] = 112661,
		},
		{ -- Acrobatic Strikes
			["n"] = 90752,
			["e"] = 112644,
		},
		{ -- Doomblade
			["n"] = 90777,
			["e"] = 112670,
		},
		{ -- Leeching Poison
			["n"] = 90758,
			["e"] = 112650,
		},
		{ -- Blindside
			["n"] = 90786,
			["e"] = 112679,
		},
		{ -- Recuperator
			["n"] = 90640,
			["e"] = 112526,
		},
		{ -- Tiny Toxic Blade
			["n"] = 90770,
			["e"] = 112663,
		},
		{ -- Alacrity
			["n"] = 90751,
			["e"] = 112643,
		},
		{ -- Poison Bomb
			["n"] = 90767,
			["e"] = 112660,
		},
		{ -- Alacrity
			["n"] = 90751,
			["e"] = 112643,
		},
		{ -- Poison Bomb
			["n"] = 90767,
			["e"] = 112660,
		},
		{ -- Seal Fate
			["n"] = 90757,
			["e"] = 112649,
		},
		{ -- Shrouded Suffocation
			["n"] = 90776,
			["e"] = 112669,
		},
		{ -- Seal Fate
			["n"] = 90757,
			["e"] = 112649,
		},
		{ -- Serrated Bone Spike
			["n"] = 90622,
			["e"] = 112506,
		},
		{ -- Echoing Reprimand
			["n"] = 90639,
			["e"] = 112525,
		},
		{ -- Zoldyck Recipe
			["n"] = 90785,
			["e"] = 112678,
		},
		{ -- Marked for Death
			["n"] = 90750,
			["e"] = 112641,
		},
		{ -- Zoldyck Recipe
			["n"] = 90785,
			["e"] = 112678,
		},
		{ -- Reverberation
			["n"] = 90638,
			["e"] = 112523,
		},
	},
	[260] = { -- Outlaw
		{ -- Shiv
			["n"] = 90740,
			["e"] = 112630,
		},
		{ -- Opportunity
			["n"] = 90683,
			["e"] = 112571,
		},
		{ -- Sap
			["n"] = 90685,
			["e"] = 112573,
		},
		{ -- Blade Flurry
			["n"] = 90674,
			["e"] = 112561,
		},
		{ -- Evasion
			["n"] = 90764,
			["e"] = 112657,
		},
		{ -- Grappling Hook
			["n"] = 90682,
			["e"] = 112570,
		},
		{ -- Feint
			["n"] = 90742,
			["e"] = 112632,
		},
		{ -- Combat Potency
			["n"] = 90646,
			["e"] = 112532,
		},
		{ -- Cloak of Shadows
			["n"] = 90697,
			["e"] = 112585,
		},
		{ -- Hit and Run
			["n"] = 90673,
			["e"] = 112560,
		},
		{ -- Numbing Poison
			["n"] = 90763,
			["e"] = 112656,
		},
		{ -- Retractable Hook
			["n"] = 90681,
			["e"] = 112569,
		},
		{ -- Nimble Fingers
			["n"] = 90745,
			["e"] = 112635,
		},
		{ -- Combat Stamina
			["n"] = 90648,
			["e"] = 112534,
		},
		{ -- Shadowrunner
			["n"] = 90687,
			["e"] = 112575,
		},
		{ -- Adrenaline Rush
			["n"] = 90659,
			["e"] = 112545,
		},
		{ -- Fleet Footed
			["n"] = 90762,
			["e"] = 112654,
		},
		{ -- Ruthlessness
			["n"] = 90680,
			["e"] = 112568,
		},
		{ -- Improved Sprint
			["n"] = 90746,
			["e"] = 112636,
		},
		{ -- Restless Blades
			["n"] = 90658,
			["e"] = 112544,
		},
		{ -- Shadowstep
			["n"] = 90695,
			["e"] = 112583,
		},
		{ -- Fatal Flourish
			["n"] = 90662,
			["e"] = 112548,
		},
		{ -- Virulent Poisons
			["n"] = 90761,
			["e"] = 112653,
		},
		{ -- Heavy Hitter
			["n"] = 90642,
			["e"] = 112528,
		},
		{ -- Deadened Nerves
			["n"] = 90743,
			["e"] = 112633,
		},
		{ -- Devious Stratagem
			["n"] = 90679,
			["e"] = 112567,
		},
		{ -- Tight Spender
			["n"] = 90694,
			["e"] = 112582,
		},
		{ -- Roll the Bones
			["n"] = 90657,
			["e"] = 112543,
		},
		{ -- Deadly Precision
			["n"] = 90760,
			["e"] = 112652,
		},
		{ -- Quick Draw
			["n"] = 90663,
			["e"] = 112549,
		},
		{ -- Deadly Precision
			["n"] = 90760,
			["e"] = 112652,
		},
		{ -- Audacity
			["n"] = 90641,
			["e"] = 112527,
		},
		{ -- Thief's Versatility
			["n"] = 90753,
			["e"] = 112645,
		},
		{ -- Loaded Dice
			["n"] = 90656,
			["e"] = 112542,
		},
		{ -- Thief's Versatility
			["n"] = 90753,
			["e"] = 112645,
		},
		{ -- Dancing Steel
			["n"] = 90669,
			["e"] = 112556,
		},
		{ -- Nightstalker
			["n"] = 90693,
			["e"] = 112581,
		},
		{ -- Triple Threat
			["n"] = 90678,
			["e"] = 112566,
		},
		{ -- Nightstalker
			["n"] = 90693,
			["e"] = 112581,
		},
		{ -- Triple Threat
			["n"] = 90678,
			["e"] = 112566,
		},
		{ -- Vigor
			["n"] = 90759,
			["e"] = 112651,
		},
		{ -- Improved Main Gauche
			["n"] = 90668,
			["e"] = 112555,
		},
		{ -- Acrobatic Strikes
			["n"] = 90752,
			["e"] = 112644,
		},
		{ -- Improved Main Gauche
			["n"] = 90668,
			["e"] = 112555,
		},
		{ -- Improved Ambush
			["n"] = 90692,
			["e"] = 112580,
		},
		{ -- Blade Rush
			["n"] = 90644,
			["e"] = 112530,
		},
		{ -- Lethality
			["n"] = 90749,
			["e"] = 112640,
		},
		{ -- Precise Cuts
			["n"] = 90667,
			["e"] = 112554,
		},
		{ -- Lethality
			["n"] = 90749,
			["e"] = 112640,
		},
		{ -- Take 'em by Surprise
			["n"] = 90676,
			["e"] = 112563,
		},
		{ -- Alacrity
			["n"] = 90751,
			["e"] = 112643,
		},
		{ -- Take 'em by Surprise
			["n"] = 90676,
			["e"] = 112563,
		},
		{ -- Alacrity
			["n"] = 90751,
			["e"] = 112643,
		},
		{ -- Fan the Hammer
			["n"] = 90666,
			["e"] = 112553,
		},
		{ -- Soothing Darkness
			["n"] = 90691,
			["e"] = 112579,
		},
		{ -- Fan the Hammer
			["n"] = 90666,
			["e"] = 112553,
		},
		{ -- Deeper Stratagem
			["n"] = 90750,
			["e"] = 112642,
		},
		{ -- Hidden Opportunity
			["n"] = 90675,
			["e"] = 112562,
		},
		{ -- Find Weakness
			["n"] = 90690,
			["e"] = 112578,
		},
		{ -- Greenskin's Wickers
			["n"] = 90665,
			["e"] = 112552,
		},
		{ -- Find Weakness
			["n"] = 90690,
			["e"] = 112578,
		},
	},
	[261] = { -- Subtlety
	},
}

addonTable.ROGUE_TALENTS = ROGUE_TALENTS