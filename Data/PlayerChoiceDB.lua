local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local PLAYERCHOICE = {
	["Fatescribe Roh-Tahl"] 								= 174871,			-- Creature ID
	["Drafting Table: Gorgrond"] 							= 81119,			-- Creature ID
	["Shadowlands Covenant Map: Covenant Selection (Max)"] 	= 355352,			-- GameObject ID
	["Shadowlands Covenant Map: Covenant Selection (Low)"] 	= 357514,			-- GameObject ID
	["Warchief's Command Board"] 							= 342, 				-- choiceID
	["Hero's Call Board"] 									= 352, 				-- choiceID
}

addonTable.PLAYERCHOICE = PLAYERCHOICE