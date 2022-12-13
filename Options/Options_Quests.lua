local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function StartsWith(text, prefix)
	return text:find(prefix, 1, true) == 1
end

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
		showQuestCount = {
			name = L_GLOBALSTRINGS["Quests.Toggle.ShowQuestCount"],
			order = 7,
			desc = L_GLOBALSTRINGS["Quests.Toggle.ShowQuestCountDesc"],
			type = "toggle",
			get = function() return HelpMePlayDB.ShowQuestCountEnabled end,
			set = function(_, val) HelpMePlayDB.ShowQuestCountEnabled = val end,
		},
		expansionIntro_header = {
			name = L_GLOBALSTRINGS["Header.ExpansionIntros"],
			order = 10,
			type = "header",
		},
		bfaIntro = {
			name = L_GLOBALSTRINGS["Quests.Toggle.ExpansionIntros.BFA"],
			order = 11,
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
			order = 12,
			desc = L_GLOBALSTRINGS["Quests.Toggle.ExpansionIntros.TheMawDesc"],
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
						[47962] = "|T2065627:0|t " .. (C_Map.GetMapInfo(942)).name, -- Stormsong Valley
						[47960] = "|T2065630:0|t " .. (C_Map.GetMapInfo(895)).name, -- Tiragarde Sound
						[47961] = "|T2065567:0|t " .. (C_Map.GetMapInfo(896)).name, -- Drustvar
					}
				else
					values = {
						[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
						[47512] = "|T2032229:0|t " .. (C_Map.GetMapInfo(863)).name, -- Nazmir
						[47513] = "|T2065632:0|t " .. (C_Map.GetMapInfo(864)).name, -- Vol'dun
						[47514] = "|T2065640:0|t " .. (C_Map.GetMapInfo(862)).name, -- Zuldazar
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
				local faction = UnitFactionGroup("player")
				if not HelpMePlayDB.ZoneId_BFA then
					HelpMePlayDB.ZoneId_BFA = {}
					HelpMePlayDB.ZoneId_BFA["Alliance"] = 0
					HelpMePlayDB.ZoneId_BFA["Horde"] = 0
				end
				return HelpMePlayDB.ZoneId_BFA[faction]
			end,
			set = function(_, zoneId)
				local faction = UnitFactionGroup("player")
				HelpMePlayDB.ZoneId_BFA[faction] = zoneId
			end,
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
				[62275] = "|T3551337:0|t " .. (C_Map.GetMapInfo(1569)).name, -- Bastion
				[62277] = "|T3551336:0|t " .. (C_Map.GetMapInfo(1565)).name, -- Ardenweald
				[62278] = "|T3551338:0|t " .. (C_Map.GetMapInfo(1536)).name, -- Maldraxxus
				[62279] = "|T3551339:0|t " .. (C_Map.GetMapInfo(1525)).name, -- Revendreth
				[64846] = "|T3257863:0|t " .. (C_Map.GetMapInfo(1618)).name, -- Torghast
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
		zoneSelection_Dragonflight = {
			name = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.DF.Title"],
			order = 25,
			desc = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.DF.Desc"],
			type = "select",
			style = "dropdown",
			values = {
				[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
				[72266] = "|T4672500:0|t " .. (C_Map.GetMapInfo(2022)).name, -- The Waking Shores
				[72267] = "|T4672498:0|t " .. (C_Map.GetMapInfo(2023)).name, -- Ohn'ahran Plains
				[72268] = "|T4672495:0|t " .. (C_Map.GetMapInfo(2024)).name, -- The Azure Span
				[72269] = "|T4672499:0|t " .. (C_Map.GetMapInfo(2025)).name, -- Thaldraszus
			},
			sorting = {
				[1] = 0,
				[2] = 72266,
				[3] = 72267,
				[4] = 72268,
				[5] = 72269,
			},
			get = function()
				if not HelpMePlayDB.ZoneID_DF then
					HelpMePlayDB.ZoneID_DF = 0
				end
				return HelpMePlayDB.ZoneID_DF
			end,
			set = function(_, zoneID) HelpMePlayDB.ZoneID_DF = zoneID end,
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
				[1] = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.Option.Custom"],
			},
			sorting = {
				[1] = 0,
				[2] = 1,
			},
			get = function()
				if not HelpMePlayDB.QuestMobIcon then
					HelpMePlayDB.QuestMobIconId = 0
					HelpMePlayDB.QuestMobIcon = "Mobile-QuestIcon"
				end
				return HelpMePlayDB.QuestMobIconId
			end,
			set = function(_, iconId)
				local namePlates = C_NamePlate.GetNamePlates()
				local icon = ""
				
				if iconId == 0 then
					icon = "Mobile-QuestIcon"
				elseif iconId == 1 then
					StaticPopupDialogs["HELPMEPLAY_QUESTMOBSICON_CUSTOM"] = {
						text = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.Option.Custom.Text"],
						button1 = "OK",
						OnShow = function(self, data)
							self.editBox:SetText("")
							self.editBox:HighlightText()
						end,
						OnAccept = function(self)
							if StartsWith(self.editBox:GetText(), "#") then
								icon = string.sub(self.editBox:GetText(), 2)
								for i = 1, #namePlates do
									if namePlates[i][addonName.."Icon"] then
										namePlates[i][addonName.."Icon"]:SetAtlas(icon)
									end
								end
							else
								icon = "Interface\\ICONS\\" .. self.editBox:GetText(); HelpMePlayDB.QuestMobIcon = icon
								for i = 1, #namePlates do
									if namePlates[i][addonName.."Icon"] then
										namePlates[i][addonName.."Icon"]:SetTexture(icon)
									end
								end
							end
						end,
						showAlert = true,
						whileDead = false,
						hideOnEscape = true,
						enterClicksFirstButton = true,
						hasEditBox = true,
						preferredIndex = 3,
					}
					StaticPopup_Show("HELPMEPLAY_QUESTMOBSICON_CUSTOM")
				end
				
				for i = 1, #namePlates do
					if namePlates[i][addonName.."Icon"] then
						if iconId == 0 then
							namePlates[i][addonName.."Icon"]:SetAtlas(icon)
						end
					end
				end
				
				HelpMePlayDB.QuestMobIconId = iconId
				
				if iconId == 0 then
					HelpMePlayDB.QuestMobIcon = icon
				end
			end,
		},
		questMobsIconPosition = {
			name = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.IconPosition"],
			order = 33,
			desc = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.IconPosition.Desc"],
			type = "select",
			style = "dropdown",
			values = {
				[0] = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.IconPosition.Option.Top"],
				[1] = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.IconPosition.Option.Bottom"],
				[2] = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.IconPosition.Option.Left"],
				[3] = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.IconPosition.Option.Right"],
				[4] = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.IconPosition.Option.TopLeft"],
				[5] = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.IconPosition.Option.TopRight"],
				[6] = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.IconPosition.Option.BottomLeft"],
				[7] = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.IconPosition.Option.BottomRight"],
				[8] = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.IconPosition.Option.Center"],
			},
			sorting = {
				[1] = 0,
				[2] = 1,
				[3] = 2,
				[4] = 3,
				[5] = 4,
				[6] = 5,
				[7] = 6,
				[8] = 7,
				[9] = 8,
			},
			get = function()
				if not HelpMePlayDB.QuestMobIconPosition then
					HelpMePlayDB.QuestMobIconPosition = 8
				end
				return HelpMePlayDB.QuestMobIconPosition
			end,
			set = function(_, iconPositionId)
				HelpMePlayDB.QuestMobIconPosition = iconPositionId
			end,
		},
		questMobsIconXOffset = {
			name = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.XOffset"],
			order = 34,
			type = "range",
			min = -50,
			max = 50,
			step = 2,
			desc = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.XOffset.Desc"],
			get = function()
				if not HelpMePlayDB.QuestMobIconXOffset then
					HelpMePlayDB.QuestMobIconXOffset = 0
				end
				return HelpMePlayDB.QuestMobIconXOffset
			end,
			set = function(_, val) HelpMePlayDB.QuestMobIconXOffset = val end,
		},
		questMobsIconYOffset = {
			name = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.YOffset"],
			order = 35,
			type = "range",
			min = -50,
			max = 50,
			step = 2,
			desc = L_GLOBALSTRINGS["Quests.DropDowns.QuestMobs.YOffset.Desc"],
			get = function()
				if not HelpMePlayDB.QuestMobIconYOffset then
					HelpMePlayDB.QuestMobIconYOffset = 0
				end
				return HelpMePlayDB.QuestMobIconYOffset
			end,
			set = function(_, val) HelpMePlayDB.QuestMobIconYOffset = val end,
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