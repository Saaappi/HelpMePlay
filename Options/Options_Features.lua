local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local featuresOptions = {
	name = L_GLOBALSTRINGS["Tabs.Features"],
	handler = HelpMePlay,
	type = "group",
	args = {
		toggleHeader = {
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
		
		emotes = {
			name = L_GLOBALSTRINGS["Features.Toggle.Emotes"],
			order = 2,
			desc = L_GLOBALSTRINGS["Features.Toggle.EmotesDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.EmotesEnabled end,
			set = function(info, val) HelpMePlayDB.EmotesEnabled = val end,
		},
		flightPaths = {
			name = L_GLOBALSTRINGS["Features.Toggle.FlightPaths"],
			order = 3,
			desc = L_GLOBALSTRINGS["Features.Toggle.FlightPathsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.FlightPathsEnabled end,
			set = function(info, val) HelpMePlayDB.FlightPathsEnabled = val end,
		},
		groups = {
			name = L_GLOBALSTRINGS["Features.Toggle.Groups"],
			order = 4,
			desc = L_GLOBALSTRINGS["Features.Toggle.GroupsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.GroupsEnabled end,
			set = function(info, val) HelpMePlayDB.GroupsEnabled = val end,
		},
		gossip = {
			name = L_GLOBALSTRINGS["Features.Toggle.Gossip"],
			order = 5,
			desc = L_GLOBALSTRINGS["Features.Toggle.GossipDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.GossipEnabled end,
			set = function(info, val) HelpMePlayDB.GossipEnabled = val end,
		},
		notes = {
			name = L_GLOBALSTRINGS["Features.Toggle.Notes"],
			order = 6,
			desc = L_GLOBALSTRINGS["Features.Toggle.NotesDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.NotesEnabled end,
			set = function(info, val) HelpMePlayDB.NotesEnabled = val end,
		},
		queues = {
			name = L_GLOBALSTRINGS["Features.Toggle.Queues"],
			order = 7,
			desc = L_GLOBALSTRINGS["Features.Toggle.QueuesDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.QueuesEnabled end,
			set = function(info, val) HelpMePlayDB.QueuesEnabled = val end,
		},
		readyChecks = {
			name = L_GLOBALSTRINGS["Features.Toggle.ReadyChecks"],
			order = 8,
			desc = L_GLOBALSTRINGS["Features.Toggle.ReadyChecksDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.ReadyChecksEnabled end,
			set = function(info, val) HelpMePlayDB.ReadyChecksEnabled = val end,
		},
		repairs = {
			name = L_GLOBALSTRINGS["Features.Toggle.Repairs"],
			order = 9,
			desc = L_GLOBALSTRINGS["Features.Toggle.RepairsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.RepairsEnabled end,
			set = function(info, val) HelpMePlayDB.RepairsEnabled = val end,
		},
		speech = {
			name = L_GLOBALSTRINGS["Features.Toggle.Speech"],
			order = 10,
			desc = L_GLOBALSTRINGS["Features.Toggle.SpeechDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.SpeechEnabled end,
			set = function(info, val) HelpMePlayDB.SpeechEnabled = val end,
		},
		trainers = {
			name = L_GLOBALSTRINGS["Features.Toggle.Trainers"],
			order = 11,
			desc = L_GLOBALSTRINGS["Features.Toggle.TrainersDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.TrainersEnabled end,
			set = function(info, val) HelpMePlayDB.TrainersEnabled = val end,
		},
		vehicles = {
			name = L_GLOBALSTRINGS["Features.Toggle.Vehicles"],
			order = 12,
			desc = L_GLOBALSTRINGS["Features.Toggle.VehiclesDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.VehiclesEnabled end,
			set = function(info, val) HelpMePlayDB.VehiclesEnabled = val end,
		},
		warMode = {
			name = L_GLOBALSTRINGS["Features.Toggle.WarMode"],
			order = 13,
			desc = L_GLOBALSTRINGS["Features.Toggle.WarModeDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.WarModeEnabled end,
			set = function(info, val) HelpMePlayDB.WarModeEnabled = val end,
		},
		waypoints = {
			name = L_GLOBALSTRINGS["Features.Toggle.Waypoints"],
			order = 14,
			desc = L_GLOBALSTRINGS["Features.Toggle.WaypointsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.WaypointsEnabled end,
			set = function(info, val) HelpMePlayDB.WaypointsEnabled = val end,
		},
		extrasHeader = {
			name = L_GLOBALSTRINGS["Header.Extras"],
			order = 20,
			type = "header",
		},
		talkingHead = {
			name = L_GLOBALSTRINGS["Features.Toggle.Extras.TalkingHead"],
			order = 21,
			desc = L_GLOBALSTRINGS["Features.Toggle.Extras.TalkingHeadDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.TalkingHeadEnabled end,
			set = function(info, val) HelpMePlayDB.TalkingHeadEnabled = val end,
		},
		holidayQueues = {
			name = L_GLOBALSTRINGS["Features.Toggle.Extras.HolidayQueues"],
			order = 22,
			desc = L_GLOBALSTRINGS["Features.Toggle.Extras.HolidayQueuesDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.HolidayQueuesEnabled end,
			set = function(info, val) HelpMePlayDB.HolidayQueuesEnabled = val end,
		},
		personalHealthHeader = {
			name = L_GLOBALSTRINGS["Header.PersonalHealth"],
			order = 30,
			type = "header",
		},
		waterReminder = {
			name = L_GLOBALSTRINGS["Features.Toggle.PersonalHealth.WaterReminder"],
			order = 31,
			desc = L_GLOBALSTRINGS["Features.Toggle.PersonalHealth.WaterReminderDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.WaterReminderEnabled end,
			set = function(info, val) HelpMePlayDB.WaterReminderEnabled = val end,
		},
		waterReminderMinDelay = {
			name = L_GLOBALSTRINGS["Features.Toggle.PersonalHealth.ReminderMinDelay"],
			order = 32,
			type = "range",
			min = 5,
			max = 30,
			step = 1,
			desc = L_GLOBALSTRINGS["Features.Toggle.PersonalHealth.ReminderMinDelayDesc"],
			get = function()
				if not HelpMePlayDB.WaterReminderMinDelay then
					HelpMePlayDB.WaterReminderMinDelay = 10
				end
				return HelpMePlayDB.WaterReminderMinDelay
			end,
			set = function(_, val) HelpMePlayDB.WaterReminderMinDelay = val end,
		},
		waterReminderMaxDelay = {
			name = L_GLOBALSTRINGS["Features.Toggle.PersonalHealth.ReminderMaxDelay"],
			order = 33,
			type = "range",
			min = 5,
			max = 30,
			step = 1,
			desc = L_GLOBALSTRINGS["Features.Toggle.PersonalHealth.ReminderMaxDelayDesc"],
			get = function()
				if not HelpMePlayDB.WaterReminderMaxDelay then
					HelpMePlayDB.WaterReminderMaxDelay = 20
				end
				return HelpMePlayDB.WaterReminderMaxDelay
			end,
			set = function(_, val) HelpMePlayDB.WaterReminderMaxDelay = val end,
		},
	},
}
addonTable.featuresOptions = featuresOptions