local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local numTabs = 4
local icon = ""

local junkerOptions = {
	name = L_GLOBALSTRINGS["Tabs.Junker"],
	handler = HelpMePlay,
	type = "group",
	args = {
		enable = {
			name = L_GLOBALSTRINGS["General.Toggle.Enable"],
			order = 0,
			desc = L_GLOBALSTRINGS["Junker.Toggle.EnableDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.JunkerEnabled end,
			set = function(_, val)
				HelpMePlayDB.JunkerEnabled = val
				if val then
					HelpMePlay:ShowJunkerButton()
				else
					HelpMePlay:HideJunkerButton()
				end
			end,
		},
		safe_mode = {
			name = L_GLOBALSTRINGS["Junker.Toggle.SafeMode"],
			order = 1,
			desc = L_GLOBALSTRINGS["Junker.Toggle.SafeModeDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.JunkerSafeModeEnabled end,
			set = function(_, val) HelpMePlayDB.JunkerSafeModeEnabled = val end,
		},
		toggle_header = {
			name = L_GLOBALSTRINGS["Header.Toggles"],
			order = 2,
			type = "header",
		},
	},
}
addonTable.junkerOptions = junkerOptions