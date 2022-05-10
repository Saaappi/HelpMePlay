local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
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
	[13670] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_WAYPOINTS["Waypoint: Lord Everblaze"],							-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Winter's Breath Lake"],			-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13675] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_WAYPOINTS["Waypoint: Lord Everblaze"],							-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Winter's Breath Lake"],			-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13616] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_WAYPOINTS["Waypoint: Lord Everblaze"],							-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Winter's Breath Lake"],			-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13743] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_WAYPOINTS["Waypoint: Lord Everblaze"],							-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Winter's Breath Lake"],			-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13770] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_WAYPOINTS["Waypoint: Lord Everblaze"],							-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Winter's Breath Lake"],			-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13780] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_WAYPOINTS["Waypoint: Lord Everblaze"],							-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Winter's Breath Lake"],			-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13754] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_WAYPOINTS["Waypoint: Lord Everblaze"],							-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Winter's Breath Lake"],			-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13764] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_WAYPOINTS["Waypoint: Lord Everblaze"],							-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Winter's Breath Lake"],			-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13748] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_WAYPOINTS["Waypoint: Lord Everblaze"],							-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Winter's Breath Lake"],			-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13785] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_WAYPOINTS["Waypoint: Lord Everblaze"],							-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Winter's Breath Lake"],			-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13759] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_WAYPOINTS["Waypoint: Lord Everblaze"],							-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Winter's Breath Lake"],			-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13775] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_WAYPOINTS["Waypoint: Lord Everblaze"],							-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Winter's Breath Lake"],			-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13669] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_WAYPOINTS["Waypoint: Winter Hyacinth"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},				
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Drak'Mar"],						-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13769] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_WAYPOINTS["Waypoint: Winter Hyacinth"],							-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},				
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Drak'Mar"],						-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},				
	},				
	[13742] = { -- A Worthy Weapon (Daily)				
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_WAYPOINTS["Waypoint: Winter Hyacinth"],							-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Drak'Mar"],						-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13774] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_WAYPOINTS["Waypoint: Winter Hyacinth"],							-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Drak'Mar"],						-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13674] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_WAYPOINTS["Waypoint: Winter Hyacinth"],							-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Drak'Mar"],						-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13758] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_WAYPOINTS["Waypoint: Winter Hyacinth"],							-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Drak'Mar"],						-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13600] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_WAYPOINTS["Waypoint: Winter Hyacinth"],							-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Drak'Mar"],						-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13753] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_WAYPOINTS["Waypoint: Winter Hyacinth"],							-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Drak'Mar"],						-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13763] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_WAYPOINTS["Waypoint: Winter Hyacinth"],							-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Drak'Mar"],						-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13784] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_WAYPOINTS["Waypoint: Winter Hyacinth"],							-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Drak'Mar"],						-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13779] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_WAYPOINTS["Waypoint: Winter Hyacinth"],							-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Drak'Mar"],						-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13747] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_WAYPOINTS["Waypoint: Winter Hyacinth"],							-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Drak'Mar"],						-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13673] = { -- A Blade Fit For A Champion (Daily)
		{				
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Ashwood Lake"],					-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13666] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Ashwood Lake"],					-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13603] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Ashwood Lake"],					-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13783] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Ashwood Lake"],					-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13757] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Ashwood Lake"],					-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13752] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Ashwood Lake"],					-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13773] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Ashwood Lake"],					-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13741] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Ashwood Lake"],					-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13746] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Ashwood Lake"],					-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13762] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Ashwood Lake"],					-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13778] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Ashwood Lake"],					-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13768] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_WAYPOINTS["Waypoint: Maiden of Ashwood Lake"],					-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[58575] = { -- Stuff We All Get
		{
			1536,																-- Maldraxxus
			51.9, 																-- X
			49.0, 																-- Y
			L_WAYPOINTS["Waypoint: Weapons of the Fallen"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1536,																-- Maldraxxus
			52.5, 																-- X
			48.0, 																-- Y
			L_WAYPOINTS["Waypoint: Weapons of the Fallen"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1536,																-- Maldraxxus
			52.0, 																-- X
			47.5, 																-- Y
			L_WAYPOINTS["Waypoint: Weapons of the Fallen"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1536,																-- Maldraxxus
			51.0, 																-- X
			44.5, 																-- Y
			L_WAYPOINTS["Waypoint: Weapons of the Fallen"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1536,																-- Maldraxxus
			51.2, 																-- X
			45.3, 																-- Y
			L_WAYPOINTS["Waypoint: Weapons of the Fallen"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1536,																-- Maldraxxus
			50.7, 																-- X
			46.3, 																-- Y
			L_WAYPOINTS["Waypoint: Weapons of the Fallen"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1536,																-- Maldraxxus
			49.7, 																-- X
			44.4, 																-- Y
			L_WAYPOINTS["Waypoint: Weapons of the Fallen"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1536,																-- Maldraxxus
			48.9, 																-- X
			45.0, 																-- Y
			L_WAYPOINTS["Waypoint: Weapons of the Fallen"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1536,																-- Maldraxxus
			48.9, 																-- X
			45.8, 																-- Y
			L_WAYPOINTS["Waypoint: Weapons of the Fallen"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1536,																-- Maldraxxus
			48.2, 																-- X
			47.9, 																-- Y
			L_WAYPOINTS["Waypoint: Weapons of the Fallen"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1536,																-- Maldraxxus
			49.0, 																-- X
			49.3, 																-- Y
			L_WAYPOINTS["Waypoint: Weapons of the Fallen"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1536,																-- Maldraxxus
			49.8, 																-- X
			49.6, 																-- Y
			L_WAYPOINTS["Waypoint: Weapons of the Fallen"],						-- Title
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