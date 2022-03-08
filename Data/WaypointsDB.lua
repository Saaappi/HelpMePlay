local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local waypointDB = {
	[65325] = { -- Motes of Knowledge (Daily)
		{
			1970,						-- Zereth Mortis
			64, 						-- X
			69, 						-- Y
			"Compilation Nodule",		-- Title
			"4038106",					-- Icon
			nil,						-- DisplayID
		},
		{
			1970,						-- Zereth Mortis
			61.2, 						-- X
			68.4, 						-- Y
			"Composition Mote",			-- Title
			"4038107",					-- Icon
			nil,						-- DisplayID
		},
	},
	[65363] = { -- Dangerous State (Daily)
		{														
			1970,												-- Zereth Mortis
			44.4, 												-- X
			42.2, 												-- Y
			"Leashkeeper Helzid",								-- Title
			nil,												-- Icon
			100683,												-- DisplayID
		},
		{
			1970,												-- Zereth Mortis
			47.2, 												-- X
			40.2, 												-- Y
			"Dominated Jiro (scattered in the area)",			-- Title
			nil,												-- Icon
			98978,												-- DisplayID
		},
	},
	[64977] = { -- Step into the Ring (Daily)
		{														
			1970,												-- Zereth Mortis
			58.0, 												-- X
			44.4, 												-- Y
			"Nexus of Actualization",							-- Title
			nil,												-- Icon
			nil,												-- DisplayID
		},
	},
	[64785] = { -- Overgrown Story (Daily)
		{														
			1970,												-- Zereth Mortis
			60.6, 												-- X
			64.6, 												-- Y
			"Gaiagantic",										-- Title
			nil,												-- Icon
			102117,												-- DisplayID
		},
		{
			1970,												-- Zereth Mortis
			61.6, 												-- X
			68.6, 												-- Y
			"Overgrown Geomental (scattered in the area)",		-- Title
			nil,												-- Icon
			100374,												-- DisplayID
		},
	},
}

addonTable.waypointDB = waypointDB