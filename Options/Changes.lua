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
		--[[addedHeader = {
			name = "Added",
			order = 10,
			type = "header",
		},
		addedText = {
			name = "",
			order = 11,
			type = "description",
			fontSize = "medium",
		},]]
		updatedHeader = {
			name = "Changed / Updated",
			order = 20,
			type = "header",
		},
		updatedText = {
			name = coloredDash .. "Updated the flight to Ashran for the Alliance to require the player to be on the |cffFFD100Ashran Appearance|r quest.\n" ..
			coloredDash .. "Updated the quest hub icon under the Waypoints automation.\n\n" ..
			"     |cffFFD100Old|r: |T236668:0|t\n" ..
			"     |cffFFD100New|r: |T236671:0|t\n\n" ..
			coloredDash .. "Updated the flow of Waypoints in The Azure Span. Each documented quest should add one or two waypoints at the most.",
			order = 21,
			type = "description",
			fontSize = "medium",
		},
		updatedAuthorNoteText = {
			name = "     |cff009AE4This should make the flow of the route feel more fluid and natural, opposed to plotting a dozen waypoints at once. The Waking Shores will be reworked in the next release.|r",
			order = 22,
			type = "description",
			fontSize = "small",
		},
		--[[fixedHeader = {
			name = "Fixed",
			order = 30,
			type = "header",
		},
		fixedText = {
			--name = "",
			order = 31,
			type = "description",
			fontSize = "medium",
		},]]
		--[[removedHeader = {
			name = "Removed",
			order = 40,
			type = "header",
		},
		removedText = {
			name = "",
			order = 41,
			type = "description",
			fontSize = "medium",
		},]]
		--[[recommendedHeader = {
			name = "Recommended",
			order = 50,
			type = "header",
		},]]
	},
}
addonTable.changesOptions = changesOptions