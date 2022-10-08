local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_SL = {
	-- Supported Maps: 1409 (Exile's Reach), 1550 (The Shadowlands)
	-- No Map Association
	[0] = {
		["g"] = {
			{
				["text"] 		= L_DIALOG["Ancient Translocator 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Repository Console 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- Oribos
	[159478] = { -- Tal-Inara
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[174871] = { -- Fatescribe Roh-Tahl
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	-- End of Oribos
	-- Bastion
	-- End of Bastion
	-- Maldraxxus
	-- End of Maldraxxus
	-- Ardenweald
	-- End of Ardenweald
	-- Revendreth
	[167838] = { -- Globknob
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[167918] = { -- Bela
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[164420] = { -- Laurent
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[167849] = { -- Soul of Keltesh
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[156295] = { -- Courier Rokalai
		["g"] = {
			{
				["o"] 			= 2,
				["c"] 			= "quest.isActive",
				["q"] 			= 60177, -- Reason for the Treason
			},
		},
	},
	[168237] = { -- Ilka
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[168238] = { -- Samu
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[167717] = { -- Darkhaven Villager
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[167744] = { -- Darkhaven Villager
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[167746] = { -- Darkhaven Villager
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[160163] = { -- The Accuser
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[160233] = { -- The Accuser
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
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
				["c"] 			= "none",
			},
		},
	},
	[168979] = { -- Meatball
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[167839] = { -- Partially-Infused Soul Remnant
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[166123] = { -- Indigo
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[152418] = { -- Gallath
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[166151] = { -- Moriaz the Red
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[171920] = { -- Ayeleth
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[171901] = { -- Kaletar
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[172264] = { -- Yira'lya
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[172261] = { -- Chalkyth
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[157426] = { -- Indri the Treesinger
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[178932] = { -- Ve'lor the Messenger
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[166147] = { -- Calix
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[157406] = { -- Renavyth
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[166148] = { -- Sawn
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[172244] = { -- Blisswing
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[171996] = { -- Kythekios
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[179671] = { -- Ella
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[179669] = { -- Spore of Marasmius
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[172260] = { -- Karynmwylyann
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[157432] = { -- Bloodletter Phantoriax
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	[171867] = { -- Dug Gravewell
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= "none",
			},
		},
	},
	-- End of Torghast
	-- Zereth Mortis
	-- End of Zereth Mortis
	-- Exile's Reach
	-- End of Exile's Reach
}

addonTable.DIALOG_SL = DIALOG_SL