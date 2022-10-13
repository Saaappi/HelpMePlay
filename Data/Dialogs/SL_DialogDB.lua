local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_SL = {
	-- Supported Maps: 1409 (Exile's Reach), 1550 (The Shadowlands)
	-- No Map Association
	-- Oribos
	[159478] = { -- Tal-Inara
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "quests.notActive", "level.lower" },
				["q"] 			= { 62739, 63036 }, -- Restoring Balance
				["l"] 			= 60,
			},
		},
	},
	[174871] = { -- Fatescribe Roh-Tahl
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Oribos
	-- Bastion
	[159277] = { -- Aspirant Leda
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[159278] = { -- Aspirant Ikaran
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[158765] = { -- Pelodis
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "quests.isActive",
				["q"] 			= { 57933 }, -- We Can Rebuild Him
			},
			{
				["o"] 			= 1,
				["c"] 			= "quests.isActive",
				["q"] 			= { 62241 }, -- Training Regimen (WQ)
			},
			{
				["o"] 			= 2,
				["c"] 			= "quests.isActive",
				["q"] 			= { 60296 }, -- Pride or Unit
			},
		},
		["c"] = true,
	},
	[157696] = { -- Nemea
		["g"] = {
			{
				["o"] 			= 2,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Bastion
	-- Ardenweald
	[157949] = { -- Heartwood Grove Holdout
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[158006] = { -- Heartwood Grove Holdout
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[159428] = { -- Groonoomcrooek
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "quest.obj.isNotComplete" },
				["q"] 			= 57865, -- Ages-Echoing Wisdom
				["obj"] 		= 1,
			},
		},
	},
	[159427] = { -- Elder Finnan
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "quest.obj.isNotComplete" },
				["q"] 			= 57865, -- Ages-Echoing Wisdom
				["obj"] 		= 2,
			},
		},
	},
	[159465] = { -- Elder Gwenna
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "quest.obj.isNotComplete" },
				["q"] 			= 57865, -- Ages-Echoing Wisdom
				["obj"] 		= 3,
			},
		},
	},
	-- End of Ardenweald
	-- Revendreth
	[167838] = { -- Globknob
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[167918] = { -- Bela
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[164420] = { -- Laurent
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[167849] = { -- Soul of Keltesh
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[156295] = { -- Courier Rokalai
		["g"] = {
			{
				["o"] 			= 2,
				["c"] 			= { "none" },
			},
		},
	},
	[168237] = { -- Ilka
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[168238] = { -- Samu
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[167717] = { -- Darkhaven Villager
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[167744] = { -- Darkhaven Villager
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[167746] = { -- Darkhaven Villager
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[160163] = { -- The Accuser
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[160233] = { -- The Accuser
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[169238] = { -- Courier Araak
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[166543] = { -- Dobwobble
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[166541] = { -- Cobwobble
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[166542] = { -- Slobwobble
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[165921] = { -- Courier Araak
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Revendreth
	-- The Maw
	-- End of The Maw
	-- Torghast
	[175127] = { -- Wayfinder
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[168979] = { -- Meatball
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[167839] = { -- Partially-Infused Soul Remnant
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[166123] = { -- Indigo
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[152418] = { -- Gallath
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[166151] = { -- Moriaz the Red
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[171920] = { -- Ayeleth
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[171901] = { -- Kaletar
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[172264] = { -- Yira'lya
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[172261] = { -- Chalkyth
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[157426] = { -- Indri the Treesinger
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[178932] = { -- Ve'lor the Messenger
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[166147] = { -- Calix
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[157406] = { -- Renavyth
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[166148] = { -- Sawn
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[172244] = { -- Blisswing
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[171996] = { -- Kythekios
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[179671] = { -- Ella
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[179669] = { -- Spore of Marasmius
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[172260] = { -- Karynmwylyann
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[157432] = { -- Bloodletter Phantoriax
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[171867] = { -- Dug Gravewell
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Torghast
	-- Exile's Reach (Alliance)
	[153211] = { -- Meredy Huntswell
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[164835] = { -- Kee-La (Monk Only)
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[156943] = { -- Meredy Huntswell
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Exile's Reach (Alliance)
	-- Darkmaul Citadel (Alliance)
	[161350] = { -- Captain Garrick
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Darkmaul Citadel (Alliance)
}

addonTable.DIALOG_SL = DIALOG_SL