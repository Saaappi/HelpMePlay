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
					return 0
				else
					return HelpMePlayDB.RarityId
				end
			end,
			set = function(_, rarityId) HelpMePlayDB.RarityId = rarityId end,
		},
	},
}
addonTable.junkerOptions = junkerOptions