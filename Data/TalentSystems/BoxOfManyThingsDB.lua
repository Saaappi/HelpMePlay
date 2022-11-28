local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local BOXOFMANYTHINGS = {
	-- Tower Knowledge: 1904
	{ -- Blessing of the Ancients (Rank 1)
		["perkId"] 	= 1783,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Blessing of the Ancients (Rank 2)
		["perkId"] 	= 1783,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Freed from Torment (Rank 1)
		["perkId"] 	= 1784,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Efficient Looter
		["perkId"] 	= 1794,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Empowered Perseverence (Rank 1)
		["perkId"] 	= 1785,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Empowered Swiftness (Rank 1)
		["perkId"] 	= 1787,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- The Adamant Vaults
		["perkId"] 	= 1788,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Blessing of the Ancients (Rank 3)
		["perkId"] 	= 1783,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Enduring Souls
		["perkId"] 	= 1789,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Freed from Torment (Rank 2)
		["perkId"] 	= 1784,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Empowered Perseverence (Rank 2)
		["perkId"] 	= 1785,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Empowered Swiftness (Rank 2)
		["perkId"] 	= 1787,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Good Reflexes (Rank 1)
		["perkId"] 	= 1790,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Elite Slayer
		["perkId"] 	= 1863,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Unflinching (Rank 1)
		["perkId"] 	= 1861,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Anima Plunderer (Rank 1)
		["perkId"] 	= 1865,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Unflinching (Rank 2)
		["perkId"] 	= 1861,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Unflinching (Rank 3)
		["perkId"] 	= 1861,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Good Reflexes (Rank 2)
		["perkId"] 	= 1790,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Inexplicable Power (Rank 1)
		["perkId"] 	= 1786,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Inexplicable Power (Rank 2)
		["perkId"] 	= 1786,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Anima Plunderer (Rank 2)
		["perkId"] 	= 1865,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Meddle With Fate (Rank 1)
		["perkId"] 	= 1864,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Empowered Nova
		["perkId"] 	= 1878,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Meddle With Fate (Rank 2)
		["perkId"] 	= 1864,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Meddle With Fate (Rank 3)
		["perkId"] 	= 1864,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Inexplicable Power (Rank 3)
		["perkId"] 	= 1786,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Inexplicable Power (Rank 4)
		["perkId"] 	= 1786,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Inexplicable Power (Rank 5)
		["perkId"] 	= 1786,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Discovered Cache (Rank 1)
		["perkId"] 	= 1792,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Discovered Cache (Rank 2)
		["perkId"] 	= 1792,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Discovered Cache (Rank 3)
		["perkId"] 	= 1792,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Undeterred (Rank 1)
		["perkId"] 	= 1793,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Undeterred (Rank 2)
		["perkId"] 	= 1793,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Undeterred (Rank 3)
		["perkId"] 	= 1793,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Death Denied (Rank 1)
		["perkId"] 	= 1791,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Death Denied (Rank 2)
		["perkId"] 	= 1791,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Death Denied (Rank 3)
		["perkId"] 	= 1791,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Undeterred (Rank 4)
		["perkId"] 	= 1793,
		["print"]	= "spell",
		["f"]		= "",
	},
	{ -- Undeterred (Rank 5)
		["perkId"] 	= 1793,
		["print"]	= "spell",
		["f"]		= "",
	},
}

addonTable.BOXOFMANYTHINGS = BOXOFMANYTHINGS