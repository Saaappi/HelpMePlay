local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local L_WAYPOINTS = addonTable.L_WAYPOINTS
local WAYPOINTS = {
	[26176] = { -- Onward to Thelsamar
		{
			48,																	-- Loch Modan
			36.8, 																-- X
			61.2, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			48,																	-- Loch Modan
			41.3, 																-- X
			39.1, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			48,																	-- Loch Modan
			61.6, 																-- X
			73.1, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			48,																	-- Loch Modan
			68.1, 																-- X
			66.0, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			48,																	-- Loch Modan
			53.7, 																-- X
			38.2, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			48,																	-- Loch Modan
			73.1, 																-- X
			35.9, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[62721] = { -- Deconstructing The Problem (Bonus Objective)
		{
			1536,																-- Maldraxxus
			30.9, 																-- X
			28.7, 																-- Y
			L_WAYPOINTS["Waypoint: Treasure"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[62741] = { -- Choice of Action (Bonus Objective)
		{
			1536,																-- Maldraxxus
			47.25, 																-- X
			62.12, 																-- Y
			L_WAYPOINTS["Waypoint: Treasure"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[62743] = { -- Decaying Situation (Bonus Objective)
		{
			1536,																-- Maldraxxus
			65.68, 																-- X
			50.76, 																-- Y
			L_WAYPOINTS["Waypoint: Treasure"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1536,																-- Maldraxxus
			73.9, 																-- X
			49.4, 																-- Y
			L_WAYPOINTS["Waypoint: Treasure"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1536,																-- Maldraxxus
			75.41, 																-- X
			43.21, 																-- Y
			L_WAYPOINTS["Waypoint: Treasure"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[60900] = { -- Archival Protection
		{
			1536,																-- Maldraxxus
			42.35, 																-- X
			23.33, 																-- Y
			L_WAYPOINTS["Waypoint: Treasure"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[70845] = { -- In Tyr's Footsteps
		-- Ohn'ahran Plains
		{
			2023,																-- Ohn'ahran Plains
			23.0, 																-- X
			66.6, 																-- Y
			"Territorial Coastling",											-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2023,																-- Ohn'ahran Plains
			26.2, 																-- X
			65.2, 																-- Y
			"Ripsaw the Stalker",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2023,																-- Ohn'ahran Plains
			26.0, 																-- X
			34.2, 																-- Y
			"Ty'foon the Ascended",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2023,																-- Ohn'ahran Plains
			62.95, 																-- X
			48.39, 																-- Y
			"Sunscale Behemoth",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2023,																-- Ohn'ahran Plains
			45.2, 																-- X
			48.4, 																-- Y
			"Skaara",															-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2023,																-- Ohn'ahran Plains
			59.8, 																-- X
			66.8, 																-- Y
			"Prozela Galeshot",													-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		-- Thaldraszus
		{
			2025,																-- Thaldraszus
			36.6, 																-- X
			72.8, 																-- Y
			"Liskron the Dazzling",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2025,																-- Thaldraszus
			36.8, 																-- X
			85.6, 																-- Y
			"Lookout Mordren",													-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2025,																-- Thaldraszus
			37.6, 																-- X
			85.0, 																-- Y
			"Private Shikzar",													-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2025,																-- Thaldraszus
			56.1, 																-- X
			77.8, 																-- Y
			"Henlare",															-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2025,																-- Thaldraszus
			40.8, 																-- X
			74.56, 																-- Y
			"Acrosoth",															-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		-- The Waking Shores
		{
			2022,																-- The Waking Shores
			77.6, 																-- X
			22.4, 																-- Y
			"Ancient Hornswog",													-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2022,																-- The Waking Shores
			81.4, 																-- X
			37.4, 																-- Y
			"Primal Scythid Queen",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2022,																-- The Waking Shores
			64.2, 																-- X
			33.0, 																-- Y
			"Dragonhunter Igordan",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2022,																-- The Waking Shores
			54.8, 																-- X
			21.6, 																-- Y
			"Firava the Rekindler",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2022,																-- The Waking Shores
			60.6, 																-- X
			83.0, 																-- Y
			"Terillod the Devout",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2022,																-- The Waking Shores
			54.8, 																-- X
			82.2, 																-- Y
			"Klozicc the Ascended",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		-- The Azure Span
		{
			2024,																-- The Azure Span
			36.8, 																-- X
			32.6, 																-- Y
			"Sharpfang",														-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2024,																-- The Azure Span
			23.6, 																-- X
			33.6, 																-- Y
			"Cascade",															-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			2024,																-- The Azure Span
			17.2, 																-- X
			41.8, 																-- Y
			"Vakril",															-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65686] = { -- To the Azure Span
		{
			2024,																-- The Azure Span
			41.4, 																-- X
			35.6, 																-- Y
			"Step 1 - The Azure Span",											-- Title
			236668,																-- Icon
			nil,																-- DisplayID
		},
		{
			2024,																-- The Azure Span
			45.66, 																-- X
			39.05, 																-- Y
			"Step 2 - Camp Antonidas",											-- Title
			236668,																-- Icon
			nil,																-- DisplayID
		},
		{
			2024,																-- The Azure Span
			65.45, 																-- X
			16.04, 																-- Y
			"Step 3 - Hollow Up",												-- Title
			236668,																-- Icon
			nil,																-- DisplayID
		},
		{
			2024,																-- The Azure Span
			63.72, 																-- X
			28.95, 																-- Y
			"Step 4 - Prowling Predators",										-- Title
			236668,																-- Icon
			nil,																-- DisplayID
		},
		{
			2024,																-- The Azure Span
			70.0, 																-- X
			33.6, 																-- Y
			"Step 5 - Summoned Destroyer (Rare)",								-- Title
			133731,																-- Icon
			nil,																-- DisplayID
		},
		{
			2024,																-- The Azure Span
			59.27, 																-- X
			39.75, 																-- Y
			"Step 6 - Field Medic 101",											-- Title
			236668,																-- Icon
			nil,																-- DisplayID
		},
		{
			2024,																-- The Azure Span
			58.81, 																-- X
			34.91, 																-- Y
			"Step 7 - Old Grimtusk",											-- Title
			236668,																-- Icon
			nil,																-- DisplayID
		},
		{
			2024,																-- The Azure Span
			67.24, 																-- X
			44.42, 																-- Y
			"Step 8 - The Ailing Apprentice",									-- Title
			236668,																-- Icon
			nil,																-- DisplayID
		},
		{
			2024,																-- The Azure Span
			63.25, 																-- X
			58.39, 																-- Y
			"Step 9 - Camp Nowhere",											-- Title
			236668,																-- Icon
			nil,																-- DisplayID
		},
		{
			2024,																-- The Azure Span
			44.79, 																-- X
			50.66, 																-- Y
			"Step 10 - Mammoths Matter",										-- Title
			236668,																-- Icon
			nil,																-- DisplayID
		},
		{
			2024,																-- The Azure Span
			40.96, 																-- X
			55.02, 																-- Y
			"Step 11 - Meeting Kalecgos",										-- Title
			236668,																-- Icon
			nil,																-- DisplayID
		},
		{
			2024,																-- The Azure Span
			38.48, 																-- X
			59.62, 																-- Y
			"Step 12 - Forgotten Creation (Rare)",								-- Title
			133731,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65855] = { -- Aiding Azure Span
		{
			2024,																-- The Azure Span
			45.66, 																-- X
			39.05, 																-- Y
			"Step 13 - Camp Antonidas",											-- Title
			236668,																-- Icon
			nil,																-- DisplayID
		},
	},
}

addonTable.WAYPOINTS = WAYPOINTS