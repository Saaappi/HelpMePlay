local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

--Icons for acknowledgment buttons need to be 32x32 and in TGA format.

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
			name = "|cffFFD100Author|r: " .. "Lightsky",
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