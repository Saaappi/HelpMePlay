local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local expansionFeatures = {
	name = L_GLOBALSTRINGS["Tabs.ExpansionFeatures"],
	handler = HelpMePlay,
	type = "group",
	args = {
		garrison_header = {
			name = L_GLOBALSTRINGS["Header.Garrisons"],
			order = 0,
			type = "header",
		},
		architect_table = {
			name = L_GLOBALSTRINGS["Quests.Toggle.ArchitectTable"],
			order = 1,
			desc = L_GLOBALSTRINGS["Quests.Toggle.ArchitectTableDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.ArchitectTableEnabled end,
			set = function(info, val) HelpMePlayDB.ArchitectTableEnabled = val end,
		},
		mission_table = {
			name = L_GLOBALSTRINGS["Quests.Toggle.MissionTable"],
			order = 2,
			desc = L_GLOBALSTRINGS["Quests.Toggle.MissionTableDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.MissionTableEnabled end,
			set = function(info, val) HelpMePlayDB.MissionTableEnabled = val end,
		},
		outposts = {
			name = L_GLOBALSTRINGS["Quests.Toggle.GarrisonOutposts"],
			order = 3,
			desc = L_GLOBALSTRINGS["Quests.Toggle.GarrisonOutpostsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.GarrisonOutpostsEnabled end,
			set = function(info, val) HelpMePlayDB.GarrisonOutpostsEnabled = val end,
		},
		torghast_header = {
			name = L_GLOBALSTRINGS["Header.Torghast"],
			order = 10,
			type = "header",
		},
	},
}
addonTable.expansionFeatures = expansionFeatures