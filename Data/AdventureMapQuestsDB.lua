local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local ADVENTURE_MAP_QUESTS_INDICES = {
	["Alliance"] = {
		L_GLOBALSTRINGS["Drustvar"],
		L_GLOBALSTRINGS["Stormsong Valley"],
		L_GLOBALSTRINGS["Tiragarde Sound"],
	},
	["Horde"] = {
		L_GLOBALSTRINGS["Zuldazar"],
		L_GLOBALSTRINGS["Nazmir"],
		L_GLOBALSTRINGS["Vol'dun"],
	},
	["Shadowlands"] = {
		L_GLOBALSTRINGS["Ardenweald"],
		L_GLOBALSTRINGS["Bastion"],
		L_GLOBALSTRINGS["Maldraxxus"],
		L_GLOBALSTRINGS["Torghast"],
		L_GLOBALSTRINGS["Revendreth"],
	},
}
local ADVENTURE_MAP_QUESTS = {
	["Alliance"] = {
		["Drustvar"] = 47961,
		["Stormsong Valley"] = 47962,
		["Tiragarde Sound"] = 47960,
	},
	["Horde"] = {
		["Zuldazar"] = 47514,
		["Nazmir"] = 47512,
		["Vol'dun"] = 47513,
	},
	["Shadowlands"] = {
		["Ardenweald"] = 62277,
		["Bastion"] = 62275,
		["Maldraxxus"] = 62278,
		["Torghast"] = 64846,
		["Revendreth"] = 62279,
	},
}

addonTable.ADVENTURE_MAP_QUESTS = ADVENTURE_MAP_QUESTS
addonTable.ADVENTURE_MAP_QUESTS_INDICES = ADVENTURE_MAP_QUESTS_INDICES