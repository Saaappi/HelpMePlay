local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_BFA = {
	-- Supported Maps 875 (Zandalar), 876 (Kul Tiras)
	-- Drustvar
	-- End of Drustvar
	-- Stormsong Valley
	-- End of Stormsong Valley
	-- Tiragarde Sound
	-- End of Tiragarde Sound
	-- Zuldazar
	-- End of Zuldazar
	-- Vol'dun
	-- End of Vol'dun
	-- Nazmir
	-- End of Nazmir
	-- Boralus
	[122370] = { -- Cyrus Crestfall
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[137066] = { -- 7th Legion Magus
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	-- End of Boralus
}

addonTable.DIALOG_BFA = DIALOG_BFA