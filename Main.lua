local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:RegisterEvent("PLAYER_LEVEL_CHANGED")
eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
eventHandler:SetScript(
    "OnEvent",
    function(self, event, ...)
        if event == "ADDON_LOADED" then
            local addonLoaded = ...
            if addonLoaded == addonName then
                -- Create an empty global table for all the addon's functions.
                HelpMePlay = {}

                -- If the account/character saved variable tables are nil, then
                -- initialize them.
                if HelpMePlayDB == nil then
                    HelpMePlayDB = {}
                end
                if HelpMePlayDB_Character == nil then
                    HelpMePlayDB_Character = {}
                end

                -- Set the default values for addon settings.
                if HelpMePlayDB["SkipCutscenes"] == nil then
                    HelpMePlayDB["SkipCutscenes"] = false
                end
                if HelpMePlayDB["UseAdventureMaps"] == nil then
                    HelpMePlayDB["UseAdventureMaps"] = false
                end
                if HelpMePlayDB["AcceptAndCompleteQuests"] == nil then
                    HelpMePlayDB["AcceptAndCompleteQuests"] = false
                end
                if HelpMePlayDB["AcceptAndCompleteAllQuests"] == nil then
                    HelpMePlayDB["AcceptAndCompleteAllQuests"] = false
                end
                if HelpMePlayDB["IgnoreRepeatableQuests"] == nil then
                    HelpMePlayDB["IgnoreRepeatableQuests"] = false
                end
                if HelpMePlayDB["IgnoreDailyQuests"] == nil then
                    HelpMePlayDB["IgnoreDailyQuests"] = false
                end
                if HelpMePlayDB["UseEmotes"] == nil then
                    HelpMePlayDB["UseEmotes"] = false
                end
                if HelpMePlayDB["MuteTalkingHead"] == nil then
                    HelpMePlayDB["MuteTalkingHead"] = false
                end
                if HelpMePlayDB["AcceptGossip"] == nil then
                    HelpMePlayDB["AcceptGossip"] = false
                end
                if HelpMePlayDB["UsePartyPlay"] == nil then
                    HelpMePlayDB["UsePartyPlay"] = false
                end
                if HelpMePlayDB["UsePlayerChoice"] == nil then
                    HelpMePlayDB["UsePlayerChoice"] = false
                end
                if HelpMePlayDB["AcceptReadyChecks"] == nil then
                    HelpMePlayDB["AcceptReadyChecks"] = false
                end
                if HelpMePlayDB["AcceptRoleChecks"] == nil then
                    HelpMePlayDB["AcceptRoleChecks"] = false
                end
                if HelpMePlayDB["TrainerProtectionValue"] == nil then
                    HelpMePlayDB["TrainerProtectionValue"] = 0
                end
                if HelpMePlayDB["shouldAutomaticRepair"] == nil then
                    HelpMePlayDB["shouldAutomaticRepair"] = false
                end
                if HelpMePlayDB["PurchaseQuestItems"] == nil then
                    HelpMePlayDB["PurchaseQuestItems"] = false
                end
                if HelpMePlayDB["UseDynamicFlightButton"] == nil then
                    HelpMePlayDB["UseDynamicFlightButton"] = false
                end
                if HelpMePlayDB["UseWorldEventQueue"] == nil then
                    HelpMePlayDB["UseWorldEventQueue"] = false
                end
                if HelpMePlayDB["DepositKeepAmount"] == nil then
                    HelpMePlayDB["DepositKeepAmount"] = 0
                end
                if HelpMePlayDB["DepositKeepMeSafe"] == nil then
                    HelpMePlayDB["DepositKeepMeSafe"] = true
                end
                if HelpMePlayDB["UseWarMode"] == nil then
                    HelpMePlayDB["UseWarMode"] = false
                end
                if HelpMePlayDB["UseHeirloomAutomation"] == nil then
                    HelpMePlayDB["UseHeirloomAutomation"] = false
                end
                if HelpMePlayDB["RareScan"] == nil then
                    HelpMePlayDB["RareScan"] = false
                end
                if HelpMePlayDB["ShowChatIcons"] == nil then
                    HelpMePlayDB["ShowChatIcons"] = false
                end
                if HelpMePlayDB["OpenContainers"] == nil then
                    HelpMePlayDB["OpenContainers"] = false
                end
                if HelpMePlayDB["ChromieTimeExpansionID"] == nil then
                    HelpMePlayDB["ChromieTimeExpansionID"] = 0
                end
                if HelpMePlayDB["QuestRewardSelectionTypeID"] == nil then
                    HelpMePlayDB["QuestRewardSelectionTypeID"] = 0
                end
                if HelpMePlayDB["QuestMobsIconID"] == nil then
                    HelpMePlayDB["QuestMobsIconID"] = 0
                end
                if HelpMePlayDB["QuestMobsCustomIcon"] == nil then
                    HelpMePlayDB["QuestMobsCustomIcon"] = ""
                end
                if HelpMePlayDB["QuestMobsIconPositionID"] == nil then
                    HelpMePlayDB["QuestMobsIconPositionID"] = 1
                end
                if HelpMePlayDB["QuestMobsIconXOffset"] == nil then
                    HelpMePlayDB["QuestMobsIconXOffset"] = -5
                end
                if HelpMePlayDB["QuestMobsIconYOffset"] == nil then
                    HelpMePlayDB["QuestMobsIconYOffset"] = 0
                end
                if HelpMePlayDB["NCC_ActionBar2"] == nil then
                    HelpMePlayDB["NCC_ActionBar2"] = false
                end
                if HelpMePlayDB["NCC_ActionBar3"] == nil then
                    HelpMePlayDB["NCC_ActionBar3"] = false
                end
                if HelpMePlayDB["NCC_ActionBar4"] == nil then
                    HelpMePlayDB["NCC_ActionBar4"] = false
                end
                if HelpMePlayDB["NCC_ActionBar5"] == nil then
                    HelpMePlayDB["NCC_ActionBar5"] = false
                end
                if HelpMePlayDB["NCC_ActionBar6"] == nil then
                    HelpMePlayDB["NCC_ActionBar6"] = false
                end
                if HelpMePlayDB["NCC_ActionBar7"] == nil then
                    HelpMePlayDB["NCC_ActionBar7"] = false
                end
                if HelpMePlayDB["NCC_ActionBar8"] == nil then
                    HelpMePlayDB["NCC_ActionBar8"] = false
                end
                if HelpMePlayDB["ClearAllTracking"] == nil then
                    HelpMePlayDB["ClearAllTracking"] = false
                end
                if HelpMePlayDB["AutoLoot"] == nil then
                    HelpMePlayDB["AutoLoot"] = false
                end
                if HelpMePlayDB["DisableTutorials"] == nil then
                    HelpMePlayDB["DisableTutorials"] = false
                end
                if HelpMePlayDB["AutoPushSpells"] == nil then
                    HelpMePlayDB["AutoPushSpells"] = false
                end
                if HelpMePlayDB["ClassColorFrames"] == nil then
                    HelpMePlayDB["ClassColorFrames"] = false
                end
                if HelpMePlayDB["LootUnderMouse"] == nil then
                    HelpMePlayDB["LootUnderMouse"] = false
                end
                if HelpMePlayDB["DisableDialog"] == nil then
                    HelpMePlayDB["DisableDialog"] = false
                end
                if HelpMePlayDB["NCC_EditModeLayoutID"] == nil then
                    HelpMePlayDB["NCC_EditModeLayoutID"] = 1
                end

                -- If the Characters table is nil, then initialize it.
                if HelpMePlayDB["Characters"] == nil then
                    HelpMePlayDB["Characters"] = {}
                end

                -- If the Class Talents table is nil, then initialize it.
                if HelpMePlayDB["ClassTalents"] == nil then
                    HelpMePlayDB["ClassTalents"] = {}
                    HelpMePlayDB["ClassTalents"][1] = {}
                    HelpMePlayDB["ClassTalents"][2] = {}
                    HelpMePlayDB["ClassTalents"][3] = {}
                    HelpMePlayDB["ClassTalents"][4] = {}
                    HelpMePlayDB["ClassTalents"][5] = {}
                    HelpMePlayDB["ClassTalents"][6] = {}
                    HelpMePlayDB["ClassTalents"][7] = {}
                    HelpMePlayDB["ClassTalents"][8] = {}
                    HelpMePlayDB["ClassTalents"][9] = {}
                    HelpMePlayDB["ClassTalents"][10] = {}
                    HelpMePlayDB["ClassTalents"][11] = {}
                    HelpMePlayDB["ClassTalents"][12] = {}
                    HelpMePlayDB["ClassTalents"][13] = {}
                end

                -- If the Heirloom table is nil, then initialize it.
                if HelpMePlayDB["Heirlooms"] == nil then
                    HelpMePlayDB["Heirlooms"] = {}
                end

                -- If the Mounts table is nil, then initialize it.
                if HelpMePlayDB["Mounts"] == nil then
                    HelpMePlayDB["Mounts"] = {}
                    HelpMePlayDB["Mounts"]["Ground"] = {}
                    HelpMePlayDB["Mounts"]["Aquatic"] = {}
                    HelpMePlayDB["Mounts"]["Flying"] = {}
                    HelpMePlayDB["Mounts"]["Dynamic"] = {}
                    HelpMePlayDB["Mounts"]["AQ"] = {}
                    HelpMePlayDB["Mounts"]["Vashjir"] = {}
                    HelpMePlayDB["Mounts"]["Unused"] = {}
                end

                -- Delete the old, unused saved variables.
                HelpMePlayDB["MinimapIconEnabled"] = nil
                HelpMePlayDB["Junker"] = nil
                HelpMePlayDB["MerchantItems"] = nil
                HelpMePlayDB["PlayerTalents"] = nil
                HelpMePlayDB["Enabled"] = nil
                HelpMePlayDB["NONE"] = nil
                HelpMePlayDB["IgnoredCreatures"] = nil
                HelpMePlayDB["TheMawEnabled"] = nil
                HelpMePlayDB["GuideQuests"] = nil
                HelpMePlayDB["GuideQuestItems"] = nil
                HelpMePlayDB["GuideGossips"] = nil
                HelpMePlayDB["DynamicFlightTrait1"] = nil
                HelpMePlayDB["DynamicFlightTrait2"] = nil
                HelpMePlayDB["NCCEnabled"] = nil
                HelpMePlayDB["AGE"] = nil
                HelpMePlayDB["ShouldRepair"] = nil
                if HelpMePlayDB["OpenHolidayItems"] then
                    HelpMePlayDB["OpenContainers"] = HelpMePlayDB["OpenHolidayItems"]
                    HelpMePlayDB["OpenHolidayItems"] = nil
                end

                -- Unload the event for performance.
                eventHandler:UnregisterEvent("ADDON_LOADED")
            end
        end
        if event == "PLAYER_LEVEL_CHANGED" then
            local _, newLevel = ...
            if newLevel then
                addon.playerLevel = newLevel
            end
        end
        if event == "PLAYER_LOGIN" then
            C_Timer.After(
                addon.Constants["TIMER_DELAY"] + 0.4,
                function()
                    addon.playerClassName, addon.playerClassFileName, addon.playerClassID = UnitClass("player")
                    addon.playerClassColor = C_ClassColor.GetClassColor(addon.playerClassFileName)
                    addon.playerLevel = UnitLevel("player")
                    addon.playerSpecID = PlayerUtil.GetCurrentSpecID()
                    addon.playerSpecName = select(2, GetSpecializationInfoByID(addon.playerSpecID))
                    addon.playerGUID = UnitGUID("player")
                    if C_AddOns.IsAddOnLoaded("Syndicator") then
                        addon.playerFullName = Syndicator.API.GetCurrentCharacter()
                    end

                    -- Get the player's mounts so we can use them.
                    addon.RefreshMountsByType("Ground")
                    addon.RefreshMountsByType("Flying")
                    addon.RefreshMountsByType("Dynamic")
                    addon.RefreshMountsByType("Aquatic")
                    addon.RefreshMountsByType("AQ")
                    addon.RefreshMountsByType("Vashjir")
                    addon.RefreshMountsByType("Unused")

                    -- If the class an for the current character
                    -- doesn't have an heirloom table, then create one.
                    if HelpMePlayDB["Heirlooms"][addon.playerClassID] == nil then
                        HelpMePlayDB["Heirlooms"][addon.playerClassID] = {}
                    end

                    -- If the spec for the class of the current character
                    -- doesn't have an heirloom table, then create one.
                    if HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID] == nil then
                        HelpMePlayDB["Heirlooms"][addon.playerClassID][addon.playerSpecID] = {}
                    end

                    -- Unload the event for performance.
                    eventHandler:UnregisterEvent("PLAYER_LOGIN")
                end
            )
        end
        if event == "PLAYER_SPECIALIZATION_CHANGED" then
            addon.playerSpecID = PlayerUtil.GetCurrentSpecID()
            addon.playerSpecName = select(2, GetSpecializationInfoByID(addon.playerSpecID))
        end
    end
)