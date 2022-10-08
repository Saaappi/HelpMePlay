local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_BFA = {
	-- Supported Maps 875 (Zandalar), 876 (Kul Tiras)
	-- Drustvar
	[137613] = { -- Hobart Grapplehammer
		["g"] = {
			{
				["text"] 		= L_DIALOG["Hobart Grapplehammer 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Hobart Grapplehammer 2"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Drustvar
	-- Stormsong Valley
	[138137] = { -- Huelo
		["g"] = {
			{
				["text"] 		= L_DIALOG["Huelo 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Stormsong Valley
	-- Tiragarde Sound
	[137675] = { -- Shadow Hunter Ty'jin
		["g"] = {
			{
				["text"] 		= L_DIALOG["Shadow Hunter Ty'jin 1"],
				["condition"] 	= "none",
			},
		},
	},
	[137798] = { -- Boatswain Taryn
		["g"] = {
			{
				["text"] 		= L_DIALOG["Boatswain Taryn 1"],
				["condition"] 	= "none",
			},
		},
	},
	[137800] = { -- Quartermaster Killian
		["g"] = {
			{
				["text"] 		= L_DIALOG["Quartermaster Killian 1"],
				["condition"] 	= "none",
			},
		},
	},
	[137807] = { -- Navigator Swink
		["g"] = {
			{
				["text"] 		= L_DIALOG["Navigator Swink 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Tiragarde Sound
	-- Zuldazar
	[135440] = { -- Princess Talanji
		["g"] = {
			{
				["text"] 		= L_DIALOG["Princess Talanji 1"],
				["condition"] 	= "none",
			},
		},
	},
	[135690] = { -- Dread-Admiral Tattersail
		["g"] = {
			{
				["text"] 		= L_DIALOG["Quest"],
				["condition"] 	= "none",
			},
		},
	},
	[143334] = { -- Daria Smithson
		["g"] = {
			{
				["text"] 		= L_DIALOG["Take us back to Boralus."],
				["condition"] 	= "none",
			},
		},
	},
	[143690] = { -- Captured Zandalari Troll
		["g"] = {
			{
				["text"] 		= L_DIALOG["Captured Zandalari Troll 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Zuldazar
	-- Vol'dun
	[137559] = { -- Private James
		["g"] = {
			{
				["text"] 		= L_DIALOG["Private James 1"],
				["condition"] 	= "none",
			},
		},
	},
	[135383] = { -- Barnard "The Smasher" Baysworth
		["g"] = {
			{
				["text"] 		= L_DIALOG["Take us back to Boralus."],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Vol'dun
	-- Nazmir
	[122688] = { -- Bwonsamdi
		["g"] = {
			{
				["text"] 		= L_DIALOG["Bwonsamdi 2"],
				["condition"] 	= "none",
			},
		},
	},
	[166110] = { -- Spirit of Vol'jin
		["g"] = {
			{
				["text"] 		= L_DIALOG["Spirit of Vol'jin 1"],
				["condition"] 	= "none",
			},
		},
	},
	[139620] = { -- Desha Stormwallow
		["g"] = {
			{
				["text"] 		= L_DIALOG["Take us back to Boralus."],
				["condition"] 	= "none",
			},
		},
	},
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
	[135612] = { -- Halford Wyrmbane
		["g"] = {
			{
				["text"] 		= L_DIALOG["Halford Wyrmbane 1"],
				["condition"] 	= "none",
			},
		},
	},
	[135681] = { -- Grand Admiral Jes-Tereth
		["g"] = {
			{
				["text"] 		= L_DIALOG["Quest"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Boralus
}

addonTable.DIALOG_BFA = DIALOG_BFA