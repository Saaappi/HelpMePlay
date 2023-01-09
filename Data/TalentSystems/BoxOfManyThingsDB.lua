local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local BOXOFMANYTHINGS = {
	-- Tower Knowledge: 1904
	{ -- Blessing of the Ancients (Rank 1)
		["perkID"] 	= 1783,
		["print"]	= "spell",
	},
	{ -- Blessing of the Ancients (Rank 2)
		["perkID"] 	= 1783,
		["print"]	= "spell",
	},
	{ -- Freed from Torment (Rank 1)
		["perkID"] 	= 1784,
		["print"]	= "spell",
	},
	{ -- Efficient Looter
		["perkID"] 	= 1794,
		["print"]	= "spell",
	},
	{ -- Empowered Perseverence (Rank 1)
		["perkID"] 	= 1785,
		["print"]	= "spell",
	},
	{ -- Empowered Swiftness (Rank 1)
		["perkID"] 	= 1787,
		["print"]	= "spell",
	},
	{ -- The Adamant Vaults
		["perkID"] 	= 1788,
		["print"]	= "spell",
	},
	{ -- Blessing of the Ancients (Rank 3)
		["perkID"] 	= 1783,
		["print"]	= "spell",
	},
	{ -- Enduring Souls
		["perkID"] 	= 1789,
		["print"]	= "spell",
	},
	{ -- Freed from Torment (Rank 2)
		["perkID"] 	= 1784,
		["print"]	= "spell",
	},
	{ -- Empowered Perseverence (Rank 2)
		["perkID"] 	= 1785,
		["print"]	= "spell",
	},
	{ -- Empowered Swiftness (Rank 2)
		["perkID"] 	= 1787,
		["print"]	= "spell",
	},
	{ -- Good Reflexes (Rank 1)
		["perkID"] 	= 1790,
		["print"]	= "spell",
	},
	{ -- Elite Slayer
		["perkID"] 	= 1863,
		["print"]	= "spell",
	},
	{ -- Unflinching (Rank 1)
		["perkID"] 	= 1861,
		["print"]	= "spell",
	},
	{ -- Anima Plunderer (Rank 1)
		["perkID"] 	= 1865,
		["print"]	= "spell",
	},
	{ -- Unflinching (Rank 2)
		["perkID"] 	= 1861,
		["print"]	= "spell",
	},
	{ -- Unflinching (Rank 3)
		["perkID"] 	= 1861,
		["print"]	= "spell",
	},
	{ -- Good Reflexes (Rank 2)
		["perkID"] 	= 1790,
		["print"]	= "spell",
	},
	{ -- Inexplicable Power (Rank 1)
		["perkID"] 	= 1786,
		["print"]	= "spell",
	},
	{ -- Inexplicable Power (Rank 2)
		["perkID"] 	= 1786,
		["print"]	= "spell",
	},
	{ -- Anima Plunderer (Rank 2)
		["perkID"] 	= 1865,
		["print"]	= "spell",
	},
	{ -- Meddle With Fate (Rank 1)
		["perkID"] 	= 1864,
		["print"]	= "spell",
	},
	{ -- Empowered Nova
		["perkID"] 	= 1878,
		["print"]	= "spell",
	},
	{ -- Meddle With Fate (Rank 2)
		["perkID"] 	= 1864,
		["print"]	= "spell",
	},
	{ -- Meddle With Fate (Rank 3)
		["perkID"] 	= 1864,
		["print"]	= "spell",
	},
	{ -- Inexplicable Power (Rank 3)
		["perkID"] 	= 1786,
		["print"]	= "spell",
	},
	{ -- Inexplicable Power (Rank 4)
		["perkID"] 	= 1786,
		["print"]	= "spell",
	},
	{ -- Inexplicable Power (Rank 5)
		["perkID"] 	= 1786,
		["print"]	= "spell",
	},
	{ -- Discovered Cache (Rank 1)
		["perkID"] 	= 1792,
		["print"]	= "spell",
	},
	{ -- Discovered Cache (Rank 2)
		["perkID"] 	= 1792,
		["print"]	= "spell",
	},
	{ -- Discovered Cache (Rank 3)
		["perkID"] 	= 1792,
		["print"]	= "spell",
	},
	{ -- Undeterred (Rank 1)
		["perkID"] 	= 1793,
		["print"]	= "spell",
	},
	{ -- Undeterred (Rank 2)
		["perkID"] 	= 1793,
		["print"]	= "spell",
	},
	{ -- Undeterred (Rank 3)
		["perkID"] 	= 1793,
		["print"]	= "spell",
	},
	{ -- Death Denied (Rank 1)
		["perkID"] 	= 1791,
		["print"]	= "spell",
	},
	{ -- Death Denied (Rank 2)
		["perkID"] 	= 1791,
		["print"]	= "spell",
	},
	{ -- Death Denied (Rank 3)
		["perkID"] 	= 1791,
		["print"]	= "spell",
	},
	{ -- Undeterred (Rank 4)
		["perkID"] 	= 1793,
		["print"]	= "spell",
	},
	{ -- Undeterred (Rank 5)
		["perkID"] 	= 1793,
		["print"]	= "spell",
	},
}

addonTable.BOXOFMANYTHINGS = BOXOFMANYTHINGS