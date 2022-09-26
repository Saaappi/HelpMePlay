local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local main = {
	name = addonName,
	handler = HelpMePlay,
	type = "group",
	args = {
		about_header = {
			name = L_GLOBALSTRINGS["Header.About"],
			order = 0,
			type = "header",
		},
		versionText = {
			name = L_GLOBALSTRINGS["MainOptions.Version"],
			order = 1,
			type = "description",
		},
		authorText = {
			name = L_GLOBALSTRINGS["MainOptions.Author"],
			order = 2,
			type = "description",
		},
		contactText = {
			name = L_GLOBALSTRINGS["MainOptions.Contact"],
			order = 3,
			type = "description",
		},
		resources_header = {
			name = L_GLOBALSTRINGS["Header.Resources"],
			order = 10,
			type = "header",
		},
		issueBtn = {
			name = L_GLOBALSTRINGS["General.Button.OpenIssue"],
			order = 11,
			type = "execute",
			func = function(_, _)
				StaticPopupDialogs["HELPMEPLAY_GITHUB_POPUP"] = {
					text = L_GLOBALSTRINGS["General.Button.OpenIssue.Text"],
					button1 = "OK",
					OnShow = function(self, data)
						self.editBox:SetText("https://github.com/Saaappi/HelpMePlay/issues/new")
						self.editBox:HighlightText()
					end,
					timeout = 30,
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