local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local systemsOptions = {
	name = L_GLOBALSTRINGS["Tabs.Systems"],
	handler = HelpMePlay,
	type = "group",
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
		soulboundModeMinItemLevelSlider = {
			name = L_GLOBALSTRINGS["Junker.Toggle.SoulboundModeItemLevel"],
			order = 6,
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
		importBtn = {
			name = L_GLOBALSTRINGS["Junker.Button.Import"],
			order = 7,
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
}
addonTable.systemsOptions = systemsOptions