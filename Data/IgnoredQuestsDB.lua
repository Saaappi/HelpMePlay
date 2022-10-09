local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local IGNORED_QUESTS = {
	[39781] 	= true, -- Neltharion's Lair: Death to the Underking
	[40567] 	= true, -- Darkheart Thicket: Enter the Nightmare
	[53437] 	= true, -- The MOTHERLODE!!: Raw Deal
	[58092] 	= true, -- Halls of Atonement: Your Absolution
	[59583] 	= true, -- Welcome to Stormwind
	[62371] 	= true, -- Tirna Scithe: A Warning Silence
}

addonTable.IGNORED_QUESTS = IGNORED_QUESTS