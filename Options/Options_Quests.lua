local addonName, addonTable = ...
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
		acceptQuests = {
			name = L_GLOBALSTRINGS["Quests.Toggle.AcceptQuests"],
			order = 1,
			desc = L_GLOBALSTRINGS["Quests.Toggle.AcceptQuestsDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.AcceptQuestsEnabled end,
			set = function(_, val) HelpMePlayDB.AcceptQuestsEnabled = val end,
		},
		adventureMaps = {
			name = L_GLOBALSTRINGS["Quests.Toggle.AdventureMaps"],
			order = 2,
			desc = L_GLOBALSTRINGS["Quests.Toggle.AdventureMapsDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.AdventureMapsEnabled end,
			set = function(_, val) HelpMePlayDB.AdventureMapsEnabled = val end,
		},
		completeQuests = {
			name = L_GLOBALSTRINGS["Quests.Toggle.CompleteQuests"],
			order = 3,
			desc = L_GLOBALSTRINGS["Quests.Toggle.CompleteQuestsDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.CompleteQuestsEnabled end,
			set = function(_, val) HelpMePlayDB.CompleteQuestsEnabled = val end,
		},
		purchaseQuestItems = {
			name = L_GLOBALSTRINGS["Quests.Toggle.PurchaseQuestItems"],
			order = 4,
			desc = L_GLOBALSTRINGS["Quests.Toggle.PurchaseQuestItemsDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.PurchaseQuestItemsEnabled end,
			set = function(_, val) HelpMePlayDB.PurchaseQuestItemsEnabled = val end,
		},
		equipQuestRewards = {
			name = L_GLOBALSTRINGS["Quests.Toggle.AutoEquipQuestRewards"],
			order = 5,
			desc = L_GLOBALSTRINGS["Quests.Toggle.AutoEquipQuestRewardsDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.AutoEquipQuestRewardsEnabled end,
			set = function(_, val) HelpMePlayDB.AutoEquipQuestRewardsEnabled = val end,
		},
		threadsOfFate = {
			name = L_GLOBALSTRINGS["Quests.Toggle.ThreadsOfFate"],
			order = 6,
			desc = L_GLOBALSTRINGS["Quests.Toggle.ThreadsOfFateDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.ThreadsOfFateEnabled end,
			set = function(_, val) HelpMePlayDB.ThreadsOfFateEnabled = val end,
		},
		expansionIntro_header = {
			name = L_GLOBALSTRINGS["Header.ExpansionIntros"],
			order = 10,
			type = "header",
		},
		theMaw = {
			name = L_GLOBALSTRINGS["Quests.Toggle.TheMaw"],
			order = 11,
			desc = L_GLOBALSTRINGS["Quests.Toggle.TheMawDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.TheMawEnabled end,
			set = function(_, val) HelpMePlayDB.TheMawEnabled = val end,
		},
		dropDown_header = {
			name = L_GLOBALSTRINGS["Header.DropDowns"],
			order = 20,
			type = "header",
		},
		zoneSelection_BattleForAzeroth = {
			name = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.Title"],
			order = 21,
			desc = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.Desc"],
			type = "select",
			style = "dropdown",
			values = function()
				if UnitFactionGroup("player") == "Alliance" then
					values = {
						[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
						[47962] = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.STORMSONGVALLEY"],
						[47960] = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.TIRAGARDESOUND"],
						[47961] = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.DRUSTVAR"],
					}
				else
					values = {
						[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
						[47512] = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.NAZMIR"],
						[47513] = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.VOLDUN"],
						[47514] = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.ZULDAZAR"],
					}
				end
				return values
			end,
			sorting = function()
				if UnitFactionGroup("player") == "Alliance" then
					values = {
						[1] = 0,
						[2] = 47961,
						[3] = 47960,
						[4] = 47962,
					}
				else
					values = {
						[1] = 0,
						[2] = 47512,
						[3] = 47513,
						[4] = 47514,
					}
				end
				return values
			end,
			get = function()
				if not HelpMePlayDB.ZoneId_BFA then
					HelpMePlayDB.ZoneId_BFA = 0
				end
				return HelpMePlayDB.ZoneId_BFA
			end,
			set = function(_, zoneId) HelpMePlayDB.ZoneId_BFA = zoneId end,
		},
		chromieTime = {
			name = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.Title"],
			order = 22,
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
				--[11] = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.SL"], (NYI)
				--[12] = L_GLOBALSTRINGS["Quests.DropDowns.ChromieTime.DF"], (NYI)
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
				--[9] = 11, -- SL (NYI)
				--[10] = 12, -- DF (NYI)
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
			order = 23,
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
		zoneSelection_Shadowlands = {
			name = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.Title"],
			order = 24,
			desc = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.Desc"],
			type = "select",
			style = "dropdown",
			values = {
				[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
				[62275] = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.BASTION"],
				[62277] = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.ARDENWEALD"],
				[62278] = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.MALDRAXXUS"],
				[62279] = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.REVENDRETH"],
				[64846] = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.TORGHAST"],
			},
			sorting = {
				[1] = 0,
				[2] = 62277,
				[3] = 62275,
				[4] = 62278,
				[5] = 62279,
				[6] = 64846,
			},
			get = function()
				if not HelpMePlayDB.ZoneId_SL then
					HelpMePlayDB.ZoneId_SL = 0
				end
				return HelpMePlayDB.ZoneId_SL
			end,
			set = function(_, zoneId) HelpMePlayDB.ZoneId_SL = zoneId end,
		},
		questMobsHeader = {
			name = L_GLOBALSTRINGS["Header.QuestMobs"],
			order = 30,
			type = "header",
		},
		questMobs = {
			name = L_GLOBALSTRINGS["Quests.Toggle.QuestMobs.QuestMobs"],
			order = 31,
			desc = L_GLOBALSTRINGS["Quests.Toggle.QuestMobs.QuestMobsDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.QuestMobsEnabled end,
			set = function(_, val)
				if val == false then
					local namePlates = C_NamePlate.GetNamePlates()
					for i = 1, #namePlates do
						if namePlates[i][addonName.."Icon"] then
							namePlates[i][addonName.."Icon"]:Hide()
						end
					end
				end
				HelpMePlayDB.QuestMobsEnabled = val
			end,
		},
		questMobsIcon = {
			name = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.Name"],
			order = 32,
			desc = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.Desc"],
			type = "select",
			style = "dropdown",
			values = {
				[0] = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.Option.Default"],
				[1] = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.Option.Khadgar"],
				[2] = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.Option.Skull"],
			},
			sorting = {
				[1] = 0,
				[2] = 1,
				[3] = 2,
			},
			get = function()
				if not HelpMePlayDB.QuestMobIcon then
					HelpMePlayDB.QuestMobIcon = 0
				end
				return HelpMePlayDB.QuestMobIcon
			end,
			set = function(_, iconId)
				local namePlates = C_NamePlate.GetNamePlates()
				for i = 1, #namePlates do
					if namePlates[i][addonName.."Icon"] then
						if iconId == 0 then
							namePlates[i][addonName.."Icon"]:SetAtlas("Mobile-QuestIcon")
						elseif iconId == 1 then
							namePlates[i][addonName.."Icon"]:SetTexture("Interface\\ICONS\\quest_khadgar")
							PlaySound(66561, "Master") -- VO_703_Archmage_Khadgar_16
						end
					end
				end
				HelpMePlayDB.QuestMobIcon = iconId
			end,
		},
		partyPlayHeader = {
			name = L_GLOBALSTRINGS["Header.PartyPlay"],
			order = 40,
			type = "header",
		},
		partyPlayEnable = {
			name = L_GLOBALSTRINGS["General.Toggle.Enable"],
			order = 41,
			desc = L_GLOBALSTRINGS["Quests.Toggle.PartyPlayDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.PartyPlayEnabled end,
			set = function(_, val) HelpMePlayDB.PartyPlayEnabled = val end,
		},
		partyPlayAnnounce = {
			name = L_GLOBALSTRINGS["Quests.Toggle.PartyPlayAnnounce"],
			order = 42,
			desc = L_GLOBALSTRINGS["Quests.Toggle.PartyPlayAnnounceDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.PartyPlayAnnounceEnabled end,
			set = function(_, val) HelpMePlayDB.PartyPlayAnnounceEnabled = val end,
		},
		partyPlayAutoShare = {
			name = L_GLOBALSTRINGS["Quests.Toggle.PartyPlayAutoShare"],
			order = 43,
			desc = L_GLOBALSTRINGS["Quests.Toggle.PartyPlayAutoShareDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.PartyPlayAutoShareEnabled end,
			set = function(_, val) HelpMePlayDB.PartyPlayAutoShareEnabled = val end,
		},
	},	
}	
addonTable.questOptions = questOptions	