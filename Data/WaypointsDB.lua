local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local waypointDB = {
	[28766] = {
		{
			425,				-- Northshire Valley
			29.4, 				-- X
			42.9, 				-- Y
			"Blackrock Worgs",	-- Title
			"132224",			-- Icon
		},
	},
	--[[[1970] = { -- Zereth Mortis
		[65325] = { -- Motes of Knowledge (Daily)
			["c"] = {
				"/way 64, 69 Toadious",
				"/way 61.2, 68.4 Motes of Knowledge",
			},
		},
	},]]
}

addonTable.waypointDB = waypointDB