local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local GUID = {
	["Player-1426-0DEEAE42"] 	= 0, -- Artaius (Aerie Peak)
	["Player-1426-0ADB1BEE"] 	= 0, -- Grimfeast (Aerie Peak)
	["Player-61-0ED311BA"] 		= 0, -- Helpmeplays (Aerie Peak)
	["Player-1426-0DEE000B"] 	= 0, -- Highchants (Aerie Peak)
	["Player-1426-0DDBAD46"] 	= 0, -- Pieromancer (Aerie Peak)
	["Player-1426-0DDCECA0"] 	= 0, -- Spookasem (Aerie Peak)
}

local QUEST_DUNGEON_QUEUES = {
	[55992] 	= 2043, -- Darkmaul Citadel (A)
	[59984] 	= 2043, -- Darkmaul Citadel (H)
}

addonTable.GUID = GUID
addonTable.QUEST_DUNGEON_QUEUES = QUEST_DUNGEON_QUEUES