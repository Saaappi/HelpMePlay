local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

local function QUEST_GOSSIP()
    if not IsShiftKeyDown() then
        local GUID = UnitGUID("target")
        local mapID = C_Map.GetBestMapForUnit("player")
        if GUID then
            local npcID = select(6, string.split("-", GUID)); npcID = tonumber(npcID)
            if HelpMePlay.IsQuestGiverIgnored(npcID) then return end
        end
        local activeQuests = C_GossipInfo.GetActiveQuests()
        local availableQuests = C_GossipInfo.GetAvailableQuests()
        if activeQuests and mapID then
            for _, quest in ipairs(activeQuests) do
                if HelpMePlayDB["AcceptAndCompleteQuests"] then
                    C_Timer.After(addon.Constants["TIMER_DELAY"], function()
                        if quest.isComplete then
                            C_GossipInfo.SelectActiveQuest(quest.questID)
                            HelpMePlay.CompleteQuest()
                        end
                    end)
                end
            end
        end
        if availableQuests and mapID then
            for _, quest in ipairs(availableQuests) do
                if HelpMePlayDB["IgnoreRepeatableQuests"] and quest.repeatable then
                    -- We do nothing here because the player chose to ignore repeatable quests.
                elseif HelpMePlayDB["IgnoreDailyQuests"] and quest.frequency == Enum.QuestFrequency.Daily then
                    -- We do nothing here because the player chose to ignore daily quests.
                else
                    if HelpMePlayDB["AcceptAndCompleteQuests"] then
                        C_Timer.After(addon.Constants["TIMER_DELAY"], function()
                            C_GossipInfo.SelectAvailableQuest(quest.questID)
                            AcceptQuest()
                        end)
                    end
                end
            end
        end
    else
        C_Timer.After(1, QUEST_GOSSIP)
    end
end

local function QUEST_COMPLETE()
    if not IsShiftKeyDown() then
        local questID = GetQuestID()
        local mapID = C_Map.GetBestMapForUnit("player")
        if questID and mapID then
            if HelpMePlayDB["AcceptAndCompleteQuests"] then
                HelpMePlay.CompleteQuest()
            end
        end
    else
        C_Timer.After(1, QUEST_COMPLETE)
    end
end

local function QUEST_DETAIL()
    local questID = GetQuestID()
    if not IsShiftKeyDown() then
        if QuestGetAutoAccept() then
            CloseQuest()
        else
            local mapID = C_Map.GetBestMapForUnit("player")
            if questID and mapID then
                if HelpMePlayDB["AcceptAndCompleteQuests"] then
                    if HelpMePlayDB["IgnoreRepeatableQuests"] and C_QuestLog.IsRepeatableQuest(questID) then
                    elseif HelpMePlayDB["IgnoreDailyQuests"] and QuestIsDaily() then
                    else
                        AcceptQuest()
                    end
                end
            end
        end
    else
        C_Timer.After(1, QUEST_DETAIL)
    end
end

local function QUEST_GREETING()
    if not IsShiftKeyDown() then
        local GUID = UnitGUID("target")
        if GUID then
            local npcID = select(6, string.split("-", GUID)); npcID = tonumber(npcID)
            if npcID then
                if HelpMePlay.IsQuestGiverIgnored(npcID) then return end
            end
        end

        for i = 1, GetNumActiveQuests() do
            local questID = GetActiveQuestID(i)
            local isComplete = select(2, GetActiveTitle(i))
            local mapID = C_Map.GetBestMapForUnit("player")
            if questID and isComplete and mapID then
                if HelpMePlayDB["AcceptAndCompleteQuests"] then
                    SelectActiveQuest(i)
                end
            end
        end

        for i = 1, GetNumAvailableQuests() do
            local questID = select(5, GetAvailableQuestInfo(i))
            local mapID = C_Map.GetBestMapForUnit("player")
            if questID and mapID then
                if HelpMePlayDB["AcceptAndCompleteQuests"] then
                    if HelpMePlayDB["IgnoreRepeatableQuests"] and C_QuestLog.IsRepeatableQuest(questID) then
                    elseif HelpMePlayDB["IgnoreDailyQuests"] and QuestIsDaily() then
                    else
                        SelectAvailableQuest(i)
                        AcceptQuest()
                    end
                end
            end
        end
    else
        C_Timer.After(1, QUEST_GREETING)
    end
end

local function QUEST_PROGRESS()
    if not IsShiftKeyDown() then
        if IsQuestCompletable() then
            local questID = GetQuestID()
            local mapID = C_Map.GetBestMapForUnit("player")
            if questID and mapID then
                if HelpMePlayDB["AcceptAndCompleteQuests"] then
                    C_Timer.After(addon.Constants["TIMER_DELAY"], function()
                        QuestFrameCompleteButton:Click()
                        HelpMePlay.CompleteQuest()
                    end)
                end
            end
        end
    else
        C_Timer.After(1, QUEST_PROGRESS)
    end
