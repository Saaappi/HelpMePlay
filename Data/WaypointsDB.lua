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
		},
		{
			48,																	-- Loch Modan
			41.3, 																-- X
			39.1, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			48,																	-- Loch Modan
			61.6, 																-- X
			73.1, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			48,																	-- Loch Modan
			68.1, 																-- X
			66.0, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			48,																	-- Loch Modan
			53.7, 																-- X
			38.2, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			48,																	-- Loch Modan
			73.1, 																-- X
			35.9, 																-- Y
			L_WAYPOINTS["Waypoint: Explorer Doc"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
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
		},
		{
			1536,																-- Maldraxxus
			73.9, 																-- X
			49.4, 																-- Y
			L_WAYPOINTS["Waypoint: Treasure"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			1536,																-- Maldraxxus
			75.41, 																-- X
			43.21, 																-- Y
			L_WAYPOINTS["Waypoint: Treasure"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
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
		},
		{
			2023,																-- Ohn'ahran Plains
			26.2, 																-- X
			65.2, 																-- Y
			"Ripsaw the Stalker",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2023,																-- Ohn'ahran Plains
			26.0, 																-- X
			34.2, 																-- Y
			"Ty'foon the Ascended",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2023,																-- Ohn'ahran Plains
			62.95, 																-- X
			48.39, 																-- Y
			"Sunscale Behemoth",												-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2023,																-- Ohn'ahran Plains
			45.2, 																-- X
			48.4, 																-- Y
			"Skaara",															-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2023,																-- Ohn'ahran Plains
			59.8, 																-- X
			66.8, 																-- Y
			"Prozela Galeshot",													-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
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
		},
		{
			2025,																-- Thaldraszus
			36.8, 																-- X
			85.6, 																-- Y
			"Lookout Mordren",													-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2025,																-- Thaldraszus
			37.6, 																-- X
			85.0, 																-- Y
			"Private Shikzar",													-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2025,																-- Thaldraszus
			56.1, 																-- X
			77.8, 																-- Y
			"Henlare",															-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2025,																-- Thaldraszus
			40.8, 																-- X
			74.56, 																-- Y
			"Acrosoth",															-- Title
			nil,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
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
		},
	},
	[66429] = { -- I Will Remember
		{
			2024,																-- The Azure Span
			44.79, 																-- X
			50.66, 																-- Y
			"Step 10 - Mammoths Matter",										-- Title
			236671,																-- Icon
			nil,																-- DisplayID																
			{ 																	-- Prerequisite Quests
				66152, -- Nowhere to Go
			}, 																
		},
	},
	[66152] = { -- Nowhere to Go
		{
			2024,																-- The Azure Span
			44.79, 																-- X
			50.66, 																-- Y
			"Step 10 - Mammoths Matter",										-- Title
			236671,																-- Icon
			nil,																-- DisplayID																
			{ 																	-- Prerequisite Quests
				66429, -- I Will Remember
			}, 																
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
		},
	},
	[66239] = { -- Spreading Decay
		{
			2024,																-- The Azure Span
			36.8, 																-- X
			32.6, 																-- Y
			"Step 15 - Sharpfang (Rare)",										-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[67173] = { -- Thieving Gnolls
		{
			2024,																-- The Azure Span
			23.6, 																-- X
			33.6, 																-- Y
			"Step 16 - Cascade (Rare)",											-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
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
		},
	},
	[65849] = { -- To Iskaara
		{
			2024,																-- The Azure Span
			17.2, 																-- X
			41.8, 																-- Y
			"Step 18 - Vakril (Rare)",											-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2024,																-- The Azure Span
			13.74, 																-- X
			47.46, 																-- Y
			"Step 19 - Iskaara\n\n" ..											-- Title
			"|cffFFFFFFSkip:|r\n" ..
			"|cffFFFFFF- Brackenhide Hollow|r\n" ..
			"|cffFFFFFF- WANTED|r\n" ..
			"|cffFFFFFF- Fishing Seamoth|r\n" ..
			"|cffFFFFFF- Nook News|r",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[65911] = { -- Azure Alignment
		{
			2024,																-- The Azure Span
			1.25, 																-- X
			39.15, 																-- Y
			"Step 20 - A Far Furbolg Friend",									-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[71000] = { -- Barst Recruited
		{
			2024,																-- The Azure Span
			39.71, 																-- X
			62.75, 																-- Y
			"Step 21 - Azure Archives",											-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2024,																-- The Azure Span
			58.79, 																-- X
			34.83, 																-- Y
			"Step 22 - Old Grimtusk",											-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[71135] = { -- Loose Ends
		{
			2024,																-- The Azure Span
			58.79, 																-- X
			34.83, 																-- Y
			"Step 23 - Rhonin's Shield\n\n" ..									-- Title
			"Only do |cffFFFFFFDrakes be Gone|r!",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[70122] = { -- Explorers in Peril (Alliance)
		{
			2022,																-- The Waking Shores
			81.68, 																-- X
			33.25, 																-- Y
			"Step 1 - Explorers in Peril",										-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2022,																-- The Waking Shores
			81.4, 																-- X
			37.4, 																-- Y
			"Step 2 - Primal Scythid Queen (Rare)",								-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2022,																-- The Waking Shores
			77.6, 																-- X
			22.4, 																-- Y
			"Step 3 - Ancient Hornswog (Rare)",									-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2022,																-- The Waking Shores
			76.57, 																-- X
			33.72, 																-- Y
			"Step 4 - Where's Wrathion?\n\n" ..									-- Title
			"Skip:\n" ..
			"- Artisan's Supply",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[65452] = { -- Explorers in Peril (Horde)
		{
			2022,																-- The Waking Shores
			39.71, 																-- X
			62.75, 																-- Y
			"Step 1 - Explorers in Peril",										-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2022,																-- The Waking Shores
			81.4, 																-- X
			37.4, 																-- Y
			"Step 2 - Primal Scythid Queen (Rare)",								-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2022,																-- The Waking Shores
			77.6, 																-- X
			22.4, 																-- Y
			"Step 3 - Ancient Hornswog (Rare)",									-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2022,																-- The Waking Shores
			77.6, 																-- X
			22.4, 																-- Y
			"Step 4 - Where's Wrathion?\n\n" ..									-- Title
			"Skip:\n" ..
			"- Artisan's Supply",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[72293] = { -- Adventuring in the Dragon Isles
		{
			2022,																-- The Waking Shores
			77.6, 																-- X
			22.4, 																-- Y
			"Step 5 - Adventuring in the Dragon Isles",							-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[65760] = { -- Reporting for Duty
		{
			2022,																-- The Waking Shores
			71.19, 																-- X
			40.78, 																-- Y
			"Step 6 - Reporting for Duty\n\n" ..								-- Title
			"Stick to main story quests at this hub.",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[65991] = { -- Time for a Reckoning
		{
			2022,																-- The Waking Shores
			66.35, 																-- X
			34.92, 																-- Y
			"Step 7 - Time for a Reckoning\n\n" ..								-- Title
			"Complete the bonus objective and all of Wrathion's quests.",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2022,																-- The Waking Shores
			64.2, 																-- X
			33.0, 																-- Y
			"Step 8 - Dragonhunter Igordan (Rare)",								-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2022,																-- The Waking Shores
			55.01, 																-- X
			30.88, 																-- Y
			"Step 9 - Chasing Sendrax\n\n" ..									-- Title
			"Keep following the main story quests. Don't accept any side quests!",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[65999] = { -- Red in Tooth and Claw
		{
			2022,																-- The Waking Shores
			54.8, 																-- X
			21.6, 																-- Y
			"Step 10 - Firava the Rekindler (Rare)",							-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[66114] = { -- For the Benefit of the Queen
		{
			2022,																-- The Waking Shores
			62.26, 																-- X
			72.88, 																-- Y
			"Step 11 - For the Benefit of the Queen\n\n" ..						-- Title
			"Keep following the main story quests.\n\n" ..
			"The only side quest we accept is the one from Veritistrasz (step 12).",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2022,																-- The Waking Shores
			57.84, 																-- X
			66.85, 																-- Y
			"Step 12 - Stay a While",											-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[68799] = { -- Return to the Ruby Lifeshrine
		{
			2022,																-- The Waking Shores
			66.01, 																-- X
			58.15, 																-- Y
			"Step 13 - Site Salvage\n\n" ..										-- Title
			"Complete all the quests in the area.",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
		{
			2022,																-- The Waking Shores
			70.48, 																-- X
			56.81, 																-- Y
			"Step 14 - Drainage Solutions",										-- Title
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[66447] = { -- Beyond the Barrier
		{
			2022,																-- The Waking Shores
			62.26, 																-- X
			72.88, 																-- Y
			"Step 15 - Ruby Lifeshrine\n\n" ..									-- Title
			"There aren't any side quests left in the route, so focus on main story quests!",
			236671,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[66118] = { -- Basalt Assault
		{
			2022,																-- The Waking Shores
			60.6, 																-- X
			83.0, 																-- Y
			"Step 16 - Terillod the Devout (Rare)",								-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
		},
	},
	[66122] = { -- Proto-Fight
		{
			2022,																-- The Waking Shores
			54.8, 																-- X
			82.2, 																-- Y
			"Step 17 - Klozicc the Ascended (Rare)",							-- Title
			133731,																-- Icon
			nil,																-- DisplayID
			{}, 																-- Prerequisite Quests
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
		},
	},
}

addonTable.WAYPOINTS = WAYPOINTS