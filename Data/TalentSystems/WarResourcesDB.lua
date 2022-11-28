local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local WARRESOURCES = {
	-- War Resources: 1560
	{ -- Swift Landing
		["perkId"]	= 548,
		["print"]	= "",
		["f"]		= "Horde",
	},
	{ -- Swift Landing
		["perkId"]	= 552,
		["print"]	= "",
		["f"]		= "Alliance",
	},
	{ -- Upgraded Troop Barracks
		["perkId"]	= 553,
		["print"]	= "",
		["f"]		= "",
	},
	{ -- Island Plunderer
		["perkId"]	= 662,
		["print"]	= "",
		["f"]		= "",
	},
	{ -- Local Transportation
		["perkId"]	= 665,
		["print"]	= "",
		["f"]		= "",
	},
	{ -- Warfront Resourcer
		["perkId"]	= 666,
		["print"]	= "",
		["f"]		= "",
	},
}

addonTable.WARRESOURCES = WARRESOURCES