local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local coloredDash = "|cffFFD100-|r "
local icon = ""
--local authorNote = "|cff009AE4"

function HelpMePlay:MinimapIcon(bool)
	HelpMePlayDB.MinimapIconEnabled = bool
	if bool then
		if icon ~= "" then
			icon:Show(addonName)
		else
			icon = LibStub("LibDBIcon-1.0")
			-- Create a Lib DB first to hold all the
			-- information for the minimap icon.
			local iconLDB = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject(addonName, {
				type = "launcher",
				icon = "236688", -- 100 Exalted Reputations (Achievement)
				OnTooltipShow = function(tooltip)
					tooltip:SetText(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. " |cffFFFFFF" .. GetAddOnMetadata(addonName, "Version") .. "|r")
					tooltip:AddLine(L_GLOBALSTRINGS["Minimap.UI.Button.SubText"])
					tooltip:Show()
				end,
				OnClick = function() HelpMePlay:SlashCommandHandler("") end,
			})
			
			-- Register the minimap button with the
			-- LDB.
			icon:Register(addonName, iconLDB, HelpMePlayDB)
			icon:Show(addonName)
		end
	else
		if icon ~= "" then
			icon:Hide(addonName)
		end
	end
end

local settings = {
	name = addonName,
	handler = HelpMePlay,
	type = "group",
	args = {
		General_Tab = {
            name = "General",
			desc = "Modify general settings for the addon like toggling functionality and the minimap icon.",
            type = "group",
            order = 1,
            args = {
				Enable = {
					name = "Enable",
					order = 1,
					desc = "Toggle addon functionality.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.Enabled then
							HelpMePlayDB.Enabled = true
						end
						return HelpMePlayDB.Enabled
					end,
					set = function(_, val) HelpMePlayDB.Enabled = val end,
				},
				MinimapIcon = {
					name = "Minimap Icon",
					order = 2,
					desc = "Toggle the minimap icon.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.MinimapIconEnabled then
							HelpMePlayDB.MinimapIconEnabled = false
						end
						return HelpMePlayDB.MinimapIconEnabled
					end,
					set = function(_, val) HelpMePlay:MinimapIcon(val) end,
				},
				DeveloperMode = {
					name = "Developer Mode",
					order = 3,
					desc = "Toggle and the addon will output \"random\" information at \"spontaneous\" moments.\n\nThis really should be for the author's eyes only but... have fun!",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.DevModeEnabled then
							HelpMePlayDB.DevModeEnabled = false
						end
						return HelpMePlayDB.DevModeEnabled
					end,
					set = function(_, val) HelpMePlayDB.DevModeEnabled = val end,
				},
            },
        },
		Features_Tab = {
            name = "Features",
			desc = "Toggle addon features like skipping cinematics, automatic repairs, and more!",
            type = "group",
            order = 2,
            args = {
				Cinematics = {
					name = "Cinematics",
					order = 1,
					desc = "Toggle skipping cinematics and in-game movies.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.CinematicsEnabled then
							HelpMePlayDB.CinematicsEnabled = false
						end
						return HelpMePlayDB.CinematicsEnabled
					end,
					set = function(_, val) HelpMePlayDB.CinematicsEnabled = val end,
				},
				Emotes = {
					name = "Emotes",
					order = 2,
					desc = "Toggle emoting at specific NPCs.\n\n" ..
					"An example would be the |cffFFD100Repeat After Me|r quest in Maldraxxus.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.EmotesEnabled then
							HelpMePlayDB.EmotesEnabled = false
						end
						return HelpMePlayDB.EmotesEnabled
					end,
					set = function(_, val) HelpMePlayDB.EmotesEnabled = val end,
				},
				Equip_Loot = {
					name = "Equip Loot",
					order = 3,
					desc = "Toggle equipping soulbound loot from slain enemies.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.EquipLootEnabled then
							HelpMePlayDB.EquipLootEnabled = false
						end
						return HelpMePlayDB.EquipLootEnabled
					end,
					set = function(_, val) HelpMePlayDB.EquipLootEnabled = val end,
				},
				Flight_Paths = {
					name = "Flight Paths",
					order = 4,
					desc = "Toggle automatically taking flight paths when your character meets certain conditions.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.FlightPathsEnabled then
							HelpMePlayDB.FlightPathsEnabled = false
						end
						return HelpMePlayDB.FlightPathsEnabled
					end,
					set = function(_, val) HelpMePlayDB.FlightPathsEnabled = val end,
				},
				Group_Invites = {
					name = "Group Invites",
					order = 5,
					desc = "Toggle automatically accepting group invitations.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.GroupsEnabled then
							HelpMePlayDB.GroupsEnabled = false
						end
						return HelpMePlayDB.GroupsEnabled
					end,
					set = function(_, val) HelpMePlayDB.GroupsEnabled = val end,
				},
				Gossip = {
					name = "Gossip",
					order = 6,
					desc = "Toggle the automatic selection of gossip options. This does |cffFFFF00NOT|r apply to all NPCs.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.GossipEnabled then
							HelpMePlayDB.GossipEnabled = false
						end
						return HelpMePlayDB.GossipEnabled
					end,
					set = function(_, val) HelpMePlayDB.GossipEnabled = val end,
				},
				Notes = {
					name = "Notes",
					order = 7,
					desc = "Toggle the application of helpful tips to the tooltip of select NPCs in the world.\n\n" ..
					"An example would be the |cffFFD100Lever-Locked Chests|r in Torghast.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.NotesEnabled then
							HelpMePlayDB.NotesEnabled = false
						end
						return HelpMePlayDB.NotesEnabled
					end,
					set = function(_, val) HelpMePlayDB.NotesEnabled = val end,
				},
				Queues = {
					name = "Queues",
					order = 8,
					desc = "Toggle to allow the addon to accept role checks.\n\n" ..
					"As of 10.0.7, it's no longer possible for any addon to accept queues.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.QueuesEnabled then
							HelpMePlayDB.QueuesEnabled = false
						end
						return HelpMePlayDB.QueuesEnabled
					end,
					set = function(_, val) HelpMePlayDB.QueuesEnabled = val end,
				},
				Ready_Checks = {
					name = "Ready Checks",
					order = 9,
					desc = "Toggle automatically accepting ready checks. You're always ready!",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.ReadyChecksEnabled then
							HelpMePlayDB.ReadyChecksEnabled = false
						end
						return HelpMePlayDB.ReadyChecksEnabled
					end,
					set = function(_, val) HelpMePlayDB.ReadyChecksEnabled = val end,
				},
				Repairs = {
					name = "Repairs",
					order = 10,
					desc = "Toggle automatically repairing with repair merchants.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.RepairsEnabled then
							HelpMePlayDB.RepairsEnabled = false
						end
						return HelpMePlayDB.RepairsEnabled
					end,
					set = function(_, val) HelpMePlayDB.RepairsEnabled = val end,
				},
				Speech = {
					name = "Speech",
					order = 11,
					desc = "Toggle the ability for the addon to interact with NPC speech.\n\n" ..
					"An example would be |cffFFD100The Games We Play|r quest in Ardenweald.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.SpeechEnabled then
							HelpMePlayDB.SpeechEnabled = false
						end
						return HelpMePlayDB.SpeechEnabled
					end,
					set = function(_, val) HelpMePlayDB.SpeechEnabled = val end,
				},
				Trainers = {
					name = "Trainers",
					order = 12,
					desc = "Toggle automatically purchasing training from... well... trainers!",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.TrainersEnabled then
							HelpMePlayDB.TrainersEnabled = false
						end
						return HelpMePlayDB.TrainersEnabled
					end,
					set = function(_, val) HelpMePlayDB.TrainersEnabled = val end,
				},
				Vehicles = {
					name = "Vehicles",
					order = 13,
					desc = "Toggle the automatic exit from specific vehicles.\n\n" ..
					"This is currently only used on |cffFFD100Murky's Egg|r in Highmountain.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.VehiclesEnabled then
							HelpMePlayDB.VehiclesEnabled = false
						end
						return HelpMePlayDB.VehiclesEnabled
					end,
					set = function(_, val) HelpMePlayDB.VehiclesEnabled = val end,
				},
				War_Mode = {
					name = "War Mode",
					order = 14,
					desc = "Toggle automatically entering War Mode when entering Stormwind City or Orgrimmar at level 20 or higher.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.WarModeEnabled then
							HelpMePlayDB.WarModeEnabled = false
						end
						return HelpMePlayDB.WarModeEnabled
					end,
					set = function(_, val) HelpMePlayDB.WarModeEnabled = val end,
				},
				Waypoints = {
					name = "Waypoints",
					order = 15,
					desc = "Toggle the plotting of waypoints when accepting specific quests.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.WaypointsEnabled then
							HelpMePlayDB.WaypointsEnabled = false
						end
						if not IsAddOnLoaded("TomTom") then
							HelpMePlayDB.WaypointsEnabled = false
							return
						end
						return HelpMePlayDB.WaypointsEnabled
					end,
					set = function(_, val)
						if not IsAddOnLoaded("TomTom") then
							print("|cffFFFF00ERROR|r: TomTom must be enabled to use this feature.")
							return
						end
						HelpMePlayDB.WaypointsEnabled = val
					end,
				},
				Equip_Loot_Advanced_Header = {
					name = "Equip Loot (Advanced)",
					order = 20,
					type = "header",
					hidden = function()
						if HelpMePlayDB.EquipLootEnabled then
							return false
						end
						return true
					end,
				},
				Ignore_Bind = {
					name = "Ignore Bind",
					order = 21,
					desc = "Toggle allowing the Equip Loot feature to equip BoE loot from slain enemies.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.EquipLootIgnoreBindEnabled then
							HelpMePlayDB.EquipLootIgnoreBindEnabled = false
						end
						return HelpMePlayDB.EquipLootIgnoreBindEnabled
					end,
					set = function(_, val) HelpMePlayDB.EquipLootIgnoreBindEnabled = val end,
					hidden = function()
						if HelpMePlayDB.EquipLootEnabled then
							return false
						end
						HelpMePlayDB.EquipLootIgnoreBindEnabled = false
						return true
					end,
				},
				Queues_Advanced_Header = {
					name = "Queues (Advanced)",
					order = 30,
					type = "header",
					hidden = function()
						if HelpMePlayDB.QueuesEnabled then
							return false
						end
						return true
					end,
				},
				Holiday_Queues = {
					name = "Holiday Queues",
					order = 31,
					desc = "Toggle the presence of a button next to your character micro menu that automatically queues you for the active holiday boss.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.HolidayQueuesEnabled then
							HelpMePlayDB.HolidayQueuesEnabled = false
						end
						return HelpMePlayDB.HolidayQueuesEnabled
					end,
					set = function(_, val) HelpMePlayDB.HolidayQueuesEnabled = val end,
					hidden = function()
						if HelpMePlayDB.QueuesEnabled then
							return false
						end
						HelpMePlayDB.HolidayQueuesEnabled = false
						return true
					end,
				},
				Trainers_Advanced_Header = {
					name = "Trainers (Advanced)",
					order = 40,
					type = "header",
					hidden = function()
						if HelpMePlayDB.TrainersEnabled then
							return false
						end
						return true
					end,
				},
				Trainers_Gold_Amount = {
					name = "Trainers Minimum Amount",
					order = 41,
					usage = "|cffFFFFFF" .. "Enter an amount of gold to add to the cost of a spell to train. Your character must have the cost plus this number (default is 50 gold) before HelpMePlay will buy it.",
					type = "input",
					get = function()
						if not HelpMePlayDB.TrainersMinAmount then
							HelpMePlayDB.TrainersMinAmount = 500000 -- 50 gold
						end
						return GetCoinTextureString(HelpMePlayDB.TrainersMinAmount)
					end,
					set = function(_, val) HelpMePlayDB.TrainersMinAmount = tonumber(val*10000) end,
					validate = function(self, val)
						if tonumber(val) then
							return true
						end
						return "Please enter a numeric value from 1 to 9,999,999 (commas should not be used)."
					end,
					hidden = function()
						if HelpMePlayDB.TrainersEnabled then
							return false
						end
						return true
					end,
				},
            },
        },
		Quests_Tab = {
            name = "Quests",
			desc = "Toggle features related to quests!",
            type = "group",
            order = 3,
            args = {
				ChromieTime_Indicator_Text = {
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
				Dropdown_Header = {
					name = "Dropdowns",
					order = 1,
					type = "header",
				},
				Chromie_Time_Dropdown = {
					name = "Chromie Time:",
					order = 2,
					desc = "Select the expansion for the addon to automatically choose for Chromie Time.",
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
				Quest_Rewards_Dropdown = {
					name = "Quest Rewards:",
					order = 3,
					desc = "Select how the addon should choose your quest rewards.",
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
				Toggles_Header = {
					name = "Toggles",
					order = 10,
					type = "header",
				},
				Accept_Quests = {
					name = "Accept Quests",
					order = 11,
					desc = "Toggle automatically accepting quests.",
					type = "toggle",
					get = function() return HelpMePlayDB.AcceptQuestsEnabled end,
					get = function()
						if not HelpMePlayDB.AcceptQuestsEnabled then
							HelpMePlayDB.AcceptQuestsEnabled = false
						end
						return HelpMePlayDB.AcceptQuestsEnabled
					end,
					set = function(_, val) HelpMePlayDB.AcceptQuestsEnabled = val end,
				},
				Adventure_Maps = {
					name = "Adventure Maps",
					order = 12,
					desc = "Toggle the ability for the addon to interact with Adventure Maps and Call Boards.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.AdventureMapsEnabled then
							HelpMePlayDB.AdventureMapsEnabled = false
						end
						return HelpMePlayDB.AdventureMapsEnabled
					end,
					set = function(_, val) HelpMePlayDB.AdventureMapsEnabled = val end,
				},
				Complete_Quests = {
					name = "Complete Quests",
					order = 13,
					desc = "Toggle automatically completing quests.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.CompleteQuestsEnabled then
							HelpMePlayDB.CompleteQuestsEnabled = false
						end
						return HelpMePlayDB.CompleteQuestsEnabled
					end,
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
        },
		Expansion_Features_Tab = {
            name = "Expansion Features",
			desc = "Control the settings related to different expansion features like Garrisons.",
            type = "group",
            order = 4,
            args = {
				garrisonHeader = {
					name = L_GLOBALSTRINGS["Header.Garrisons"],
					order = 0,
					type = "header",
				},
				architectTable = {
					name = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.ArchitectTable"],
					order = 1,
					desc = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.ArchitectTableDesc"],
					type = "toggle",
					get = function(info) return HelpMePlayDB.ArchitectTableEnabled end,
					set = function(info, val) HelpMePlayDB.ArchitectTableEnabled = val end,
				},
				garrisonOutposts = {
					name = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.GarrisonOutposts"],
					order = 2,
					desc = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.GarrisonOutpostsDesc"],
					type = "toggle",
					get = function(info) return HelpMePlayDB.GarrisonOutpostsEnabled end,
					set = function(info, val) HelpMePlayDB.GarrisonOutpostsEnabled = val end,
				},
				missionTable = {
					name = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.MissionTable"],
					order = 3,
					desc = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.MissionTableDesc"],
					type = "toggle",
					get = function(info) return HelpMePlayDB.MissionTableEnabled end,
					set = function(info, val) HelpMePlayDB.MissionTableEnabled = val end,
				},
				visionsHeader = {
					name = L_GLOBALSTRINGS["Header.VisionsOfNzoth"],
					order = 10,
					type = "header",
				},
				titanResearch = {
					name = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.TitanicResearch"],
					order = 11,
					desc = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.TitanicResearchDesc"],
					type = "toggle",
					get = function(info) return HelpMePlayDB.TitanResearchEnabled end,
					set = function(info, val) HelpMePlayDB.TitanResearchEnabled = val end,
				},
				covenantsHeader = {
					name = L_GLOBALSTRINGS["Header.Covenants"],
					order = 20,
					type = "header",
				},
				covenants = {
					name = L_GLOBALSTRINGS["ExpansionFeatures.DropDowns.Covenant.Title"],
					order = 21,
					desc = L_GLOBALSTRINGS["ExpansionFeatures.DropDowns.Covenant.Desc"],
					type = "select",
					style = "dropdown",
					values = {
						[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
						[1] = L_GLOBALSTRINGS["ExpansionFeatures.DropDowns.Covenant.Kyrian"],
						[2] = L_GLOBALSTRINGS["ExpansionFeatures.DropDowns.Covenant.Venthyr"],
						[3] = L_GLOBALSTRINGS["ExpansionFeatures.DropDowns.Covenant.Necrolord"],
						[4] = L_GLOBALSTRINGS["ExpansionFeatures.DropDowns.Covenant.NightFae"],
						[5] = L_GLOBALSTRINGS["ExpansionFeatures.DropDowns.Covenant.Auto"],
					},
					sorting = {
						[1] = 0, 	-- Disabled
						[2] = 5, 	-- Auto
						[3] = 1, 	-- Kyrian
						[4] = 3, 	-- Necrolord
						[5] = 4, 	-- Night Fae
						[6] = 2, 	-- Venthyr
					},
					get = function()
						if not HelpMePlayDB.CovenantId then
							HelpMePlayDB.CovenantId = 0
						end
						return HelpMePlayDB.CovenantId
					end,
					set = function(_, covenantId) HelpMePlayDB.CovenantId = covenantId end,
				},
				torghastHeader = {
					name = L_GLOBALSTRINGS["Header.Torghast"],
					order = 30,
					type = "header",
				},
				boxOfManyThings = {
					name = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.BoxOfManyThings"],
					order = 31,
					desc = L_GLOBALSTRINGS["ExpansionFeatures.Toggle.BoxOfManyThingsDesc"],
					type = "toggle",
					get = function(info) return HelpMePlayDB.BoxOfManyThingsEnabled end,
					set = function(info, val) HelpMePlayDB.BoxOfManyThingsEnabled = val end,
				},
				animaPowers = {
					name = L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.Title"],
					order = 32,
					desc = L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.Desc"],
					type = "select",
					style = "dropdown",
					values = {
						[0] = L_GLOBALSTRINGS["DropDowns.Disabled"],
						[1] = L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.Notify"],
						[2] = L_GLOBALSTRINGS["DropDowns.Torghast.AnimaPowers.Auto"],
					},
					sorting = {
						[1] = 0, 	-- Disabled
						[2] = 1, 	-- Notify
						[3] = 2, 	-- Automatic
					},
					get = function()
						if not HelpMePlayDB.TorghastPowersId then
							HelpMePlayDB.TorghastPowersId = 0
						end
						return HelpMePlayDB.TorghastPowersId
					end,
					set = function(_, torghastPowersId) HelpMePlayDB.TorghastPowersId = torghastPowersId end,
				},
            },
        },
		Zone_Selection_Tab = {
            name = "Zone Selection",
			desc = "Define which zones the addon should choose when interacting with Adventure Maps.",
            type = "group",
            order = 5,
            args = {
				zoneSelection_BFA = {
					name = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.BFA.Title"],
					order = 1,
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
				zoneSelection_SL = {
					name = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.SL.Title"],
					order = 2,
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
				zoneSelection_DF = {
					name = L_GLOBALSTRINGS["Quests.DropDowns.ZoneSelection.DF.Title"],
					order = 3,
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
						[2] = 72267,
						[3] = 72269,
						[4] = 72268,
						[5] = 72266,
					},
					get = function()
						if not HelpMePlayDB.ZoneID_DF then
							HelpMePlayDB.ZoneID_DF = 0
						end
						return HelpMePlayDB.ZoneID_DF
					end,
					set = function(_, zoneID) HelpMePlayDB.ZoneID_DF = zoneID end,
				},
            },
        },
		Sounds_Tab = {
            name = "Sounds",
			desc = "Mute specific sounds in the game that you find annoying.",
            type = "group",
            order = 6,
            args = {
				enable = {
					name = "Enable",
					order = 1,
					desc = "Toggle to enable the ability for the addon to mute sounds.",
					type = "toggle",
					get = function(_) return HelpMePlayDB.SoundsEnabled end,
					set = function(_, val) HelpMePlayDB.SoundsEnabled = val end,
				},
				soundsHeader = {
					name = "Sounds",
					order = 2,
					type = "header",
				},
				soundInput = {
					name = "Sounds",
					order = 3,
					desc = "Input a list of sound IDs for the addon to mute. Each sound ID should be on its own line.\n\n|cffFFD100NOTE|r: You must reload after adding the sound IDs.",
					type = "input",
					multiline = true,
					get = function(_) return HelpMePlayDB.Sounds end,
					set = function(_, val)
						local sounds = {}
						for soundID in val:gmatch("[^\r\n]+") do
							table.insert(sounds, soundID)
						end
						for _, soundID in ipairs(sounds) do
							if tonumber(soundID) then
								soundID = tonumber(soundID)
								if HelpMePlayDB.Sounds[soundID] then
									HelpMePlayDB.Sounds[soundID] = nil
									UnmuteSoundFile(soundID)
								else
									HelpMePlayDB.Sounds[soundID] = true
								end
							else
								print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": |cffFFD100" .. soundID .. "|r isn't a valid sound ID.")
							end
						end
					end,
				},
            },
        },
		Systems_Tab = {
            name = "Systems",
			desc = "Toggle more in-depth features like Junker and define their settings.",
            type = "group",
            order = 7,
            args = {
				junkerHeader = {
					name = L_GLOBALSTRINGS["Header.Junker"],
					order = 0,
					type = "header",
				},
				enable = {
					name = L_GLOBALSTRINGS["General.Toggle.Enable"],
					order = 1,
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
				safeMode = {
					name = L_GLOBALSTRINGS["Junker.Toggle.SafeMode"],
					order = 2,
					desc = L_GLOBALSTRINGS["Junker.Toggle.SafeModeDesc"],
					type = "toggle",
					get = function(info) return HelpMePlayDB.JunkerSafeModeEnabled end,
					set = function(_, val) HelpMePlayDB.JunkerSafeModeEnabled = val end,
				},
				soulboundMode = {
					name = L_GLOBALSTRINGS["Junker.Toggle.SoulboundMode"],
					order = 3,
					desc = L_GLOBALSTRINGS["Junker.Toggle.SoulboundModeDesc"],
					type = "toggle",
					get = function(info) return HelpMePlayDB.JunkerSoulboundModeEnabled end,
					set = function(_, val)
						HelpMePlayDB.JunkerSoulboundModeEnabled = val
						if val then
							HelpMePlayDB.RarityId = 0
						end
					end,
				},
				autoSell = {
					name = L_GLOBALSTRINGS["Junker.Toggle.AutoSell"],
					order = 4,
					desc = L_GLOBALSTRINGS["Junker.Toggle.AutoSellDesc"],
					type = "toggle",
					get = function(info) return HelpMePlayDB.JunkerAutoSellEnabled end,
					set = function(_, val) HelpMePlayDB.JunkerAutoSellEnabled = val end,
				},
				rarity = {
					name = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Title"],
					order = 5,
					desc = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Desc"],
					type = "select",
					style = "dropdown",
					values = {
						[5] = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.PreserveTransmog"],
						[0] = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Poor"],
						[1] = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Common"],
						[2] = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Uncommon"],
						[3] = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Rare"],
						[4] = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Epic"],
					},
					sorting = {
						[1] = 5, 	-- Preserve Transmog
						[2] = 0, 	-- Poor
						[3] = 1, 	-- Common
						[4] = 2, 	-- Uncommon
						[5] = 3, 	-- Rare
						[6] = 4, 	-- Epic
					},
					get = function()
						if not HelpMePlayDB.RarityId then
							HelpMePlayDB.RarityId = 0
						end
						return HelpMePlayDB.RarityId
					end,
					set = function(_, rarityId)
						HelpMePlayDB.RarityId = rarityId
						if rarityId == 5 then
							if HelpMePlayDB.JunkerSoulboundModeEnabled then
								HelpMePlayDB.JunkerSoulboundModeEnabled = false
							end
						end
					end,
				},
				importBtn = {
					name = L_GLOBALSTRINGS["Junker.Button.Import"],
					order = 6,
					type = "execute",
					func = function(_, _)
						StaticPopupDialogs["HELPMEPLAY_JUNKER_IMPORT"] = {
							text = L_GLOBALSTRINGS["Junker.Button.Import.InitialText"],
							button1 = L_GLOBALSTRINGS["Junker.Button.Import.FromAddOnText"],
							button2 = L_GLOBALSTRINGS["Junker.Button.Import.FromListText"],
							button3 = CANCEL,
							-- This is confusing, but I don't want Cancel
							-- as the second button. Thus, OnAlt is used
							-- for cancels and OnCancel is used for loading
							-- an item ID list.
							OnButton1 = function(self, data)
								if IsAddOnLoaded("AutoVendor") then
									if AutoVendorDB["profiles"]["Default"] then
										for id, _ in pairs(AutoVendorDB["profiles"]["Default"]["junk"]) do
											HelpMePlay:ImportToJunker(id, "ADD")
										end
										for id, _ in pairs(AutoVendorDB["profiles"]["Default"]["not_junk"]) do
											HelpMePlay:ImportToJunker(id, "BLACKLIST")
										end
									end
									addonTable.Print(string.format(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Junker.Output.Text.ImportedFromAddOnText"], "AutoVendor"))
								elseif IsAddOnLoaded("Dejunk") then
									for id, _ in pairs(__DEJUNK_SAVED_VARIABLES__["Global"]["sell"]["inclusions"]) do
										HelpMePlay:ImportToJunker(id, "ADD")
									end
									for id, _ in pairs(__DEJUNK_SAVED_VARIABLES__["Global"]["sell"]["exclusions"]) do
										HelpMePlay:ImportToJunker(id, "BLACKLIST")
									end
									addonTable.Print(string.format(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Junker.Output.Text.ImportedFromAddOnText"], "Dejunk"))
								else
									addonTable.Print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Junker.Output.Text.NoAddOnEnabledText"])
								end
							end,
							OnCancel = function(self, data)
								-- Create a count variable to track how many items
								-- are inserted into the table.
								--
								-- Get the text from the editbox and store it in a
								-- string variable.
								--
								-- Convert the string to a table.
								--
								-- Import each item id into the table.
								StaticPopupDialogs["HELPMEPLAY_JUNKER_IMPORT_ITEMLIST"] = {
									text = L_GLOBALSTRINGS["Junker.Button.Import.CancelText"],
									button1 = L_GLOBALSTRINGS["Junker.Button.Import.AddText"],
									button2 = L_GLOBALSTRINGS["Junker.Button.Import.BlacklistText"],
									button3 = CANCEL,
									OnAccept = function(self)
										local count = 0
										local items = addonTable.StringToTable(self.editBox:GetText(), ",")
										for _, id in ipairs(items) do
											if tonumber(id) then
												count = count + 1
												HelpMePlay:ImportToJunker(id, "ADD")
											end
										end
										addonTable.Print(string.format(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Junker.Output.Text.ImportedFromListText"], count))
									end,
									OnCancel = function(self)
										local count = 0
										local items = addonTable.StringToTable(self.editBox:GetText(), ",")
										for _, id in ipairs(items) do
											if tonumber(id) then
												HelpMePlay:ImportToJunker(id, "BLACKLIST")
												count = count + 1
											end
										end
										addonTable.Print(string.format(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Junker.Output.Text.ImportedFromListText"], count))
									end,
									OnAlt = function() end,
									showAlert = true,
									whileDead = false,
									hideOnEscape = true,
									enterClicksFirstButton = true,
									hasEditBox = true,
									preferredIndex = 3,
								}
								StaticPopup_Show("HELPMEPLAY_JUNKER_IMPORT_ITEMLIST")
							end,
							OnAlt = function() end,
							showAlert = true,
							whileDead = false,
							hideOnEscape = true,
							preferredIndex = 3,
						}
						StaticPopup_Show("HELPMEPLAY_JUNKER_IMPORT")
					end,
				},
				soulboundModeMinItemLevelSlider = {
					name = L_GLOBALSTRINGS["Junker.Toggle.SoulboundModeItemLevel"],
					order = 7,
					type = "range",
					min = 25,
					max = 50,
					step = 1,
					desc = L_GLOBALSTRINGS["Junker.Toggle.SoulboundModeItemLevelDesc"],
					get = function()
						if not HelpMePlayDB.SoulboundModeMinItemLevel then
							HelpMePlayDB.SoulboundModeMinItemLevel = 30
						end
						return HelpMePlayDB.SoulboundModeMinItemLevel
					end,
					set = function(_, val) HelpMePlayDB.SoulboundModeMinItemLevel = val end,
				},
				talentsHeader = {
					name = L_GLOBALSTRINGS["Header.Talents"],
					order = 10,
					type = "header",
				},
				talentButton = {
					name = L_GLOBALSTRINGS["General.Toggle.TalentButton"],
					order = 11,
					desc = L_GLOBALSTRINGS["General.Toggle.TalentButtonDesc"],
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.TalentButtonEnabled then
							HelpMePlayDB.TalentButtonEnabled = false
						end
						return HelpMePlayDB.TalentButtonEnabled
					end,
					set = function(_, val)
						HelpMePlayDB.TalentButtonEnabled = val
						StaticPopupDialogs["HELPMEPLAY_BUTTON_TOGGLE"] = {
							text = L_GLOBALSTRINGS["Systems.Toggle.ReloadUI.Text"],
							button1 = YES,
							button2 = CANCEL,
							OnAccept = function(self, data)
								ReloadUI()
							end,
							showAlert = true,
							whileDead = false,
							hideOnEscape = true,
							enterClicksFirstButton = false,
							preferredIndex = 3,
						}
						StaticPopup_Show("HELPMEPLAY_BUTTON_TOGGLE")
					end,
				},
				transmogHeader = {
					name = L_GLOBALSTRINGS["Header.Transmog"],
					order = 20,
					type = "header",
				},
				transmogButton = {
					name = L_GLOBALSTRINGS["General.Toggle.TransmogButton"],
					order = 21,
					desc = L_GLOBALSTRINGS["General.Toggle.TransmogButtonDesc"],
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.TransmogButtonEnabled then
							HelpMePlayDB.TransmogButtonEnabled = false
						end
						return HelpMePlayDB.TransmogButtonEnabled
					end,
					set = function(_, val)
						HelpMePlayDB.TransmogButtonEnabled = val
						StaticPopupDialogs["HELPMEPLAY_BUTTON_TOGGLE"] = {
							text = L_GLOBALSTRINGS["Systems.Toggle.ReloadUI.Text"],
							button1 = YES,
							button2 = CANCEL,
							OnAccept = function(self, data)
								ReloadUI()
							end,
							showAlert = true,
							whileDead = false,
							hideOnEscape = true,
							enterClicksFirstButton = false,
							preferredIndex = 3,
						}
						StaticPopup_Show("HELPMEPLAY_BUTTON_TOGGLE")
					end,
				},
				dragonridingHeader = {
					name = L_GLOBALSTRINGS["Header.Dragonriding"],
					order = 30,
					type = "header",
				},
				dragonridingButton = {
					name = L_GLOBALSTRINGS["General.Toggle.DragonridingButton"],
					order = 31,
					desc = L_GLOBALSTRINGS["General.Toggle.DragonridingButtonDesc"],
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.DragonridingButtonEnabled then
							HelpMePlayDB.DragonridingButtonEnabled = false
						end
						return HelpMePlayDB.DragonridingButtonEnabled
					end,
					set = function(_, val)
						HelpMePlayDB.DragonridingButtonEnabled = val
						StaticPopupDialogs["HELPMEPLAY_BUTTON_TOGGLE"] = {
							text = L_GLOBALSTRINGS["Systems.Toggle.ReloadUI.Text"],
							button1 = YES,
							button2 = CANCEL,
							OnAccept = function(self, data)
								ReloadUI()
							end,
							showAlert = true,
							whileDead = false,
							hideOnEscape = true,
							enterClicksFirstButton = false,
							preferredIndex = 3,
						}
						StaticPopup_Show("HELPMEPLAY_BUTTON_TOGGLE")
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
        },
		Extras_Tab = {
            name = "Extras",
			desc = "Toggle the use of bonus settings.",
            type = "group",
            order = 8,
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
				autoInvite = {
					name = "Auto Invite",
					order = 31,
					desc = "Toggle whether or not HelpMePlay should process whispers for inviting players.",
					type = "toggle",
					get = function(_) return HelpMePlayDB.AutoInviteEnabled end,
					set = function(_, val) HelpMePlayDB.AutoInviteEnabled = val end,
				},
				partyMembers = {
					name = "Party Members",
					order = 32,
					type = "input",
					multiline = true,
					desc = "Set a list of players to invite when using the |cffFFD100inv|r command.\n\n" ..
					"This is best used by players to quickly form premade parties for dungeons or other content.\n\n" ..
					"|cffFFD100Format:|r\nPlayerName-RealmName\n\nEach entry should be on a separate line.",
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
				inviteKeyword = {
					name = "Invite Keyword",
					order = 33,
					usage = "|cffFFFFFF" .. "Enter a keyword people can whisper you to automatically receive a party invite.\n\n" ..
					"The default keywords are |cffFFD100invite|r and |cffFFD100inv|r.\n\n" ..
					"Players can always message you the default keywords even if you specify a custom entry.|r",
					type = "input",
					get = function()
						if not HelpMePlayDB.InviteKeyword then
							HelpMePlayDB.InviteKeyword = "invite"
						end
						return HelpMePlayDB.InviteKeyword
					end,
					set = function(_, val) HelpMePlayDB.InviteKeyword = string.lower(val) end,
				},
            },
        },
		Import_Tab = {
            name = "Import",
			desc = "Import custom data into the addon for features like player talents and more!",
            type = "group",
            order = 9,
            args = {
				playerTalentsHeader = {
					name = "Player Talents",
					order = 1,
					type = "header",
				},
				playerClassDropdown = {
					name = "Class",
					order = 2,
					desc = "",
					type = "select",
					style = "dropdown",
					values = {
						[1] = CreateAtlasMarkup("classicon-warrior") .. " " .. "Warrior",
						[2] = CreateAtlasMarkup("classicon-paladin") .. " " .. "Paladin",
						[3] = CreateAtlasMarkup("classicon-hunter") .. " " .. "Hunter",
						[4] = CreateAtlasMarkup("classicon-rogue") .. " " .. "Rogue",
						[5] = CreateAtlasMarkup("classicon-priest") .. " " .. "Priest",
						[6] = CreateAtlasMarkup("classicon-deathknight") .. " " .. "Death Knight",
						[7] = CreateAtlasMarkup("classicon-shaman") .. " " .. "Shaman",
						[8] = CreateAtlasMarkup("classicon-mage") .. " " .. "Mage",
						[9] = CreateAtlasMarkup("classicon-warlock") .. " " .. "Warlock",
						[10] = CreateAtlasMarkup("classicon-monk") .. " " .. "Monk",
						[11] = CreateAtlasMarkup("classicon-druid") .. " " .. "Druid",
						[12] = CreateAtlasMarkup("classicon-demonhunter") .. " " .. "Demon Hunter",
						[13] = CreateAtlasMarkup("classicon-evoker") .. " " .. "Evoker",
					},
					sorting = {
						[1] = 6, 	-- DK
						[2] = 12, 	-- DH
						[3] = 11, 	-- Druid
						[4] = 13, 	-- Evoker
						[5] = 3, 	-- Hunter
						[6] = 8, 	-- Mage
						[7] = 10, 	-- Monk
						[8] = 2, 	-- Paladin
						[9] = 5, 	-- Priest
						[10] = 4, 	-- Rogue
						[11] = 7, 	-- Shaman
						[12] = 9, 	-- Warlock
						[13] = 1, 	-- Warrior
					},
					get = function()
						-- If not set, then set the default class to Warrior so the
						-- specialization dropdown can be populated.
						if not HelpMePlayDB.classID then
							HelpMePlayDB.classID = 1
						end
						return HelpMePlayDB.classID
					end,
					set = function(_, classID) HelpMePlayDB.classID = classID end,
				},
				classSpecializationDropdown = {
					name = "Specialization",
					order = 3,
					desc = "",
					type = "select",
					style = "dropdown",
					values = function()
						local specializations = {}
						local numSpecs = GetNumSpecializationsForClassID(HelpMePlayDB.classID)
						for specIndex = 1, numSpecs do
							local specID, specName, _, specIcon = GetSpecializationInfoForClassID(HelpMePlayDB.classID, specIndex)
							specializations[specID] = "|T" .. specIcon .. ":0|t" .. " " .. specName
						end
						return specializations
					end,
					get = function()
						if not HelpMePlayDB.specID then
							HelpMePlayDB.specID = 0
						end
						return HelpMePlayDB.specID
					end,
					set = function(_, specID) HelpMePlayDB.specID = specID end,
				},
				talentImportButton = {
					name = "Import",
					order = 4,
					desc = function()
						local className = select(1, GetClassInfo(HelpMePlayDB.classID)); local upperClassName = string.upper(className:gsub("%s+", ""))
						local classColor = "|c" .. select(4, GetClassColor(upperClassName))
						local _, specName = GetSpecializationInfoForSpecID(HelpMePlayDB.specID)
						return "If you want to use a custom talent loadout for " .. classColor .. specName .. " " .. className .. "|r, then click here.\n\n" ..
						"Paste your import string from an online talent calculator or the in-game talent interface.\n\n" ..
						"|cffFFD100NOTE|r: Importing a custom loadout will override the loadout provided by HelpMePlay."
					end,
					type = "execute",
					func = function(_, _)
						StaticPopupDialogs["HELPMEPLAY_TALENT_IMPORT"] = {
							text = "Paste the talent share code into the field below and select |cffFFD100OK|r.\n\n" ..
							"If you would like to use the talent loadout provided by HelpMePlay, then select |cffFFD100Delete|r.\n\n" ..
							"If you don't want to continue, please select |cffFFD100Cancel|r.",
							button1 = "OK",
							button2 = "Delete",
							button3 = CANCEL,
							-- This is confusing, but I don't want Cancel
							-- as the second button. Thus, OnAlt is used
							-- for cancels and OnCancel is used for deleting
							-- talent loadouts for the class/spec.
							OnButton1 = function(self, data)
								local importString = self.editBox:GetText()
								
								if ClassTalentImportExportMixin then
									local importStream = ExportUtil.MakeImportDataStream(importString)
									local headerValid, serializationVersion, specID, treeHash = ClassTalentImportExportMixin:ReadLoadoutHeader(importStream)
									
									-- If the import string isn't valid, then return an error.
									if (not headerValid) then
										ClassTalentImportExportMixin:ShowImportError(LOADOUT_ERROR_BAD_STRING)
										return false
									end
									
									-- If the import string specID doesn't match the specID chosen in the
									-- dropdown, then return an error.
									if specID ~= HelpMePlayDB.specID then
										ClassTalentImportExportMixin:ShowImportError("|cffFF0000Loadout does not match the chosen specialization.|r")
										return false
									end
									
									-- If the import stream is a loadout from a previous patch, then return
									-- an error.
									if LOADOUT_SERIALIZATION_VERSION ~= nil and (serializationVersion ~= LOADOUT_SERIALIZATION_VERSION) then
										ClassTalentImportExportMixin:ShowImportError(LOADOUT_ERROR_SERIALIZATION_VERSION_MISMATCH)
										return false
									end
									
									-- If the PlayerTalents table is nil, then populate it with some empty
									-- data.
									if HelpMePlayDB.PlayerTalents[HelpMePlayDB.classID] == nil then
										HelpMePlayDB.PlayerTalents[HelpMePlayDB.classID] = {}
									end
									if HelpMePlayDB.PlayerTalents[HelpMePlayDB.classID][specID] == nil then
										HelpMePlayDB.PlayerTalents[HelpMePlayDB.classID][specID] = ""
									end
									
									-- The import string should be valid and all is right in the world, so put
									-- the import string into the database.
									HelpMePlayDB.PlayerTalents[HelpMePlayDB.classID][specID] = importString
								else
									print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": Please open the talent interface once before trying to import a custom loadout.")
									return false
								end
							end,
							OnCancel = function(self, data)
								if HelpMePlayDB.PlayerTalents[HelpMePlayDB.classID] ~= nil then
									if HelpMePlayDB.PlayerTalents[HelpMePlayDB.classID][HelpMePlayDB.specID] ~= "" then
										HelpMePlayDB.PlayerTalents[HelpMePlayDB.classID][HelpMePlayDB.specID] = ""
									end
								end
							end,
							OnAlt = function() end, -- Cancel Button
							showAlert = true,
							hasEditBox = true,
							whileDead = false,
							hideOnEscape = true,
							preferredIndex = 3,
						}
						StaticPopup_Show("HELPMEPLAY_TALENT_IMPORT")
					end,
				},
            },
        },
		Changelog_Tab = {
            name = "Changelog",
			desc = "Review the changelog for the currently installed release.",
            type = "group",
            order = 10,
			args = {
				--[[addedHeader = {
					name = "Added",
					order = 10,
					type = "header",
				},
				addedText = {
					name = "",
					order = 11,
					type = "description",
					fontSize = "medium",
				},]]
				changedHeader = {
					name = "Changed",
					order = 20,
					type = "header",
				},
				changedText = {
					name = coloredDash .. "Updated the layout of the Settings menu.",
					order = 21,
					type = "description",
					fontSize = "medium",
				},
				--[[fixedHeader = {
					name = "Fixed",
					order = 30,
					type = "header",
				},
				fixedText = {
					name = coloredDash .. "",
					order = 31,
					type = "description",
					fontSize = "medium",
				},]]
				--[[removedHeader = {
					name = "Removed",
					order = 40,
					type = "header",
				},
				removedText = {
					name = "",
					order = 41,
					type = "description",
					fontSize = "medium",
				},]]
            },
		},
		About_Tab = {
            name = "About",
			desc = "Learn about the addon and its author.",
            type = "group",
            order = 11,
            args = {
                versionText = {
					name = "|cffFFD100Version|r: " .. GetAddOnMetadata(addonName, "Version"),
					order = 1,
					type = "description",
				},
				authorText = {
					name = "|cffFFD100Author|r: " .. "Lightsky",
					order = 2,
					type = "description",
				},
				contactText = {
					name = "|cffFFD100Contact|r: Lightsky#0658 (Discord)",
					order = 3,
					type = "description",
				},
            },
        },
		Issue_Button = {
			name = L_GLOBALSTRINGS["MainOptions.Button.OpenIssue"],
			desc = L_GLOBALSTRINGS["MainOptions.Button.OpenIssue.Tooltip"],
			order = 21,
			type = "execute",
			func = function(_, _)
				StaticPopupDialogs["HELPMEPLAY_GITHUB_POPUP"] = {
					text = L_GLOBALSTRINGS["MainOptions.Button.OpenIssue.Text"],
					button1 = "OK",
					OnShow = function(self, data)
						self.editBox:SetText("https://github.com/Saaappi/HelpMePlay/issues/new")
						self.editBox:HighlightText()
					end,
					timeout = 20,
					showAlert = true,
					whileDead = false,
					hideOnEscape = true,
					enterClicksFirstButton = true,
					hasEditBox = true,
					preferredIndex = 3,
				}
				StaticPopup_Show("HELPMEPLAY_GITHUB_POPUP")
			end,
		},
	},
}
addonTable.settings = settings
addonTable.mainOptions = mainOptions