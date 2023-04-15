local addonName, addonTable = ...
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
					tooltip:SetText(addonTable.CONSTANTS.COLORED_ADDON_NAME .. " |cffFFFFFF" .. GetAddOnMetadata(addonName, "Version") .. "|r")
					tooltip:AddLine("Configure the addon's settings and tailor an experience that best fits your playstyle!")
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
				Dragonriding = {
					name = "Dragonriding",
					order = 2,
					desc = "Toggle to add a button to the Dragonriding interface that, when clicked, will learn all the Dragonriding traits.",
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
							text = "Toggling this option requires a UI reload. Would you like to reload now?",
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
				Emotes = {
					name = "Emotes",
					order = 3,
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
					order = 4,
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
					order = 5,
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
					order = 6,
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
					order = 7,
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
				Junker = {
					name = "Junker",
					order = 8,
					desc = "Toggle to enable the Junker subsystem.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.JunkerEnabled then
							HelpMePlayDB.JunkerEnabled = false
						end
						return HelpMePlayDB.JunkerEnabled
					end,
					set = function(_, val)
						HelpMePlayDB.JunkerEnabled = val
						if val then
							HelpMePlay:ShowJunkerButton()
						else
							HelpMePlay:HideJunkerButton()
						end
					end,
				},
				Notes = {
					name = "Notes",
					order = 9,
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
				Party_Play = {
					name = "Party Play",
					order = 10,
					desc = "Toggle to enable Party Play functionality.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.PartyPlayEnabled then
							HelpMePlayDB.PartyPlayEnabled = false
						end
						return HelpMePlayDB.PartyPlayEnabled
					end,
					set = function(_, val) HelpMePlayDB.PartyPlayEnabled = val end,
				},
				Player_Talents = {
					name = "Player Talents",
					order = 11,
					desc = "Toggle to add a button to the talent interface to automatically learn talents for your specialization!\n\n" ..
					"This will require a reload!",
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
							text = "Toggling this option requires a UI reload. Would you like to reload now?",
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
				Queues = {
					name = "Queues",
					order = 12,
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
					order = 13,
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
					order = 14,
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
					order = 15,
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
					order = 16,
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
				Transmog = {
					name = "Transmog",
					order = 17,
					desc = "Toggle to add a button next to the inventory UI to help you learn unknown transmog appearances faster!\n\n" ..
					"This will require a reload!",
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
							text = "Toggling this option requires a UI reload. Would you like to reload now?",
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
				Vehicles = {
					name = "Vehicles",
					order = 18,
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
					order = 19,
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
					order = 20,
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
					order = 30,
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
					order = 31,
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
					order = 40,
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
					order = 41,
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
					order = 50,
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
					order = 51,
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
				Junker_Advanced_Header = {
					name = "Junker (Advanced)",
					order = 60,
					type = "header",
					hidden = function()
						if HelpMePlayDB.JunkerEnabled then
							return false
						end
						return true
					end,
				},
				Junker_Safe_Mode = {
					name = "Safe Mode",
					order = 61,
					desc = "Toggle to only allow Junker to sell items in batches of 12. This will allow you to use the buyback tab in case it sells something it shouldn't.\n\n" ..
					"It's recommended you enable this.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.JunkerSafeModeEnabled then
							HelpMePlayDB.JunkerSafeModeEnabled = false
						end
						return HelpMePlayDB.JunkerSafeModeEnabled
					end,
					set = function(_, val) HelpMePlayDB.JunkerSafeModeEnabled = val end,
					hidden = function()
						if HelpMePlayDB.JunkerEnabled then
							return false
						end
						return true
					end,
				},
				Junker_Soulbound_Mode = {
					name = "Soulbound Mode",
					order = 62,
					desc = "Toggle to allow Junker to sell items that are soulbound and are under a certain item level threshold.\n\n" ..
					"This feature is mutually exclusive with the |cffFFD100Preserve Transmog|r option under the Rarity dropdown.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.JunkerSoulboundModeEnabled then
							HelpMePlayDB.JunkerSoulboundModeEnabled = false
						end
						return HelpMePlayDB.JunkerSoulboundModeEnabled
					end,
					set = function(_, val)
						HelpMePlayDB.JunkerSoulboundModeEnabled = val
						if val then
							-- Set the rarity to Poor since the player enabled Soulbound Mode.
							HelpMePlayDB.RarityID = 0
						end
					end,
					hidden = function()
						if HelpMePlayDB.JunkerEnabled then
							return false
						end
						return true
					end,
				},
				Junker_Auto_Sell = {
					name = "Auto Sell",
					order = 63,
					desc = "Toggle to allow Junker to automatically sell when the merchant window is opened.",
					type = "toggle",
					get = function(_)
						if not HelpMePlayDB.JunkerAutoSellEnabled then
							HelpMePlayDB.JunkerAutoSellEnabled = false
						end
						return HelpMePlayDB.JunkerAutoSellEnabled
					end,
					set = function(_, val) HelpMePlayDB.JunkerAutoSellEnabled = val end,
					hidden = function()
						if HelpMePlayDB.JunkerEnabled then
							return false
						end
						return true
					end,
				},
				Junker_Rarity_Dropdown = {
					name = "Rarity",
					order = 64,
					desc = "Select the minimum item rarity threshold Junker should consider when selling items.\n\n" ..
					"Setting the threshold to Poor will make Junker consider all items, whereas setting it to Uncommon will tell Junker not to sell Poor or Common items.\n\n" ..
					"Preserve Transmog uses Poor as its underlying threshold but it won't sell armor or weapons. This option is mutually exclusive with Soulbound Mode.",
					type = "select",
					style = "dropdown",
					values = {
						[5] = "Preserve Transmog",
						[0] = "Poor",
						[1] = "Common",
						[2] = "Uncommon",
						[3] = "Rare",
						[4] = "Epic",
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
						if not HelpMePlayDB.RarityID then
							HelpMePlayDB.RarityID = 0
						end
						return HelpMePlayDB.RarityID
					end,
					set = function(_, rarityID)
						HelpMePlayDB.RarityID = rarityID
						if rarityID == 5 then
							if HelpMePlayDB.JunkerSoulboundModeEnabled then
								-- Disable Soulbound Mode since the player chose the Preserve Transmog option.
								HelpMePlayDB.JunkerSoulboundModeEnabled = false
							end
						end
					end,
					hidden = function()
						if HelpMePlayDB.JunkerEnabled then
							return false
						end
						return true
					end,
				},
				Junker_Import_Button = {
					name = "Import",
					order = 65,
					type = "execute",
					func = function(_, _)
						StaticPopupDialogs["HELPMEPLAY_JUNKER_IMPORT"] = {
							text = "|T132281:36|t\n\n" .. "Would you like to import a list of item IDs or import from another addon?\n\n" ..
							"Supported AddOns:\n\n" ..
							"AutoVendor\n" ..
							"Dejunk\n\n" ..
							"|cffFFD100NOTE|r: Only items shared between all characters in these addons will be imported.",
							button1 = "Import from Addon",
							button2 = "Import from List",
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
									addonTable.Print(string.format(addonTable.CONSTANTS.COLORED_ADDON_NAME .. ": " .. "Imported all items from %s to Junker!", "AutoVendor"))
								elseif IsAddOnLoaded("Dejunk") then
									for id, _ in pairs(__DEJUNK_SAVED_VARIABLES__["Global"]["sell"]["inclusions"]) do
										HelpMePlay:ImportToJunker(id, "ADD")
									end
									for id, _ in pairs(__DEJUNK_SAVED_VARIABLES__["Global"]["sell"]["exclusions"]) do
										HelpMePlay:ImportToJunker(id, "BLACKLIST")
									end
									addonTable.Print(string.format(addonTable.CONSTANTS.COLORED_ADDON_NAME .. ": " .. "Imported all items from %s to Junker!", "Dejunk"))
								else
									addonTable.Print(addonTable.CONSTANTS.COLORED_ADDON_NAME .. ": " .. "No auto sell addon enabled.")
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
									text = "|T132281:36|t\n\n" ..
									"Please paste your comma-delimited list of items in the editbox below.",
									button1 = "Add",
									button2 = "Blacklist",
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
										addonTable.Print(string.format(addonTable.CONSTANTS.COLORED_ADDON_NAME .. ": " .. "Imported %s item(s) to Junker!", count))
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
										addonTable.Print(string.format(addonTable.CONSTANTS.COLORED_ADDON_NAME .. ": " .. "Imported %s item(s) to Junker!", count))
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
					hidden = function()
						if HelpMePlayDB.JunkerEnabled then
							return false
						end
						return true
					end,
				},
				Soulbound_Mode_Item_Level = {
					name = "Soulbound Mode Item Level",
					order = 66,
					type = "range",
					min = 25,
					max = 50,
					step = 1,
					desc = "Select the minimum item level an item must be below your current item level to be sold to a merchant.\n\n" ..
					"This setting only applies when Soulbound Mode is enabled.",
					get = function()
						if not HelpMePlayDB.SoulboundModeMinItemLevel then
							HelpMePlayDB.SoulboundModeMinItemLevel = 30
						end
						return HelpMePlayDB.SoulboundModeMinItemLevel
					end,
					set = function(_, val) HelpMePlayDB.SoulboundModeMinItemLevel = val end,
					hidden = function()
						if HelpMePlayDB.JunkerEnabled then
							return false
						end
						return true
					end,
				},
				Party_Play_Advanced_Header = {
					name = "Party Play (Advanced)",
					order = 70,
					type = "header",
					hidden = function()
						if HelpMePlayDB.PartyPlayEnabled then
							return false
						end
						return true
					end,
				},
				Party_Play_Announce = {
					name = "Announce",
					order = 71,
					desc = "Automatically report quest-related activity like accepting or removing quests, slaying an enemy, collecting quest items around the quest area, etc.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.PartyPlayAnnounceEnabled then
							HelpMePlayDB.PartyPlayAnnounceEnabled = false
						end
						return HelpMePlayDB.PartyPlayAnnounceEnabled
					end,
					set = function(_, val) HelpMePlayDB.PartyPlayAnnounceEnabled = val end,
					hidden = function()
						if HelpMePlayDB.PartyPlayEnabled then
							return false
						end
						return true
					end,
				},
				Party_Play_Auto_Share = {
					name = "Auto Share",
					order = 72,
					desc = "Automatically share quests with party members as you accept them.\n\n" ..
					"For the best results, all party members should also have HelpMePlay with |cffFFD100Accept Quests|r enabled.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.PartyPlayAutoShareEnabled then
							HelpMePlayDB.PartyPlayAutoShareEnabled = false
						end
						return HelpMePlayDB.PartyPlayAutoShareEnabled
					end,
					set = function(_, val) HelpMePlayDB.PartyPlayAutoShareEnabled = val end,
					hidden = function()
						if HelpMePlayDB.PartyPlayEnabled then
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
							chromieTimeString = "Battle for Azeroth (Current Timeline)"
						elseif chromieTimeID == 5 then
							chromieTimeString = "Cataclysm"
						elseif chromieTimeID == 6 then
							chromieTimeString = "Burning Crusade"
						elseif chromieTimeID == 7 then
							chromieTimeString = "Wrath of the Lich King"
						elseif chromieTimeID == 8 then
							chromieTimeString = "Mists of Pandaria"
						elseif chromieTimeID == 9 then
							chromieTimeString = "Warlords of Draenor"
						elseif chromieTimeID == 10 then
							chromieTimeString = "Legion"
						elseif chromieTimeID == 14 then
							chromieTimeString = "Shadowlands"
						end
						
						return "|T237538:14|t " .. chromieTimeString
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
						[99] = "Disabled",
						[6] = "Burning Crusade",
						[7] = "Wrath of the Lich King",
						[5] = "Cataclysm",
						[8] = "Mists of Pandaria",
						[9] = "Warlords of Draenor",
						[10] = "Legion",
						[0] = "Battle for Azeroth",
						[14] = "Shadowlands",
					},
					sorting = { -- Sort the options chronologically by expansion.
						[1] = 99, 	-- Disabled
						[2] = 6, 	-- Burning Crusade
						[3] = 7, 	-- Wrath of the Lich King
						[4] = 5, 	-- Cataclysm
						[5] = 8, 	-- Mists of Pandaria
						[6] = 9, 	-- Warlords of Draenor
						[7] = 10, 	-- Legion
						[8] = 0, 	-- Battle for Azeroth
						[9] = 14, 	-- Shadowlands
					},
					get = function()
						if not HelpMePlayDB.ChromieTimeID then
							HelpMePlayDB.ChromieTimeID = 0 -- Battle for Azeroth (Current Timeline)
						end
						return HelpMePlayDB.ChromieTimeID
					end,
					set = function(_, chromieTimeID) HelpMePlayDB.ChromieTimeID = chromieTimeID end,
				},
				Quest_Rewards_Dropdown = {
					name = "Quest Rewards:",
					order = 3,
					desc = "Select how the addon should choose your quest rewards.",
					type = "select",
					style = "dropdown",
					values = {
						[0] = "Disabled",
						[1] = "Item Level",
						[2] = "Sell Price"
					},
					sorting = { -- Sort the options chronologically by expansion.
						[1] = 0, 	-- Disabled
						[2] = 1, 	-- Item Level
						[3] = 2, 	-- Sell Price
					},
					get = function()
						if not HelpMePlayDB.QuestRewardID then
							HelpMePlayDB.QuestRewardID = 0
						end
						return HelpMePlayDB.QuestRewardID
					end,
					set = function(_, questRewardID) HelpMePlayDB.QuestRewardID = questRewardID end,
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
				Purchase_Quest_Items = {
					name = "Purchase Quest Items",
					order = 14,
					desc = "Toggle to allow the addon to purchase quest items from merchants.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.PurchaseQuestItemsEnabled then
							HelpMePlayDB.PurchaseQuestItemsEnabled = false
						end
						return HelpMePlayDB.PurchaseQuestItemsEnabled
					end,
					set = function(_, val) HelpMePlayDB.PurchaseQuestItemsEnabled = val end,
				},
				Equip_Quest_Rewards = {
					name = "Equip Quest Rewards",
					order = 15,
					desc = "Toggle to allow the addon to equip quest rewards that are upgrades.\n\n" ..
					"This will only apply if the |cffFFD100Quest Rewards|r dropdown is set to Item Level.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.AutoEquipQuestRewardsEnabled then
							HelpMePlayDB.AutoEquipQuestRewardsEnabled = false
						end
						return HelpMePlayDB.AutoEquipQuestRewardsEnabled
					end,
					set = function(_, val) HelpMePlayDB.AutoEquipQuestRewardsEnabled = val end,
				},
				Threads_of_Fate = {
					name = "Threads of Fate",
					order = 16,
					desc = "Toggle to opt in for Threads of Fate automation.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.ThreadsOfFateEnabled then
							HelpMePlayDB.ThreadsOfFateEnabled = false
						end
						return HelpMePlayDB.ThreadsOfFateEnabled
					end,
					set = function(_, val) HelpMePlayDB.ThreadsOfFateEnabled = val end,
				},
				Show_Quest_Count = {
					name = "Show Quest Count",
					order = 17,
					desc = "Toggle to display your active quest count above the quest journal.\n\n" ..
					"This feature is unavailable if you have |cffFFD100Kaliel's Tracker|r enabled.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.ShowQuestCountEnabled then
							HelpMePlayDB.ShowQuestCountEnabled = false
						end
						return HelpMePlayDB.ShowQuestCountEnabled
					end,
					set = function(_, val) HelpMePlayDB.ShowQuestCountEnabled = val end,
					disabled = function()
						local isAddOnLoaded = false
						if IsAddOnLoaded("!KalielsTracker") then
							isAddOnLoaded = true
						end
						return isAddOnLoaded
					end,
				},
				Expansion_Intros_Header = {
					name = "Expansion Intros",
					order = 20,
					type = "header",
				},
				BFA_Intro = {
					name = "Battle for Azeroth",
					order = 21,
					desc = "Toggle to opt in to the Battle for Azeroth intro experience.",
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
				SL_Intro = {
					name = "Shadowlands",
					order = 22,
					desc = "Toggle to opt in to the Shadowlands intro experience.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.TheMawEnabled then
							HelpMePlayDB.TheMawEnabled = false
						end
						return HelpMePlayDB.TheMawEnabled
					end,
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
				Garrisons_Header = {
					name = "Garrisons",
					order = 0,
					type = "header",
				},
				Architect_Table = {
					name = "Architect Table",
					order = 1,
					desc = "Toggle to allow the addon to plot your Barracks when opening your Garrison.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.ArchitectTableEnabled then
							HelpMePlayDB.ArchitectTableEnabled = false
						end
						return HelpMePlayDB.ArchitectTableEnabled
					end,
					set = function(_, val) HelpMePlayDB.ArchitectTableEnabled = val end,
				},
				Garrison_Outposts = {
					name = "Garrison Outposts",
					order = 2,
					desc = "Toggle to allow the addon to select your Garrison outposts.\n\n" ..
					"Currently, only Gorgrond outposts will be selected.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.GarrisonOutpostsEnabled then
							HelpMePlayDB.GarrisonOutpostsEnabled = false
						end
						return HelpMePlayDB.GarrisonOutpostsEnabled
					end,
					set = function(_, val) HelpMePlayDB.GarrisonOutpostsEnabled = val end,
				},
				Mission_Table = {
					name = "Mission Table",
					order = 3,
					desc = "Toggle to allow the addon to start your first Garrison mission when opening your Garrison.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.MissionTableEnabled then
							HelpMePlayDB.MissionTableEnabled = false
						end
						return HelpMePlayDB.MissionTableEnabled
					end,
					set = function(_, val) HelpMePlayDB.MissionTableEnabled = val end,
				},
				Visions_Header = {
					name = "Visions of N'Zoth",
					order = 10,
					type = "header",
				},
				Titanic_Research = {
					name = "Titanic Research",
					order = 11,
					desc = "Toggle to add a button to the Titanic Research interface that will purchase the best traits for Visions.\n\n" ..
					"All traits will be purchased, but the addon will select the best traits for a SOLO experience first.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.TitanResearchEnabled then
							HelpMePlayDB.TitanResearchEnabled = false
						end
						return HelpMePlayDB.TitanResearchEnabled
					end,
					set = function(info, val) HelpMePlayDB.TitanResearchEnabled = val end,
				},
				Covenants_Header = {
					name = "Covenants",
					order = 20,
					type = "header",
				},
				Covenants_Dropdown = {
					name = "Covenants",
					order = 21,
					desc = "Select the covenant you would like the addon to place all your characters in.",
					type = "select",
					style = "dropdown",
					values = {
						[0] = "Disabled",
						[1] = "Kyrian",
						[2] = "Venthyr",
						[3] = "Necrolord",
						[4] = "Night Fae",
						[5] = "Auto",
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
						if not HelpMePlayDB.CovenantID then
							HelpMePlayDB.CovenantID = 0
						end
						return HelpMePlayDB.CovenantID
					end,
					set = function(_, covenantID) HelpMePlayDB.CovenantID = covenantID end,
				},
				Torghast_Header = {
					name = "Torghast",
					order = 30,
					type = "header",
				},
				Box_of_Many_Things = {
					name = "Box of Many Things",
					order = 31,
					desc = "Toggle to add a button to the Box of Many Things interface that will purchase the best traits for Torghast.\n\n" ..
					"All traits will be purchased, but the addon will select the best traits for a SOLO experience first.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.BoxOfManyThingsEnabled then
							HelpMePlayDB.BoxOfManyThingsEnabled = false
						end
						return HelpMePlayDB.BoxOfManyThingsEnabled
					end,
					set = function(_, val) HelpMePlayDB.BoxOfManyThingsEnabled = val end,
				},
				Anima_Powers = {
					name = "Anima Powers",
					order = 32,
					desc = "Toggle how the addon should handle Anima Powers.",
					type = "select",
					style = "dropdown",
					values = {
						[0] = "Disabled",
						[1] = "Notify",
						[2] = "Auto",
					},
					sorting = {
						[1] = 0, 	-- Disabled
						[2] = 1, 	-- Notify
						[3] = 2, 	-- Automatic
					},
					get = function()
						if not HelpMePlayDB.TorghastPowersID then
							HelpMePlayDB.TorghastPowersID = 0
						end
						return HelpMePlayDB.TorghastPowersID
					end,
					set = function(_, torghastPowersID) HelpMePlayDB.TorghastPowersID = torghastPowersID end,
				},
            },
        },
		Zone_Selection_Tab = {
            name = "Zone Selection",
			desc = "Define which zones the addon should choose when interacting with Adventure Maps.",
            type = "group",
            order = 5,
            args = {
				Zone_Selection_BFA = {
					name = "Battle for Azeroth",
					order = 1,
					desc = "Select the zone the addon should choose when interacting with the call board in Boralus or Dazar'alor.",
					type = "select",
					style = "dropdown",
					values = function()
						if UnitFactionGroup("player") == "Alliance" then
							values = {
								[0] = "Disabled",
								[47962] = "|T2065627:0|t " .. (C_Map.GetMapInfo(942)).name, -- Stormsong Valley
								[47960] = "|T2065630:0|t " .. (C_Map.GetMapInfo(895)).name, -- Tiragarde Sound
								[47961] = "|T2065567:0|t " .. (C_Map.GetMapInfo(896)).name, -- Drustvar
							}
						else
							values = {
								[0] = "Disabled",
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
					set = function(_, zoneID)
						local faction = UnitFactionGroup("player")
						HelpMePlayDB.ZoneId_BFA[faction] = zoneID
					end,
				},
				Zone_Selection_Shadowlands = {
					name = "Shadowlands",
					order = 2,
					desc = "Select the zone the addon should choose when interacting with the call board in Oribos.",
					type = "select",
					style = "dropdown",
					values = {
						[0] = "Disabled",
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
						if not HelpMePlayDB.ZoneID_SL then
							HelpMePlayDB.ZoneID_SL = 0
						end
						return HelpMePlayDB.ZoneID_SL
					end,
					set = function(_, zoneID) HelpMePlayDB.ZoneID_SL = zoneID end,
				},
				Zone_Selection_DF = {
					name = "Dragonflight",
					order = 3,
					desc = "Select the zone the addon should choose when interacting with the call board in The Waking Shores.",
					type = "select",
					style = "dropdown",
					values = {
						[0] = "Disabled",
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
				Enable = {
					name = "Enable",
					order = 1,
					desc = "Toggle to enable the ability for the addon to mute sounds.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.SoundsEnabled then
							HelpMePlayDB.SoundsEnabled = false
						end
						return HelpMePlayDB.SoundsEnabled
					end,
					set = function(_, val) HelpMePlayDB.SoundsEnabled = val end,
				},
				Sounds_Header = {
					name = "Sounds",
					order = 2,
					type = "header",
				},
				Sound_Input = {
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
								print(addonTable.CONSTANTS.COLORED_ADDON_NAME .. ": |cffFFD100" .. soundID .. "|r isn't a valid sound ID.")
							end
						end
					end,
				},
            },
        },
		Extras_Tab = {
            name = "Extras",
			desc = "Toggle the use of bonus settings.",
            type = "group",
            order = 7,
            args = {
				Toggle_Header = {
					name = "Toggles",
					order = 0,
					type = "header",
				},
				Talking_Head = {
					name = "Talking Head",
					order = 1,
					desc = "Toggle to silence talking heads once and for all!",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.TalkingHeadEnabled then
							HelpMePlayDB.TalkingHeadEnabled = false
						end
						return HelpMePlayDB.TalkingHeadEnabled
					end,
					set = function(_, val) HelpMePlayDB.TalkingHeadEnabled = val end,
				},
				Wave_at_Players = {
					name = "Wave at Players",
					order = 2,
					desc = "Toggle to have a ridiculously small chance to wave at a player when you click on them.\n\n" ..
					"The chance is approximately the same as the X-45 Heartbreaker dropping for you. Good luck!",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.WaveAtPlayersEnabled then
							HelpMePlayDB.WaveAtPlayersEnabled = false
						end
						return HelpMePlayDB.WaveAtPlayersEnabled
					end,
					set = function(_, val) HelpMePlayDB.WaveAtPlayersEnabled = val end,
				},
				Quest_Mobs_Header = {
					name = "Quest Mobs",
					order = 10,
					type = "header",
				},
				Quest_Mobs = {
					name = "Quest Mobs",
					order = 11,
					desc = "Toggle to add an icon above the nameplate of NPCs required for an active quest.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.QuestMobsEnabled then
							HelpMePlayDB.QuestMobsEnabled = false
						end
						return HelpMePlayDB.QuestMobsEnabled
					end,
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
				Quest_Mobs_Icon = {
					name = "Quest Mobs Icon",
					order = 12,
					desc = "Choose an icon, either the default or a custom one, to place above the nameplate.",
					type = "select",
					style = "dropdown",
					values = {
						[0] = "Default",
						[1] = "Custom",
					},
					sorting = {
						[1] = 0,
						[2] = 1,
					},
					get = function()
						if not HelpMePlayDB.QuestMobIcon then
							HelpMePlayDB.QuestMobIconID = 0
							HelpMePlayDB.QuestMobIcon = "Mobile-QuestIcon"
						end
						return HelpMePlayDB.QuestMobIconID
					end,
					set = function(_, iconID)
						local namePlates = C_NamePlate.GetNamePlates()
						local icon = ""
						
						if iconID == 0 then
							icon = "Mobile-QuestIcon"
						elseif iconID == 1 then
							StaticPopupDialogs["HELPMEPLAY_QUESTMOBSICON_CUSTOM"] = {
								text = "Enter the icon name that you wish to have on quest NPC nameplates.\n\n" ..
								"The icon name can be siphoned from Wowhead by clicking on the icon for a spell, achievement, etc.\n\n" ..
								"You can refer to the addon's README if you need more assistance.",
								button1 = "OK",
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
								if iconID == 0 then
									namePlates[i][addonName.."Icon"]:SetAtlas(icon)
								end
							end
						end
						
						HelpMePlayDB.QuestMobIconID = iconID
						
						if iconID == 0 then
							HelpMePlayDB.QuestMobIcon = icon
						end
					end,
				},
				Quest_Mobs_Icon_Position = {
					name = "Position",
					order = 13,
					desc = "Select where to place the icon on the nameplate.",
					type = "select",
					style = "dropdown",
					values = {
						[0] = "Top",
						[1] = "Bottom",
						[2] = "Left",
						[3] = "Right",
						[4] = "TopLeft",
						[5] = "TopRight",
						[6] = "BottomLeft",
						[7] = "BottomRight",
						[8] = "Center",
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
					set = function(_, iconPositionID)
						HelpMePlayDB.QuestMobIconPosition = iconPositionID
					end,
				},
				Quest_Mobs_Icon_XOffset = {
					name = "X Offset",
					order = 14,
					type = "range",
					min = -50,
					max = 50,
					step = 2,
					desc = "Choose how far on the x-axis the icon should be.",
					get = function()
						if not HelpMePlayDB.QuestMobIconXOffset then
							HelpMePlayDB.QuestMobIconXOffset = 0
						end
						return HelpMePlayDB.QuestMobIconXOffset
					end,
					set = function(_, val) HelpMePlayDB.QuestMobIconXOffset = val end,
				},
				Quest_Mobs_Icon_YOffset = {
					name = "Y Offset",
					order = 15,
					type = "range",
					min = -50,
					max = 50,
					step = 2,
					desc = "Choose how far on the y-axis the icon should be.",
					get = function()
						if not HelpMePlayDB.QuestMobIconYOffset then
							HelpMePlayDB.QuestMobIconYOffset = 0
						end
						return HelpMePlayDB.QuestMobIconYOffset
					end,
					set = function(_, val) HelpMePlayDB.QuestMobIconYOffset = val end,
				},
				Personal_Health_Header = {
					name = "Personal Health",
					order = 20,
					type = "header",
				},
				Water_Reminder = {
					name = "Water Reminder",
					order = 21,
					desc = "Toggle to have the addon remind you that you need to drink water.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.WaterReminderEnabled then
							HelpMePlayDB.WaterReminderEnabled = false
						end
						return HelpMePlayDB.WaterReminderEnabled
					end,
					set = function(_, val) HelpMePlayDB.WaterReminderEnabled = val end,
				},
				Water_Reminder_Min_Delay = {
					name = "Minimum Reminder Delay",
					order = 22,
					type = "range",
					min = 5,
					max = 30,
					step = 1,
					desc = "Select the minimum amount of time between reminders.",
					get = function()
						if not HelpMePlayDB.WaterReminderMinDelay then
							HelpMePlayDB.WaterReminderMinDelay = 10
						end
						return HelpMePlayDB.WaterReminderMinDelay
					end,
					set = function(_, val) HelpMePlayDB.WaterReminderMinDelay = val end,
				},
				Water_Reminder_Max_Delay = {
					name = "Maximum Reminder Delay",
					order = 23,
					type = "range",
					min = 5,
					max = 30,
					step = 1,
					desc = "Select the maximum amount of time between reminders.",
					get = function()
						if not HelpMePlayDB.WaterReminderMaxDelay then
							HelpMePlayDB.WaterReminderMaxDelay = 20
						end
						return HelpMePlayDB.WaterReminderMaxDelay
					end,
					set = function(_, val) HelpMePlayDB.WaterReminderMaxDelay = val end,
				},
				Party_Invitations_Header = {
					name = "Party Invitations",
					order = 30,
					type = "header",
				},
				Auto_Invite = {
					name = "Auto Invite",
					order = 31,
					desc = "Toggle to allow the addon to process whispers for inviting players.",
					type = "toggle",
					get = function()
						if not HelpMePlayDB.AutoInviteEnabled then
							HelpMePlayDB.AutoInviteEnabled = false
						end
						return HelpMePlayDB.AutoInviteEnabled
					end,
					set = function(_, val) HelpMePlayDB.AutoInviteEnabled = val end,
				},
				Invite_Keyword = {
					name = "Invite Keyword",
					order = 32,
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
            order = 8,
            args = {
				Player_Talents_Header = {
					name = "Player Talents",
					order = 1,
					type = "header",
				},
				Player_Class_Dropdown = {
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
						[1] = 6, 	-- Death Knight
						[2] = 12, 	-- Demon Hunter
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
				Class_Specialization_Dropdown = {
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
				Talent_Import_Button = {
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
									print(addonTable.CONSTANTS.COLORED_ADDON_NAME .. ": Please open the talent interface once before trying to import a custom loadout.")
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
            order = 9,
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
					name = coloredDash .. "Updated the description of some settings.\n\n" ..
					coloredDash .. "Migrated all of the \"System\" features to the |cffFFD100Features|r tab.",
					order = 21,
					type = "description",
					fontSize = "medium",
				},
				fixedHeader = {
					name = "Fixed",
					order = 30,
					type = "header",
				},
				fixedText = {
					name = coloredDash .. "When learning a talent, something should now always be reported to the chat frame.",
					order = 31,
					type = "description",
					fontSize = "medium",
				},
				removedHeader = {
					name = "Removed",
					order = 40,
					type = "header",
				},
				removedText = {
					name = coloredDash .. "Removed the Party Members setting from the |cffFFD100Extras|r menu." ..
					coloredDash .. "Removed multiple commands.",
					order = 41,
					type = "description",
					fontSize = "medium",
				},
            },
		},
		About_Tab = {
            name = "About",
			desc = "Learn about the addon and its author.",
            type = "group",
            order = 10,
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
				Acknowledgments_Header = {
					name = "Acknowledgments",
					order = 10,
					type = "header",
				},
				krakenLatteBtn = {
					name = "|cff7C38DFKraken Latte|r",
					order = 11,
					type = "execute",
					desc = "Kraken is an avid World of Warcraft player! She has extensive knowledge of game story and an insurmountable amount of leveling experience.\n\n" ..
					"Her content has inspired me to spend countless hours pouring over the codebase of the addon, bringing all of you the best product I can.\n\n" ..
					"If you're interested, she uploads frequently to her YouTube channel and began streaming live on Twitch.tv!\n\n" ..
					"Click this button to get a link to her YouTube channel.",
					image = "Interface/AddOns/HelpMePlay/Assets/Acknowledgments/Icon_Ack_KrakenLatte",
					func = function(_, _)
						StaticPopupDialogs["HELPMEPLAY_ACK_KRAKENLATTE"] = {
							text = "Thanks for showing an interest in Kraken Latte's content! She'll be enthused to have you around.\n\n" ..
							"Copy the YouTube link below. Enjoy!",
							button1 = "OK",
							OnShow = function(self, data)
								self.editBox:SetText("https://www.youtube.com/c/KrakenLatte")
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
						StaticPopup_Show("HELPMEPLAY_ACK_KRAKENLATTE")
					end,
				},
				gildedCanaryBtn = {
					name = "|cffF1E2B7Gilded Canary|r",
					order = 12,
					type = "execute",
					desc = "Canary is a prominent member of Kraken's community. She plays the game in her free time and is a wonderful artist.\n\n" ..
					"She's provided feedback over the past few months that has led to enhancements in features like Cinematics, Gossips, and Party Play.\n\n" ..
					"If you're looking for an artist, click here to get the link to her Twitter and find out if her commissions are open!",
					image = "Interface/AddOns/HelpMePlay/Assets/Acknowledgments/Icon_Ack_GildedCanary",
					func = function(_, _)
						StaticPopupDialogs["HELPMEPLAY_ACK_GILDEDCANARY"] = {
							text = "Thank you for showing an interest in Gilded Canary's artistry!\n\n" ..
							"Copy the Twitter link below. Enjoy!",
							button1 = "OK",
							OnShow = function(self, data)
								self.editBox:SetText("https://twitter.com/theGildedCanary")
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
						StaticPopup_Show("HELPMEPLAY_ACK_GILDEDCANARY")
					end,
				},
            },
        },
		Issue_Button = {
			name = "Open Issue",
			desc = "Click the button to get a link to the GitHub page to open a bug report, feature suggestion, or to request a change.",
			order = 11,
			type = "execute",
			func = function(_, _)
				StaticPopupDialogs["HELPMEPLAY_GITHUB_POPUP"] = {
					text = "|T236688:36|t\n\n" ..
					"Copy the link below, and thank you for opening an issue!",
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