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
		notes = {
			name = L_GLOBALSTRINGS["Features.Toggle.Notes"],
			order = 4,
			desc = L_GLOBALSTRINGS["Features.Toggle.NotesDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.NotesEnabled end,
			set = function(info, val) HelpMePlayDB.NotesEnabled = val end,
		},
		queues = {
			name = L_GLOBALSTRINGS["Features.Toggle.Queues"],
			order = 5,
			desc = L_GLOBALSTRINGS["Features.Toggle.QueuesDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.QueuesEnabled end,
			set = function(info, val) HelpMePlayDB.QueuesEnabled = val end,
		},
		readyChecks = {
			name = L_GLOBALSTRINGS["Features.Toggle.ReadyChecks"],
			order = 6,
			desc = L_GLOBALSTRINGS["Features.Toggle.ReadyChecksDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.ReadyChecksEnabled end,
			set = function(info, val) HelpMePlayDB.ReadyChecksEnabled = val end,
		},
		repairs = {
			name = L_GLOBALSTRINGS["Features.Toggle.Repairs"],
			order = 7,
			desc = L_GLOBALSTRINGS["Features.Toggle.RepairsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.RepairsEnabled end,
			set = function(info, val) HelpMePlayDB.RepairsEnabled = val end,
		},
		speech = {
			name = L_GLOBALSTRINGS["Features.Toggle.Speech"],
			order = 9,
			desc = L_GLOBALSTRINGS["Features.Toggle.SpeechDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.SpeechEnabled end,
			set = function(info, val) HelpMePlayDB.SpeechEnabled = val end,
		},
		trainers = {
			name = L_GLOBALSTRINGS["Features.Toggle.Trainers"],
			order = 9,
			desc = L_GLOBALSTRINGS["Features.Toggle.TrainersDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.TrainersEnabled end,
			set = function(info, val) HelpMePlayDB.TrainersEnabled = val end,
		},
		vehicles = {
			name = L_GLOBALSTRINGS["Features.Toggle.Vehicles"],
			order = 10,
			desc = L_GLOBALSTRINGS["Features.Toggle.VehiclesDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.VehiclesEnabled end,
			set = function(info, val) HelpMePlayDB.VehiclesEnabled = val end,
		},
		warMode = {
			name = L_GLOBALSTRINGS["Features.Toggle.WarMode"],
			order = 11,
			desc = L_GLOBALSTRINGS["Features.Toggle.WarModeDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.WarModeEnabled end,
			set = function(info, val) HelpMePlayDB.WarModeEnabled = val end,
		},
		waypoints = {
			name = L_GLOBALSTRINGS["Features.Toggle.Waypoints"],
			order = 12,
			desc = L_GLOBALSTRINGS["Features.Toggle.WaypointsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.WaypointsEnabled end,
			set = function(info, val) HelpMePlayDB.WaypointsEnabled = val end,
		},
		dropdown_header = {
			name = L_GLOBALSTRINGS["Header.DropDowns"],
			order = 20,
			type = "header",
		},
		covenant_dropdown = {
			name = L_GLOBALSTRINGS["DropDowns.Features.Covenant.Title"],
			order = 21,
			desc = L_GLOBALSTRINGS["DropDowns.Features.Covenant.Desc"],
			type = "select",
			style = "dropdown",
			values = {
				[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
				[1] = L_GLOBALSTRINGS["DropDowns.Features.Covenant.Kyrian"],
				[2] = L_GLOBALSTRINGS["DropDowns.Features.Covenant.Venthyr"],
				[3] = L_GLOBALSTRINGS["DropDowns.Features.Covenant.Necrolord"],
				[4] = L_GLOBALSTRINGS["DropDowns.Features.Covenant.NightFae"],
				[5] = L_GLOBALSTRINGS["DropDowns.Features.Covenant.Auto"],
			},
			sorting = {
				[1] = 0, 	-- Disabled
				[2] = 5, 	-- Auto
				[3] = 1, 	-- Kyrian
				[4] = 3, 	-- Necrolord
				[5] = 4, 	-- Night Fae
				[6] = 2, 	-- Venthyr
			},
			get = function()
				if not HelpMePlayDB.CovenantId then
					HelpMePlayDB.CovenantId = 0
				end
				return HelpMePlayDB.CovenantId
			end,
			set = function(_, covenantId) HelpMePlayDB.CovenantId = covenantId end,
		},
	},
}
addonTable.featuresOptions = featuresOptions