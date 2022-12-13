local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local ADVENTURE_MAP_QUESTS = {
	["BFA_Alliance"] = {
		47960, -- Tiragarde Sound
		47961, -- Drustvar
		47962, -- Stormsong Valley
	},
	["BFA_Horde"] = {
		47514, -- Zuldazar
		47512, -- Nazmir
		47513, -- Vol'dun
	},
	["SL"] = {
		64846, -- Torghast
		62277, -- Ardenweald
		62279, -- Revendreth
		62275, -- Bastion
		62278, -- Maldraxxus
	},
	["DF"] = {
		72266, -- The Waking Shores
		72267, -- Ohn'ahran Plains
		72268, -- Azure Span
		72269, -- Thaldraszus
	},
}

addonTable.ADVENTURE_MAP_QUESTS = ADVENTURE_MAP_QUESTS