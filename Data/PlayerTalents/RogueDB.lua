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
	},
	[261] = { -- Subtlety
	},
}

addonTable.ROGUE_TALENTS = ROGUE_TALENTS