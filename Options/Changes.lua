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
			name = coloredDash .. "Added a text indicator to the Quests section of the options to display which expansion of Chromie Time the player is in.\n" ..
			coloredDash .. "Accepting In Tyr's Footsteps will now plot all rare waypoints from Kraken Latte's 60-70 leveling guide.\n" ..
			coloredDash .. "Accepting specific quests within The Azure Span route, will now plot related quest and rare waypoints for The Azure Span leveling route.\n" ..
			coloredDash .. "Accepting specific quests within The Waking Shores route, will now plot related quest and rare waypoints for The Waking Shores leveling route.\n" ..
			coloredDash .. "Added a new waypoint (wp) command that can be used with a quest ID to re-plot all related coordinates. For example, |cffFFD100/hmp waypoint 65686|r will plot all waypoints related to the To the Azure Span quest.\n" ..
			coloredDash .. "Added an input box so the player can dictate how much gold HelpMePlay can spend to for training.\n" ..
			coloredDash .. "Added a new feature under Extras that allows HelpMePlay to automatically invite players when they whisper you the specified keyword.",
			order = 11,
			type = "description",
			fontSize = "small",
		},
		updatedHeader = {
			name = "Changed / Updated",
			order = 20,
			type = "header",
		},
		updatedText = {
			name = coloredDash .. "If Queues is enabled, you should now automatically accept the queue popup when the party leader initiates a queue.\n" ..
			coloredDash .. "Migrated the changes list from Github to a new tab in the options menu.\n" ..
			coloredDash .. "Updated the README to account for all the latest changes.",
			order = 21,
			type = "description",
			fontSize = "small",
		},
		fixedHeader = {
			name = "Fixed",
			order = 30,
			type = "header",
		},
		fixedText = {
			name = coloredDash .. "Fixed an issue regarding gossip for Noriko the All-Remembering in The Azure Span during the For The Love of Others quest.",
			order = 31,
			type = "description",
			fontSize = "small",
		},
		removedHeader = {
			name = "Removed",
			order = 40,
			type = "header",
		},
		removedText = {
			--name = "|cffFF0000Nothing was removed in this release.|r",
			name = coloredDash .. "Removed Lake Frog from the Emote table. Therefore, HelpMePlay will no longer /kiss the Lake Frogs in Grizzly Hills.",
			order = 41,
			type = "description",
			fontSize = "small",
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