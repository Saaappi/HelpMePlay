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
			name = coloredDash .. "Updated the sound input to accept multiple entries, allowing the player to mute multiple sounds at once.\n" ..
			coloredDash .. "Changed the waypoint trigger for Step 5 in The Azure Span.\n" ..
			coloredDash .. "Changed the waypoint trigger for Step 8 in The Azure Span.\n" ..
			coloredDash .. "Changed the waypoint trigger for Step 10 in The Azure Span.\n" ..
			"     |cff009AE4Step 10 won't be plotted until both quest chains in Camp Nowhere have been completed.|r\n\n" ..
			coloredDash .. "TEST!",
			order = 21,
			type = "description",
			fontSize = "medium",
		},
		--[[updatedAuthorNoteText = {
			name = "",
			order = 22,
			type = "description",
			fontSize = "small",
		},]]
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