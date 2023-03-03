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
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			48,																	-- Loch Modan
			41.3, 																-- X
			39.1, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			48,																	-- Loch Modan
			61.6, 																-- X
			73.1, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			48,																	-- Loch Modan
			68.1, 																-- X
			66.0, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			48,																	-- Loch Modan
			53.7, 																-- X
			38.2, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			48,																	-- Loch Modan
			73.1, 																-- X
			35.9, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
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
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
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
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
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
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			1536,																-- Maldraxxus
			73.9, 																-- X
			49.4, 																-- Y
			L_WAYPOINTS["Waypoint: Treasure"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			1536,																-- Maldraxxus
			75.41, 																-- X
			43.21, 																-- Y
			L_WAYPOINTS["Waypoint: Treasure"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
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
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
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
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			2023,																-- Ohn'ahran Plains
			26.2, 																-- X
			65.2, 																-- Y
			"Ripsaw the Stalker",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			2023,																-- Ohn'ahran Plains
			26.0, 																-- X
			34.2, 																-- Y
			"Ty'foon the Ascended",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			2023,																-- Ohn'ahran Plains
			62.95, 																-- X
			48.39, 																-- Y
			"Sunscale Behemoth",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			2023,																-- Ohn'ahran Plains
			45.2, 																-- X
			48.4, 																-- Y
			"Skaara",															-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			2023,																-- Ohn'ahran Plains
			59.8, 																-- X
			66.8, 																-- Y
			"Prozela Galeshot",													-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		-- Thaldraszus
		{
			2025,																-- Thaldraszus
			36.6, 																-- X
			72.8, 																-- Y
			"Liskron the Dazzling",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			2025,																-- Thaldraszus
			36.8, 																-- X
			85.6, 																-- Y
			"Lookout Mordren",													-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			2025,																-- Thaldraszus
			37.6, 																-- X
			85.0, 																-- Y
			"Private Shikzar",													-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			2025,																-- Thaldraszus
			56.1, 																-- X
			77.8, 																-- Y
			"Henlare",															-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			2025,																-- Thaldraszus
			40.8, 																-- X
			74.56, 																-- Y
			"Acrosoth",															-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[65686] = { -- To the Azure Span
		{
			2024,																-- The Azure Span
			41.4, 																-- X
			35.6, 																-- Y
			"Step 1 - The Azure Span",											-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66228] = { -- Camp Antonidas
		{
			2024,																-- The Azure Span
			45.66, 																-- X
			39.05, 																-- Y
			"Step 2 - Camp Antonidas",											-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66493] = { -- Send It!
		{
			2024,																-- The Azure Span
			65.45, 																-- X
			16.04, 																-- Y
			"Step 3 - Hollow Up",												-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66557] = { -- Academic Aquaintances
		{
			2024,																-- The Azure Span
			63.72, 																-- X
			28.95, 																-- Y
			"Step 4 - Prowling Polar Predators",								-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[70338] = { -- They Took the Kits
		{
			2024,																-- The Azure Span
			70.0, 																-- X
			33.6, 																-- Y
			"Step 5 - Summoned Destroyer (Rare)",								-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[69895] = { -- Summoned Destroyer
		{
			2024,																-- The Azure Span
			59.27, 																-- X
			39.75, 																-- Y
			"Step 6 - Field Medic 101",											-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66730] = { -- True Survivors
		{
			2024,																-- The Azure Span
			58.81, 																-- X
			34.91, 																-- Y
			"Step 7 - Old Grimtusk",											-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[71014] = { -- A Far Furbolg Friend
		{
			2024,																-- The Azure Span
			67.24, 																-- X
			44.42, 																-- Y
			"Step 8 - The Ailing Apprentice",									-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[70970] = { -- Good Intentions
		{
			2024,																-- The Azure Span
			63.25, 																-- X
			58.39, 																-- Y
			"Step 9 - Camp Nowhere",											-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66429] = { -- I Will Remember
		{
			2024,																-- The Azure Span
			44.78, 																-- X
			50.64, 																-- Y
			"Step 10 - Mammoths Matter",										-- Title
			236671,																-- Icon
			nil,																-- DisplayID																
			{ 																	-- Prerequisite Quests
				66152, -- Nowhere to Go
			},
			"accept", 															-- Plot Condition
		},
	},
	[66152] = { -- Nowhere to Go
		{
			2024,																-- The Azure Span
			44.78, 																-- X
			50.64, 																-- Y
			"Step 10 - Mammoths Matter",										-- Title
			236671,																-- Icon
			nil,																-- DisplayID																
			{ 																	-- Prerequisite Quests
				66429, -- I Will Remember
			},
			"accept", 															-- Plot Condition
		},
	},
	[65928] = { -- Wayward Winds
		{
			2024,																-- The Azure Span
			45.82, 																-- X
			56.15, 																-- Y
			"Tuskarr Chest (Experience)",										-- Title
			4203076,															-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66155] = { -- Ruriq's River Rapids Ride
		{
			2024,																-- The Azure Span
			40.96, 																-- X
			55.02, 																-- Y
			"Step 11 - Meeting Kalecgos",										-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[65855] = { -- Aiding Azure Span
		{
			2024,																-- The Azure Span
			38.48, 																-- X
			59.62, 																-- Y
			"Step 12 - Forgotten Creation (Rare)",								-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[69864] = { -- Forgotten Creation
		{
			2024,																-- The Azure Span
			45.66, 																-- X
			39.05, 																-- Y
			"Step 13 - Camp Antonidas",											-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66503] = { -- For The Love of Others
		{
			2024,																-- The Azure Span
			35.32, 																-- X
			37.05, 																-- Y
			"Step 14 - Catch the Caravan",										-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[65867] = { -- Howling in the Big Tree Hills
		{
			2024,																-- The Azure Span
			36.8, 																-- X
			32.6, 																-- Y
			"Step 15 - Sharpfang (Rare)",										-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66026] = { -- Urgent Action Required
		{
			2024,																-- The Azure Span
			23.6, 																-- X
			33.6, 																-- Y
			"Step 16 - Cascade (Rare)",											-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[72358] = { -- Cascade
		{
			2024,																-- The Azure Span
			21.08, 																-- X
			35.14, 																-- Y
			"Step 17 - All Brawn, No Brains",									-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[71012] = { -- Varsek Recruited
		{
			2024,																-- The Azure Span
			20.61, 																-- X
			35.67, 																-- Y
			"Step 18 -  Urgent Action Required",								-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[65849] = { -- To Iskaara
		{
			2024,																-- The Azure Span
			17.2, 																-- X
			41.8, 																-- Y
			"Step 19 - Vakril (Rare)",											-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
		{
			2024,																-- The Azure Span
			13.74, 																-- X
			47.46, 																-- Y
			"Step 20 - Iskaara",												-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[65911] = { -- Azure Alignment
		{
			2024,																-- The Azure Span
			1.25, 																-- X
			39.15, 																-- Y
			"Step 21 - A Far Furbolg Friend",									-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66223] = { -- Can We Keep It?
		{
			2024,																-- The Azure Span
			13.84, 																-- X
			49.44, 																-- Y
			"Can We Keep It? - Frigidfish (Merchant)",							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[71000] = { -- Barst Recruited
		{
			2024,																-- The Azure Span
			39.71, 																-- X
			62.75, 																-- Y
			"Step 22 - Azure Archives",											-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66027] = { -- Calling the Blue Dragons
		{
			2024,																-- The Azure Span
			58.79, 																-- X
			34.83, 																-- Y
			"Step 23 - Old Grimtusk",											-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[71135] = { -- Loose Ends
		{
			2024,																-- The Azure Span
			65.80, 																-- X
			25.39, 																-- Y
			"Step 24 - Drakes be Gone",											-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"complete", 														-- Plot Condition
		},
	},
	[70122] = { -- Explorers in Peril (Alliance)
		{
			2022,																-- The Waking Shores
			81.4, 																-- X
			37.4, 																-- Y
			"Step 1 - Primal Scythid Queen (Rare)",								-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66074] = { -- Primal Scythid Queen
		{
			2022,																-- The Waking Shores
			77.6, 																-- X
			22.4, 																-- Y
			"Step 2 - Ancient Hornswog (Rare)",									-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"complete", 														-- Plot Condition
			"Alliance",															-- Faction
		},
	},
	[65452] = { -- Explorers in Peril (Horde)
		{
			2022,																-- The Waking Shores
			77.6, 																-- X
			22.4, 																-- Y
			"Step 1 - Ancient Hornswog (Rare)",									-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66076] = { -- Ancient Hornswog
		{
			2022,																-- The Waking Shores
			81.4, 																-- X
			37.4, 																-- Y
			"Step 2 - Primal Scythid Queen (Rare)",								-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"complete", 														-- Plot Condition
			"Horde", 															-- Faction
		},
	},
	[70125] = { -- Where is Wrathion? (Alliance)
		{
			2022,																-- The Waking Shores
			76.36, 																-- X
			34.13, 																-- Y
			"Step 3 - Wingrest Embassy\n\n" ..									-- Title
			"|cffFFD100Complete all quests in this hub.\n\n" ..
			"|cffFF0000DO NOT ACCEPT THE ARTISAN'S SUPPLY QUESTS!|r",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[69910] = { -- Where is Wrathion? (Horde)
		{
			2022,																-- The Waking Shores
			76.36, 																-- X
			34.13, 																-- Y
			"Step 3 - Wingrest Embassy\n\n" ..									-- Title
			"|cffFFD100Complete all quests in this hub.\n\n" ..
			"|cffFF0000DO NOT ACCEPT THE ARTISAN'S SUPPLY QUESTS!|r",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[65760] = { -- Reporting for Duty
		{
			2022,																-- The Waking Shores
			71.19, 																-- X
			40.78, 																-- Y
			"Step 4 - Reporting for Duty\n\n" ..								-- Title
			"|cffFFD100Stick to main story quests at this hub.|r",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[65994] = { -- Djaradin Justice (Bonus Objective)
		{
			2022,																-- The Waking Shores
			64.2, 																-- X
			33.0, 																-- Y
			"Step 5 - Dragonhunter Igordan (Rare)",								-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[65999] = { -- Red in Tooth and Claw
		{
			2022,																-- The Waking Shores
			54.8, 																-- X
			21.6, 																-- Y
			"Step 6 - Firava the Rekindler (Rare)",								-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66114] = { -- For the Benefit of the Queen
		{
			2022,																-- The Waking Shores
			57.84, 																-- X
			66.85, 																-- Y
			"Step 7 - Stay a While\n\n" ..										-- Title
			"|cffFFD100Keep to the main story quests.|r\n" ..
			"|cffFFD100Accept the side quest from Veritistrasz but ignore the rest.|r",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[68799] = { -- Return to the Ruby Lifeshrine
		{
			2022,																-- The Waking Shores
			66.01, 																-- X
			58.15, 																-- Y
			"Step 8 - Site Salvage\n\n" ..										-- Title
			"|cffFFD100Complete all the quests in the area.|r",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66436] = { -- Unearthed Troublemakers
		{
			2022,																-- The Waking Shores
			67.86, 																-- X
			57.98, 																-- Y
			"Chest (Experience)",												-- Title
			4203076,															-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66447] = { -- Beyond the Barrier
		{
			2022,																-- The Waking Shores
			62.26, 																-- X
			72.88, 																-- Y
			"Step 9 - Ruby Lifeshrine\n\n" ..									-- Title
			"|cffFFD100There aren't any side quests left in the route, so focus on main story quests.|r",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"complete", 														-- Plot Condition
		},
	},
	[66118] = { -- Basalt Assault
		{
			2022,																-- The Waking Shores
			60.6, 																-- X
			83.0, 																-- Y
			"Step 10 - Terillod the Devout (Rare)",								-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66122] = { -- Proto-Fight
		{
			2022,																-- The Waking Shores
			54.8, 																-- X
			82.2, 																-- Y
			"Step 11 - Klozicc the Ascended (Rare)",							-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
	[66124] = { -- Exeunt, Triumphant
		{
			2022,																-- The Waking Shores
			46.19, 																-- X
			78.32, 																-- Y
			"Step 18 - Exeunt, Triumphant",										-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
			"accept", 															-- Plot Condition
		},
	},
}

addonTable.WAYPOINTS = WAYPOINTS