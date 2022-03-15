local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local WAYPOINTS = {
	[26176] = { -- Onward to Thelsamar
		{
			48,																	-- Loch Modan
			36.8, 																-- X
			61.2, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Explorer Doc"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			48,																	-- Loch Modan
			41.3, 																-- X
			39.1, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Explorer Doc"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			48,																	-- Loch Modan
			61.6, 																-- X
			73.1, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Explorer Doc"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			48,																	-- Loch Modan
			68.1, 																-- X
			66.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Explorer Doc"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			48,																	-- Loch Modan
			53.7, 																-- X
			38.2, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Explorer Doc"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			48,																	-- Loch Modan
			73.1, 																-- X
			35.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Explorer Doc"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[13670] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Lord Everblaze"],						-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Winter's Breath Lake"],		-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13675] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Lord Everblaze"],						-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Winter's Breath Lake"],		-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13616] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Lord Everblaze"],						-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Winter's Breath Lake"],		-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13743] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Lord Everblaze"],						-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Winter's Breath Lake"],		-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13770] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Lord Everblaze"],						-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Winter's Breath Lake"],		-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13780] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Lord Everblaze"],						-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Winter's Breath Lake"],		-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13754] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Lord Everblaze"],						-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Winter's Breath Lake"],		-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13764] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Lord Everblaze"],						-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Winter's Breath Lake"],		-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13748] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Lord Everblaze"],						-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Winter's Breath Lake"],		-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13785] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Lord Everblaze"],						-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Winter's Breath Lake"],		-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13759] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Lord Everblaze"],						-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Winter's Breath Lake"],		-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13775] = { -- The Edge of Winter (Daily)
		{
			127,																-- Crystalsong Forest
			55.6, 																-- X
			75.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Lord Everblaze"],						-- Title
			nil,																-- Icon
			25680,																-- DisplayID
		},				
		{				
			117,																-- Howling Fjord
			42.0, 																-- X
			19.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Winter's Breath Lake"],		-- Title
			nil,																-- Icon
			28570,																-- DisplayID
		},
	},
	[13669] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Winter Hyacinth"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},				
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Drak'Mar"],					-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13769] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Winter Hyacinth"],						-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},				
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Drak'Mar"],					-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},				
	},				
	[13742] = { -- A Worthy Weapon (Daily)				
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Winter Hyacinth"],						-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Drak'Mar"],					-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13774] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Winter Hyacinth"],						-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Drak'Mar"],					-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13674] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Winter Hyacinth"],						-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Drak'Mar"],					-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13758] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Winter Hyacinth"],						-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Drak'Mar"],					-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13600] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Winter Hyacinth"],						-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Drak'Mar"],					-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13753] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Winter Hyacinth"],						-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Drak'Mar"],					-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13763] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Winter Hyacinth"],						-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Drak'Mar"],					-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13784] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Winter Hyacinth"],						-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Drak'Mar"],					-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13779] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Winter Hyacinth"],						-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Drak'Mar"],					-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13747] = { -- A Worthy Weapon (Daily)
		{
			127,																-- Icecrown
			14.6, 																-- X
			14.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Winter Hyacinth"],						-- Title
			"134195",															-- Icon
			nil,																-- DisplayID
		},
		{
			115,																-- Dragonblight
			93.2, 																-- X
			25.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Drak'Mar"],					-- Title
			nil,																-- Icon
			28538,																-- DisplayID
		},
	},
	[13673] = { -- A Blade Fit For A Champion (Daily)
		{				
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Ashwood Lake"],				-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13666] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Ashwood Lake"],				-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13603] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Ashwood Lake"],				-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13783] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Ashwood Lake"],				-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13757] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Ashwood Lake"],				-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13752] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Ashwood Lake"],				-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13773] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Ashwood Lake"],				-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13741] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Ashwood Lake"],				-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13746] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Ashwood Lake"],				-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13762] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Ashwood Lake"],				-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13778] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Ashwood Lake"],				-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[13768] = { -- A Blade Fit For A Champion (Daily)
		{
			116,																-- Grizzly Hills
			60.5, 																-- X
			51.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Maiden of Ashwood Lake"],				-- Title
			nil,																-- Icon
			28503,																-- DisplayID
		},
	},
	[65325] = { -- Motes of Knowledge (Daily)
		{
			1970,																-- Zereth Mortis
			64.0, 																-- X
			69.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Compilation Nodule"],					-- Title
			"4038106",															-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			61.2, 																-- X
			68.4, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Composition Mote"],						-- Title
			"4038107",															-- Icon
			nil,																-- DisplayID
		},
	},
	[65363] = { -- Dangerous State (Daily)
		{
			1970,																-- Zereth Mortis
			44.4, 																-- X
			42.2, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Leashkeeper Helzid"],					-- Title
			nil,																-- Icon
			100683,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			47.2, 																-- X
			40.2, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Dominated Jiro"],						-- Title
			nil,																-- Icon
			98978,																-- DisplayID
		},
	},
	[64977] = { -- Step into the Ring (Daily)
		{
			1970,																-- Zereth Mortis
			58.0, 																-- X
			44.4, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Nexus of Actualization"],				-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[64785] = { -- Overgrown Story (Daily)
		{
			1970,																-- Zereth Mortis
			60.6, 																-- X
			64.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Gaiagantic"],							-- Title
			nil,																-- Icon
			102117,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			61.6, 																-- X
			68.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Overgrown Geomental"],					-- Title
			nil,																-- Icon
			100374,																-- DisplayID
		},
	},
	[65096] = { -- Your Death Or Mine (Daily)
		{
			1970,																-- Zereth Mortis
			65.4, 																-- X
			45.4, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Punisher Makaris"],						-- Title
			nil,																-- Icon
			100717,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			64.6, 																-- X
			43.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Sacred Relics"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[64717] = { -- Materials of Creation (Daily)
		{
			1970,																-- Zereth Mortis
			45.3, 																-- X
			45.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Eidolic Fragment"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			45.3, 																-- X
			61.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Eidolic Fragment"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			50.0, 																-- X
			47.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Eidolic Fragment"],						-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			42.6, 																-- X
			46.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Minor Enigmet"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			41.3, 																-- X
			48.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Minor Enigmet"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			42.6, 																-- X
			49.7, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Minor Enigmet"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			43.4, 																-- X
			50.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Minor Enigmet"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			44.7, 																-- X
			52.2, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Minor Enigmet"],							-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[64964] = { -- Choose Your Fighter (Daily)
		{
			1970,																-- Zereth Mortis
			48.6, 																-- X
			50.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Custodian Taj"],							-- Title
			nil,																-- Icon
			102043,																-- DisplayID
		},
	},
	[64854] = { -- Trappings of Success (Daily)
		{
			1970,																-- Zereth Mortis
			39.6, 																-- X
			52.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Runefur"],								-- Title
			nil,																-- Icon
			102146,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			41.6, 																-- X
			62.4, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Bitterbeak"],							-- Title
			nil,																-- Icon
			98833,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			38.8, 																-- X
			58.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Cipherclad"],							-- Title
			nil,																-- Icon
			102145,																-- DisplayID
		},
	},
	[65177] = { -- Fruit of the Bloom (Daily)
		{
			1970,																-- Zereth Mortis
			47.4, 																-- X
			82.4, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Fruit of the Bloom (Daily)"],			-- Title
			nil,																-- Icon
			16915,																-- DisplayID
		},
	},
	[65326] = { -- Circle of Strife (Daily)
		{
			1970,																-- Zereth Mortis
			44.0, 																-- X
			52.2, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Circle of Strife (Daily)"],				-- Title
			nil,																-- Icon
			104781,																-- DisplayID
		},
	},
	[64592] = { -- Historic Protection (Daily)
		{
			1970,																-- Zereth Mortis
			59.6, 																-- X
			29.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Terraforming Record"],					-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			59.9, 																-- X
			27.4, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Terraforming Record"],					-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			61.2, 																-- X
			28.2, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Terraforming Record"],					-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			61.2, 																-- X
			30.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Terraforming Record"],					-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			63.4, 																-- X
			26.3, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Terraforming Record"],					-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			66.0, 																-- X
			26.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Terraforming Record"],					-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65256] = { -- Cluck, Cluck, Boom (Daily)
		{
			1970,																-- Zereth Mortis
			38.4, 																-- X
			57.8, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Cluck, Cluck, Boom (Daily)"],			-- Title
			nil,																-- Icon
			101987,																-- DisplayID
		},
	},
	[65265] = { -- Buried Remnants (Daily)
		{
			1970,																-- Zereth Mortis
			50.2, 																-- X
			44.3, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Buried Remnants (Daily)"],				-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65364] = { -- Super Jiro (Daily)
		{
			1970,																-- Zereth Mortis
			58.4, 																-- X
			49.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Super Jiro (Daily)"],					-- Title
			nil,																-- Icon
			101848,																-- DisplayID
		},
	},
	[65255] = { -- Forcing the Cycle (Daily)				
		{
			1970,																-- Zereth Mortis
			48.0, 																-- X
			60.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Forcing the Cycle (Daily) 1"],			-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			49.2, 																-- X
			58.2, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Forcing the Cycle (Daily) 2"],			-- Title
			nil,																-- Icon
			96338,																-- DisplayID
		},
	},
	[65142] = { -- Portal Play (Daily)
		{
			1970,																-- Zereth Mortis
			34.2, 																-- X
			48.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Portal Play (Daily)"],					-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65264] = { -- Operation: Relocation (Daily)
		{
			1970,																-- Zereth Mortis
			52.6, 																-- X
			49.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Operation: Relocation (Daily) 1"],		-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			53.6, 																-- X
			54.2, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Operation: Relocation (Daily) 2"],		-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65072] = { -- Not Safe for Work (Daily)
		{
			1970,																-- Zereth Mortis
			65.0, 																-- X
			44.2, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Not Safe for Work (Daily)"],				-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65362] = { -- Not of the Body (Daily)
		{
			1970,																-- Zereth Mortis
			44.1, 																-- X
			52.8, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Not of the Body (Daily)"],				-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65445] = { -- Necessary Resourcing (Daily)
		{
			1970,																-- Zereth Mortis
			54.4, 																-- X
			55.1, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Necessary Resourcing (Daily)"],			-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65269] = { -- Obvious Plant (Daily)
		{
			1970,																-- Zereth Mortis
			49.4, 																-- X
			82.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Catalyst Magic Sensor"],					-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			49.6, 																-- X
			87.5, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Catalyst Magic Sensor"],					-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			48.8, 																-- X
			90.1, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Catalyst Magic Sensor"],					-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			50.5, 																-- X
			94.7, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Catalyst Magic Sensor"],					-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			48.2, 																-- X
			95.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Catalyst Magic Sensor"],					-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			52.1, 																-- X
			91.1, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Catalyst Magic Sensor"],					-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			52.4, 																-- X
			87.4, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Catalyst Magic Sensor"],					-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			49.8, 																-- X
			91.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Catalyst Magic Sensor"],					-- Title
			nil,																-- Icon
			104825,																-- DisplayID
		},
	},
	[65226] = { -- Fleet-Footed and Fastidious (Daily)
		{
			1970,																-- Zereth Mortis
			36.5, 																-- X
			56.4, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Rana"],									-- Title
			nil,																-- Icon
			103087,																-- DisplayID
		},
	},
	[64579] = { -- Hollow Efforts (Daily)
		{
			1970,																-- Zereth Mortis
			36.4, 																-- X
			45.8, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Neomotes"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			37.2, 																-- X
			45.3, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Neomotes"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			35.6, 																-- X
			47.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Neomotes"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			37.6, 																-- X
			46.8, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Neomotes"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			39.1, 																-- X
			46.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Neomotes"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			38.8, 																-- X
			48.7, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Neomotes"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			36.6, 																-- X
			49.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Neomotes"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			38.3, 																-- X
			49.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Neomotes"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			39.4, 																-- X
			50.9, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Neomotes"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			37.5, 																-- X
			54.8, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Neomotes"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[65268] = { -- Bzzzzt! (Daily)
		{
			1970,																-- Zereth Mortis
			62.1, 																-- X
			55.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Debris"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			62.5, 																-- X
			56.8, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Debris"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			62.0, 																-- X
			58.1, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Debris"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			62.2, 																-- X
			59.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Debris"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			63.1, 																-- X
			61.2, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Debris"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			64.2, 																-- X
			57.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Debris"],								-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
	[64799] = { -- The Broken Crown (9.2 Campaign, Chapter 5)
		{
			1970,																-- Zereth Mortis
			33.3, 																-- X
			69.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: The Broken Crown"],						-- Title
			nil,																-- Icon
			105302,																-- DisplayID
		},
	},
	[64801] = { -- Elder Eru (9.2 Campaign, Chapter 5)
		{
			1970,																-- Zereth Mortis
			56.2, 																-- X
			83.3, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Elder Eru"],								-- Title
			nil,																-- Icon
			104960,																-- DisplayID
		},
	},
	[64803] = { -- Testing One Two (9.2 Campaign, Chapter 5)
		{
			1970,																-- Zereth Mortis
			56.2, 																-- X
			82.4, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Outmoded Servitor"],						-- Title
			nil,																-- Icon
			101053,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			37.9, 																-- X
			66.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Native Cervid"],							-- Title
			nil,																-- Icon
			98974,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			44.1, 																-- X
			67.6, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Native Poultrid"],						-- Title
			nil,																-- Icon
			101984,																-- DisplayID
		},
		{
			1970,																-- Zereth Mortis
			46.0, 																-- X
			68.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Native Poultrid"],						-- Title
			nil,																-- Icon
			101984,																-- DisplayID
		},
	},
	[64853] = { -- Two Paths to Tread (9.2 Campaign, Chapter 5)
		{
			1970,																-- Zereth Mortis
			33.3, 																-- X
			69.0, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Primus"],								-- Title
			nil,																-- Icon
			105032,																-- DisplayID
		},
	},
	[64809] = { -- One Half of the Equation (9.2 Campaign, Chapter 5)
		{
			1970,																-- Zereth Mortis
			57.2, 																-- X
			31.2, 																-- Y
			L_GLOBALSTRINGS["Waypoint: One Half of the Equation"],				-- Title
			nil,																-- Icon
			95194,																-- DisplayID
		},
	},
	[64806] = { -- Where the Memory Resides (9.2 Campaign, Chapter 5)
		{
			1533,																-- Bastion
			55.9, 																-- X
			86.4, 																-- Y
			L_GLOBALSTRINGS["Waypoint: Where the Memory Resides"],				-- Title
			nil,																-- Icon
			nil,																-- DisplayID
		},
	},
}

addonTable.WAYPOINTS = WAYPOINTS