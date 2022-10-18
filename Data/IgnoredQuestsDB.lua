local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local IGNORED_QUESTS = {
	[136683] = { -- Trade Prince Gallywix
		[53437] 	= true, -- The MOTHERLODE!!: Raw Deal
	},
	[154169] = { -- Captain Garrick
		[59583] 	= true, -- Welcome to Stormwind
	},
	[168431] = { -- Warlord Breka Grimaxe
		[60343] 	= true, -- Welcome to Orgrimmar
	},
}

addonTable.IGNORED_QUESTS = IGNORED_QUESTS