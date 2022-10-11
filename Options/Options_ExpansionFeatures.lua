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
		architectTable = {
			name = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.ArchitectTable"],
			order = 1,
			desc = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.ArchitectTableDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.ArchitectTableEnabled end,
			set = function(info, val) HelpMePlayDB.ArchitectTableEnabled = val end,
		},
		garrisonOutposts = {
			name = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.GarrisonOutposts"],
			order = 2,
			desc = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.GarrisonOutpostsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.GarrisonOutpostsEnabled end,
			set = function(info, val) HelpMePlayDB.GarrisonOutpostsEnabled = val end,
		},
		missionTable = {
			name = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.MissionTable"],
			order = 3,
			desc = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.MissionTableDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.MissionTableEnabled end,
			set = function(info, val) HelpMePlayDB.MissionTableEnabled = val end,
		},
		visions_header = {
			name = L_GLOBALSTRINGS["Header.VisionsOfNzoth"],
			order = 10,
			type = "header",
		},
		titanResearch = {
			name = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.TitanicResearch"],
			order = 11,
			desc = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.TitanicResearchDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.TitanResearchEnabled end,
			set = function(info, val) HelpMePlayDB.TitanResearchEnabled = val end,
		},
		torghast_header = {
			name = L_GLOBALSTRINGS["Header.Torghast"],
			order = 20,
			type = "header",
		},
		boxOfManyThings = {
			name = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.BoxOfManyThings"],
			order = 21,
			desc = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.BoxOfManyThingsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.BoxOfManyThingsEnabled end,
			set = function(info, val) HelpMePlayDB.BoxOfManyThingsEnabled = val end,
		},
		animaPowers = {
			name = L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.Title"],
			order = 22,
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
					HelpMePlayDB.TorghastPowersId = 0
				end
				return HelpMePlayDB.TorghastPowersId
			end,
			set = function(_, torghastPowersId) HelpMePlayDB.TorghastPowersId = torghastPowersId end,
		},
	},
}
addonTable.expansionFeatures = expansionFeatures