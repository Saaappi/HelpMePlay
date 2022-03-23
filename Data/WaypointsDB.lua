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
			30.7, 																-- X
			28.7, 																-- Y
			L_WAYPOINTS["Waypoint: Treasure"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[62741] = { -- Choice of Action (Bonus Objective)
		{
			1536,																-- Maldraxxus
			47.2, 																-- X
			62.1, 																-- Y
			L_WAYPOINTS["Waypoint: Treasure"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[62743] = { -- Decaying Situation (Bonus Objective)
		{
			1536,																-- Maldraxxus
			66.1, 																-- X
			50.4, 																-- Y
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
	},
	[60900] = { -- Archival Protection
		{
			1536,																-- Maldraxxus
			42.3, 																-- X
			24.3, 																-- Y
			L_WAYPOINTS["Waypoint: Treasure"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65325] = { -- Motes of Knowledge (Daily)
		{
			1970,																-- Zereth Mortis
			64.0, 																-- X
			69.0, 																-- Y
			L_WAYPOINTS["Waypoint: Compilation Nodule"],						-- Title
			"4038106",															-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			61.2, 																-- X
			68.4, 																-- Y
			L_WAYPOINTS["Waypoint: Composition Mote"],							-- Title
			"4038107",															-- Icon
			nil,																-- DisplayID
		},
	},
	[65363] = { -- Dangerous State (Daily)
		{
			1970,																-- Zereth Mortis
			44.4, 																-- X
			42.2, 																-- Y
			L_WAYPOINTS["Waypoint: Leashkeeper Helzid"],						-- Title
			nil,																-- Icon
			100683,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			47.2, 																-- X
			40.2, 																-- Y
			L_WAYPOINTS["Waypoint: Dominated Jiro"],							-- Title
			nil,																-- Icon
			98978,																-- DisplayID
		},
	},
	[64977] = { -- Step into the Ring (Daily)
		{
			1970,																-- Zereth Mortis
			58.0, 																-- X
			44.4, 																-- Y
			L_WAYPOINTS["Waypoint: Nexus of Actualization"],					-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[64785] = { -- Overgrown Story (Daily)
		{
			1970,																-- Zereth Mortis
			60.6, 																-- X
			64.6, 																-- Y
			L_WAYPOINTS["Waypoint: Gaiagantic"],								-- Title
			nil,																-- Icon
			102117,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			61.6, 																-- X
			68.6, 																-- Y
			L_WAYPOINTS["Waypoint: Overgrown Geomental"],						-- Title
			nil,																-- Icon
			100374,																-- DisplayID
		},
	},
	[65096] = { -- Your Death Or Mine (Daily)
		{
			1970,																-- Zereth Mortis
			65.4, 																-- X
			45.4, 																-- Y
			L_WAYPOINTS["Waypoint: Punisher Makaris"],							-- Title
			nil,																-- Icon
			100717,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			64.6, 																-- X
			43.9, 																-- Y
			L_WAYPOINTS["Waypoint: Sacred Relics"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[64717] = { -- Materials of Creation (Daily)
		{
			1970,																-- Zereth Mortis
			45.3, 																-- X
			45.9, 																-- Y
			L_WAYPOINTS["Waypoint: Eidolic Fragment"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			45.3, 																-- X
			61.5, 																-- Y
			L_WAYPOINTS["Waypoint: Eidolic Fragment"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			50.0, 																-- X
			47.0, 																-- Y
			L_WAYPOINTS["Waypoint: Eidolic Fragment"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			42.6, 																-- X
			46.0, 																-- Y
			L_WAYPOINTS["Waypoint: Minor Enigmet"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			41.3, 																-- X
			48.0, 																-- Y
			L_WAYPOINTS["Waypoint: Minor Enigmet"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			42.6, 																-- X
			49.7, 																-- Y
			L_WAYPOINTS["Waypoint: Minor Enigmet"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			43.4, 																-- X
			50.5, 																-- Y
			L_WAYPOINTS["Waypoint: Minor Enigmet"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			44.7, 																-- X
			52.2, 																-- Y
			L_WAYPOINTS["Waypoint: Minor Enigmet"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[64964] = { -- Choose Your Fighter (Daily)
		{
			1970,																-- Zereth Mortis
			48.6, 																-- X
			50.0, 																-- Y
			L_WAYPOINTS["Waypoint: Custodian Taj"],								-- Title
			nil,																-- Icon
			102043,																-- DisplayID
		},
	},
	[64854] = { -- Trappings of Success (Daily)
		{
			1970,																-- Zereth Mortis
			39.6, 																-- X
			52.0, 																-- Y
			L_WAYPOINTS["Waypoint: Runefur"],									-- Title
			nil,																-- Icon
			102146,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			41.6, 																-- X
			62.4, 																-- Y
			L_WAYPOINTS["Waypoint: Bitterbeak"],								-- Title
			nil,																-- Icon
			98833,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			38.8, 																-- X
			58.6, 																-- Y
			L_WAYPOINTS["Waypoint: Cipherclad"],								-- Title
			nil,																-- Icon
			102145,																-- DisplayID
		},
	},
	[65177] = { -- Fruit of the Bloom (Daily)
		{
			1970,																-- Zereth Mortis
			47.4, 																-- X
			82.4, 																-- Y
			L_WAYPOINTS["Waypoint: Fruit of the Bloom (Daily)"],				-- Title
			nil,																-- Icon
			16915,																-- DisplayID
		},
	},
	[65326] = { -- Circle of Strife (Daily)
		{
			1970,																-- Zereth Mortis
			44.0, 																-- X
			52.2, 																-- Y
			L_WAYPOINTS["Waypoint: Circle of Strife (Daily)"],					-- Title
			nil,																-- Icon
			104781,																-- DisplayID
		},
	},
	[64592] = { -- Historic Protection (Daily)
		{
			1970,																-- Zereth Mortis
			59.6, 																-- X
			29.6, 																-- Y
			L_WAYPOINTS["Waypoint: Terraforming Record"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			59.9, 																-- X
			27.4, 																-- Y
			L_WAYPOINTS["Waypoint: Terraforming Record"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			61.2, 																-- X
			28.2, 																-- Y
			L_WAYPOINTS["Waypoint: Terraforming Record"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			61.2, 																-- X
			30.9, 																-- Y
			L_WAYPOINTS["Waypoint: Terraforming Record"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			63.4, 																-- X
			26.3, 																-- Y
			L_WAYPOINTS["Waypoint: Terraforming Record"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			66.0, 																-- X
			26.6, 																-- Y
			L_WAYPOINTS["Waypoint: Terraforming Record"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			60.0, 																-- X
			33.0, 																-- Y
			L_WAYPOINTS["Waypoint: Terraforming Record"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			61.2, 																-- X
			30.7, 																-- Y
			L_WAYPOINTS["Waypoint: Terraforming Record"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			64.3, 																-- X
			24.6, 																-- Y
			L_WAYPOINTS["Waypoint: Terraforming Record"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			64.7, 																-- X
			23.4, 																-- Y
			L_WAYPOINTS["Waypoint: Terraforming Record"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65256] = { -- Cluck, Cluck, Boom (Daily)
		{
			1970,																-- Zereth Mortis
			38.4, 																-- X
			57.8, 																-- Y
			L_WAYPOINTS["Waypoint: Cluck, Cluck, Boom (Daily)"],				-- Title
			nil,																-- Icon
			101987,																-- DisplayID
		},
	},
	[65265] = { -- Buried Remnants (Daily)
		{
			1970,																-- Zereth Mortis
			50.2, 																-- X
			44.3, 																-- Y
			L_WAYPOINTS["Waypoint: Buried Remnants (Daily)"],					-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65364] = { -- Super Jiro (Daily)
		{
			1970,																-- Zereth Mortis
			58.4, 																-- X
			49.6, 																-- Y
			L_WAYPOINTS["Waypoint: Super Jiro (Daily)"],						-- Title
			nil,																-- Icon
			101848,																-- DisplayID
		},
	},
	[65255] = { -- Forcing the Cycle (Daily)				
		{
			1970,																-- Zereth Mortis
			48.0, 																-- X
			60.0, 																-- Y
			L_WAYPOINTS["Waypoint: Forcing the Cycle (Daily) 1"],				-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			49.2, 																-- X
			58.2, 																-- Y
			L_WAYPOINTS["Waypoint: Forcing the Cycle (Daily) 2"],				-- Title
			nil,																-- Icon
			96338,																-- DisplayID
		},
	},
	[65142] = { -- Portal Play (Daily)
		{
			1970,																-- Zereth Mortis
			34.2, 																-- X
			48.6, 																-- Y
			L_WAYPOINTS["Waypoint: Portal Play (Daily)"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65264] = { -- Operation: Relocation (Daily)
		{
			1970,																-- Zereth Mortis
			52.6, 																-- X
			49.9, 																-- Y
			L_WAYPOINTS["Waypoint: Operation: Relocation (Daily) 1"],			-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			53.6, 																-- X
			54.2, 																-- Y
			L_WAYPOINTS["Waypoint: Operation: Relocation (Daily) 2"],			-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65072] = { -- Not Safe for Work (Daily)
		{
			1970,																-- Zereth Mortis
			65.0, 																-- X
			44.2, 																-- Y
			L_WAYPOINTS["Waypoint: Not Safe for Work (Daily)"],					-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65362] = { -- Not of the Body (Daily)
		{
			1970,																-- Zereth Mortis
			44.1, 																-- X
			52.8, 																-- Y
			L_WAYPOINTS["Waypoint: Not of the Body (Daily)"],					-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65445] = { -- Necessary Resourcing (Daily)
		{
			1970,																-- Zereth Mortis
			54.4, 																-- X
			55.1, 																-- Y
			L_WAYPOINTS["Waypoint: Necessary Resourcing (Daily)"],				-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65269] = { -- Obvious Plant (Daily)
		{
			1970,																-- Zereth Mortis
			49.4, 																-- X
			82.9, 																-- Y
			L_WAYPOINTS["Waypoint: Catalyst Magic Sensor"],						-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			49.6, 																-- X
			87.5, 																-- Y
			L_WAYPOINTS["Waypoint: Catalyst Magic Sensor"],						-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			48.8, 																-- X
			90.1, 																-- Y
			L_WAYPOINTS["Waypoint: Catalyst Magic Sensor"],						-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			50.5, 																-- X
			94.7, 																-- Y
			L_WAYPOINTS["Waypoint: Catalyst Magic Sensor"],						-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			48.2, 																-- X
			95.6, 																-- Y
			L_WAYPOINTS["Waypoint: Catalyst Magic Sensor"],						-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			52.1, 																-- X
			91.1, 																-- Y
			L_WAYPOINTS["Waypoint: Catalyst Magic Sensor"],						-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			52.4, 																-- X
			87.4, 																-- Y
			L_WAYPOINTS["Waypoint: Catalyst Magic Sensor"],						-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			49.8, 																-- X
			91.9, 																-- Y
			L_WAYPOINTS["Waypoint: Catalyst Magic Sensor"],						-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
	},
	[65226] = { -- Fleet-Footed and Fastidious (Daily)
		{
			1970,																-- Zereth Mortis
			36.5, 																-- X
			56.4, 																-- Y
			L_WAYPOINTS["Waypoint: Rana"],										-- Title
			nil,																-- Icon
			103087,																-- DisplayID
		},
	},
	[64579] = { -- Hollow Efforts (Daily)
		{
			1970,																-- Zereth Mortis
			36.4, 																-- X
			45.8, 																-- Y
			L_WAYPOINTS["Waypoint: Neomotes"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			37.2, 																-- X
			45.3, 																-- Y
			L_WAYPOINTS["Waypoint: Neomotes"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			35.6, 																-- X
			47.0, 																-- Y
			L_WAYPOINTS["Waypoint: Neomotes"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			37.6, 																-- X
			46.8, 																-- Y
			L_WAYPOINTS["Waypoint: Neomotes"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			39.1, 																-- X
			46.9, 																-- Y
			L_WAYPOINTS["Waypoint: Neomotes"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			38.8, 																-- X
			48.7, 																-- Y
			L_WAYPOINTS["Waypoint: Neomotes"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			36.6, 																-- X
			49.6, 																-- Y
			L_WAYPOINTS["Waypoint: Neomotes"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			38.3, 																-- X
			49.9, 																-- Y
			L_WAYPOINTS["Waypoint: Neomotes"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			39.4, 																-- X
			50.9, 																-- Y
			L_WAYPOINTS["Waypoint: Neomotes"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			37.5, 																-- X
			54.8, 																-- Y
			L_WAYPOINTS["Waypoint: Neomotes"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65268] = { -- Bzzzzt! (Daily)
		{
			1970,																-- Zereth Mortis
			62.1, 																-- X
			55.6, 																-- Y
			L_WAYPOINTS["Waypoint: Debris"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			62.5, 																-- X
			56.8, 																-- Y
			L_WAYPOINTS["Waypoint: Debris"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			62.0, 																-- X
			58.1, 																-- Y
			L_WAYPOINTS["Waypoint: Debris"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			62.2, 																-- X
			59.6, 																-- Y
			L_WAYPOINTS["Waypoint: Debris"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			63.1, 																-- X
			61.2, 																-- Y
			L_WAYPOINTS["Waypoint: Debris"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			64.2, 																-- X
			57.6, 																-- Y
			L_WAYPOINTS["Waypoint: Debris"],									-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[64799] = { -- The Broken Crown (9.2 Campaign, Chapter 5)
		{
			1970,																-- Zereth Mortis
			33.3, 																-- X
			69.0, 																-- Y
			L_WAYPOINTS["Waypoint: The Broken Crown"],							-- Title
			nil,																-- Icon
			105302,																-- DisplayID
		},
	},
	[64801] = { -- Elder Eru (9.2 Campaign, Chapter 5)
		{
			1970,																-- Zereth Mortis
			56.2, 																-- X
			83.3, 																-- Y
			L_WAYPOINTS["Waypoint: Elder Eru"],									-- Title
			nil,																-- Icon
			104960,																-- DisplayID
		},
	},
	[64803] = { -- Testing One Two (9.2 Campaign, Chapter 5)
		{
			1970,																-- Zereth Mortis
			56.2, 																-- X
			82.4, 																-- Y
			L_WAYPOINTS["Waypoint: Outmoded Servitor"],							-- Title
			nil,																-- Icon
			101053,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			37.9, 																-- X
			66.6, 																-- Y
			L_WAYPOINTS["Waypoint: Native Cervid"],								-- Title
			nil,																-- Icon
			98974,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			44.1, 																-- X
			67.6, 																-- Y
			L_WAYPOINTS["Waypoint: Native Poultrid"],							-- Title
			nil,																-- Icon
			101984,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			46.0, 																-- X
			68.0, 																-- Y
			L_WAYPOINTS["Waypoint: Native Poultrid"],							-- Title
			nil,																-- Icon
			101984,																-- DisplayID
		},
	},
	[64853] = { -- Two Paths to Tread (9.2 Campaign, Chapter 5)
		{
			1970,																-- Zereth Mortis
			33.3, 																-- X
			69.0, 																-- Y
			L_WAYPOINTS["Waypoint: Primus"],									-- Title
			nil,																-- Icon
			105032,																-- DisplayID
		},
	},
	[64809] = { -- One Half of the Equation (9.2 Campaign, Chapter 5)
		{
			1970,																-- Zereth Mortis
			57.2, 																-- X
			31.2, 																-- Y
			L_WAYPOINTS["Waypoint: One Half of the Equation"],					-- Title
			nil,																-- Icon
			95194,																-- DisplayID
		},
	},
	[64806] = { -- Where the Memory Resides (9.2 Campaign, Chapter 5)
		{
			1533,																-- Bastion
			55.9, 																-- X
			86.4, 																-- Y
			L_WAYPOINTS["Waypoint: Where the Memory Resides"],					-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[64875] = { -- Something Wonderful (9.2 Campaign, Chapter 6)
		{
			1970,																-- Zereth Mortis
			34.9, 																-- X
			45.6, 																-- Y
			L_WAYPOINTS["Waypoint: Something Wonderful"],						-- Title
			nil,																-- Icon
			100915,																-- DisplayID
		},
	},
	[64878] = { -- What A Long Strange Trip (9.2 Campaign, Chapter 6)
		{
			1970,																-- Zereth Mortis
			41.5, 																-- X
			42.9, 																-- Y
			L_WAYPOINTS["Waypoint: What A Long Strange Trip"],					-- Title
			nil,																-- Icon
			102001,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			42.9, 																-- X
			39.8, 																-- Y
			L_WAYPOINTS["Waypoint: What A Long Strange Trip"],					-- Title
			nil,																-- Icon
			102001,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			42.7, 																-- X
			32.7, 																-- Y
			L_WAYPOINTS["Waypoint: What A Long Strange Trip"],					-- Title
			nil,																-- Icon
			102001,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			44.6, 																-- X
			30.8, 																-- Y
			L_WAYPOINTS["Waypoint: What A Long Strange Trip"],					-- Title
			nil,																-- Icon
			102001,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			47.2, 																-- X
			29.4, 																-- Y
			L_WAYPOINTS["Waypoint: What A Long Strange Trip"],					-- Title
			nil,																-- Icon
			102001,																-- DisplayID
		},
	},
	[64889] = { -- Match Made in Zereth Mortis (9.2 Campaign, Chapter 6)
		{
			1970,																-- Zereth Mortis
			69.2, 																-- X
			10.8, 																-- Y
			L_WAYPOINTS["Waypoint: Match Made in Zereth Mortis"],				-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[64879] = { -- A Monumental Discovery (9.2 Campaign, Chapter 7)
		{
			1970,																-- Zereth Mortis
			34.9, 																-- X
			45.6, 																-- Y
			L_WAYPOINTS["Waypoint: A Monumental Discovery"],					-- Title
			nil,																-- Icon
			100915,																-- DisplayID
		},
	},
	[64733] = { -- Help From Beyond (9.2 Campaign, Chapter 7)
		{
			1970,																-- Zereth Mortis
			34.6, 																-- X
			49.7, 																-- Y
			L_WAYPOINTS["Waypoint: Kbato"],										-- Title
			nil,																-- Icon
			105023,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			47.6, 																-- X
			80.6, 																-- Y
			L_WAYPOINTS["Waypoint: Venthyr Forces"],							-- Title
			nil,																-- Icon
			93210,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			47.8, 																-- X
			58.3, 																-- Y
			L_WAYPOINTS["Waypoint: Night Fae Forces"],							-- Title
			nil,																-- Icon
			93641,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			53.9, 																-- X
			48.4, 																-- Y
			L_WAYPOINTS["Waypoint: Necrolord Forces"],							-- Title
			nil,																-- Icon
			96754,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			57.0, 																-- X
			31.2, 																-- Y
			L_WAYPOINTS["Waypoint: Help From Beyond"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[64720] = { -- Cleaving A Path (9.2 Campaign, Chapter 7)
		{
			1970,																-- Zereth Mortis
			57.84, 																-- X
			23.16, 																-- Y
			L_WAYPOINTS["Waypoint: Oracle Zoketh"],								-- Title
			nil,																-- Icon
			103099,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			59.29, 																-- X
			32.78, 																-- Y
			L_WAYPOINTS["Waypoint: Oracle Voraxxi"],							-- Title
			nil,																-- Icon
			103099,																-- DisplayID
		},
	},
	[64718] = { -- Keys To Victory (9.2 Campaign, Chapter 7)
		{
			1970,																-- Zereth Mortis
			60.41, 																-- X
			27.96, 																-- Y
			L_WAYPOINTS["Waypoint: Mawsworn Cell"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			60.48, 																-- X
			29.69, 																-- Y
			L_WAYPOINTS["Waypoint: Mawsworn Cell"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			60.96, 																-- X
			30.22, 																-- Y
			L_WAYPOINTS["Waypoint: Mawsworn Cell"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			60.53, 																-- X
			32.01, 																-- Y
			L_WAYPOINTS["Waypoint: Mawsworn Cell"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			59.62, 																-- X
			31.24, 																-- Y
			L_WAYPOINTS["Waypoint: Mawsworn Cell"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[64722] = { -- Knocking On Death's Door (9.2 Campaign, Chapter 7)
		{
			1970,																-- Zereth Mortis
			55.35, 																-- X
			30.43, 																-- Y
			L_WAYPOINTS["Waypoint: Kbato"],										-- Title
			nil,																-- Icon
			105023,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			64.42, 																-- X
			21.61, 																-- Y
			L_WAYPOINTS["Waypoint: Shadow Bulwark"],							-- Title
			nil,																-- Icon
			103110,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			65.90, 																-- X
			23.01, 																-- Y
			L_WAYPOINTS["Waypoint: Shadow Bulwark"],							-- Title
			nil,																-- Icon
			103110,																-- DisplayID
		},
	},
	[64722] = { -- Knocking On Death's Door (9.2 Campaign, Chapter 7)
		{
			1670,																-- Oribos
			38.93, 																-- X
			69.96, 																-- Y
			L_WAYPOINTS["Waypoint: Tal-Inara"],									-- Title
			nil,																-- Icon
			98194,																-- DisplayID
		},
	},
}

addonTable.WAYPOINTS = WAYPOINTS