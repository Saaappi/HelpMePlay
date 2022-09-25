local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local garrisonOptions = {
	name = L_GLOBALSTRINGS["Tabs.Garrisons"],
	handler = HelpMePlay,
	type = "group",
	args = {
	},
}
addonTable.garrisonOptions = garrisonOptions