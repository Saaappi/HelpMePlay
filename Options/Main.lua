local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local main = {
	name = addonName,
	handler = HelpMePlay,
	type = "group",
	args = {
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
			name = "Lightsky",
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