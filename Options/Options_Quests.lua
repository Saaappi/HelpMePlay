local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local questOptions = {
	name = L_GLOBALSTRINGS["Tabs.Quests"],
	handler = HelpMePlay,
	type = "group",
	args = {
	},
}
addonTable.questOptions = questOptions