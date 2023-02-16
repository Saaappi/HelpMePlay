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
		added1Text = {
			name = "- Added a text indicator to the Quests section of the options to display which expansion of Chromie Time the player is in.",
			order = 11,
			type = "description",
			fontSize = "small",
		},
		added2Text = {
			name = "- Accepting In Tyr's Footsteps will now plot all rare waypoints from Kraken Latte's 60-70 leveling guide.",
			order = 12,
			type = "description",
			fontSize = "small",
		},
		added3Text = {
			name = "- Accepting To the Azure Span will now plot all quest and rare waypoints for the Azure Span leveling route.",
			order = 13,
			type = "description",
			fontSize = "small",
		},
		added4Text = {
			name = "- Added a new waypoint (wp) command that can be used with a quest ID to re-plot all related coordinates. For example, |cffFFD100/hmp waypoint 65686|r will plot all waypoints related to the To the Azure Span quest.",
			order = 14,
			type = "description",
			fontSize = "small",
		},
		updatedHeader = {
			name = "Changed / Updated",
			order = 20,
			type = "header",
		},
		updated1Text = {
			name = "- If Queues is enabled, you should now automatically accept the queue popup when the party leader initiates a queue.",
			order = 21,
			type = "description",
			fontSize = "small",
		},
	},
}
addonTable.changesOptions = changesOptions