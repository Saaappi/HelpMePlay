local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local category = addonName .. " |T236688:16|t"

HelpMePlay = LibStub("AceAddon-3.0"):NewAddon("HelpMePlay", "AceConsole-3.0", "AceHook-3.0")

function HelpMePlay:OnInitialize()
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_Main", addonTable.main)
	self.mainOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_Main", category); addonTable.mainOptions = self.mainOptions
	self:RegisterChatCommand(L_GLOBALSTRINGS["Command.Slash1"], "SlashCommandHandler")
	
	-- General
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_GeneralOptions", addonTable.generalOptions)
	self.generalOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_GeneralOptions", L_GLOBALSTRINGS["Tabs.General"], category); addonTable.generalOptions = self.generalOptions
	
	-- Features
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_FeaturesOptions", addonTable.featuresOptions)
	self.featuresOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_FeaturesOptions", L_GLOBALSTRINGS["Tabs.Features"], category); addonTable.featuresOptions = self.featuresOptions
	
	-- Quests
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_QuestOptions", addonTable.questOptions)
	self.questOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_QuestOptions", L_GLOBALSTRINGS["Tabs.Quests"], category); addonTable.questOptions = self.questOptions
	
	-- Expansion Features
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_ExpansionFeatures", addonTable.expansionFeatures)
	self.expansionFeatures = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_ExpansionFeatures", L_GLOBALSTRINGS["Tabs.ExpansionFeatures"], category); addonTable.expansionFeatures = self.expansionFeatures
	
	-- Systems
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_Systems", addonTable.systemsOptions)
	self.systemsOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_Systems", L_GLOBALSTRINGS["Tabs.Systems"], category); addonTable.systemsOptions = self.systemsOptions
	
	-- Zone Selection
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_ZoneSelection", addonTable.zoneSelectionOptions)
	self.zoneSelectionOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_ZoneSelection", L_GLOBALSTRINGS["Tabs.ZoneSelection"], category); addonTable.zoneSelectionOptions = self.zoneSelectionOptions
	
	-- Sounds
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_Sounds", addonTable.soundsOptions)
	self.soundsOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_Sounds", "Sounds", category); addonTable.soundsOptions = self.soundsOptions
	
	-- Extras
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_Extras", addonTable.extrasOptions)
	self.extrasOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_Extras", L_GLOBALSTRINGS["Tabs.Extras"], category); addonTable.extrasOptions = self.extrasOptions
	
	-- Controls
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_Controls", addonTable.controlOptions)
	self.controlOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_Controls", "Controls", category); addonTable.controlOptions = self.controlOptions
	
	-- Changes
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay_Changes", addonTable.changesOptions)
	self.changesOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay_Changes", "Changes", category); addonTable.changesOptions = self.changesOptions
	
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
	
	-- Set the Torghast Powers ID to 2 if it's
	-- higher than this due to changes.
	if HelpMePlayDB.TorghastPowersId == nil then
		HelpMePlayDB.TorghastPowersId = 0
	end
	
	-- Set the Junker Armor and Consumable settings to nil since
	-- they're being deprecated.
	if HelpMePlayDB.Armor ~= nil then
		HelpMePlayDB.Armor = nil
	end
	if HelpMePlayDB.Consumable ~= nil then
		HelpMePlayDB.Consumable = nil
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
			if HelpMePlayDB.BarberShop == nil then
				HelpMePlayDB.BarberShop = {}
			end
			if HelpMePlayDB.PlayerTalents == nil then
				HelpMePlayDB.PlayerTalents = {}
			end
			addonTable.currentClass = UnitClass("player")
		end
	end
end)