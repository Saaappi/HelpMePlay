local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

HelpMePlay = LibStub("AceAddon-3.0"):NewAddon("HelpMePlay", "AceConsole-3.0", "AceHook-3.0")

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
	
	-- Systems
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_Systems", addonTable.systemsOptions)
	self.systemsOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_Systems", L_GLOBALSTRINGS["Tabs.Systems"], addonName); addonTable.systemsOptions = self.systemsOptions
	
	-- Zone Selection
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_ZoneSelection", addonTable.zoneSelectionOptions)
	self.zoneSelectionOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_ZoneSelection", L_GLOBALSTRINGS["Tabs.ZoneSelection"], addonName); addonTable.zoneSelectionOptions = self.zoneSelectionOptions
	
	-- Sounds
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_Sounds", addonTable.soundsOptions)
	self.soundsOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_Sounds", L_GLOBALSTRINGS["Tabs.Sounds"], addonName); addonTable.soundsOptions = self.soundsOptions
	
	-- Extras
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_Extras", addonTable.extrasOptions)
	self.extrasOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_Extras", L_GLOBALSTRINGS["Tabs.Extras"], addonName); addonTable.extrasOptions = self.extrasOptions
	
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
	
	-- Reset the BFAIntroEnabled variable under
	-- the addon's saved variable table.
	if type(HelpMePlayDB.BFAIntroEnabled) ~= "table" then
		HelpMePlayDB.BFAIntroEnabled = nil
	end
	
	-- Set the Torghast Powers ID to 2 if it's
	-- higher than this due to changes.
	if HelpMePlayDB.TorghastPowersId == nil then
		HelpMePlayDB.TorghastPowersId = 0
	end
	
	-- Reset the quest mobs icon to 0 since backend changes
	-- were made.
	if HelpMePlayDB.QuestMobIcon == 0 or HelpMePlayDB.QuestMobIcon == 1 then
		HelpMePlayDB.QuestMobIcon = "Mobile-QuestIcon"
		HelpMePlayDB.QuestMobIconId = 0
	end
end

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addonLoaded)
	if event == "ADDON_LOADED" then
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
				HelpMePlayDB["Junker"] = {}
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
			if HelpMePlayQuestMobsDB == nil then
				HelpMePlayQuestMobsDB = {}
			end
			if HelpMePlayDB.TheMawEnabled == nil then
				HelpMePlayDB.TheMawEnabled = false
			end
			if HelpMePlayDB.Sounds == nil then
				HelpMePlayDB.Sounds = {}
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