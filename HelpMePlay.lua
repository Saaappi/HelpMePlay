local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

HelpMePlay = LibStub("AceAddon-3.0"):NewAddon("HelpMePlay", "AceConsole-3.0")

function HelpMePlay:OnInitialize()
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_Main", addonTable.main)
	self.mainOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_Main", addonName); addonTable.mainOptions = self.mainOptions
	self:RegisterChatCommand(L_GLOBALSTRINGS["Command.Slash1"], "SlashCommandHandler")
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_GeneralOptions", addonTable.generalOptions)
	self.generalOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_GeneralOptions", L_GLOBALSTRINGS["Tabs.General"], addonName); addonTable.generalOptions = self.generalOptions
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_FeaturesOptions", addonTable.featuresOptions)
	self.featuresOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_FeaturesOptions", L_GLOBALSTRINGS["Tabs.Features"], addonName); addonTable.featuresOptions = self.featuresOptions
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_QuestOptions", addonTable.questOptions)
	self.questOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_QuestOptions", L_GLOBALSTRINGS["Tabs.Quests"], addonName); addonTable.questOptions = self.questOptions
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_ExpansionFeatures", addonTable.expansionFeatures)
	self.expansionFeatures = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_ExpansionFeatures", L_GLOBALSTRINGS["Tabs.ExpansionFeatures"], addonName); addonTable.expansionFeatures = self.expansionFeatures
	
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_Junker", addonTable.junkerOptions)
	self.junkerOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_Junker", L_GLOBALSTRINGS["Tabs.Junker"], addonName); addonTable.junkerOptions = self.junkerOptions
	
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

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "ADDON_LOADED" then
		local addonLoaded = ...
		if addonLoaded == addonName then
			if HelpMePlayIgnoredCreaturesDB == nil then
				HelpMePlayIgnoredCreaturesDB = {}
			end
			if HelpMePlayIgnoredQuestsDB == nil then
				HelpMePlayIgnoredQuestsDB = {}
			end
			if HelpMePlayPlayerDialogDB == nil then
				HelpMePlayPlayerDialogDB = {}
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
			if HelpMePlayDB.TheMawEnabled == nil then
				HelpMePlayDB.TheMawEnabled = false
			end
			
			-- Clear the player-submitted dialogs.
			--
			-- This should only ever occur once.
			for _, tbl in pairs(HelpMePlayPlayerDialogDB) do
				if type(tbl) == "table" then
					for _, dialog in ipairs(tbl.g) do
						if type(dialog) == "string" then
							HelpMePlayPlayerDialogDB = {}
							print("Table is in incorrect format.")
							return
						end
					end
				end
			end
		end
	end
end)