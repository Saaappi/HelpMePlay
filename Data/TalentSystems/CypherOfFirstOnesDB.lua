local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local CYPHERSOFTHEFIRSTONES = {
	-- Cyphers of the First Ones: 1979
	1901, -- Metrial Understanding (Grants the ability to summon our friend, Pocopoc)
	1972, -- Cachial Understanding (Unlocks the 3rd World Quest of Zereth Mortis)
	1904, -- Aealic Understanding (Access to Enhancement Consoles in the zone for temporary buffs)
	1902, -- Altonian Understanding (Unlocks new quests, which means bonus currency from the zone)
	1932, -- Dealic Understanding (Unlocks Protoform Synthesis for battle pets)
	1988, -- Elic (Allows you to place gems in Cypher equipment)
	1931, -- Sopranian Understanding (Unlocks Protoform Synthesis for mounts)
	1971, -- Corial (Unlocks access to the last treasure for the "Treasures of Zereth Mortis" achievement)
}

addonTable.CYPHERSOFTHEFIRSTONES = CYPHERSOFTHEFIRSTONES