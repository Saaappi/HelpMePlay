local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DIALOG_LEGION = {
	-- Supported Maps: 619 (Broken Isles), 905 (Argus)
	-- Objects
	[0] = {
		["g"] = {
			{
				["text"] 		= L_DIALOG["Leave the Darkpens."], -- Ravencrest Cemetary
				["condition"] 	= "none",
			},
		},
	},
	-- Highmountain
	[151641] = { -- Spiritwalker Ebonhorn
		["g"] = {
			{
				["text"] 		= L_DIALOG["Spiritwalker Ebonhorn 3"],
				["condition"] 	= "none",
			},
		},
	},
	[151643] = { -- Navarrogg
		["g"] = {
			{
				["text"] 		= L_DIALOG["Quest"],
				["condition"] 	= "none",
			},
		},
	},
	[151963] = { -- Navarrogg
		["g"] = {
			{
				["text"] 		= L_DIALOG["Quest"],
				["condition"] 	= "none",
			},
		},
	},
	[98825] = { -- Spiritwalker Ebonhorn
		["g"] = {
			{
				["text"] 		= L_DIALOG["Spiritwalker Ebonhorn 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Spiritwalker Ebonhorn 2"],
				["condition"] 	= "none",
			},
		},
	},
	[99745] = { -- Snazzle Shinyfinder
		["g"] = {
			{
				["text"] 		= L_DIALOG["Snazzle Shinyfinder 1"],
				["condition"] 	= "none",
			},
		},
	},
	[99746] = { -- Trytooth Hardchisel
		["g"] = {
			{
				["text"] 		= L_DIALOG["Trytooth Hardchisel 1"],
				["condition"] 	= "none",
			},
		},
	},
	[99747] = { -- Kindle Candlecrafter
		["g"] = {
			{
				["text"] 		= L_DIALOG["Kindle Candlecrafter 1"],
				["condition"] 	= "none",
			},
		},
	},
	[99748] = { -- Dug Digger
		["g"] = {
			{
				["text"] 		= L_DIALOG["Dug Digger 1"],
				["condition"] 	= "none",
			},
		},
	},
	[99781] = { -- Snazzle Shinyfinder
		["g"] = {
			{
				["text"] 		= L_DIALOG["Snazzle Shinyfinder 2"],
				["condition"] 	= "none",
			},
		},
	},
	[99782] = { -- Trytooth Hardchisel
		["g"] = {
			{
				["text"] 		= L_DIALOG["Trytooth Hardchisel 2"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Trytooth Hardchisel 3"],
				["condition"] 	= "none",
			},
		},
	},
	[99784] = { -- Kindle Candlecrafter
		["g"] = {
			{
				["text"] 		= L_DIALOG["Kindle Candlecrafter 2"],
				["condition"] 	= "none",
			},
		},
	},
	[95403] = { -- Windmaster Julan
		["g"] = {
			{
				["text"] 		= L_DIALOG["Windmaster Julan 1"],
				["condition"] 	= "none",
			},
		},
	},
	[96286] = { -- Navarrogg
		["g"] = {
			{
				["text"] 		= L_DIALOG["Navarrogg 1"],
				["condition"] 	= "none",
			},
		},
	},
	[98773] = { -- Lasan Skyhorn
		["g"] = {
			{
				["text"] 		= L_DIALOG["Yes!"],
				["condition"] 	= "none",
			},
		},
	},
	[99619] = { -- Navarrogg
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[96591] = { -- Amateur Hunter
		["g"] = {
			{
				["text"] 		= L_DIALOG["Go hunt somewhere else!"],
				["condition"] 	= "none",
			},
		},
	},
	[98804] = { -- Amateur Hunter
		["g"] = {
			{
				["text"] 		= L_DIALOG["Go hunt somewhere else!"],
				["condition"] 	= "none",
			},
		},
	},
	[94434] = { -- Addie Fizzlebog
		["g"] = {
			{
				["text"] 		= L_DIALOG["Addie Fizzlebog 1"],
				["condition"] 	= "none",
			},
		},
	},
	[106153] = { -- Tarvim Daywalker
		["g"] = {
			{
				["text"] 		= L_DIALOG["There is no time left. Run!"],
				["condition"] 	= "none",
			},
		},
	},
	[106115] = { -- Red Skymane
		["g"] = {
			{
				["text"] 		= L_DIALOG["There is no time left. Run!"],
				["condition"] 	= "none",
			},
		},
	},
	[106191] = { -- Old Nefu
		["g"] = {
			{
				["text"] 		= L_DIALOG["There is no time left. Run!"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Highmountain
	-- Val'sharah
	[91462] = { -- Malfurion Stormrage
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[91109] = { -- Malfurion Stormrage
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[92742] = { -- Ysera
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[104799] = { -- Tyrande Whisperwind
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[92734] = { -- Penelope Heathrow
		["g"] = {
			{
				["text"] 		= L_DIALOG["Penelope Heathrow 1"],
				["condition"] 	= "none",
			},
		},
	},
	[92620] = { -- Commander Jarod Shadowsong
		["g"] = {
			{
				["text"] 		= L_DIALOG["I am ready."],
				["condition"] 	= "none",
			},
		},
	},
	[94974] = { -- Sirius Ebonwing
		["g"] = {
			{
				["text"] 		= L_DIALOG["Sirius Ebonwing 1"],
				["condition"] 	= "none",
			},
		},
	},
	[94975] = { -- Asha Ravensong
		["g"] = {
			{
				["text"] 		= L_DIALOG["Asha Ravensong 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Asha Ravensong 2"],
				["condition"] 	= "none",
			},
		},
	},
	[94976] = { -- Cassiel Nightthorn
		["g"] = {
			{
				["text"] 		= L_DIALOG["Cassiel Nightthorn 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Cassiel Nightthorn 2"],
				["condition"] 	= "none",
			},
		},
	},
	[104739] = { -- Tyrande Whisperwind
		["g"] = {
			{
				["text"] 		= L_DIALOG["Tyrande Whisperwind 1"],
				["condition"] 	= "none",
			},
			{
				["text"] 		= L_DIALOG["Tyrande Whisperwind 2"],
				["condition"] 	= "none",
			},
		},
	},
	[106638] = { -- Leafbeard the Storied
		["g"] = {
			{
				["text"] 		= L_DIALOG["Leafbeard the Storied 1"],
				["condition"] 	= "none",
			},
		},
	},
	[108642] = { -- Keeper Remulos
		["g"] = {
			{
				["text"] 		= L_DIALOG["Keeper Remulos 1"],
				["condition"] 	= "none",
			},
		},
	},
	-- End of Val'sharah
}

addonTable.DIALOG_LEGION = DIALOG_LEGION