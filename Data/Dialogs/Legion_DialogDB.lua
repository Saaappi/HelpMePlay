local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_LEGION = {
	-- Supported Maps: 619 (Broken Isles), 905 (Argus)
	-- Objects
	[0] = {
		["g"] = {
			{
				["o"] 			= 1, -- Ravencrest Cemetary
				["c"] 			= { "none" },
			},
		},
	},
	-- Highmountain
	-- End of Highmountain
	-- Val'sharah
	-- End of Val'sharah
}

addonTable.DIALOG_LEGION = DIALOG_LEGION