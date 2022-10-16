local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local FLIGHT_PATHS = {
	[650] = { -- Highmountain
		["g"] = {
			{
				["p"] 	= "Thunder Totem, Highmountain",
				["c"] 	= { "quests.isActive", "target.is" },
				["q"] 	= { 39580 }, -- The High Chieftain
				["t"] 	= 96565, -- Chofa Nighthoof
			},
		},
	},
}

addonTable.FLIGHT_PATHS = FLIGHT_PATHS