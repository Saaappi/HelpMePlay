local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local main = {
	name = addonName,
	handler = HelpMePlay,
	type = "group",
	args = {
		versionText = {
			type = "description",
			order = 0,
			name = L_GLOBALSTRINGS["MainOptions.Version"],
		},
		authorText = {
			type = "description",
			order = 1,
			name = L_GLOBALSTRINGS["MainOptions.Author"],
		},
		contactText = {
			type = "description",
			order = 2,
			name = L_GLOBALSTRINGS["MainOptions.Contact"],
		},
	},
}
addonTable.main = main