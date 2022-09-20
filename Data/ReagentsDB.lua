local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
--[[
	Table Legend:
		COUNT (c) The amount of said reagent to complete its parent (no children).
		CHILD REAGENT (cr) A reagent required to make its parent to make its parent.
		CHILD REAGENTS (crs) Multiple reagents required to make its parent to make its parent.
]]
local REAGENTS = {
	-- Mining
	[2840] = { -- Copper Bar
		{
			["id"] = 2770, -- Copper Ore
			["c"] = 1,
			["cr"] = nil,
			["crs"] = nil,
		},
	},
	[2841] = { -- Bronze Bar
		{
			["id"] = 2840,
			["c"] = 1,
			["cr"] = 2840,
			["crs"] = nil,
		},
		{
			["id"] = 3576,
			["c"] = 1,
			["cr"] = 3576,
			["crs"] = nil,
		},
	},
	[3576] = { -- Tin Bar
		{
			["id"] = 2771,
			["c"] = 1,
			["cr"] = nil,
			["crs"] = nil,
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