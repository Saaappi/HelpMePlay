local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local TITANICRESEARCH = {
	-- Corrupted Mementos: 1744
	{ -- Orb Operation Manual (Rank 1)
		["perkId"]	= 791,
		["print"]	= "spell",
	},
	{ -- Expansive Mind (Rank 1)
		["perkId"]	= 798,
		["print"]	= "spell",
	},
	{ -- Expansive Mind (Rank 2)
		["perkId"]	= 798,
		["print"]	= "spell",
	},
	{ -- Expansive Mind (Rank 3)
		["perkId"]	= 798,
		["print"]	= "spell",
	},
	{ -- Clear Sight (Rank 1)
		["perkId"]	= 802,
		["print"]	= "spell",
	},
	{ -- Clear Sight (Rank 2)
		["perkId"]	= 802,
		["print"]	= "spell",
	},
	{ -- Clear Sight (Rank 3)
		["perkId"]	= 802,
		["print"]	= "spell",
	},
	{ -- Elite Extermination (Rank 1)
		["perkId"]	= 805,
		["print"]	= "spell",
	},
	{ -- Vision Hunter (Rank 1)
		["perkId"]	= 806,
		["print"]	= "spell",
	},
	{ -- Vision Hunter (Rank 2)
		["perkId"]	= 806,
		["print"]	= "spell",
	},
	{ -- Vision Hunter (Rank 3)
		["perkId"]	= 806,
		["print"]	= "spell",
	},
	{ -- Gift of the Titans (Rank 1)
		["perkId"]	= 792,
		["print"]	= "spell",
	},
	{ -- Singular Sanitation Expertise (Rank 1)
		["perkId"]	= 794,
		["print"]	= "spell",
	},
	{ -- Singular Sanitation Expertise (Rank 2)
		["perkId"]	= 794,
		["print"]	= "spell",
	},
	{ -- Singular Sanitation Expertise (Rank 3)
		["perkId"]	= 794,
		["print"]	= "spell",
	},
	{ -- Emergency Cranial Defibrillation (Rank 1)
		["perkId"]	= 795,
		["print"]	= "spell",
	},
	{ -- Experimental Destabilization (Rank 1)
		["perkId"]	= 804,
		["print"]	= "spell",
	},
	{ -- Experimental Destabilization (Rank 2)
		["perkId"]	= 804,
		["print"]	= "spell",
	},
	{ -- Experimental Destabilization (Rank 3)
		["perkId"]	= 804,
		["print"]	= "spell",
	},
	{ -- Synchronized Mind Stabilizer (Rank 1)
		["perkId"]	= 800,
		["print"]	= "spell",
	},
}

addonTable.TITANICRESEARCH = TITANICRESEARCH