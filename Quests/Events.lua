local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")

local function QUEST_GOSSIP()
    if not IsShiftKeyDown() then
        -- I'm not sure I need to ignore quest givers. I'll disable for now and
        -- discuss it with Kraken's community.
        --[[local GUID = UnitGUID("target")
        local mapID = C_Map.GetBestMapForUnit("player")
        if GUID then
            local npcID = select(6, string.split("-", GUID)); npcID = tonumber(npcID)
            if HelpMePlay.IsQuestGiverIgnored(npcID) then return end
        end]]

        if HelpMePlayDB["AcceptAndCompleteQuests"] then
            -- Let's deal with completed quests first.
            for _, quest in next, C_GossipInfo.GetActiveQuests() do
                if quest.isComplete and (not C_QuestLog.IsWorldQuest(quest.questID)) then
                    C_GossipInfo.SelectActiveQuest(quest.questID)
                    HelpMePlay.CompleteQuest()
                end
            end

            -- Accept all available quests now.
            for _, quest in next, C_GossipInfo.GetAvailableQuests() do
                if HelpMePlayDB["IgnoreRepeatableQuests"] and quest.repeatable then
                elseif HelpMePlayDB["IgnoreDailyQuests"] and quest.frequency == Enum.QuestFrequency.Daily then
                else
                    if LHMP:IsQuestIgnored(quest.questID) then return false end
                    C_GossipInfo.SelectAvailableQuest(quest.questID)
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
        if questID then
            if HelpMePlayDB["AcceptAndCompleteQuests"] then
                HelpMePlay.CompleteQuest()
            end
        end
    else
        C_Timer.After(1, QUEST_COMPLETE)
    end
end

local function QUEST_DETAIL()
    if not IsShiftKeyDown() then
        if QuestIsFromAreaTrigger() then
            -- This type of quest is triggered when the player enters a specific
            -- area. It's presented in a way like the player has a choice, but
            -- they don't. Just accept the quest.
            AcceptQuest()
        elseif QuestGetAutoAccept() then
            -- This type of quest is auto accepted. It's presented like the player
            -- has a choice in the matter, but they really don't. In such case,
            -- we'll acknowledge the auto accept quest so the window is closed.
            AcknowledgeAutoAcceptQuest()
        else
            local questID = GetQuestID()
            if questID then
                if HelpMePlayDB["AcceptAndCompleteQuests"] then
                    if HelpMePlayDB["IgnoreRepeatableQuests"] and C_QuestLog.IsRepeatableQuest(questID) then
                    elseif HelpMePlayDB["IgnoreDailyQuests"] and QuestIsDaily() then
                    else
                        if LHMP:IsQuestIgnored(questID) then return false end
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
        -- I'm not sure I need to ignore quest givers. I'll disable for now and
        -- discuss it with Kraken's community.
        --[[local GUID = UnitGUID("target")
        if GUID then
            local npcID = select(6, string.split("-", GUID)); npcID = tonumber(npcID)
            if npcID then
                if HelpMePlay.IsQuestGiverIgnored(npcID) then return end
            end
        end]]

        if HelpMePlayDB["AcceptAndCompleteQuests"] then
            -- Let's deal with active and complete quests first.
            for index = 1, GetNumActiveQuests() do
                local isComplete = select(2, GetActiveTitle(index))
                if isComplete and (not C_QuestLog.IsWorldQuest(GetActiveQuestID(index))) then
                    SelectActiveQuest(index)
                end
            end

            -- Accept available quests now.
            for index = 1, GetNumAvailableQuests() do
                local questID = select(5, GetAvailableQuestInfo(index))
                if questID then
                    if HelpMePlayDB["IgnoreRepeatableQuests"] and C_QuestLog.IsRepeatableQuest(questID) then
                    elseif HelpMePlayDB["IgnoreDailyQuests"] and QuestIsDaily() then
                    else
                        if LHMP:IsQuestIgnored(questID) then return false end
                        SelectAvailableQuest(index)
                    end
                end
            end
        end
    else
        C_Timer.After(1, QUEST_GREETING)
    end
end

