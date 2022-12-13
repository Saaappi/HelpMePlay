local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local main = {
	name = addonName,
	handler = HelpMePlay,
	type = "group",
	args = {
		festiveText = {
			name = function()
				if date("%m") == "02" then
					return L_GLOBALSTRINGS["MainOptions.Festive.LoveIsInTheAir"]
				elseif date("%m") == "10" then
					return L_GLOBALSTRINGS["MainOptions.Festive.HallowsEnd"]
				elseif date("%m") == "12" then
					return L_GLOBALSTRINGS["MainOptions.Festive.WinterVeil"]
				end
			end,
			order = 0,
			fontSize = "medium",
			type = "description",
		},
		festiveSpecialItemBtn = {
			name = function()
				if date("%m") == "02" then
					return "|cffA335EE[X-45 Heartbreaker]|r"
				elseif date("%m") == "10" then
					return "|cffA335EE[The Horseman's Reins]|r"
				elseif date("%m") == "12" then
					return "|cffA335EE[Minion of Grumpus]|r"
				end
			end,
			order = 1,
			image = function()
				if date("%m") == "02" then
					return "Interface\\ICONS\\inv_rocketmountpink"
				elseif date("%m") == "10" then
					return "Interface\\ICONS\\inv_belt_12"
				elseif date("%m") == "12" then
					return "Interface\\ICONS\\inv_misc_pet_pandaren_yeti_grey"
				end
			end,
			type = "execute",
			tooltipHyperlink = function()
				if date("%m") == "02" then
					return "|cffa335ee|Hitem:50250::::::::27:253::::::::|h[X-45 Heartbreaker]|h|r"
				elseif date("%m") == "10" then
					return "|cffa335ee|Hitem:37012::::::::27:253::::::::|h[The Horseman's Reins]|h|r"
				elseif date("%m") == "12" then
					return "|cffa335ee|Hitem:128671::::::::27:253::::::::|h[Minion of Grumpus]|h|r"
				end
			end,
		},
		aboutHeader = {
			name = L_GLOBALSTRINGS["Header.About"],
			order = 2,
			type = "header",
		},
		versionText = {
			name = L_GLOBALSTRINGS["MainOptions.Version"],
			order = 3,
			type = "description",
		},
		authorText = {
			name = L_GLOBALSTRINGS["MainOptions.Author"],
			order = 4,
			type = "description",
		},
		contactText = {
			name = L_GLOBALSTRINGS["MainOptions.Contact"],
			order = 5,
			type = "description",
		},
		acknowledgmentsHeader = {
			name = L_GLOBALSTRINGS["Header.Acknowledgments"],
			order = 10,
			type = "header",
		},
		krakenLatteBtn = {
			name = L_GLOBALSTRINGS["MainOptions.Button.Acknowledgments.KrakenLatte.Title"],
			order = 11,
			type = "execute",
			desc = L_GLOBALSTRINGS["MainOptions.Button.Acknowledgments.KrakenLatte.Desc"],
			image = "Interface/AddOns/HelpMePlay/Assets/Acknowledgments/Icon_Ack_KrakenLatte",
			func = function(_, _)
				StaticPopupDialogs["HELPMEPLAY_ACK_KRAKENLATTE"] = {
					text = L_GLOBALSTRINGS["MainOptions.Button.Acknowledgments.KrakenLatte.Text"],
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
		resourcesHeader = {
			name = L_GLOBALSTRINGS["Header.Resources"],
			order = 20,
			type = "header",
		},
		issueBtn = {
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
addonTable.main = main