local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_CLASSIC = {
	-- Supported Maps: 12 (Kalimdor), 13 (Eastern Kingdoms)
	-- Blasted Lands
	[78423] = { -- Archmage Khadgar
		["g"] = {
			{
				["text"] 		= L_DIALOG["Archmage Khadgar 1"],
				["condition"] 	= "level_lower",
				["level"] 		= 50,
			},
		},
		["c"] = {
			{
				["text"] 		= L_DIALOG["Archmage Khadgar 2"],
				["condition"] 	= "level_lower",
				["level"] 		= 50,
			},
		},
	},
	[88206] = { -- Zidormi
		["g"] = {
			{
				["text"] 		= L_DIALOG["Zidormi 4"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Zidormi 5"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Blasted Lands
	-- Dun Morogh
	[46293] = { -- Torben Zapblast
		["g"] = {
			{
				["text"] 		= L_DIALOG["Torben Zapblast 1"],
				["condition"] 	= "none",
			},
		},
	},
	[40991] = { -- Mountaineer Dunstan
		["g"] = {
			{
				["text"] 		= L_DIALOG["Mountaineer Dunstan 1"],
				["condition"] 	= "none",
			},
		},
	},
	[40994] = { -- Mountaineer Lewin
		["g"] = {
			{
				["text"] 		= L_DIALOG["Mountaineer Lewin 1"],
				["condition"] 	= "none",
			},
		},
	},
	[41056] = { -- Mountaineer Valgrum
		["g"] = {
			{
				["text"] 		= L_DIALOG["Mountaineer Valgrum 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Dun Morogh
	-- Redridge Mountains
	[162591] = { -- Ben Howell
		["g"] = {
			{
				["text"] 		= L_DIALOG["Ben Howell 1"],
				["condition"] 	= "none",
			},
		},
	},
	[167281] = { -- Jamin
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[167282] = { -- Roger
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[777] = { -- Amy Davenport
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[789] = { -- Kimberly Hiett
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[790] = { -- Karen Taylor
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[791] = { -- Lindsay Ashlock
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[793] = { -- Kara Adams
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[812] = { -- Alma Jainrose
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[956] = { -- Dorin Songblade
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[1678] = { -- Vernon Hale
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[1680] = { -- Matthew Hooper
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[3086] = { -- Gretchen Vogel
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[3087] = { -- Crystal Boughman
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[9982] = { -- Penny
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[162953] = { -- Sarah Howell
		["g"] = {
			{
				["text"] 		= L_DIALOG["Sarah Howell 1"],
				["condition"] 	= "none",
			},
		},
	},
	[167279] = { -- Rachel
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[167280] = { -- Nathan
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[167283] = { -- Hannah
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[167284] = { -- Madison
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	[167285] = { -- Erin
		["g"] = {
			{
				["text"] 		= L_DIALOG["The bells tell us to go to the town hall to be safe."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate has ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The magistrate ordered our retreat."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are incoming."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Everything will be okay."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We must get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Don't be a hero."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We will survive this."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["We're all going to go hide in the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Get to the town hall."],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["The Scourge are coming!"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Redridge Mountains
	-- Deadwind Pass
	[113986] = { -- Archmage Khadgar
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Deadwind Pass
	-- Hillsbrad Foothills
	[47442] = { -- Johnny Awesome
		["g"] = {
			{
				["text"] 		= L_DIALOG["Johnny Awesome 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Johnny Awesome 2"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Johnny Awesome 3"],
				["condition"] 	= "none",
			},
		},
	},
	[47443] = { -- Kingslayer Orkus
		["g"] = {
			{
				["text"] 		= L_DIALOG["Kingslayer Orkus 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Kingslayer Orkus 2"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Kingslayer Orkus 3"],
				["condition"] 	= "none",
			},
		},
	},
	[47444] = { -- Dumass
		["g"] = {
			{
				["text"] 		= L_DIALOG["Dumass 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Dumass 2"],
				["condition"] 	= "none",
			},
		},
	},
	[48218] = { -- Kingslayer Orkus
		["g"] = {
			{
				["text"] 		= L_DIALOG["Kingslayer Orkus 4"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Hillsbrad Foothills
	-- Silithus
	[128607] = { -- Zidormi
		["g"] = {
			{
				["text"] 		= L_DIALOG["Zidormi 3"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Zidormi 6"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Silithus
	-- Silverpine Forest
	[44825] = { -- Bat Handler Maggotbreath
		["g"] = {
			{
				["text"] 		= L_DIALOG["Bat Handler Maggotbreath 1"],
				["condition"] 	= "none",
			},
		},
	},
	[45752] = { -- Ambermill Dimensional Portal
		["g"] = {
			{
				["text"] 		= L_DIALOG["Ambermill Dimensional Portal 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Silverpine Forest
	-- Ironforge
	[1573] = { -- Gryth Thurden
		["g"] = {
			{
				["text"] 		= L_DIALOG["Gryth Thurden 1"],
				["condition"] 	= "level_lower",
				["level"]		= 50,
			},
		},
	},
	-- End of Ironforge
	-- Stormwind City
	[107934] = { -- Recruiter Lee
		["g"] = {
			{
				["text"] 		= L_DIALOG["I've heard this tale before..."],
				["condition"] 	= "none",
			},
		},
		["c"] = {
			{
				["text"] 		= L_DIALOG["Are you sure you want to skip the Broken Shore introduction?"],
				["condition"] 	= "none",
			},
		},
	},
	[120590] = { -- Lady Jaina Proudmoore
		["g"] = {
			{
				["text"] 		= L_DIALOG["I'm ready to set sail!"],
				["condition"] 	= "level_lower",
				["level"]		= 50,
			},
		},
	},
	[149626] = { -- Vanguard Battlemage (Alliance)
		["g"] = {
			{
				["text"] 		= L_DIALOG["Vanguard Battlemage 1"],
				["condition"] 	= "none",
			},
		},
	},
	[171789] = { -- High Inquisitor Whitemane
		["g"] = {
			{
				["text"] 		= L_DIALOG["I have heard this tale before."],
				["condition"] 	= "none",
			},
		},
		["c"] = {
			{
				["text"] 		= L_DIALOG["Are you sure?"],
				["condition"] 	= "none",
			},
		},
	},
	[100429] = { -- Anduin Wrynn
		["g"] = {
			{
				["text"] 		= L_DIALOG["Anduin Wrynn 1"],
				["condition"] 	= "none",
			},
		},
	},
	[149616] = { -- Kirin Tor Emissary
		["g"] = {
			{
				["text"] 		= L_DIALOG["Kirin Tor Emissary 1"],
				["condition"] 	= "none",
			},
		},
	},
	[163095] = { -- Lindie Springstock
		["g"] = {
			{
				["text"] 		= L_DIALOG["Lindie Springstock 1"],
				["condition"] 	= "none",
			},
		},
	},
	[154169] = { -- Captain Garrick
		["g"] = {
			{
				["text"] 		= L_DIALOG["Captain Garrick 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Stormwind City
	-- Tirisfal Glades
	[141488] = { -- Zidormi
		["g"] = {
			{
				["text"] 		= L_DIALOG["Zidormi 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Tirisfal Glades
	-- Twilight Highlands
	[164012] = { -- Alexstrasza, the Life-Binder
		["g"] = {
			{
				["text"] 		= L_DIALOG["Alexstrasza, the Life-Binder 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Twilight Highlands
	-- Durotar
	[4311] = { -- Holgar Stormaxe
		["g"] = {
			{
				["text"] 		= L_DIALOG["I've heard this tale before..."],
				["condition"] 	= "none",
			},
		},
		["c"] = {
			{
				["text"] 		= L_DIALOG["Are you sure you want to skip the Broken Shore introduction?"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Durotar
	-- Orgrimmar
	[135205] = { -- Nathanos Blightcaller
		["g"] = {
			{
				["text"] 		= L_DIALOG["Nathanos Blightcaller 1"],
				["condition"] 	= "none",
			},
		},
	},
	[167032] = { -- Chromie
		["g"] = {
			{
				["text"] 		= L_DIALOG["Chromie 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Chromie 2"],
				["condition"] 	= "none",
			},
		},
	},
	[168431] = { -- Warlord Breka Grimaxe
		["g"] = {
			{
				["text"] 		= L_DIALOG["Warlord Breka Grimaxe 2"],
				["condition"] 	= "none",
			},
		},
	},
	[171791] = { -- Nazgrim
		["g"] = {
			{
				["text"] 		= L_DIALOG["I have heard this tale before."],
				["condition"] 	= "none",
			},
		},
		["c"] = {
			{
				["text"] 		= L_DIALOG["Are you sure?"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Orgrimmar
	-- Darkshore
	[141489] = { -- Zidormi
		["g"] = {
			{
				["text"] 		= L_DIALOG["Zidormi 2"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Zidormi 3"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Darkshore
}

addonTable.DIALOG_CLASSIC = DIALOG_CLASSIC