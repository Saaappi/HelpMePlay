local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local SHAMAN_TALENTS = {
	[262] = { -- Elemental
		{ -- Astral Shift
			["n"] = 81057,
			["e"] = 101945,
		},
		{ -- Earth Shock
			["n"] = 80984,
			["e"] = 101854,
		},
		{ -- Earth Elemental
			["n"] = 81064,
			["e"] = 101952,
		},
		{ -- Earthquake
			["n"] = 80985,
			["e"] = 101855,
		},
		{ -- Wind Shear
			["n"] = 81068,
			["e"] = 101957,
		},
		{ -- Elemental Fury
			["n"] = 80983,
			["e"] = 101853,
		},
		{ -- Thunderous Paws
			["n"] = 81072,
			["e"] = 101962,
		},
		{ -- Fire Elemental
			["n"] = 80981,
			["e"] = 101850,
		},
		{ -- Frost Shock
			["n"] = 81074,
			["e"] = 101965,
		},
		{ -- Tumultuous Fissures
			["n"] = 80986,
			["e"] = 101857,
		},
		{ -- Earth Shield
			["n"] = 81106,
			["e"] = 102004,
		},
		{ -- Primordial Fury
			["n"] = 80982,
			["e"] = 101852,
		},
		{ -- Fire and Ice
			["n"] = 81067,
			["e"] = 101956,
		},
		{ -- Refreshing Waters
			["n"] = 80980,
			["e"] = 101848,
		},
		{ -- Capacitor Totem
			["n"] = 81071,
			["e"] = 101961,
		},
		{ -- Call of Thunder
			["n"] = 80987,
			["e"] = 101858,
		},
		{ -- Elemental Orbit
			["n"] = 81105,
			["e"] = 102003,
		},
		{ -- Flow of Power
			["n"] = 80998,
			["e"] = 101871,
		},
		{ -- Spiritwalker's Grace
			["n"] = 81066,
			["e"] = 101955,
		},
		{ -- Lava Surge
			["n"] = 80979,
			["e"] = 101846,
		},
		{ -- Static Charge
			["n"] = 81070,
			["e"] = 101960,
		},
		{ -- Unrelenting Calamity
			["n"] = 80988,
			["e"] = 101859,
		},
		{ -- Purge
			["n"] = 81076,
			["e"] = 101968,
		},
		{ -- Icefury
			["n"] = 80997,
			["e"] = 101870,
		},
		{ -- Graceful Spirit
			["n"] = 81065,
			["e"] = 101954,
		},
		{ -- Echo of the Elements
			["n"] = 80999,
			["e"] = 101872,
		},
		{ -- Earthgrab Totem
			["n"] = 81082,
			["e"] = 101975,
		},
		{ -- Stormkeeper
			["n"] = 80992,
			["e"] = 101863,
		},
		{ -- Nature's Fury
			["n"] = 81086,
			["e"] = 101980,
		},
		{ -- Electrified Shocks
			["n"] = 80996,
			["e"] = 101868,
		},
		{ -- Nature's Fury
			["n"] = 81086,
			["e"] = 101980,
		},
		{ -- Surge of Power
			["n"] = 81000,
			["e"] = 101873,
		},
		{ -- Nature's Guardian
			["n"] = 81081,
			["e"] = 101974,
		},
		{ -- Eye of the Storm
			["n"] = 80995,
			["e"] = 101867,
		},
		{ -- Nature's Guardian
			["n"] = 81081,
			["e"] = 101974,
		},
		{ -- Eye of the Storm
			["n"] = 80995,
			["e"] = 101867,
		},
		{ -- Winds of Al'Akir
			["n"] = 81087,
			["e"] = 101981,
		},
		{ -- Master of the Elements
			["n"] = 81004,
			["e"] = 101879,
		},
		{ -- Winds of Al'Akir
			["n"] = 81087,
			["e"] = 101981,
		},
		{ -- Master of the Elements
			["n"] = 81004,
			["e"] = 101879,
		},
		{ -- Brimming with Life
			["n"] = 81085,
			["e"] = 101979,
		},
		{ -- Primordial Wave
			["n"] = 81014,
			["e"] = 101891,
		},
		{ -- Improved Lightning Bolt
			["n"] = 81098,
			["e"] = 101996,
		},
		{ -- Liquid Magma Totem
			["n"] = 81008,
			["e"] = 101884,
		},
		{ -- Improved Lightning Bolt
			["n"] = 81098,
			["e"] = 101996,
		},
		{ -- Elemental Equilibrium
			["n"] = 80993,
			["e"] = 101865,
		},
		{ -- Gust of Wind
			["n"] = 81088,
			["e"] = 101982,
		},
		{ -- Elemental Equilibrium
			["n"] = 80993,
			["e"] = 101865,
		},
		{ -- Nature's Swiftness
			["n"] = 81099,
			["e"] = 101997,
		},
		{ -- Rolling Magma
			["n"] = 80977,
			["e"] = 101843,
		},
		{ -- Thunderstorm
			["n"] = 81097,
			["e"] = 101995,
		},
		{ -- Rolling Magma
			["n"] = 80977,
			["e"] = 101843,
		},
		{ -- Surging Shields
			["n"] = 81092,
			["e"] = 101988,
		},
		{ -- Echo Chamber
			["n"] = 81013,
			["e"] = 101890,
		},
		{ -- Surging Shields
			["n"] = 81092,
			["e"] = 101988,
		},
		{ -- Echo Chamber
			["n"] = 81013,
			["e"] = 101890,
		},
		{ -- Thundershock
			["n"] = 81096,
			["e"] = 101994,
		},
		{ -- Stormkeeper
			["n"] = 80989,
			["e"] = 101860,
		},
		{ -- Totemic Recall
			["n"] = 81091,
			["e"] = 101987,
		},
		{ -- Primordial Surge
			["n"] = 80978,
			["e"] = 101845,
		},
		{ -- Call of the Elements
			["n"] = 81090,
			["e"] = 101986,
		},
	},
	[263] = { -- Enhancement
	},
	[264] = { -- Restoration
	},
}

addonTable.SHAMAN_TALENTS = SHAMAN_TALENTS