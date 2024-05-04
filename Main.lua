local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:RegisterEvent("PLAYER_LEVEL_CHANGED")
eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
eventHandler:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventHandler:SetScript("OnEvent", function(self, event, ...)
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
            if HelpMePlayDB["AcceptReadyChecks"] == nil then
                HelpMePlayDB["AcceptReadyChecks"] = false
            end
            if HelpMePlayDB["AcceptRoleChecks"] == nil then
                HelpMePlayDB["AcceptRoleChecks"] = false
            end
            if HelpMePlayDB["TrainerProtectionValue"] == nil then
                HelpMePlayDB["TrainerProtectionValue"] = 0
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

            -- If the Guide Quests table is nil, then initialize it.
            if HelpMePlayDB["GuideQuests"] == nil then
                HelpMePlayDB["GuideQuests"] = {}
            end

            -- If the Guide Gossips table is nil, then initialize it.
            if HelpMePlayDB["GuideGossips"] == nil then
                HelpMePlayDB["GuideGossips"]= {}
            end

            -- If the Guide Quest Items table is nil, then initialize it.
            if HelpMePlayDB["GuideQuestItems"] == nil then
                HelpMePlayDB["GuideQuestItems"] = {}
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
        -- This mapID will be referenced in numerous locations in the code. It's important it's
        -- available on login.
        C_Timer.After(addon.Constants["TIMER_DELAY"] + 0.4, function()
            local mapID = C_Map.GetBestMapForUnit("player")
            if mapID then
                addon.mapID = mapID
                if not HelpMePlayDB["GuideQuests"][mapID] then
                    HelpMePlayDB["GuideQuests"][mapID] = {}
                end
                if not HelpMePlayDB["GuideGossips"][mapID] then
                    HelpMePlayDB["GuideGossips"][mapID] = {}
                end
            end

            addon.playerClassName, addon.playerClassFileName, addon.playerClassID = UnitClass("player")
            addon.playerClassColor = C_ClassColor.GetClassColor(addon.playerClassFileName)
            addon.playerLevel = UnitLevel("player")
            addon.playerSpecID = PlayerUtil.GetCurrentSpecID()
            addon.playerSpecName = select(2, GetSpecializationInfoByID(addon.playerSpecID))

            -- Unload the event for performance.
            eventHandler:UnregisterEvent("PLAYER_LOGIN")
        end)
    end
    if event == "PLAYER_SPECIALIZATION_CHANGED" then
        addon.playerSpecID = PlayerUtil.GetCurrentSpecID()
        addon.playerSpecName = select(2, GetSpecializationInfoByID(addon.playerSpecID))
    end
    if event == "ZONE_CHANGED_NEW_AREA" then
        -- The same case as above during PLAYER_LOGIN; the mapID variable will be referenced in
        -- numerous locations in the code. It's important it's available after a zone change.
        C_Timer.After(addon.Constants["TIMER_DELAY"] + 0.4, function()
            local mapID = C_Map.GetBestMapForUnit("player")
            if mapID then
                addon.mapID = mapID
                if not HelpMePlayDB["GuideQuests"][mapID] then
                    HelpMePlayDB["GuideQuests"][mapID] = {}
                end
                if not HelpMePlayDB["GuideGossips"][mapID] then
                    HelpMePlayDB["GuideGossips"][mapID] = {}
                end
            end
        end)
    end
end)