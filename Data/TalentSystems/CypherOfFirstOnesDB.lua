local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local CYPHERSOFTHEFIRSTONES = {
	-- Cyphers of the First Ones: 1979
	{ -- Metrial Understanding
		["perkId"]	= 1901,
		["print"] 	= "name",
	},
	{ -- Cachial Understanding
		["perkId"] 	= 1972,
		["print"] 	= "name",
	},
	{ -- Aealic Understanding
		["perkId"] 	= 1904,
		["print"] 	= "name",
	},
	{ -- Altonian Understanding
		["perkId"] 	= 1902,
		["print"] 	= "name",
	},
	{ -- Dealic Understanding
		["perkId"] 	= 1932,
		["print"] 	= "name",
	},
	{ -- Elic
		["perkId"] 	= 1988,
		["print"] 	= "name",
	},
	{ -- Sopranian Understanding
		["perkId"] 	= 1931,
		["print"] 	= "name",
	},
	{ -- Corial
		["perkId"] 	= 1971,
		["print"] 	= "name",
	},
}

addonTable.CYPHERSOFTHEFIRSTONES = CYPHERSOFTHEFIRSTONES