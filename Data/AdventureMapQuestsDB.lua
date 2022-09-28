local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local ADVENTURE_MAP_QUESTS = {
	["BFA_Alliance"] = {
		47960, -- Tiragarde Sound
		47961, -- Drustvar
		47962, -- Stormsong Valley
	},
	["BFA_Horde"] = {
		47512, -- Nazmir
		47513, -- Vol'dun
		47514, -- Zuldazar
	},
	["SL"] = {
		
		62275, -- Bastion
		62277, -- Ardenweald
		62278, -- Maldraxxus
		62279, -- Revendreth
		64846, -- Torghast
	},
}

addonTable.ADVENTURE_MAP_QUESTS = ADVENTURE_MAP_QUESTS