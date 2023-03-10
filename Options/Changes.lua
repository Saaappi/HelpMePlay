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
			name = coloredDash .. "Added the ability for the player to import their own talent loadouts for individual classes and specializations.\n\n" ..
			"   |cff009AE4Talent loadouts must be imported under the class and specialization for which it's intended. Only one custom loadout is supported for each class and specialization.|r",
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
			name = coloredDash .. "Updated the TOC to support Patch 10.0.7.",
			order = 21,
			type = "description",
			fontSize = "medium",
		},
		--[[fixedHeader = {
			name = "Fixed",
			order = 30,
			type = "header",
		},
		fixedText = {
			name = "",
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
	},
}
addonTable.changesOptions = changesOptions