local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_MOP = {
	-- Supported Maps: 424 (Pandaria)
	-- The Jade Forest
	[66730] = { -- Hyuna of the Shrines
		["g"] = {
			L_DIALOG["Think you can take me in a pet battle?"],
		},
		["c"] = {
			L_DIALOG["Let's do it!"],
		},
	},
	[68464] = { -- Whispering Pandaren Spirit
		["g"] = {
			L_DIALOG["Another challenge?"],
		},
		["c"] = {
			L_DIALOG["Prepare yourself!"],
		},
	},
	[66243] = { -- Pan the Kind Hand
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[66241] = { -- Hong the Kindly
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of The Jade Forest
	-- Valley of the Four Winds
	[66734] = { -- Farmer Nishi
		["g"] = {
			L_DIALOG["Think you can take me in a pet battle?"],
		},
		["c"] = {
			L_DIALOG["Let's rumble!"],
		},
	},
	[66244] = { -- Su the Tamer
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Valley of the Four Winds
	-- Krasarang Wilds
	[66733] = { -- Mo'ruk
		["g"] = {
			L_DIALOG["Think you can take me in a pet battle?"],
		},
		["c"] = {
			L_DIALOG["Come at me!"],
		},
	},
	[59310] = { -- Teve Dawnchaser
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Krasarang Wilds
	-- Townlong Steppes
	[66246] = { -- Tigermaster Gai-Lin
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Townlong Steppes
	-- Dread Wastes
	[68462] = { -- Flowing Pandaren Spirit
		["g"] = {
			L_DIALOG["Another challenge?"],
		},
		["c"] = {
			L_DIALOG["Prepare yourself!"],
		},
	},
	[66250] = { -- Handler Kla'vik
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Dread Wastes
	-- Vale of Eternal Blossoms
	[66741] = { -- Aki the Chosen
		["g"] = {
			L_DIALOG["Think you can take me in a pet battle?"],
		},
		["c"] = {
			L_DIALOG["You're going down!"],
		},
	},
	[63988] = { -- Jaul Hsu
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Vale of Eternal Blossoms
	-- Kun-Lai Summit
	[68465] = { -- Thundering Pandaren Spirit
		["g"] = {
			L_DIALOG["Another challenge?"],
		},
		["c"] = {
			L_DIALOG["Prepare yourself!"],
		},
	},
	-- End of Kun-Lai Summit
	-- Timeless Isle
	[73626] = { -- Little Tommy Newcomer
		["g"] = {
			L_DIALOG["Little Tommy Newcomer 1"],
		},
		["c"] = {
			L_DIALOG["Let's rumble!"],
		},
	},
	[73632] = { -- Cowardly Zue
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	[73082] = { -- Master Li
		["g"] = {
			L_DIALOG["Master Li 1"],
		},
	},
	-- End of Timeless Isle
	-- Celestial Tournament
	[71924] = { -- Wrathion
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	[71927] = { -- Chen Stormstout
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	[71930] = { -- Shademaster Kiryn
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	[71931] = { -- Taran Zhu
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	[71932] = { -- Wise Mari
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	[71933] = { -- Blingtron 4000
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	[71926] = { -- Lorewalker Cho
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	[71934] = { -- Dr. Ion Goldbloom
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	[71929] = { -- Sully "The Pickle" McLeary
		["g"] = {
			L_DIALOG["Let's do battle!"],
		},
	},
	-- End of Celestial Tournament
	-- Mogu'shan Vaults
	[61348] = { -- Lorewalker Cho
		["g"] = {
			L_DIALOG["Lorewalker Cho 1"],
			L_DIALOG["Lorewalker Cho 2"],
		},
	},
	-- End of Mogu'shan Vaults
	-- Isle of Thunder
	[69565] = { -- Scout Captain Elsia
		["g"] = {
			L_DIALOG["Scout Captain Elsia 1"],
		},
	},
	[69810] = { -- Taoshi
		["g"] = {
			L_DIALOG["Taoshi 1"],
		},
	},
	[70297] = { -- Taoshi
		["g"] = {
			L_DIALOG["Taoshi 2"],
		},
	},
	[69252] = { -- Ranger Shalan
		["g"] = {
			L_DIALOG["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L_DIALOG["A small fee for supplies is required."],
		},
	},
	-- End of Isle of Thunder
}

addonTable.DIALOG_MOP = DIALOG_MOP