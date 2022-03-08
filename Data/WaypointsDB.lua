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
	[64854] = { -- Trappings of Success (Daily)
		{														
			1970,												-- Zereth Mortis
			39.6, 												-- X
			52.0, 												-- Y
			"Runefur",											-- Title
			nil,												-- Icon
			102146,												-- DisplayID
		},
		{														
			1970,												-- Zereth Mortis
			41.6, 												-- X
			62.4, 												-- Y
			"Bitterbeak",										-- Title
			nil,												-- Icon
			98833,												-- DisplayID
		},
		{														
			1970,												-- Zereth Mortis
			38.8, 												-- X
			58.6, 												-- Y
			"Cipherclad",										-- Title
			nil,												-- Icon
			102145,												-- DisplayID
		},
		{														
			1970,												-- Zereth Mortis
			37.4, 												-- X
			57.6, 												-- Y
			"Mawsworn Cryptoseer (scattered around)",			-- Title
			nil,												-- Icon
			92781,												-- DisplayID
		},
	},
	[65177] = { -- Fruit of the Bloom (Daily)
		{														
			1970,												-- Zereth Mortis
			47.4, 												-- X
			82.4, 												-- Y
			"Fruit of the Bloom",								-- Title
			nil,												-- Icon
			16915,												-- DisplayID
		},
	},
	[65326] = { -- Circle of Strife (Daily)
		{														
			1970,												-- Zereth Mortis
			44.0, 												-- X
			52.2, 												-- Y
			"Automa Constructor (scattered around)",			-- Title
			nil,												-- Icon
			104781,												-- DisplayID
		},
	},
	[64592] = { -- Historic Protection (Daily)
		{														
			1970,												-- Zereth Mortis
			59.6, 												-- X
			29.6, 												-- Y
			"Terraforming Record",								-- Title
			nil,												-- Icon
			nil,												-- DisplayID
		},
		{														
			1970,												-- Zereth Mortis
			59.9, 												-- X
			27.4, 												-- Y
			"Terraforming Record",								-- Title
			nil,												-- Icon
			nil,												-- DisplayID
		},
		{														
			1970,												-- Zereth Mortis
			61.2, 												-- X
			28.2, 												-- Y
			"Terraforming Record",								-- Title
			nil,												-- Icon
			nil,												-- DisplayID
		},
		{														
			1970,												-- Zereth Mortis
			61.2, 												-- X
			30.9, 												-- Y
			"Terraforming Record",								-- Title
			nil,												-- Icon
			nil,												-- DisplayID
		},
		{														
			1970,												-- Zereth Mortis
			63.4, 												-- X
			26.3, 												-- Y
			"Terraforming Record",								-- Title
			nil,												-- Icon
			nil,												-- DisplayID
		},
		{														
			1970,												-- Zereth Mortis
			66.0, 												-- X
			26.6, 												-- Y
			"Terraforming Record",								-- Title
			nil,												-- Icon
			nil,												-- DisplayID
		},
	},
}

addonTable.waypointDB = waypointDB