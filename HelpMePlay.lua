local addonName, addon = ...
local e = CreateFrame("Frame")
local category = addonName .. " |T236688:16|t"

HelpMePlay = LibStub("AceAddon-3.0"):NewAddon("HelpMePlay", "AceConsole-3.0", "AceHook-3.0")

function HelpMePlay:OnInitialize()
	LibStub("AceConfig-3.0"):RegisterOptionsTable("HelpMePlay", addon.settings)
	self.mainOptions = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("HelpMePlay", addonName); addon.settings = self.settings
	self:RegisterChatCommand("hmp", "SlashCommandHandler")
	self:RegisterChatCommand("helpmeplay", "SlashCommandHandler")
	
	if HelpMePlayDB == nil then
		HelpMePlayDB = {}
	else
		HelpMePlay:MinimapIcon(HelpMePlayDB.MinimapIconEnabled)
	end
end

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addonLoaded)
	if event == "ADDON_LOADED" then
		if addonLoaded == addonName then
			if HelpMePlayCharacterDB == nil then
				HelpMePlayCharacterDB = {}
			end
			if HelpMePlayCharacterDB.Saves == nil then
				HelpMePlayCharacterDB.Saves = {}
			end
			if HelpMePlayCharacterDB.Quests == nil then
				HelpMePlayCharacterDB.Quests = {}
			end
			if HelpMePlayCharacterDB.Junker == nil then
				HelpMePlayCharacterDB.Junker = {}
			end
			if HelpMePlayCharacterDB.Junker.DB == nil then
				HelpMePlayCharacterDB.Junker.DB = {}
			end
			if HelpMePlayCharacterDB.Junker.BlacklistDB == nil then
				HelpMePlayCharacterDB.Junker.BlacklistDB = {}
			end
			if HelpMePlayDB.TheMawEnabled == nil then
				HelpMePlayDB.TheMawEnabled = false
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
			if HelpMePlayDB.Junker == nil then
				HelpMePlayDB.Junker = {}
			end
			if HelpMePlayDB.Junker.GlobalDB == nil then
				HelpMePlayDB.Junker.GlobalDB = {}
			end
			if HelpMePlayDB.Junker.GlobalBlacklistDB == nil then
				HelpMePlayDB.Junker.GlobalBlacklistDB = {}
			end
			if HelpMePlayDB.Junker.DB == nil then
				HelpMePlayDB.Junker.DB = {}
			end
			if HelpMePlayDB.Junker.BlacklistDB == nil then
				HelpMePlayDB.Junker.BlacklistDB = {}
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
				HelpMePlayDB.PlayerDB.Gossips = HelpMePlayPlayerDialogDB
				HelpMePlayPlayerDialogDB = nil
			end
			if HelpMePlayIgnoredCreaturesDB then
				HelpMePlayDB.IgnoredCreatures = HelpMePlayIgnoredCreaturesDB
				HelpMePlayIgnoredCreaturesDB = nil
			end
			if HelpMePlayIgnoredQuestsDB then
				HelpMePlayDB.IgnoredQuests = HelpMePlayIgnoredQuestsDB
				HelpMePlayIgnoredQuestsDB = nil
			end
			if HelpMePlayJunkerGlobalDB then
				HelpMePlayDB.Junker.GlobalDB = HelpMePlayJunkerGlobalDB
				HelpMePlayJunkerGlobalDB = nil
			end
			if HelpMePlayJunkerGlobalBlacklistDB then
				HelpMePlayDB.Junker.GlobalBlacklistDB = HelpMePlayJunkerGlobalBlacklistDB
				HelpMePlayJunkerGlobalBlacklistDB = nil
			end
			if HelpMePlaySavesDB then
				HelpMePlayCharacterDB.Saves = HelpMePlaySavesDB
				HelpMePlaySavesDB = nil
			end
			if HelpMePlayCharacterQuestsDB then
				HelpMePlayCharacterDB.Quests = HelpMePlayCharacterQuestsDB
				HelpMePlayCharacterQuestsDB = nil
			end
			if HelpMePlayDB.BarberShop then
				HelpMePlayDB.BarberShop = nil
			end
			if HelpMePlayJunkerDB then
				HelpMePlayCharacterDB.Junker.DB = HelpMePlayJunkerDB
				HelpMePlayJunkerDB = nil
			end
			if HelpMePlayJunkerBlacklistDB then
				HelpMePlayCharacterDB.Junker.BlacklistDB = HelpMePlayJunkerBlacklistDB
				HelpMePlayJunkerBlacklistDB = nil
			end
			if (HelpMePlayDB.OpenablesEnabled) then
				HelpMePlayDB.OpenablesEnabled = nil
			end
			if (HelpMePlayDB.HideNPE) then
				HelpMePlayDB.HideNPE = nil
			end
			if (HelpMePlayDB.SoundsEnabled) then
				HelpMePlayDB.SoundsEnabled = nil
			end
			if (HelpMePlayDB.TradeSkillCategoriesCollapsed) then
				HelpMePlayDB.TradeSkillCategoriesCollapsed = nil
			end
			if (HelpMePlayDB.EquipLootIgnoreBindEnabled) then
				HelpMePlayDB.EquipLootIgnoreBindEnabled = nil
			end
			if ( HelpMePlayDB.AutoInviteEnabled ) then
			    HelpMePlayDB.AutoInviteEnabled = nil
			end
            if ( HelpMePlayDB.InviteKeyword ) then
                HelpMePlayDB.InviteKeyword = nil
            end
		end
	end
end)