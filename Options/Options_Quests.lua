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
		dropdown_header = {
			name = L_GLOBALSTRINGS["Header.DropDowns"],
			order = 10,
			type = "header",
		},
		chromietime_dropdown = {
			name = L_GLOBALSTRINGS["DropDowns.ChromieTime.Title"],
			order = 11,
			desc = L_GLOBALSTRINGS["DropDowns.ChromieTime.Desc"],
			type = "select",
			style = "dropdown",
			values = {
				[99] = L_GLOBALSTRINGS["DropDowns.Disabled"],
				[6] = L_GLOBALSTRINGS["DropDowns.ChromieTime.BC"],
				[7] = L_GLOBALSTRINGS["DropDowns.ChromieTime.WOTLK"],
				[5] = L_GLOBALSTRINGS["DropDowns.ChromieTime.CATA"],
				[8] = L_GLOBALSTRINGS["DropDowns.ChromieTime.MOP"],
				[9] = L_GLOBALSTRINGS["DropDowns.ChromieTime.WOD"],
				[10] = L_GLOBALSTRINGS["DropDowns.ChromieTime.LEGION"],
				[0] = L_GLOBALSTRINGS["DropDowns.ChromieTime.BFA"],
			},
			sorting = { -- Sort the options chronologically by expansion.
				[1] = 99,
				[2] = 6,
				[3] = 7,
				[4] = 5,
				[5] = 8,
				[6] = 9,
				[7] = 10,
				[8] = 0,
			},
			get = function()
				if not HelpMePlayDB.ChromieTimeId then
					return 0
				else
					return HelpMePlayDB.ChromieTimeId
				end
			end,
			set = function(_, chromieTimeId) HelpMePlayDB.ChromieTimeId = chromieTimeId end,
		},	
	},	
}	
addonTable.questOptions = questOptions	