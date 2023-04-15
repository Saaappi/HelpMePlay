local addonName, addonTable = ...
local e = CreateFrame("Frame")
local BOXOFMANYTHINGS = {
	-- Tower Knowledge: 1904
	{ -- Blessing of the Ancients
		["perkID"] 	= 1783,
	},
	{ -- Efficient Looter
		["perkID"] 	= 1794,
	},
	{ -- Freed from Torment
		["perkID"] 	= 1784,
	},
	{ -- Empowered Perseverence
		["perkID"] 	= 1785,
	},
	{ -- Empowered Swiftness
		["perkID"] 	= 1787,
	},
	{ -- The Adamant Vaults
		["perkID"] 	= 1788,
		["print"]	= "spell",
	},
	{ -- Enduring Souls
		["perkID"] 	= 1789,
		["print"]	= "spell",
	},
	{ -- Good Reflexes
		["perkID"] 	= 1790,
	},
	{ -- Elite Slayer
		["perkID"] 	= 1863,
	},
	{ -- Unflinching
		["perkID"] 	= 1861,
	},
	{ -- Anima Plunderer
		["perkID"] 	= 1865,
	},
	{ -- Inexplicable Power
		["perkID"] 	= 1786,
	},
	{ -- Meddle With Fate
		["perkID"] 	= 1864,
	},
	{ -- Empowered Nova
		["perkID"] 	= 1878,
	},
	{ -- Discovered Cache
		["perkID"] 	= 1792,
	},
	{ -- Undeterred
		["perkID"] 	= 1793,
	},
	{ -- Death Denied
		["perkID"] 	= 1791,
	},
}

addonTable.BOXOFMANYTHINGS = BOXOFMANYTHINGS