local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local coloredDash = "|cffFFD100-|r "
--local authorNote = "|cff009AE4"

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
			--name = coloredDash .. "Added the ability for HelpMePlay to ignore specific quest rewards from being equipped. The |cffFFD100Wind-Sealed Mana Capsule|r is the only item on the list...for now.\n" ..
			--coloredDash .. "Automated the gossips for the Maidens of Inspiration during the Tyr quests.",
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
			--name = coloredDash .. "|cffFF0000Nothing was updated in this release.",
			name = coloredDash .. "Updated the quest hub icon under the Waypoints automation.\n" ..
			coloredDash .. "Updated the flow of Waypoints in The Azure Span. Each documented quest should add one or two waypoints at the most.",
			order = 21,
			type = "description",
			fontSize = "medium",
		},
		updatedAuthorNoteText = {
			name = "     Author Note: |cff009AE4This should make the flow of the route feel more fluid and natural, opposed to plotting a dozen waypoints at once.|r",
			order = 22,
			type = "description",
			fontSize = "small",
		},
		fixedHeader = {
			name = "Fixed",
			order = 30,
			type = "header",
		},
		fixedText = {
			name = coloredDash .. "|cffFF0000Nothing was fixed in this release.|r",
			--name = coloredDash .. "Fixed an issue that I caused in 2.0.13 that prevented most looted items from being equipped.",
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
			name = coloredDash .. "|cffFF0000Nothing was removed in this release.|r",
			order = 41,
			type = "description",
			fontSize = "medium",
		},
		--[[recommendedHeader = {
			name = "Recommended",
			order = 50,
			type = "header",
		},]]
	},
}
addonTable.changesOptions = changesOptions