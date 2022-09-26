local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local questOptions = {
	name = L_GLOBALSTRINGS["Tabs.Quests"],
	handler = HelpMePlay,
	type = "group",
	args = {
		purchase_quest_items = {
			name = L_GLOBALSTRINGS["Quests.Toggle.PurchaseQuestItems"],
			order = 1,
			desc = L_GLOBALSTRINGS["Quests.Toggle.PurchaseQuestItemsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.PurchaseQuestItemsEnabled end,
			set = function(info, val) HelpMePlayDB.PurchaseQuestItemsEnabled = val end,
		},
	},
}
addonTable.questOptions = questOptions