local addonName, addonTable = ...
local DIALOG_DF = {
	-- Supported Maps: 1978 (Dragon Isles)
	-- The Forbidden Reach
	[182317] = { -- Scalecommander Cindrethresh
		["g"] = {
			{
				["o"] 	= 54978,
				["c"] 	= { "none" },
			},
		},
	},
	[182610] = { -- Scalecommander Viridia
		["g"] = {
			{
				["o"] 	= 51849,
				["c"] 	= { "none" },
			},
		},
	},
	[182611] = { -- Scalecommander Sarkareth
		["g"] = {
			{
				["o"] 	= 51850,
				["c"] 	= { "none" },
			},
		},
	},
	-- End of The Forbidden Reach
}

addonTable.DIALOG_DF = DIALOG_DF