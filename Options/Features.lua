local addonName, addonTable = ...
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
			get = function(_) return HelpMePlayDB.CinematicsEnabled end,
			set = function(_, val) HelpMePlayDB.CinematicsEnabled = val end,
		},
		
		emotes = {
			name = L_GLOBALSTRINGS["Features.Toggle.Emotes"],
			order = 2,
			desc = L_GLOBALSTRINGS["Features.Toggle.EmotesDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.EmotesEnabled end,
			set = function(_, val) HelpMePlayDB.EmotesEnabled = val end,
		},
		equipLoot = {
			name = L_GLOBALSTRINGS["Features.Toggle.EquipLoot"],
			order = 3,
			desc = L_GLOBALSTRINGS["Features.Toggle.EquipLootDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.EquipLootEnabled end,
			set = function(_, val) HelpMePlayDB.EquipLootEnabled = val end,
		},
		flightPaths = {
			name = L_GLOBALSTRINGS["Features.Toggle.FlightPaths"],
			order = 4,
			desc = L_GLOBALSTRINGS["Features.Toggle.FlightPathsDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.FlightPathsEnabled end,
			set = function(_, val) HelpMePlayDB.FlightPathsEnabled = val end,
		},
		groups = {
			name = L_GLOBALSTRINGS["Features.Toggle.Groups"],
			order = 5,
			desc = L_GLOBALSTRINGS["Features.Toggle.GroupsDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.GroupsEnabled end,
			set = function(_, val) HelpMePlayDB.GroupsEnabled = val end,
		},
		gossip = {
			name = L_GLOBALSTRINGS["Features.Toggle.Gossip"],
			order = 6,
			desc = L_GLOBALSTRINGS["Features.Toggle.GossipDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.GossipEnabled end,
			set = function(_, val) HelpMePlayDB.GossipEnabled = val end,
		},
		notes = {
			name = L_GLOBALSTRINGS["Features.Toggle.Notes"],
			order = 7,
			desc = L_GLOBALSTRINGS["Features.Toggle.NotesDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.NotesEnabled end,
			set = function(_, val) HelpMePlayDB.NotesEnabled = val end,
		},
		queues = {
			name = L_GLOBALSTRINGS["Features.Toggle.Queues"],
			order = 8,
			desc = L_GLOBALSTRINGS["Features.Toggle.QueuesDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.QueuesEnabled end,
			set = function(_, val) HelpMePlayDB.QueuesEnabled = val end,
		},
		readyChecks = {
			name = L_GLOBALSTRINGS["Features.Toggle.ReadyChecks"],
			order = 9,
			desc = L_GLOBALSTRINGS["Features.Toggle.ReadyChecksDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.ReadyChecksEnabled end,
			set = function(_, val) HelpMePlayDB.ReadyChecksEnabled = val end,
		},
		repairs = {
			name = L_GLOBALSTRINGS["Features.Toggle.Repairs"],
			order = 10,
			desc = L_GLOBALSTRINGS["Features.Toggle.RepairsDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.RepairsEnabled end,
			set = function(_, val) HelpMePlayDB.RepairsEnabled = val end,
		},
		speech = {
			name = L_GLOBALSTRINGS["Features.Toggle.Speech"],
			order = 11,
			desc = L_GLOBALSTRINGS["Features.Toggle.SpeechDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.SpeechEnabled end,
			set = function(_, val) HelpMePlayDB.SpeechEnabled = val end,
		},
		trainers = {
			name = L_GLOBALSTRINGS["Features.Toggle.Trainers"],
			order = 12,
			desc = L_GLOBALSTRINGS["Features.Toggle.TrainersDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.TrainersEnabled end,
			set = function(_, val) HelpMePlayDB.TrainersEnabled = val end,
		},
		vehicles = {
			name = L_GLOBALSTRINGS["Features.Toggle.Vehicles"],
			order = 13,
			desc = L_GLOBALSTRINGS["Features.Toggle.VehiclesDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.VehiclesEnabled end,
			set = function(_, val) HelpMePlayDB.VehiclesEnabled = val end,
		},
		warMode = {
			name = L_GLOBALSTRINGS["Features.Toggle.WarMode"],
			order = 14,
			desc = L_GLOBALSTRINGS["Features.Toggle.WarModeDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.WarModeEnabled end,
			set = function(_, val) HelpMePlayDB.WarModeEnabled = val end,
		},
		waypoints = {
			name = L_GLOBALSTRINGS["Features.Toggle.Waypoints"],
			order = 15,
			desc = L_GLOBALSTRINGS["Features.Toggle.WaypointsDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.WaypointsEnabled end,
			set = function(_, val) HelpMePlayDB.WaypointsEnabled = val end,
		},
		equipLootAdvancedHeader = {
			name = L_GLOBALSTRINGS["Header.EquipLootAdvanced"],
			order = 20,
			type = "header",
			hidden = function()
				if HelpMePlayDB.EquipLootEnabled then
					return false
				end
				return true
			end,
		},
		ignoreBind = {
			name = L_GLOBALSTRINGS["Features.Toggle.EquipLoot.Advanced.IgnoreBind"],
			order = 21,
			desc = L_GLOBALSTRINGS["Features.Toggle.EquipLoot.Advanced.IgnoreBindDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.EquipLootIgnoreBindEnabled end,
			set = function(_, val) HelpMePlayDB.EquipLootIgnoreBindEnabled = val end,
			hidden = function()
				if HelpMePlayDB.EquipLootEnabled then
					return false
				end
				HelpMePlayDB.EquipLootIgnoreBindEnabled = false
				return true
			end,
		},
	},
}
addonTable.featuresOptions = featuresOptions