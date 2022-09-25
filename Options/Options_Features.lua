local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local featuresOptions = {
	name = L_GLOBALSTRINGS["Tabs.Features"],
	handler = HelpMePlay,
	type = "group",
	args = {
		cinematics = {
			name = L_GLOBALSTRINGS["Features.Toggle.Cinematics"],
			order = 0,
			desc = L_GLOBALSTRINGS["Features.Toggle.CinematicsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.CinematicsEnabled end,
			set = function(info, val) HelpMePlayDB.CinematicsEnabled = val end,
		},
		dialog = {
			name = L_GLOBALSTRINGS["Features.Toggle.Dialog"],
			order = 1,
			desc = L_GLOBALSTRINGS["Features.Toggle.DialogDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.DialogEnabled end,
			set = function(info, val) HelpMePlayDB.DialogEnabled = val end,
		},
		emotes = {
			name = L_GLOBALSTRINGS["Features.Toggle.Emotes"],
			order = 2,
			desc = L_GLOBALSTRINGS["Features.Toggle.EmotesDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.EmotesEnabled end,
			set = function(info, val) HelpMePlayDB.EmotesEnabled = val end,
		},
	},
}
addonTable.featuresOptions = featuresOptions