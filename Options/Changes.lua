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
		--[[updatedHeader = {
			name = "Changed / Updated",
			order = 20,
			type = "header",
		},
		updatedText = {
			name = "",
			order = 21,
			type = "description",
			fontSize = "medium",
		},]]
		fixedHeader = {
			name = "Fixed",
			order = 30,
			type = "header",
		},
		fixedText = {
			name = coloredDash .. "Fixed an issue that caused the Gossip automation to always load the Dragonflight gossip table regardless of the player's current map.\n\n" ..
			"   |cff009AE4This was caused by half of a check for the map's type being compared against the map ID opposed to the map's type. This led to further recursion than was intended.|r",
			order = 31,
			type = "description",
			fontSize = "medium",
		},
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
	},
}
addonTable.changesOptions = changesOptions