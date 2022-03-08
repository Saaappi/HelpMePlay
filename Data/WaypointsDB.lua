local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local waypointDB = {
	[65325] = { -- Motes of Knowledge (Daily)
		{
			1970,						-- Zereth Mortis
			64, 						-- X
			69, 						-- Y
			"Compilation Nodule",		-- Title
			"4038106",					-- Icon
		},
		{
			1970,						-- Zereth Mortis
			61.2, 						-- X
			68.4, 						-- Y
			"Composition Mote",			-- Title
			"4038107",					-- Icon
		},
	},
}

addonTable.waypointDB = waypointDB