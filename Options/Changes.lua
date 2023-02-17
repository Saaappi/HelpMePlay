local addonName, addonTable = ...
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

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
			name = "Chromie",
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
			name = "- Added a text indicator to the Quests section of the options to display which expansion of Chromie Time the player is in.\n" ..
			"- Accepting In Tyr's Footsteps will now plot all rare waypoints from Kraken Latte's 60-70 leveling guide.\n" ..
			"- Accepting To the Azure Span will now plot all quest and rare waypoints for the Azure Span leveling route.\n" ..
			"- Added a new waypoint (wp) command that can be used with a quest ID to re-plot all related coordinates. For example, |cffFFD100/hmp waypoint 65686|r will plot all waypoints related to the To the Azure Span quest.",
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
			name = "- If Queues is enabled, you should now automatically accept the queue popup when the party leader initiates a queue.\n" ..
			"- Migrated the changes list from Github to a new tab in the options menu.",
			order = 21,
			type = "description",
			fontSize = "small",
		},
		removedHeader = {
			name = "Removed",
			order = 30,
			type = "header",
		},
		removedText = {
			name = "|cffFF0000Nothing was removed in this release.|r",
			order = 31,
			type = "description",
			fontSize = "small",
		},
	},
}
addonTable.changesOptions = changesOptions