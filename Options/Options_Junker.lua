local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local numTabs = 4
local icon = ""

local junkerOptions = {
	name = L_GLOBALSTRINGS["Tabs.Junker"],
	handler = HelpMePlay,
	type = "group",
	args = {
		enable = {
			name = L_GLOBALSTRINGS["General.Toggle.Enable"],
			order = 0,
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
		safe_mode = {
			name = L_GLOBALSTRINGS["Junker.Toggle.SafeMode"],
			order = 1,
			desc = L_GLOBALSTRINGS["Junker.Toggle.SafeModeDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.JunkerSafeModeEnabled end,
			set = function(_, val) HelpMePlayDB.JunkerSafeModeEnabled = val end,
		},
		soulbound_mode = {
			name = L_GLOBALSTRINGS["Junker.Toggle.SoulboundMode"],
			order = 2,
			desc = L_GLOBALSTRINGS["Junker.Toggle.SoulboundModeDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.JunkerSoulboundModeEnabled end,
			set = function(_, val) HelpMePlayDB.JunkerSoulboundModeEnabled = val end,
		},
		importBtn = {
			name = L_GLOBALSTRINGS["Junker.Button.Import"],
			order = 3,
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
		toggle_header = {
			name = L_GLOBALSTRINGS["Header.Toggles"],
			order = 10,
			type = "header",
		},
		junker_armor = {
			name = L_GLOBALSTRINGS["Junker.Toggle.JunkerArmor"],
			order = 11,
			desc = L_GLOBALSTRINGS["Junker.Toggle.JunkerArmorDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.Armor end,
			set = function(_, val) HelpMePlayDB.Armor = val end,
		},
		junker_consumable = {
			name = L_GLOBALSTRINGS["Junker.Toggle.JunkerConsumable"],
			order = 12,
			desc = L_GLOBALSTRINGS["Junker.Toggle.JunkerConsumableDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.Consumable end,
			set = function(_, val) HelpMePlayDB.Consumable = val end,
		},
		dropdown_header = {
			name = L_GLOBALSTRINGS["Header.DropDowns"],
			order = 20,
			type = "header",
		},
		junker_rarity_dropdown = {
			name = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Title"],
			order = 21,
			desc = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Desc"],
			type = "select",
			style = "dropdown",
			values = {
				[0] = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Poor"],
				[1] = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Common"],
				[2] = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Uncommon"],
				[3] = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Rare"],
				[4] = L_GLOBALSTRINGS["DropDowns.Junker.Rarity.Epic"],
			},
			get = function()
				if not HelpMePlayDB.RarityId then
					HelpMePlayDB.RarityId = 0
				end
				return HelpMePlayDB.RarityId
			end,
			set = function(_, rarityId) HelpMePlayDB.RarityId = rarityId end,
		},
	},
}
addonTable.junkerOptions = junkerOptions