end

eventHandler:RegisterEvent("ADVENTURE_MAP_OPEN")
eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:RegisterEvent("QUEST_ACCEPTED")
eventHandler:RegisterEvent("QUEST_AUTOCOMPLETE")
eventHandler:RegisterEvent("QUEST_COMPLETE")
eventHandler:RegisterEvent("QUEST_DETAIL")
eventHandler:RegisterEvent("QUEST_GREETING")
eventHandler:RegisterEvent("QUEST_PROGRESS")
eventHandler:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADVENTURE_MAP_OPEN" then
        if HelpMePlayDB["UseAdventureMaps"] == false then return end

        local adventureMapID = C_AdventureMap.GetMapID()
        if adventureMapID then
            for _, questID in ipairs(addon.AdventureMaps[adventureMapID]) do
                if not C_QuestLog.IsQuestFlaggedCompleted(questID) then
                    C_AdventureMap.StartQuest(questID)
                end
            end
        end
    end

    if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
        local type = ...
        if type == 3 then
            if HelpMePlayDB["AcceptAndCompleteQuests"] == false and HelpMePlayDB["AcceptAndCompleteAllQuests"] == false then return end

            QUEST_GOSSIP()
        elseif type == 45 then -- Chromie Time
            if HelpMePlayDB["ChromieTimeExpansionID"] == 0 or addon.playerLevel >= addon.Constants["CHROMIE_TIME_MAX_LEVEL"] then return end

            if UnitChromieTimeID("player") ~= HelpMePlayDB["ChromieTimeExpansionID"] then
                C_ChromieTime.SelectChromieTimeOption(HelpMePlayDB["ChromieTimeExpansionID"])
            end
        end
    end

    if event == "QUEST_ACCEPTED" then
        -- Automatically hides the quest popup when one is accepted.
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false and HelpMePlayDB["AcceptAndCompleteAllQuests"] == false then return end

        local questID = ...
        if questID then
            C_Timer.After(addon.Constants["TIMER_DELAY"], function()
                local numPopups = GetNumAutoQuestPopUps()
                if numPopups > 0 then
                    AcknowledgeAutoAcceptQuest()
                    AutoQuestPopupTracker_RemovePopUp(questID)
                end
            end)
        end
    end

    if event == "QUEST_AUTOCOMPLETE" then
        -- Automatically hides the quest popup when one is completed.
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false and HelpMePlayDB["AcceptAndCompleteAllQuests"] == false then return end

        local questID = ...
        local mapID = C_Map.GetBestMapForUnit("player")
        if questID and mapID then
            if HelpMePlayDB["AcceptAndCompleteQuests"] and HelpMePlayDB["GuideQuests"][mapID] then
                if HelpMePlayDB["GuideQuests"][mapID][questID] then
                    ShowQuestComplete(questID)
                end
            elseif HelpMePlayDB["AcceptAndCompleteAllQuests"] then
                ShowQuestComplete(questID)
            end
        end
    end

    if event == "QUEST_COMPLETE" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false and HelpMePlayDB["AcceptAndCompleteAllQuests"] == false then return end

        QUEST_COMPLETE()
    end

    if event == "QUEST_DETAIL" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false and HelpMePlayDB["AcceptAndCompleteAllQuests"] == false then return end

        QUEST_DETAIL()
    end

    if event == "QUEST_GREETING" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false and HelpMePlayDB["AcceptAndCompleteAllQuests"] == false then return end

        QUEST_GREETING()
    end

    if event == "QUEST_PROGRESS" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false and HelpMePlayDB["AcceptAndCompleteAllQuests"] == false then return end

        QUEST_PROGRESS()
    end

    if event == "UPDATE_MOUSEOVER_UNIT" then
        if HelpMePlayDB["UseEmotes"] == false then return end

        local GUID = UnitGUID("mouseover")
		if GUID then
			local npcID = select(6, string.split("-", GUID)); npcID = tonumber(npcID)
			if npcID and addon.Emotes[npcID] then
				DoEmote(addon.Emotes[npcID], "mouseover")
			end
		end
    end
end)

-- This is for muting the talking head. They can be annoying, so let's
-- close it immediately if the setting is enabled.
hooksecurefunc(TalkingHeadFrame, "PlayCurrent", function(self)
    if HelpMePlayDB["MuteTalkingHead"] == false then return end

	self:CloseImmediately()
end)