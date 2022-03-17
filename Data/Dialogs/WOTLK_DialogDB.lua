local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_WOTLK = {
	-- Supported Maps: 113 (Northrend)
	-- Grizzly Hills
	[33224] = { -- Maiden of Ashwood Lake
		["g"] = {
			["text"] 		= L_DIALOG["Maiden of Ashwood Lake 1"],
			["condition"] 	= "none",
		},
	},
	-- End of Grizzly Hills
}

addonTable.DIALOG_WOTLK = DIALOG_WOTLK