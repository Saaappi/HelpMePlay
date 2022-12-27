local addonName, addonTable = ...
local e = CreateFrame("Frame")
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
}

addonTable.WAYPOINTS = WAYPOINTS