local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local IGNORED_QUESTS = {
	[53437] = true, -- The MOTHERLODE!!: Raw Deal
	[59583] = true, -- Welcome to Stormwind
	[60343] = true, -- Welcome to Orgrimmar
}

addonTable.IGNORED_QUESTS = IGNORED_QUESTS