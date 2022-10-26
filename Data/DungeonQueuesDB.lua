local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DUNGEON_QUEUES_BY_QUEST = {
	[55992] = { -- Darkmaul Citadel (A)
		["id"] 	= 2043,
		["n"] 	= C_Map.GetMapInfo(1609).name,
		["t"] 	= "INTERFACE\\ICONS\\achievement_boss_highmaul_king",
	},
	[59984] = { -- Darkmaul Citadel (H)
		["id"] 	= 2043,
		["n"] 	= C_Map.GetMapInfo(1609).name,
		["t"] 	= "INTERFACE\\ICONS\\achievement_boss_highmaul_king",
	},
}

addonTable.DUNGEON_QUEUES_BY_QUEST = DUNGEON_QUEUES_BY_QUEST