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
			name = coloredDash .. "Added a waypoint to The Azure Span, marking a location for a Tuskarr Chest (rewards player experience).\n" ..
			coloredDash .. "Added an additional waypoint between Varsek and the next main quest in The Azure Span.\n" ..
			coloredDash .. "Added a note to |cffFFD100Brena|r, |cffFFD100Lukoturukk|r and |cffFFD100Bukarakikk's|r tooltips when the player is less than 70 to not accept any (or some) of their quests.\n" ..
			coloredDash .. "Added an additional waypoint in The Azure Span to mark the merchant that sells |T237302:0|t Frigidfish for the |cffFFD100Can We Keep It?|r quest.",
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
			name = coloredDash .. "Updated the sound input to accept multiple entries, allowing the player to mute multiple sounds at once.\n" ..
			coloredDash .. "Changed the waypoint trigger for Step 5 in The Azure Span.\n" ..
			coloredDash .. "Changed the waypoint trigger for Step 8 in The Azure Span.\n" ..
			coloredDash .. "Changed the waypoint trigger for Step 10 in The Azure Span.\n" ..
			"   |cff009AE4Step 10 won't be plotted until both quest chains in Camp Nowhere have been completed.|r\n" ..
			coloredDash .. "Changed the waypoint trigger for Step 15 in The Azure Span.\n" ..
			coloredDash .. "Changed the waypoint trigger for Step 16 in The Azure Span.\n" ..
			coloredDash .. "Changed the waypoint trigger for Step 23 in The Azure Span.\n" ..
			coloredDash .. "Changed the waypoint triggers for Steps 1-2 in The Waking Shores.\n" ..
			"   |cff009AE4What's plotted first will depend on the player's faction. Alliance get the |cffFFD100Primal Scythid Queen|r while the Horde get the |cffFFD100Ancient Hornswog|r. Upon killing the respective rare, the other will be plotted automatically.|r",
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
		fixedHeader = {
			name = "Fixed",
			order = 30,
			type = "header",
		},
		fixedText = {
			name = coloredDash .. "Fixed the coordinates for Step 24 in The Azure Span.",
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
			name = coloredDash .. "Removed |cffFFD100Lake Frog|r, |cffFFD100Kael'thas Sunstrider|r (during Venthyr campaign), and the |cffFFD100Exposed Boggart|r from the Notes table.\n" ..
			coloredDash .. "Removed the |cffFFD100Explorers in Peril|r waypoint.\n" ..
			coloredDash .. "Removed the |cffFFD100Where's Wrathion?|r waypoint.\n" ..
			coloredDash .. "Removed the |cffFFD100Adventuring in the Dragon Isles|r waypoint.",
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