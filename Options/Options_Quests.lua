local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local questOptions = {
	name = L_GLOBALSTRINGS["Tabs.Quests"],
	handler = HelpMePlay,
	type = "group",
	args = {
		toggle_header = {
			name = L_GLOBALSTRINGS["Header.Toggles"],
			order = 0,
			type = "header",
		},
		accept_quests = {
			name = L_GLOBALSTRINGS["Quests.Toggle.AcceptQuests"],
			order = 1,
			desc = L_GLOBALSTRINGS["Quests.Toggle.AcceptQuestsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.AcceptQuestsEnabled end,
			set = function(info, val) HelpMePlayDB.AcceptQuestsEnabled = val end,
		},
		complete_quests = {
			name = L_GLOBALSTRINGS["Quests.Toggle.CompleteQuests"],
			order = 2,
			desc = L_GLOBALSTRINGS["Quests.Toggle.CompleteQuestsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.CompleteQuestsEnabled end,
			set = function(info, val) HelpMePlayDB.CompleteQuestsEnabled = val end,
		},
		purchase_quest_items = {
			name = L_GLOBALSTRINGS["Quests.Toggle.PurchaseQuestItems"],
			order = 3,
			desc = L_GLOBALSTRINGS["Quests.Toggle.PurchaseQuestItemsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.PurchaseQuestItemsEnabled end,
			set = function(info, val) HelpMePlayDB.PurchaseQuestItemsEnabled = val end,
		},
	},
}
addonTable.questOptions = questOptions