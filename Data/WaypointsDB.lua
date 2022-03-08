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
			"Dominated Jiro (scattered around)",				-- Title
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
			"Overgrown Geomental (scattered around)",			-- Title
			nil,												-- Icon
			100374,												-- DisplayID
		},
	},
	[65096] = { -- Your Death Or Mine (Daily)
		{														
			1970,												-- Zereth Mortis
			65.4, 												-- X
			45.4, 												-- Y
			"Punisher Makaris",									-- Title
			nil,												-- Icon
			100717,												-- DisplayID
		},
		{
			1970,												-- Zereth Mortis
			64.6, 												-- X
			43.9, 												-- Y
			"Sacred Relic (use the mines, scattered around)",	-- Title
			"4038106",											-- Icon
			nil,												-- DisplayID
		},
	},
	[64717] = { -- Materials of Creation (Daily)
		{														
			1970,												-- Zereth Mortis
			45.3, 												-- X
			45.9, 												-- Y
			"Eidolic Fragment",									-- Title
			"463857",											-- Icon
			nil,												-- DisplayID
		},
		{														
			1970,												-- Zereth Mortis
			45.3, 												-- X
			61.5, 												-- Y
			"Eidolic Fragment",									-- Title
			"463857",											-- Icon
			nil,												-- DisplayID
		},
		{														
			1970,												-- Zereth Mortis
			50.0, 												-- X
			47.0, 												-- Y
			"Eidolic Fragment",									-- Title
			"463857",											-- Icon
			nil,												-- DisplayID
		},
		{
			1970,												-- Zereth Mortis
			42.6, 												-- X
			46.0, 												-- Y
			"Minor Enigmet",									-- Title
			"4038105",											-- Icon
			nil,												-- DisplayID
		},
		{
			1970,												-- Zereth Mortis
			41.3, 												-- X
			48.0, 												-- Y
			"Minor Enigmet",									-- Title
			"4038105",											-- Icon
			nil,												-- DisplayID
		},
		{
			1970,												-- Zereth Mortis
			42.6, 												-- X
			49.7, 												-- Y
			"Minor Enigmet",									-- Title
			"4038105",											-- Icon
			nil,												-- DisplayID
		},
		{
			1970,												-- Zereth Mortis
			43.4, 												-- X
			50.5, 												-- Y
			"Minor Enigmet",									-- Title
			"4038105",											-- Icon
			nil,												-- DisplayID
		},
		{
			1970,												-- Zereth Mortis
			44.7, 												-- X
			52.2, 												-- Y
			"Minor Enigmet",									-- Title
			"4038105",											-- Icon
			nil,												-- DisplayID
		},
	},
	[64964] = { -- Choose Your Fighter (Daily)
		{														
			1970,												-- Zereth Mortis
			48.6, 												-- X
			50.0, 												-- Y
			"Custodian Taj",									-- Title
			nil,												-- Icon
			102043,												-- DisplayID
		},
	},
}

addonTable.waypointDB = waypointDB