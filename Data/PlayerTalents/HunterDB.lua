local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local HUNTER_TALENTS = {
	[253] = { -- Beast Mastery
		{ -- Kill Shot
			["n"] = 79835,
			["e"] = 100539,
		},
		{ -- Cobra Shot
			["n"] = 79949,
			["e"] = 100663,
		},
		{ -- Trailblazer
			["n"] = 79931,
			["e"] = 100644,
		},
		{ -- Pack Tactics
			["n"] = 79958,
			["e"] = 100672,
		},
		{ -- Trailblazer
			["n"] = 79931,
			["e"] = 100644,
		},
		{ -- Multi-Shot
			["n"] = 79917,
			["e"] = 100630,
		},
		{ -- Posthaste
			["n"] = 79921,
			["e"] = 100634,
		},
		{ -- Barbed Shot
			["n"] = 79968,
			["e"] = 100683,
		},
		{ -- Posthaste
			["n"] = 79921,
			["e"] = 100634,
		},
		{ -- Aspect of the Beast
			["n"] = 79944,
			["e"] = 100658,
		},
		{ -- Improved Kill Shot
			["n"] = 79930,
			["e"] = 100643,
		},
		{ -- Wilderness Medicine
			["n"] = 79936,
			["e"] = 100649,
		},
		{ -- Training Expert
			["n"] = 79948,
			["e"] = 100662,
		},
		{ -- Wilderness Medicine
			["n"] = 79936,
			["e"] = 100649,
		},
		{ -- Training Expert
			["n"] = 79948,
			["e"] = 100662,
		},
		{ -- Counter Shot
			["n"] = 79912,
			["e"] = 100624,
		},
		{ -- Animal Companion
			["n"] = 79947,
			["e"] = 100661,
		},
		{ -- Natural Mending
			["n"] = 79925,
			["e"] = 100638,
		},
		{ -- Beast Cleave
			["n"] = 79956,
			["e"] = 100670,
		},
		{ -- Natural Mending
			["n"] = 79925,
			["e"] = 100638,
		},
		{ -- Beast Cleave
			["n"] = 79956,
			["e"] = 100670,
		},
		{ -- Misdirection
			["n"] = 79924,
			["e"] = 100637,
		},
		{ -- Killer Command
			["n"] = 79939,
			["e"] = 100653,
		},
		{ -- Survival of the Fittest
			["n"] = 79821,
			["e"] = 100523,
		},
		{ -- Killer Command
			["n"] = 79939,
			["e"] = 100653,
		},
		{ -- Nature's Endurance
			["n"] = 79820,
			["e"] = 100521,
		},
		{ -- Sharp Barbs
			["n"] = 79945,
			["e"] = 100659,
		},
		{ -- Born To Be Wild
			["n"] = 79933,
			["e"] = 100646,
		},
		{ -- Sharp Barbs
			["n"] = 79945,
			["e"] = 100659,
		},
		{ -- Binding Shot
			["n"] = 79937,
			["e"] = 100650,
		},
		{ -- Thrill of the Hunt
			["n"] = 79964,
			["e"] = 100679,
		},
		{ -- Camouflage
			["n"] = 79934,
			["e"] = 100647,
		},
		{ -- Thrill of the Hunt
			["n"] = 79964,
			["e"] = 100679,
		},
		{ -- Binding Shackles
			["n"] = 79920,
			["e"] = 100633,
		},
		{ -- Kill Cleave
			["n"] = 79954,
			["e"] = 100668,
		},
		{ -- Pathfinding
			["n"] = 79918,
			["e"] = 100631,
		},
		{ -- A Murder of Crows
			["n"] = 79943,
			["e"] = 100657,
		},
		{ -- Pathfinding
			["n"] = 79918,
			["e"] = 100631,
		},
		{ -- Bestial Wrath
			["n"] = 79955,
			["e"] = 100669,
		},
		{ -- Beast Master
			["n"] = 79926,
			["e"] = 100639,
		},
		{ -- War Orders
			["n"] = 79952,
			["e"] = 100666,
		},
		{ -- Beast Master
			["n"] = 79926,
			["e"] = 100639,
		},
		{ -- War Orders
			["n"] = 79952,
			["e"] = 100666,
		},
		{ -- Keen Eyesight
			["n"] = 79922,
			["e"] = 100635,
		},
		{ -- Stomp
			["n"] = 79942,
			["e"] = 100656,
		},
		{ -- Keen Eyesight
			["n"] = 79922,
			["e"] = 100635,
		},
		{ -- Stomp
			["n"] = 79942,
			["e"] = 100656,
		},
		{ -- Master Marksman
			["n"] = 79913,
			["e"] = 100625,
		},
		{ -- Barbed Wrath
			["n"] = 79822,
			["e"] = 100524,
		},
		{ -- Master Marksman
			["n"] = 79913,
			["e"] = 100625,
		},
		{ -- Wild Call
			["n"] = 79966,
			["e"] = 100681,
		},
		{ -- Improved Kill Command
			["n"] = 79932,
			["e"] = 100645,
		},
		{ -- Scent of Blood
			["n"] = 79965,
			["e"] = 100680,
		},
		{ -- Improved Kill Command
			["n"] = 79932,
			["e"] = 100645,
		},
		{ -- Scent of Blood
			["n"] = 79965,
			["e"] = 100680,
		},
		{ -- Serrated Shots
			["n"] = 79814,
			["e"] = 100513,
		},
		{ -- One with the Pack
			["n"] = 79960,
			["e"] = 100674,
		},
		{ -- Alpha Predator
			["n"] = 79904,
			["e"] = 100613,
		},
		{ -- One with the Pack
			["n"] = 79960,
			["e"] = 100674,
		},
		{ -- Death Chakram
			["n"] = 79916,
			["e"] = 100628,
		},
		{ -- Piercing Fangs
			["n"] = 79961,
			["e"] = 100675,
		},
	},
	[254] = { -- Marksmanship
		{ -- Concussive Shot
			["n"] = 79906,
			["e"] = 100616,
		},
		{ -- Aimed Shot
			["n"] = 79873,
			["e"] = 100578,
		},
		{ -- Trailblazer
			["n"] = 79931,
			["e"] = 100644,
		},
		{ -- Crack Shot
			["n"] = 79895,
			["e"] = 100600,
		},
		{ -- Trailblazer
			["n"] = 79931,
			["e"] = 100644,
		},
		{ -- Improved Steady Shot
			["n"] = 79898,
			["e"] = 100604,
		},
		{ -- Posthaste
			["n"] = 79921,
			["e"] = 100634,
		},
		{ -- Precise Shots
			["n"] = 79877,
			["e"] = 100582,
		},
		{ -- Posthaste
			["n"] = 79921,
			["e"] = 100634,
		},
		{ -- Precise Shots
			["n"] = 79877,
			["e"] = 100582,
		},
		{ -- Improved Kill Shot
			["n"] = 79930,
			["e"] = 100643,
		},
		{ -- Rapid Fire
			["n"] = 79880,
			["e"] = 100585,
		},
		{ -- Counter Shot
			["n"] = 79836,
			["e"] = 100540,
		},
		{ -- Chimaera Shot
			["n"] = 79915,
			["e"] = 100627,
		},
		{ -- Natural Mending
			["n"] = 79925,
			["e"] = 100638,
		},
		{ -- Streamline
			["n"] = 79893,
			["e"] = 100598,
		},
		{ -- Tar Trap
			["n"] = 79928,
			["e"] = 100641,
		},
		{ -- Streamline
			["n"] = 79893,
			["e"] = 100598,
		},
		{ -- Misdirection
			["n"] = 79924,
			["e"] = 100637,
		},
		{ -- Careful Aim
			["n"] = 79879,
			["e"] = 100584,
		},
		{ -- Survival of the Fittest
			["n"] = 79821,
			["e"] = 100523,
		},
		{ -- Careful Aim
			["n"] = 79879,
			["e"] = 100584,
		},
		{ -- Tranquilizing Shot
			["n"] = 79907,
			["e"] = 100617,
		},
		{ -- Surging Shots
			["n"] = 79897,
			["e"] = 100602,
		},
		{ -- Nature's Endurance
			["n"] = 79820,
			["e"] = 100521,
		},
		{ -- Target Practice
			["n"] = 79886,
			["e"] = 100591,
		},
		{ -- Born To Be Wild
			["n"] = 79933,
			["e"] = 100646,
		},
		{ -- Focused Aim
			["n"] = 79896,
			["e"] = 100601,
		},
		{ -- Born To Be Wild
			["n"] = 79933,
			["e"] = 100646,
		},
		{ -- Focused Aim
			["n"] = 79896,
			["e"] = 100601,
		},
		{ -- Intimidation
			["n"] = 79910,
			["e"] = 100621,
		},
		{ -- Multi-Shot
			["n"] = 79840,
			["e"] = 100544,
		},
		{ -- Binding Shot
			["n"] = 79937,
			["e"] = 100650,
		},
		{ -- Double Tap
			["n"] = 79874,
			["e"] = 100579,
		},
		{ -- Camouflage
			["n"] = 79934,
			["e"] = 100647,
		},
		{ -- Trick Shots
			["n"] = 79875,
			["e"] = 100580,
		},
		{ -- Pathfinding
			["n"] = 79918,
			["e"] = 100631,
		},
		{ -- Volley
			["n"] = 79890,
			["e"] = 100595,
		},
		{ -- Pathfinding
			["n"] = 79918,
			["e"] = 100631,
		},
		{ -- Serpentstalker's Trickery
			["n"] = 79881,
			["e"] = 100586,
		},
		{ -- Keen Eyesight
			["n"] = 79922,
			["e"] = 100635,
		},
		{ -- Heavy Ammo
			["n"] = 79903,
			["e"] = 100611,
		},
		{ -- Keen Eyesight
			["n"] = 79922,
			["e"] = 100635,
		},
		{ -- Trueshot
			["n"] = 79882,
			["e"] = 100587,
		},
		{ -- Master Marksman
			["n"] = 79913,
			["e"] = 100625,
		},
		{ -- Lock and Load
			["n"] = 79884,
			["e"] = 100589,
		},
		{ -- Master Marksman
			["n"] = 79913,
			["e"] = 100625,
		},
		{ -- Bulletstorm
			["n"] = 79817,
			["e"] = 100517,
		},
		{ -- Serrated Shots
			["n"] = 79814,
			["e"] = 100513,
		},
		{ -- Eagletalon's True Focus
			["n"] = 79901,
			["e"] = 100607,
		},
		{ -- Arctic Bola
			["n"] = 79815,
			["e"] = 100514,
		},
		{ -- Eagletalon's True Focus
			["n"] = 79901,
			["e"] = 100607,
		},
		{ -- Arctic Bola
			["n"] = 79815,
			["e"] = 100514,
		},
		{ -- Wailing Arrow
			["n"] = 79885,
			["e"] = 100590,
		},
		{ -- Serpent Sting
			["n"] = 79905,
			["e"] = 100615,
		},
		{ -- Salvo
			["n"] = 79830,
			["e"] = 100534,
		},
		{ -- Death Chakram
			["n"] = 79916,
			["e"] = 100628,
		},
		{ -- Unerring Vision
			["n"] = 79902,
			["e"] = 100608,
		},
		{ -- Barrage
			["n"] = 79914,
			["e"] = 100526,
		},
		{ -- Windrunner's Barrage
			["n"] = 79813,
			["e"] = 100512,
		},
		{ -- Poison Injection
			["n"] = 79911,
			["e"] = 100623,
		},
	},
	[255] = { -- Survival
	},
}

addonTable.HUNTER_TALENTS = HUNTER_TALENTS