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
		threads_of_fate = {
			name = L_GLOBALSTRINGS["Quests.Toggle.ThreadsOfFate"],
			order = 4,
			desc = L_GLOBALSTRINGS["Quests.Toggle.ThreadsOfFateDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.ThreadsOfFateEnabled end,
			set = function(info, val) HelpMePlayDB.ThreadsOfFateEnabled = val end,
		},
		adventure_maps = {
			name = L_GLOBALSTRINGS["Quests.Toggle.AdventureMaps"],
			order = 5,
			desc = L_GLOBALSTRINGS["Quests.Toggle.AdventureMapsDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.AdventureMapsEnabled end,
			set = function(info, val) HelpMePlayDB.AdventureMapsEnabled = val end,
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
				[1] = 99, 	-- Disabled
				[2] = 6, 	-- BC
				[3] = 7, 	-- WOTLK
				[4] = 5, 	-- CATA (Classic)
				[5] = 8, 	-- MOP
				[6] = 9, 	-- WOD
				[7] = 10, 	-- Legion
				[8] = 0, 	-- BFA
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
		party_play_header = {
			name = L_GLOBALSTRINGS["Header.PartyPlay"],
			order = 20,
			type = "header",
		},
		party_play_enable = {
			name = L_GLOBALSTRINGS["General.Toggle.Enable"],
			order = 21,
			desc = L_GLOBALSTRINGS["Quests.Toggle.PartyPlayDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.PartyPlayEnabled end,
			set = function(info, val) HelpMePlayDB.PartyPlayEnabled = val end,
		},
		party_play_announce = {
			name = L_GLOBALSTRINGS["Quests.Toggle.PartyPlayAnnounce"],
			order = 22,
			desc = L_GLOBALSTRINGS["Quests.Toggle.PartyPlayAnnounceDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.PartyPlayAnnounceEnabled end,
			set = function(info, val) HelpMePlayDB.PartyPlayAnnounceEnabled = val end,
		},
		party_play_auto_share = {
			name = L_GLOBALSTRINGS["Quests.Toggle.PartyPlayAutoShare"],
			order = 23,
			desc = L_GLOBALSTRINGS["Quests.Toggle.PartyPlayAutoShareDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.PartyPlayAutoShareEnabled end,
			set = function(info, val) HelpMePlayDB.PartyPlayAutoShareEnabled = val end,
		},
	},	
}	
addonTable.questOptions = questOptions	