local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local GARRISON_MISSIONS = {
	[2] 	= "Gronnlings Abound",
	[66]	= "Killing the Corrupted",
}

addonTable.GARRISON_MISSIONS = GARRISON_MISSIONS