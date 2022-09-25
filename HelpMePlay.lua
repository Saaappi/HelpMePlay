local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

HelpMePlay = LibStub("AceAddon-3.0"):NewAddon("HelpMePlay", "AceConsole-3.0")

function HelpMePlay:OnInitialize()
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_Main", addonTable.main)
	self.mainOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_Main", addonName); addonTable.mainOptions = self.mainOptions
	self:RegisterChatCommand(L_GLOBALSTRINGS["Slash HMP"], "SlashCommandHandler")
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_GeneralOptions", addonTable.generalOptions)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_GeneralOptions", L_GLOBALSTRINGS["Tabs.General"], addonName)
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_FeaturesOptions", addonTable.featuresOptions)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_FeaturesOptions", L_GLOBALSTRINGS["Tabs.Features"], addonName)
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_QuestOptions", addonTable.questOptions)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_QuestOptions", L_GLOBALSTRINGS["Tabs.Quests"], addonName)
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_GarrisonsOptions", addonTable.garrisonOptions)
	LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_GarrisonsOptions", L_GLOBALSTRINGS["Tabs.Garrisons"], addonName)
	
	-- Default Options
	if HelpMePlayDB == nil then
		HelpMePlayDB = {}
		HelpMePlayDB.Enabled = true
	else
		-- The options aren't nil, so let's run
		-- some code to ensure we get the state
		-- of the options we expect.
		HelpMePlay:MinimapIcon(HelpMePlayDB.MinimapIconEnabled)
	end
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