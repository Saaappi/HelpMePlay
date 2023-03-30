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
			name = coloredDash .. "",
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
			name = coloredDash .. "While targeting an NPC, players can now use |cffFFD100/hmp gossip|r to wipe all gossips for the NPC. (This is the same as writing |cffFFD100/hmp gossip 0|r while targeting the NPC.)\n" ..
			coloredDash .. "An NPC must have a gossip entry now before the player can use the |cffFFD100/hmp confirm|r command for them.",
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
			name = coloredDash .. "Fixed an issue that would allow a player to add gossips for an NPC when their gossip options were unavailable.\n" ..
			coloredDash .. "Fixed an issue that caused the game to crash when the player added a gossip that has an associated confirmation. (|cff009AE4e.g. Asking a Stable Master to mend your battle pets.|r)",
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