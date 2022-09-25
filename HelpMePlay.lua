local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local defaults = {
	profile = {
		enable = true,
	},
}

HelpMePlay = LibStub("AceAddon-3.0"):NewAddon("HelpMePlay", "AceConsole-3.0")

function HelpMePlay:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("HelpMePlayDB", defaults, true)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay", addonTable.options)
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addonName, addonName); addonTable.optionsFrame = self.optionsFrame
	self:RegisterChatCommand(L_GLOBALSTRINGS["Slash HMP"], "SlashCommandHandler")
end

function HelpMePlay:OnEnable()
	-- Called when the addon is enabled
end

function HelpMePlay:OnDisable()
	-- Called when the addon is disabled
end

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "ADDON_LOADED" then
		local addonLoaded = ...
		if addonLoaded == addonName then
			if HelpMePlayOptionsDB == nil then
				HelpMePlayOptionsDB = {}
			end
			if HelpMePlayIgnoredCreaturesDB == nil then
				HelpMePlayIgnoredCreaturesDB = {}
			end
			if HelpMePlayIgnoredQuestsDB == nil then
				HelpMePlayIgnoredQuestsDB = {}
			end
			if HelpMePlayPlayerDialogDB == nil then
				HelpMePlayPlayerDialogDB = {}
			end
			if HelpMePlayPlayerDialogDB[0] == nil then
				HelpMePlayPlayerDialogDB[0] = {}
				HelpMePlayPlayerDialogDB[0]["g"] = {}
			end
			if HelpMePlaySavesDB == nil then
				HelpMePlaySavesDB = {}
			end
			if HelpMePlayCharacterQuestsDB == nil then
				HelpMePlayCharacterQuestsDB = {}
			end
			if HelpMePlayJunkerDB == nil then
				HelpMePlayJunkerDB = {}
				HelpMePlayOptionsDB["Junker"] = {}
			end
			if HelpMePlayJunkerBlacklistDB == nil then
				HelpMePlayJunkerBlacklistDB = {}
			end
			if HelpMePlayJunkerGlobalDB == nil then
				HelpMePlayJunkerGlobalDB = {}
			end
			if HelpMePlayJunkerGlobalBlacklistDB == nil then
				HelpMePlayJunkerGlobalBlacklistDB = {}
			end
			if HelpMePlayOptionsDB.MinimapIcon then
				HelpMePlayShowMinimapIcon(true)
			end
		end
	end
end)