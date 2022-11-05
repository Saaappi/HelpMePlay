local addonName, addonTable = ...
local DIALOG_SL = {
	-- Supported Maps: 1409 (Exile's Reach), 1550 (The Shadowlands)
	-- No Map Association
	[169501] = { -- Shadowlands Wormhole
		["g"] = {
			{
				["o"] 			= 51938, -- Revendreth
				["c"] 			= { "quests.notComplete", "level.lower" },
				["q"] 			= { 62778 }, -- Reinforcing Revendreth
				["l"] 			= 52,
			},
			{
				["o"] 			= 51937, -- Ardenweald
				["c"] 			= { "quests.complete", "level.lower" },
				["q"] 			= { 62778 }, -- Reinforcing Revendreth
				["l"] 			= 56,
			},
			{
				["o"] 			= 51935, -- Bastion
				["c"] 			= { "quests.complete", "level.lower" },
				["q"] 			= { 62763 }, -- Support the Court
				["l"] 			= 59,
			},
		},
	},
	-- Oribos
	[159478] = { -- Tal-Inara
		["g"] = {
			{
				["o"] 			= 53547,
				["c"] 			= { "quests.active", "level.lower" },
				["q"] 			= { 62159 }, -- Aiding the Shadowlands
				["l"] 			= 60,
			},
		},
	},
	[174871] = { -- Fatescribe Roh-Tahl
		["g"] = {
			{
				["o"] 			= 52127,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Oribos
	-- Bastion
	[159277] = { -- Aspirant Leda
		["g"] = {
			{
				["o"] 			= 49551,
				["c"] 			= { "none" },
			},
		},
	},
	[159278] = { -- Aspirant Ikaran
		["g"] = {
			{
				["o"] 			= 49554,
				["c"] 			= { "none" },
			},
		},
	},
	[158765] = { -- Pelodis
		["g"] = {
			{
				["o"] 			= 49984,
				["c"] 			= "quests.active",
				["q"] 			= { 57933 }, -- We Can Rebuild Him
			},
			{
				["o"] 			= 1,
				["c"] 			= "quests.active",
				["q"] 			= { 62241 }, -- Training Regimen (WQ)
			},
			{
				["o"] 			= 2,
				["c"] 			= "quests.active",
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
				["o"] 			= 49575,
				["c"] 			= { "none" },
			},
		},
	},
	[158006] = { -- Heartwood Grove Holdout
		["g"] = {
			{
				["o"] 			= 49575,
				["c"] 			= { "none" },
			},
		},
	},
	[159428] = { -- Groonoomcrooek
		["g"] = {
			{
				["o"] 			= 49626,
				["c"] 			= { "quest.obj.notComplete" },
				["q"] 			= 57865, -- Ages-Echoing Wisdom
				["obj"] 		= 1,
			},
		},
	},
	[159427] = { -- Elder Finnan
		["g"] = {
			{
				["o"] 			= 49625,
				["c"] 			= { "quest.obj.notComplete" },
				["q"] 			= 57865, -- Ages-Echoing Wisdom
				["obj"] 		= 2,
			},
		},
	},
	[159465] = { -- Elder Gwenna
		["g"] = {
			{
				["o"] 			= 49621,
				["c"] 			= { "quest.obj.notComplete" },
				["q"] 			= 57865, -- Ages-Echoing Wisdom
				["obj"] 		= 3,
			},
		},
	},
	-- End of Ardenweald
	-- Revendreth
	[160163] = { -- The Accuser
		["g"] = {
			{
				["o"] 			= 49481,
				["c"] 			= { "none" },
			},
		},
	},
	[160233] = { -- The Accuser
		["g"] = {
			{
				["o"] 			= 49482,
				["c"] 			= { "none" },
			},
		},
	},
	[167918] = { -- Bela
		["g"] = {
			{
				["o"] 			= 51746,
				["c"] 			= { "none" },
			},
		},
	},
	[167849] = { -- Soul of Keltesh
		["g"] = {
			{
				["o"] 			= 53436,
				["c"] 			= { "none" },
			},
		},
	},
	[167838] = { -- Globknob
		["g"] = {
			{
				["o"] 			= 54010,
				["c"] 			= { "none" },
			},
		},
	},
	[167746] = { -- Darkhaven Villager
		["g"] = {
			{
				["o"] 			= 54308,
				["c"] 			= { "none" },
			},
		},
	},
	[156295] = { -- Courier Rokalai
		["g"] = {
			{
				["o"] 			= 54009,
				["c"] 			= { "none" },
			},
		},
	},
	[167717] = { -- Darkhaven Villager
		["g"] = {
			{
				["o"] 			= 53217,
				["c"] 			= { "none" },
			},
		},
	},
	[167744] = { -- Darkhaven Villager
		["g"] = {
			{
				["o"] 			= 53218,
				["c"] 			= { "none" },
			},
		},
	},
	[168237] = { -- Ilka
		["g"] = {
			{
				["o"] 			= 53803,
				["c"] 			= { "none" },
			},
		},
	},
	[168238] = { -- Samu
		["g"] = {
			{
				["o"] 			= 52448,
				["c"] 			= { "none" },
			},
		},
	},
	[169238] = { -- Courier Araak
		["g"] = {
			{
				["o"] 			= 54243,
				["c"] 			= { "none" },
			},
		},
	},
	[166543] = { -- Dobwobble
		["g"] = {
			{
				["o"] 			= 54247,
				["c"] 			= { "none" },
			},
		},
	},
	[166541] = { -- Cobwobble
		["g"] = {
			{
				["o"] 			= 52005,
				["c"] 			= { "none" },
			},
		},
	},
	[166542] = { -- Slobwobble
		["g"] = {
			{
				["o"] 			= 54248,
				["c"] 			= { "none" },
			},
		},
	},
	[165921] = { -- Courier Araak
		["g"] = {
			{
				["o"] 			= 54242,
				["c"] 			= { "none" },
			},
		},
	},
	[164420] = { -- Laurent
		["g"] = {
			{
				["o"] 			= 50018,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Revendreth
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
				["o"] 			= 49526,
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
	-- Exile's Reach (Horde)
	[167298] = { -- Herbert Gloomburst
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[167598] = { -- Herbert Gloomburst
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Exile's Reach (Horde)
	-- Exile's Reach (Class NPCs)
	[164835] = { -- Kee-La (Monk Only)
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[163024] = { -- Coulston Nereus (Rogue Only)
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	[162943] = { -- Hjalmar the Undying (Warrior Only)
		["g"] = {
			{
				["o"] 			= 51265,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Exile's Reach (Class NPCs)
	-- Darkmaul Citadel (Horde)
	[167663] = { -- Warlord Breka Grimaxe
		["g"] = {
			{
				["o"] 			= 1,
				["c"] 			= { "none" },
			},
		},
	},
	-- End of Darkmaul Citadel (Horde)
}

addonTable.DIALOG_SL = DIALOG_SL