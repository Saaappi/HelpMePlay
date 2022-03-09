local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_WOD = {
	-- Supported Maps: 572 (Draenor)
	-- Garrison (Alliance)
	[79243] = { -- Baros Alexston
		["g"] = {
			L_DIALOG["Baros Alexston 1"],
		},
	},
	[84455] = { -- Assistant Brightstone
		["g"] = {
			L_DIALOG["Assistant Brightstone 1"],
		},
	},
	[81441] = { -- Shelly Hamby
		["g"] = {
			L_DIALOG["Shelly Hamby 1"],
		},
	},
	[81103] = { -- Dungar Longdrink
		["g"] = {
			L_DIALOG["Dungar Longdrink 1"],
		},
	},
	-- End of Garrison (Alliance)
	-- Garrison (Horde)
	[80225] = { -- Skaggit
		["g"] = {
			L_DIALOG["Skaggit 1"],
		},
	},
	[86775] = { -- Senior Peon II
		["g"] = {
			L_DIALOG["Senior Peon II 1"],
		},
	},
	[88228] = { -- Sergeant Grimjaw
		["g"] = {
			L_DIALOG["Sergeant Grimjaw 1"],
		},
	},
	-- End of Garrison (Horde)
	-- Frostfire Ridge
	[87122] = { -- Gargra
		["g"] = {
			L_DIALOG["Let's do this!"],
		},
	},
	-- End of Frostfire Ridge
	-- Shadowmoon Valley
	[84372] = { -- Madari
		["g"] = {
			L_DIALOG["Madari 1"],
		},
	},
	[72871] = { -- All-Seeing Eye
		["g"] = {
			L_DIALOG["All-Seeing Eye 1"],
		},
	},
	[78556] = { -- Ariok
		["g"] = {
			L_DIALOG["Ariok 1"],
		},
	},
	[87124] = { -- Ashlei
		["g"] = {
			L_DIALOG["Let's do this!"],
		},
	},
	-- End of Shadowmoon Valley
	-- Gorgrond
	[81013] = { -- Rangari Rajess
		["g"] = {
			L_DIALOG["D'kaan is coming with help."],
		},
	},
	[81018] = { -- Rangari Kolaan
		["g"] = {
			L_DIALOG["D'kaan is coming with help."],
		},
	},
	[81020] = { -- Rangari Jonaa
		["g"] = {
			L_DIALOG["D'kaan is coming with help."],
		},
	},
	-- End of Gorgrond
	-- Talador
	[87125] = { -- Taralune
		["g"] = {
			L_DIALOG["Let's do this!"],
		},
	},
	-- End of Talador
	-- Spires of Arak
	[82553] = { -- Villi Gobsplat
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Spires of Arak
	-- Nagrand
	[87110] = { -- Tarr the Terrible
		["g"] = {
			L_DIALOG["Let's do this!"],
		},
	},
	-- End of Nagrand
	-- Stormshield
	[85963] = { -- Orville Manfred
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Stormshield
	-- Tanaan Jungle
	[78568] = { -- Thaelin Darkanvil
		["g"] = {
			L_DIALOG["Thaelin Darkanvil 1"],
		},
	},
	-- End of Tanaan Jungle
}

addonTable.DIALOG_WOD = DIALOG_WOD