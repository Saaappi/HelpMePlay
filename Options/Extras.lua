local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local extrasOptions = {
	name = L_GLOBALSTRINGS["Tabs.Extras"],
	handler = HelpMePlay,
	type = "group",
	args = {
		toggleHeader = {
			name = L_GLOBALSTRINGS["Header.Toggles"],
			order = 0,
			type = "header",
		},
		talkingHead = {
			name = L_GLOBALSTRINGS["Features.Toggle.Extras.TalkingHead"],
			order = 1,
			desc = L_GLOBALSTRINGS["Features.Toggle.Extras.TalkingHeadDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.TalkingHeadEnabled end,
			set = function(_, val) HelpMePlayDB.TalkingHeadEnabled = val end,
		},
		waveAtPlayers = {
			name = L_GLOBALSTRINGS["Features.Toggle.Extras.WaveAtPlayers"],
			order = 2,
			desc = L_GLOBALSTRINGS["Features.Toggle.Extras.WaveAtPlayersDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.WaveAtPlayersEnabled end,
			set = function(_, val) HelpMePlayDB.WaveAtPlayersEnabled = val end,
		},
		questMobsHeader = {
			name = L_GLOBALSTRINGS["Header.QuestMobs"],
			order = 10,
			type = "header",
		},
		questMobs = {
			name = L_GLOBALSTRINGS["Quests.Toggle.QuestMobs.QuestMobs"],
			order = 11,
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
			order = 12,
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
						button1 = L_GLOBALSTRINGS["OK"],
						OnShow = function(self, data)
							self.editBox:SetText("")
							self.editBox:HighlightText()
						end,
						OnAccept = function(self)
							if addonTable.StartsWith(self.editBox:GetText(), "#") then
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
			order = 13,
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
			order = 14,
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
			order = 15,
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
		personalHealthHeader = {
			name = L_GLOBALSTRINGS["Header.PersonalHealth"],
			order = 20,
			type = "header",
		},
		waterReminder = {
			name = L_GLOBALSTRINGS["Features.Toggle.PersonalHealth.WaterReminder"],
			order = 21,
			desc = L_GLOBALSTRINGS["Features.Toggle.PersonalHealth.WaterReminderDesc"],
			type = "toggle",
			get = function(_) return HelpMePlayDB.WaterReminderEnabled end,
			set = function(_, val) HelpMePlayDB.WaterReminderEnabled = val end,
		},
		waterReminderMinDelay = {
			name = L_GLOBALSTRINGS["Features.Toggle.PersonalHealth.ReminderMinDelay"],
			order = 22,
			type = "range",
			min = 5,
			max = 30,
			step = 1,
			desc = L_GLOBALSTRINGS["Features.Toggle.PersonalHealth.ReminderMinDelayDesc"],
			get = function()
				if not HelpMePlayDB.WaterReminderMinDelay then
					HelpMePlayDB.WaterReminderMinDelay = 10
				end
				return HelpMePlayDB.WaterReminderMinDelay
			end,
			set = function(_, val) HelpMePlayDB.WaterReminderMinDelay = val end,
		},
		waterReminderMaxDelay = {
			name = L_GLOBALSTRINGS["Features.Toggle.PersonalHealth.ReminderMaxDelay"],
			order = 23,
			type = "range",
			min = 5,
			max = 30,
			step = 1,
			desc = L_GLOBALSTRINGS["Features.Toggle.PersonalHealth.ReminderMaxDelayDesc"],
			get = function()
				if not HelpMePlayDB.WaterReminderMaxDelay then
					HelpMePlayDB.WaterReminderMaxDelay = 20
				end
				return HelpMePlayDB.WaterReminderMaxDelay
			end,
			set = function(_, val) HelpMePlayDB.WaterReminderMaxDelay = val end,
		},
		partyInvitationsHeader = {
			name = "Party Invitations",
			order = 30,
			type = "header",
		},
		partyMembers = {
			name = "Party Members",
			order = 31,
			type = "input",
			multiline = true,
			desc = "Set a list of players to invite when using the |cffFFD100inv|r command.\n\nThis is best used by players to quickly form premade parties for dungeons or other content.\n\n|cffFFD100Format:|r\nPlayerName-RealmName\n\nEach entry should be on a separate line.",
			get = function(_)
				local members = ""
				for _, member in ipairs(HelpMePlayDB.PartyMembers) do
					members = members .. member .. "\n"
				end
				return members
			end,
			set = function(_, val)
				HelpMePlayDB.PartyMembers = {}
				for member in val:gmatch("([^\n]*)\n?") do
					table.insert(HelpMePlayDB.PartyMembers, member)
				end
			end,
		},
	},
}
addonTable.extrasOptions = extrasOptions