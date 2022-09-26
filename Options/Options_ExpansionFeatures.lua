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
			name = L_GLOBALSTRINGS["Expansion Features.Toggle.ArchitectTable"],
			order = 1,
			desc = L_GLOBALSTRINGS["Expansion Features.Toggle.ArchitectTableDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.ArchitectTableEnabled end,
			set = function(info, val) HelpMePlayDB.ArchitectTableEnabled = val end,
		},
		mission_table = {
			name = L_GLOBALSTRINGS["Expansion Features.Toggle.MissionTable"],
			order = 2,
			desc = L_GLOBALSTRINGS["Expansion Features.Toggle.MissionTableDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.MissionTableEnabled end,
			set = function(info, val) HelpMePlayDB.MissionTableEnabled = val end,
		},
		outposts = {
			name = L_GLOBALSTRINGS["Expansion Features.Toggle.GarrisonOutposts"],
			order = 3,
			desc = L_GLOBALSTRINGS["Expansion Features.Toggle.GarrisonOutpostsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.GarrisonOutpostsEnabled end,
			set = function(info, val) HelpMePlayDB.GarrisonOutpostsEnabled = val end,
		},
		torghast_header = {
			name = L_GLOBALSTRINGS["Header.Torghast"],
			order = 10,
			type = "header",
		},
		box_of_many_things = {
			name = L_GLOBALSTRINGS["Expansion Features.Toggle.BoxOfManyThings"],
			order = 11,
			desc = L_GLOBALSTRINGS["Expansion Features.Toggle.BoxOfManyThingsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.BoxOfManyThingsEnabled end,
			set = function(info, val) HelpMePlayDB.BoxOfManyThingsEnabled = val end,
		},
		torghast_animapower_dropdown = {
			name = L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.Title"],
			order = 12,
			desc = L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.Desc"],
			type = "select",
			style = "dropdown",
			values = {
				[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
				[1] = L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.Notify"],
				[2] = L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.NoEpics"],
				[3] = L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.Auto"],
			},
			sorting = {
				[1] = 0, 	-- Disabled
				[2] = 1, 	-- Notify
				[3] = 2, 	-- No Epics
				[4] = 3, 	-- Automatic
			},
			get = function()
				if not HelpMePlayDB.TorghastPowersId then
					return 0
				else
					return HelpMePlayDB.TorghastPowersId
				end
			end,
			set = function(_, torghastPowersId) HelpMePlayDB.TorghastPowersId = torghastPowersId end,
		},
	},
}
addonTable.expansionFeatures = expansionFeatures