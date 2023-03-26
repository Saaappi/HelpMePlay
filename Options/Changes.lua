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
			name = coloredDash .. "Added support for the new Dragonriding traits.",
			order = 11,
			type = "description",
			fontSize = "medium",
		},
		--[[updatedHeader = {
			name = "Changed / Updated",
			order = 20,
			type = "header",
		},
		updatedText = {
			name = coloredDash .. "Updated the TOC to support Patch 10.0.7.\n" ..
			coloredDash .. "Updated all talent builds to support Patch 10.0.7. Some talent builds were also updated due to changes in the new patch.",
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
			name = coloredDash .. "Fixed an issue where the payload quest ID was nil when accepting a quest.\n" ..
			coloredDash .. "Fixed an issue in the Merchants automation when the GUID is nil.\n" ..
			coloredDash .. "Fixed an issue that would cause successive gossips not to be selected when speaking with the same NPC.",
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
			name = coloredDash .. "Removed the code that allowed HelpMePlay to accept LFD queues on behalf of the player. (|cff009AE4This was patched in 10.0.7 and is no longer possible.|r)",
			order = 41,
			type = "description",
			fontSize = "medium",
		},
	},
}
addonTable.changesOptions = changesOptions