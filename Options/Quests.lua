local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local questOptions = {
	name = L_GLOBALSTRINGS["Tabs.Quests"],
	handler = HelpMePlay,
	type = "group",
	args = {
		chromieTimeIndicatorText = {
			name = function()
				local chromieTimeID = UnitChromieTimeID("player")
				local chromieTimeString = ""
				if chromieTimeID == 0 then
					chromieTimeString = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.Present"]
				elseif chromieTimeID == 5 then
					chromieTimeString = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.CATA"]
				elseif chromieTimeID == 6 then
					chromieTimeString = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.BC"]
				elseif chromieTimeID == 7 then
					chromieTimeString = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.WOTLK"]
				elseif chromieTimeID == 8 then
					chromieTimeString = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.MOP"]
				elseif chromieTimeID == 9 then
					chromieTimeString = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.WOD"]
				elseif chromieTimeID == 10 then
					chromieTimeString = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.LEGION"]
				elseif chromieTimeID == 14 then
					chromieTimeString = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.SL"]
				end
				
				return L_GLOBALSTRINGS["Quests.Descriptions.ChromieTimeIndicator"] .. chromieTimeString
			end,
			order = 0,
			type = "description",
			fontSize = "medium",
			hidden = function()
				local playerLevel = UnitLevel("player")
				if playerLevel < addonTable.CONSTANTS["CHROMIE_TIME_MAX_LEVEL"] then
					return false
				end
				return true
			end,
		},
		dropdownHeader = {
			name = L_GLOBALSTRINGS["Header.DropDowns"],
			order = 1,
			type = "header",
		},
		chromieTime = {
			name = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.Title"],
			order = 2,
			desc = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.Desc"],
			type = "select",
			style = "dropdown",
			values = {
				[99] = L_GLOBALSTRINGS["DropDowns.Disabled"],
				[6] = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.BC"],
				[7] = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.WOTLK"],
				[5] = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.CATA"],
				[8] = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.MOP"],
				[9] = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.WOD"],
				[10] = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.LEGION"],
				[0] = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.BFA"],
				[14] = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.SL"],
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
				[9] = 14, 	-- SL
			},
			get = function()
				if not HelpMePlayDB.ChromieTimeId then
					HelpMePlayDB.ChromieTimeId = 0
				end
				return HelpMePlayDB.ChromieTimeId
			end,
			set = function(_, chromieTimeId) HelpMePlayDB.ChromieTimeId = chromieTimeId end,
		},
		questRewards = {
			name = L_GLOBALSTRINGS["Quests.DropDowns.QuestRewards.Title"],
			order = 3,
			desc = L_GLOBALSTRINGS["Quests.DropDowns.QuestRewards.Desc"],
			type = "select",
			style = "dropdown",
			values = {
				[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
				[1] = L_GLOBALSTRINGS["Quests.DropDowns.QuestRewards.ItemLevel"],
				[2] = L_GLOBALSTRINGS["Quests.DropDowns.QuestRewards.SellPrice"],
			},
			sorting = { -- Sort the options chronologically by expansion.
				[1] = 0, 	-- Disabled
				[2] = 1, 	-- Item Level
				[3] = 2, 	-- Sell Price
			},
			get = function()
				if not HelpMePlayDB.QuestRewardId then
					HelpMePlayDB.QuestRewardId = 0
				end
				return HelpMePlayDB.QuestRewardId
			end,
			set = function(_, questRewardId) HelpMePlayDB.QuestRewardId = questRewardId end,
		},
		toggleHeader = {
			name = L_GLOBALSTRINGS["Header.Toggles"],
			order = 10,
			type = "header",
		},
		acceptQuests = {
			name = L_GLOBALSTRINGS["Quests.Toggle.AcceptQuests"],
			order = 11,
			desc = L_GLOBALSTRINGS["Quests.Toggle.AcceptQuestsDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.AcceptQuestsEnabled end,
			set = function(_, val) HelpMePlayDB.AcceptQuestsEnabled = val end,
		},
		adventureMaps = {
			name = L_GLOBALSTRINGS["Quests.Toggle.AdventureMaps"],
			order = 12,
			desc = L_GLOBALSTRINGS["Quests.Toggle.AdventureMapsDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.AdventureMapsEnabled end,
			set = function(_, val) HelpMePlayDB.AdventureMapsEnabled = val end,
		},
		completeQuests = {
			name = L_GLOBALSTRINGS["Quests.Toggle.CompleteQuests"],
			order = 13,
			desc = L_GLOBALSTRINGS["Quests.Toggle.CompleteQuestsDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.CompleteQuestsEnabled end,
			set = function(_, val) HelpMePlayDB.CompleteQuestsEnabled = val end,
		},
		purchaseQuestItems = {
			name = L_GLOBALSTRINGS["Quests.Toggle.PurchaseQuestItems"],
			order = 14,
			desc = L_GLOBALSTRINGS["Quests.Toggle.PurchaseQuestItemsDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.PurchaseQuestItemsEnabled end,
			set = function(_, val) HelpMePlayDB.PurchaseQuestItemsEnabled = val end,
		},
		equipQuestRewards = {
			name = L_GLOBALSTRINGS["Quests.Toggle.AutoEquipQuestRewards"],
			order = 15,
			desc = L_GLOBALSTRINGS["Quests.Toggle.AutoEquipQuestRewardsDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.AutoEquipQuestRewardsEnabled end,
			set = function(_, val) HelpMePlayDB.AutoEquipQuestRewardsEnabled = val end,
		},
		threadsOfFate = {
			name = L_GLOBALSTRINGS["Quests.Toggle.ThreadsOfFate"],
			order = 16,
			desc = L_GLOBALSTRINGS["Quests.Toggle.ThreadsOfFateDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.ThreadsOfFateEnabled end,
			set = function(_, val) HelpMePlayDB.ThreadsOfFateEnabled = val end,
		},
		showQuestCount = {
			name = L_GLOBALSTRINGS["Quests.Toggle.ShowQuestCount"],
			order = 17,
			desc = L_GLOBALSTRINGS["Quests.Toggle.ShowQuestCountDesc"],
			type = "toggle",
			disabled = function()
				local isAddOnLoaded = false
				if IsAddOnLoaded("!KalielsTracker") then
					isAddOnLoaded = true
				end
				return isAddOnLoaded
			end,
			get = function() return HelpMePlayDB.ShowQuestCountEnabled end,
			set = function(_, val) HelpMePlayDB.ShowQuestCountEnabled = val end,
		},
		expansionIntrosHeader = {
			name = L_GLOBALSTRINGS["Header.ExpansionIntros"],
			order = 20,
			type = "header",
		},
		bfaIntro = {
			name = L_GLOBALSTRINGS["Quests.Toggle.ExpansionIntros.BFA"],
			order = 21,
			desc = L_GLOBALSTRINGS["Quests.Toggle.ExpansionIntros.BFADesc"],
			type = "toggle",
			get = function()
				local faction = UnitFactionGroup("player")
				if not HelpMePlayDB.BFAIntroEnabled then
					HelpMePlayDB.BFAIntroEnabled = {}
					HelpMePlayDB.BFAIntroEnabled["Alliance"] = false
					HelpMePlayDB.BFAIntroEnabled["Horde"] = false
				end
				return HelpMePlayDB.BFAIntroEnabled[faction]
			end,
			set = function(_, val)
				local faction = UnitFactionGroup("player")
				HelpMePlayDB.BFAIntroEnabled[faction] = val
			end,
		},
		slIntro = {
			name = L_GLOBALSTRINGS["Quests.Toggle.ExpansionIntros.TheMaw"],
			order = 22,
			desc = L_GLOBALSTRINGS["Quests.Toggle.ExpansionIntros.TheMawDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.TheMawEnabled end,
			set = function(_, val) HelpMePlayDB.TheMawEnabled = val end,
		},
	},	
}	
addonTable.questOptions = questOptions	