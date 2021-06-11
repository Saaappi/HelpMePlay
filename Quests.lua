local addonName, t = ...;

local quests = {
	[10] = { -- Northern Barrens
		["In Defense of Far Watch"] = {
			["id"] = 871,
			["autoAccept"] = 1,
			["flightPath"] = nil,
		},
	},
	[21] = { -- Silverpine Forest
		["The Warchief Cometh"] = {
			["id"] = 26965,
			["autoAccept"] = 1,
			["flightPath"] = nil,
		},
		["Warchief's Command: Hillsbrad Foothills!"] = {
			["id"] = 28089,
			["autoAccept"] = 1,
			["flightPath"] = nil,
		},
	},
	[22] = { -- Western Plaguelands
	
	},
	[25] = { -- Hillsbrad Foothills
	
	},
	[65] = { -- Stonetalon Mountains
	
	},
	[70] = { -- Dustwallow Marsh
	
	},
	[199] = { -- Southern Barrens
	
	},
};

t.quests = quests;