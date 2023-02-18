local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local coloredDash = "|cffFFD100-|r "
local speechBubble = "charactercreate-icon-customize-speechbubble-selected"

local changesOptions = {
	name = "Changes",
	handler = HelpMePlay,
	type = "group",
	args = {
		versionText = {
			name = "|cffFFD100" .. GetAddOnMetadata(addonName, "Version") .. "|r",
			order = 0,
			type = "description",
			fontSize = "large",
		},
		codenameText = {
			name = "Chromie (|cffFFD100" .. "Dragonflight" .. "|r)",
			order = 1,
			type = "description",
			fontSize = "medium",
		},
		addedHeader = {
			name = "Added",
			order = 10,
			type = "header",
		},
		addedText = {
			name = coloredDash .. "|cffFF0000Nothing was added in this release.",
			order = 11,
			type = "description",
			fontSize = "medium",
		},
		updatedHeader = {
			name = "Changed / Updated",
			order = 20,
			type = "header",
		},
		updatedText = {
			name = coloredDash .. "|cffFF0000Nothing was updated in this release.",
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
			name = coloredDash .. "Fixed an issue that I caused in 2.0.13 that prevented most looted items from being equipped.",
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
			name = "|cffFF0000Nothing was removed in this release.|r",
			order = 41,
			type = "description",
			fontSize = "medium",
		},
		recommendedHeader = {
			name = "Recommended",
			order = 50,
			type = "header",
		},
		levelingGuideBtn = {
			name = "60-70 Guide",
			order = 51,
			type = "execute",
			--desc = "",
			func = function(_, _)
				StaticPopupDialogs["HELPMEPLAY_ACK_LEVELGUIDE"] = {
					text = "|T1129713:32|t " .. CreateAtlasMarkup(speechBubble, 32, 32) .. "\n\n" ..
					"Be sure to check out Kraken Latte's short play video of her 60-70 leveling route!\n\n" ..
					"This button won't be available in the next release, so be sure to use it now!\n\n",
					button1 = "OK",
					OnShow = function(self, data)
						self.editBox:SetText("https://www.youtube.com/watch?v=fpGbVepwKiI")
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
				StaticPopup_Show("HELPMEPLAY_ACK_LEVELGUIDE")
			end,
		},
	},
}
addonTable.changesOptions = changesOptions