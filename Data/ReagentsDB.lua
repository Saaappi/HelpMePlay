local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
--[[
	Table Legend:
		QUANTITY (q) The amount of the reagent made baseline (specified by Blizzard).
		REAGENTS (r) A table holding the children reagents used to craft the primary reagent. (e.g. Copper Ore for Copper Bar)
		COUNT (c) The amount of the child reagent necessary to craft the primary reagent.
		PRIMARY KEY (pk) A reference to another entry in the table.
]]
local REAGENTS = {
	-- Mining
	[2840] = { -- Copper Bar
		["q"] = 1,
		["r"] = {
			{
				["id"] = 2770, -- Copper Ore
				["c"] = 1,
				["pk"] = nil,
			},
		},
	},
	[2841] = { -- Bronze Bar
		["q"] = 1,
		["r"] = {
			{
				["id"] = 2840,
				["c"] = 1,
				["pk"] = 2840,
			},
			{
				["id"] = 3576,
				["c"] = 1,
				["pk"] = 3576,
			},
		},
	},
	[3576] = { -- Tin Bar
		["q"] = 1,
		["r"] = {
			{
				["id"] = 2771,
				["c"] = 1,
				["pk"] = nil,
			},
		},
	},
	
	-- Tailoring
	--[[[2996] = { -- Bolt of Linen Cloth
		["Linen Cloth"] = 2,
	},
	[2997] = { -- Bolt of Woolen Cloth
		["Wool Cloth"] = 3,
	},
	[4305] = { -- Bolt of Silk Cloth
		["Silk Cloth"] = 4,
	},
	[4339] = { -- Bolt of Mageweave
		["Mageweave Cloth"] = 4,
	},
	[14048] = {	-- Bolt of Runecloth
		["Runecloth"] = 4,
	},
	[21840] = {	-- Bolt of Netherweave
		["Netherweave Cloth"] = 5,
	},
	[21842] = {	-- Bolt of Imbued Netherweave
		["Arcane Dust"] = 2,
		["Bolt of Netherweave"] = {
			["count"] = 3,
			["childReagents"] = {
				["Netherweave Cloth"] = 5,
			},
		},
	},
	[21844] = {	-- Bolt of Soulcloth
		["Soul Essence"] = 8,
		["Bolt of Netherweave"] = {
			["count"] = 1,
			["childReagents"] = {
				["Netherweave Cloth"] = 5,
			},
		},
	},
	[41511] = {	-- Bolt of Imbued Frostweave
		["Infinite Dust"] = 2,
		["Bolt of Frostweave"] = {
			["count"] = 2,
			["childReagents"] = {
				["Frostweave Cloth"] = 5,
			},
		},
	},
	[41510] = {	-- Bolt of Frostweave
		["Frostweave Cloth"] = 5,
	},
	[41593] = {	-- Ebonweave
		["Eternal Shadow"] = 2,
		["Bolt of Imbued Frostweave"] = {
			["count"] = 1,
			["childReagents"] = {
				["Bolt of Frostweave"] = 2,
				["Infinite Dust"] = 2,
			},
		},
	},
	[53643] = {	-- Bolt of Embersilk Cloth
		["Embersilk Cloth"] = 5,
	},
	[82441] = {	-- Bolt of Windwool Cloth
		["Windwool Cloth"] = 5,
	},
	[98619] = {	-- Celestial Cloth
		["Bolt of Windwool Cloth"] = {
			["count"] = 10,
			["childReagents"] = {
				["Windwool Cloth"] = 5,
			},
		},
	},]]
}

addonTable.REAGENTS = REAGENTS