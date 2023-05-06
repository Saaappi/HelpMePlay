local addonName, addon = ...
local e = CreateFrame("Frame")
local category = addonName .. " |T236688:16|t"

HelpMePlay = LibStub("AceAddon-3.0"):NewAddon("HelpMePlay", "AceConsole-3.0", "AceHook-3.0")

function HelpMePlay:OnInitialize()
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay", addon.settings)
	self.mainOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay", addonName); addon.settings = self.settings
	self:RegisterChatCommand("hmp", "SlashCommandHandler")
	self:RegisterChatCommand("helpmeplay", "SlashCommandHandler")
	
	-- Default Options
	if HelpMePlayDB == nil then
		HelpMePlayDB = {}
	else
		-- The options aren't nil, so let's run
		-- some code to ensure we get the state
		-- of the options we expect.
		HelpMePlay:MinimapIcon(HelpMePlayDB.MinimapIconEnabled)
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
			if HelpMePlayDB.PlayerDB == nil then
				HelpMePlayDB.PlayerDB = {}
			end
			if HelpMePlayDB.PlayerDB.Merchants == nil then
				HelpMePlayDB.PlayerDB.Merchants = {}
			end
			if HelpMePlayDB.MerchantItems == nil then
				HelpMePlayDB.MerchantItems = {}
			end
			
			-- Deprecate these old settings.
			if HelpMePlayDB.QuestRewardId then
				HelpMePlayDB.QuestRewardId = nil
			end
			if HelpMePlayDB.ChromieTimeId then
				HelpMePlayDB.ChromieTimeId = nil
			end
			if HelpMePlayDB.CovenantId then
				HelpMePlayDB.CovenantId = nil
			end
			if HelpMePlayDB.TorghastPowersId then
				HelpMePlayDB.TorghastPowersId = nil
			end
			if HelpMePlayDB.ZoneId_SL then
				HelpMePlayDB.ZoneId_SL = nil
			end
			if HelpMePlayDB.QuestMobIconId then
				HelpMePlayDB.QuestMobIconId = nil
			end
			if HelpMePlayDB.PartyMembers then
				HelpMePlayDB.PartyMembers = nil
			end
			if HelpMePlayDB.RarityId then
				HelpMePlayDB.RarityId = nil
			end
			if (HelpMePlayDB.QueuesEnabled) then
				HelpMePlayDB.QueuesEnabled = nil
			end
			if (HelpMePlayDB.ShowQuestCountEnabled) then
				HelpMePlayDB.ShowQuestCountEnabled = nil
			end
			if (HelpMePlayDB.DevModeEnabled) then
				local playerGUID = UnitGUID("player")
				if (not addon.myCharacters[playerGUID]) then
					HelpMePlayDB.DevModeEnabled = nil
				end
			end
			if (HelpMePlayDB.Sounds) then
				HelpMePlayDB.Sounds = nil
			end
			if (HelpMePlayDB.WaveAtPlayersEnabled) then
				HelpMePlayDB.WaveAtPlayersEnabled = nil
			end
			if HelpMePlayPlayerDialogDB then
				HelpMePlayDB.PlayerDialogs = HelpMePlayPlayerDialogDB
				HelpMePlayPlayerDialogDB = nil
			end
		end
	end
end)