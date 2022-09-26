local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local featuresOptions = {
	name = L_GLOBALSTRINGS["Tabs.Features"],
	handler = HelpMePlay,
	type = "group",
	args = {
		toggle_header = {
			name = L_GLOBALSTRINGS["Header.Toggles"],
			order = 0,
			type = "header",
		},
		cinematics = {
			name = L_GLOBALSTRINGS["Features.Toggle.Cinematics"],
			order = 1,
			desc = L_GLOBALSTRINGS["Features.Toggle.CinematicsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.CinematicsEnabled end,
			set = function(info, val) HelpMePlayDB.CinematicsEnabled = val end,
		},
		dialog = {
			name = L_GLOBALSTRINGS["Features.Toggle.Dialog"],
			order = 2,
			desc = L_GLOBALSTRINGS["Features.Toggle.DialogDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.DialogEnabled end,
			set = function(info, val) HelpMePlayDB.DialogEnabled = val end,
		},
		emotes = {
			name = L_GLOBALSTRINGS["Features.Toggle.Emotes"],
			order = 3,
			desc = L_GLOBALSTRINGS["Features.Toggle.EmotesDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.EmotesEnabled end,
			set = function(info, val) HelpMePlayDB.EmotesEnabled = val end,
		},
		queues = {
			name = L_GLOBALSTRINGS["Features.Toggle.Queues"],
			order = 4,
			desc = L_GLOBALSTRINGS["Features.Toggle.QueuesDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.QueuesEnabled end,
			set = function(info, val) HelpMePlayDB.QueuesEnabled = val end,
		},
		speech = {
			name = L_GLOBALSTRINGS["Features.Toggle.Speech"],
			order = 5,
			desc = L_GLOBALSTRINGS["Features.Toggle.SpeechDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.SpeechEnabled end,
			set = function(info, val) HelpMePlayDB.SpeechEnabled = val end,
		},
		repairs = {
			name = L_GLOBALSTRINGS["Features.Toggle.Repairs"],
			order = 6,
			desc = L_GLOBALSTRINGS["Features.Toggle.RepairsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.RepairsEnabled end,
			set = function(info, val) HelpMePlayDB.RepairsEnabled = val end,
		},
		notes = {
			name = L_GLOBALSTRINGS["Features.Toggle.Notes"],
			order = 7,
			desc = L_GLOBALSTRINGS["Features.Toggle.NotesDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.NotesEnabled end,
			set = function(info, val) HelpMePlayDB.NotesEnabled = val end,
		},
		waypoints = {
			name = L_GLOBALSTRINGS["Features.Toggle.Waypoints"],
			order = 8,
			desc = L_GLOBALSTRINGS["Features.Toggle.WaypointsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.WaypointsEnabled end,
			set = function(info, val) HelpMePlayDB.WaypointsEnabled = val end,
		},
		vehicles = {
			name = L_GLOBALSTRINGS["Features.Toggle.Vehicles"],
			order = 9,
			desc = L_GLOBALSTRINGS["Features.Toggle.VehiclesDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.VehiclesEnabled end,
			set = function(info, val) HelpMePlayDB.VehiclesEnabled = val end,
		},
		warmode = {
			name = L_GLOBALSTRINGS["Features.Toggle.WarMode"],
			order = 10,
			desc = L_GLOBALSTRINGS["Features.Toggle.WarModeDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.WarModeEnabled end,
			set = function(info, val) HelpMePlayDB.WarModeEnabled = val end,
		},
	},
}
addonTable.featuresOptions = featuresOptions