local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local BattleForAzeroth = {
	-- Supported Maps 875 (Zandalar), 876 (Kul Tiras)
	-- Drustvar
	[137613] = { -- Hobart Grapplehammer
		["g"] = {
			L_DIALOG["Hobart Grapplehammer 1"],
			L_DIALOG["Hobart Grapplehammer 2"],
		},
	},
	-- End of Drustvar
	-- Stormsong Valley
	[138137] = { -- Huelo
		["g"] = {
			L_DIALOG["Huelo 1"],
		},
	},
	-- End of Stormsong Valley
	-- Tiragarde Sound
	[149877] = { -- Tinkmaster Overspark
		["g"] = {
			L_DIALOG["I'm ready."],
		},
	},
	[150117] = { -- Sapphronetta Flivvers
		["g"] = {
			L_DIALOG["We need you for Mechagon."],
			L_DIALOG["Sapphronetta Flivvers 2"],
		},
	},
	[150121] = { -- Grizzek Fizzwrench
		["g"] = {
			L_DIALOG["Grizzek Fizzwrench 1"],
		},
	},
	[151102] = { -- Cog Captain Winklespring
		["g"] = {
			L_DIALOG["We need you for Mechagon."],
		},
	},
	[137675] = { -- Shadow Hunter Ty'jin
		["g"] = {
			L_DIALOG["Shadow Hunter Ty'jin 1"],
		},
	},
	[137798] = { -- Boatswain Taryn
		["g"] = {
			L_DIALOG["Boatswain Taryn 1"],
		},
	},
	[137800] = { -- Quartermaster Killian
		["g"] = {
			L_DIALOG["Quartermaster Killian 1"],
		},
	},
	[137807] = { -- Navigator Swink
		["g"] = {
			L_DIALOG["Navigator Swink 1"],
		},
	},
	-- End of Tiragarde Sound
	-- Zuldazar
	[135440] = { -- Princess Talanji
		["g"] = {
			L_DIALOG["Princess Talanji 1"],
		},
	},
	[135690] = { -- Dread-Admiral Tattersail
		["g"] = {
			L_DIALOG["Quest"],
		},
	},
	[143334] = { -- Daria Smithson
		["g"] = {
			L_DIALOG["Take us back to Boralus."],
		},
	},
	[143690] = { -- Captured Zandalari Troll
		["g"] = {
			L_DIALOG["Captured Zandalari Troll 1"],
		},
	},
	-- End of Zuldazar
	-- Vol'dun
	[137559] = { -- Private James
		["g"] = {
			L_DIALOG["Private James 1"],
		},
	},
	[135383] = { -- Barnard "The Smasher" Baysworth
		["g"] = {
			L_DIALOG["Take us back to Boralus."],
		},
	},
	-- End of Vol'dun
	-- Nazmir
	[122688] = { -- Bwonsamdi
		["g"] = {
			L_DIALOG["Bwonsamdi 2"],
		},
	},
	[166110] = { -- Spirit of Vol'jin
		["g"] = {
			L_DIALOG["Spirit of Vol'jin 1"],
		},
	},
	[139620] = { -- Desha Stormwallow
		["g"] = {
			L_DIALOG["Take us back to Boralus."],
		},
	},
	[142073] = { -- Leila Stafford
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Nazmir
	-- Boralus
	[122370] = { -- Cyrus Crestfall
		["g"] = {
			L_DIALOG["Cyrus Crestfall 1"],
		},
	},
	[137066] = { -- 7th Legion Magus
		["g"] = {
			L_DIALOG["7th Legion Magus 1"],
		},
	},
	[135612] = { -- Halford Wyrmbane
		["g"] = {
			L_DIALOG["Halford Wyrmbane 1"],
		},
	},
	[135681] = { -- Grand Admiral Jes-Tereth
		["g"] = {
			L_DIALOG["Quest"],
		},
	},
	-- End of Boralus
	-- Horrific Visions
	[152993] = { -- Garona Halforcen
		["g"] = {
			L_DIALOG["Garona Halforcen 1"],
		},
	},
	[160998] = { -- Altar of the Daredevil
		["g"] = {
			L_DIALOG["Altar of the Daredevil 1"],
		},
	},
	[160961] = { -- Altar of the Dark Imagination
		["g"] = {
			L_DIALOG["Altar of the Dark Imagination 1"],
		},
	},
	[161000] = { -- Altar of the Pained
		["g"] = {
			L_DIALOG["Altar of the Pained 1"],
		},
	},
	[160967] = { -- Altar of the Burned Bridge
		["g"] = {
			L_DIALOG["Altar of the Burned Bridge 1"],
		},
	},
	[160999] = { -- Altar of the Long Night
		["g"] = {
			L_DIALOG["Altar of the Long Night 1"],
		},
	},
	-- End of Horrific Visions
}

addonTable.DIALOG_BFA = DIALOG_BFA