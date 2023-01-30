local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local soundsOptions = {
	name = L_GLOBALSTRINGS["Tabs.Sounds"],
	handler = HelpMePlay,
	type = "group",
	args = {
		enable = {
			name = L_GLOBALSTRINGS["General.Toggle.Enable"],
			order = 1,
			desc = L_GLOBALSTRINGS["Sounds.Toggle.Desc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.SoundsEnabled end,
			set = function(_, val) HelpMePlayDB.SoundsEnabled = val end,
		},
		soundsHeader = {
			name = L_GLOBALSTRINGS["Header.Sounds"],
			order = 2,
			type = "header",
		},
		soundInput = {
			name = L_GLOBALSTRINGS["Sounds.Input.Title"],
			order = 3,
			desc = L_GLOBALSTRINGS["Sounds.Input.Desc"],
			type = "input",
			get = function(_) return HelpMePlayDB.Sounds end,
			set = function(_, val)
				val = tonumber(val)
				if HelpMePlayDB.Sounds[val] then
					HelpMePlayDB.Sounds[val] = nil
				else
					HelpMePlayDB.Sounds[val] = true
				end
			end,
			validate = function(self, val)
				if tonumber(val) then
					return true
				end
				return L_GLOBALSTRINGS["Text.Output.NumericValue"]
			end,
		},
	},
}
addonTable.soundsOptions = soundsOptions