local function QUEST_LOG_UPDATE()
    -- Check for quest popups whenever the quest log is updated.
    if GetNumAutoQuestPopUps() > 0 then
        if not UnitIsDeadOrGhost("player") then
            -- This is apparently intrusive?
            local questID, questType = GetAutoQuestPopUp(1)
            if questType == "OFFER" then
                ShowQuestOffer(questID)
            elseif questType == "COMPLETE" then
                ShowQuestComplete(questID)
            end

            -- Remove the quest popup since the game doesn't handle this organically...
            RemoveAutoQuestPopUp(questID)
        else
            -- You cannot accept quests while dead.
            C_Timer.After(1, QUEST_LOG_UPDATE)
        end
    end
end

local function QUEST_PROGRESS()
    if not IsShiftKeyDown() then
        if not IsQuestCompletable() then return end

        if HelpMePlayDB["AcceptAndCompleteQuests"] then
            CompleteQuest()
            HelpMePlay.CompleteQuest()
        end
    else
        C_Timer.After(1, QUEST_PROGRESS)
    end
end

eventHandler:RegisterEvent("ADVENTURE_MAP_OPEN")
eventHandler:RegisterEvent("BAG_UPDATE")
eventHandler:RegisterEvent("PLAYER_CHOICE_UPDATE")
eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:RegisterEvent("QUEST_ACCEPTED")
eventHandler:RegisterEvent("QUEST_AUTOCOMPLETE")
eventHandler:RegisterEvent("QUEST_COMPLETE")
eventHandler:RegisterEvent("QUEST_DETAIL")
eventHandler:RegisterEvent("QUEST_GREETING")
eventHandler:RegisterEvent("QUEST_LOG_UPDATE")
eventHandler:RegisterEvent("QUEST_PROGRESS")
eventHandler:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADVENTURE_MAP_OPEN" then
        if HelpMePlayDB["UseAdventureMaps"] == false then
            return false
        end
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then
            return false
        end

        local adventureMapID = C_AdventureMap.GetMapID()
        if adventureMapID then
            for _, questID in ipairs(addon.AdventureMaps[adventureMapID]) do
                if not C_QuestLog.IsQuestFlaggedCompleted(questID) then
                    C_AdventureMap.StartQuest(questID)
                end
            end
        end
    end
    if event == "BAG_UPDATE" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then
            return false
        end

        for bagID = 0, 4 do
            local numSlots = (C_Container.GetContainerNumSlots(bagID) - C_Container.GetContainerNumFreeSlots(bagID))
            for slotID = 1, numSlots do
                local questInfo = C_Container.GetContainerItemQuestInfo(bagID, slotID)
                if questInfo and questInfo.questID and (not questInfo.isActive) then
                    C_Container.UseContainerItem(bagID, slotID)
                end
            end
        end
    end
    if event == "PLAYER_CHOICE_UPDATE" then
        if HelpMePlayDB["UsePlayerChoice"] == false then
            return false
        end

        local choiceInfo = C_PlayerChoice.GetCurrentPlayerChoiceInfo()
        if choiceInfo then
            local playerChoice = LHMP:GetPlayerChoiceByID(choiceInfo.choiceID)
            if playerChoice then
                C_PlayerChoice.SendPlayerChoiceResponse(choiceInfo.options[playerChoice].buttons[playerChoice].id)
                HideUIPanel(PlayerChoiceFrame)
            end
        end
    end
    if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
        local type = ...
        if type == 3 then
            if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

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
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

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
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

        local questID = ...
        if questID then
            if HelpMePlayDB["AcceptAndCompleteQuests"] then
                ShowQuestComplete(questID)
            end
        end
    end

    if event == "QUEST_COMPLETE" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

        QUEST_COMPLETE()
    end

    if event == "QUEST_DETAIL" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

        QUEST_DETAIL()
    end

    if event == "QUEST_GREETING" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

        QUEST_GREETING()
    end

    if event == "QUEST_LOG_UPDATE" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end
        if WorldMapFrame:IsShown() then return end

        QUEST_LOG_UPDATE()
    end

    if event == "QUEST_PROGRESS" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then
            return false
        end

        QUEST_PROGRESS()
    end

    if event == "UPDATE_MOUSEOVER_UNIT" then
        if HelpMePlayDB["UseEmotes"] == false then
            return false
        end

        local GUID = UnitGUID("mouseover")
		if GUID then
			local npcID = LHMP:SplitString(GUID, "-", 6)
			if npcID then
                if LHMP:IsEmoteSupportedForNPC(npcID) then
                    local emote = LHMP:GetEmoteForNPC(npcID)
                    DoEmote(emote, "mouseover")
                end
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