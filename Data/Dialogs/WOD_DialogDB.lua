local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_WOD = {
	-- Supported Maps: 572 (Draenor)
	-- Garrison (Alliance)
	-- End of Garrison (Alliance)
	-- Gorgrond
	-- End of Gorgrond
	-- Tanaan Jungle
	[78556] = { -- Ariok
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	[78568] = { -- Thaelin Darkanvil
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "quests.isActive" },
				["q"] 	= { 35747 }, -- Taking a Trip to the Top of the Tank
			},
		},
	},
	[79243] = { -- Baros Alexston
		["g"] = {
			{
				["o"] 	= 1,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of Tanaan Jungle
}

addonTable.DIALOG_WOD = DIALOG_WOD