local _, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")

local lootPatterns = { LOOT_ITEM_SELF, LOOT_ITEM_PUSHED_SELF }

local function QUEST_GOSSIP()
    if not IsShiftKeyDown() then
        if HelpMePlayDB["AcceptAndCompleteQuests"] then
            -- Let's deal with completed quests first.
            for _, quest in ipairs(C_GossipInfo.GetActiveQuests()) do
                if not LHMP:IsQuestIgnored(quest.questID) then
                    if quest.isComplete and (not C_QuestLog.IsWorldQuest(quest.questID)) then
                        C_GossipInfo.SelectActiveQuest(quest.questID)
                        HelpMePlay.CompleteQuest()
                    end
                end
            end

            -- Accept all available quests now.
            for _, quest in ipairs(C_GossipInfo.GetAvailableQuests()) do
                if not LHMP:IsQuestIgnored(quest.questID) then
                    if HelpMePlayDB["IgnoreRepeatableQuests"] and quest.repeatable then
                    elseif HelpMePlayDB["IgnoreDailyQuests"] and quest.frequency == Enum.QuestFrequency.Daily then
                    else
                        C_GossipInfo.SelectAvailableQuest(quest.questID)
                    end
                end
            end
        end
    else
        C_Timer.After(1, QUEST_GOSSIP)
    end
end

local function QUEST_COMPLETE()
    if not IsShiftKeyDown() and not InCombatLockdown() then
        local questID = GetQuestID()
        if questID then
            if LHMP:IsQuestIgnored(questID) then return end
            if HelpMePlayDB["AcceptAndCompleteQuests"] then
                local numQuestChoices = GetNumQuestChoices()
                if numQuestChoices > 1 then
                    for index = 1, numQuestChoices do
                        local itemLink = GetQuestItemLink("choice", index)
                        if itemLink then
                            local itemID = C_Item.GetItemInfoInstant(itemLink)
                            if itemID and itemID == 45724 then -- This is an Argent Tournament quest, so take the purse.
                                GetQuestReward(index)
                                return
                            end
                        end
                    end
                end
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
            C_Timer.After(0.25, function() AcceptQuest() end)
        elseif QuestGetAutoAccept() then
            -- This type of quest is auto accepted. It's presented like the player
            -- has a choice in the matter, but they really don't. In such case,
            -- we'll acknowledge the auto accept quest so the window is closed.
            C_Timer.After(0.25, function() AcknowledgeAutoAcceptQuest() end)
        else
            local questID = GetQuestID()
            if questID then
                if LHMP:IsQuestIgnored(questID) then return end
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
        if HelpMePlayDB["AcceptAndCompleteQuests"] then
            -- Let's deal with active and complete quests first.
            for index = 1, GetNumActiveQuests() do
                local questID = GetActiveQuestID(index)
                if not LHMP:IsQuestIgnored(questID) then
                    local isComplete = select(2, GetActiveTitle(index))
                    if isComplete and (not C_QuestLog.IsWorldQuest(questID)) then
                        SelectActiveQuest(index)
                    end
                end
            end

            -- Accept available quests now.
            for index = 1, GetNumAvailableQuests() do
                local questID = select(5, GetAvailableQuestInfo(index))
                if questID then
                    if not LHMP:IsQuestIgnored(questID) then
                        if HelpMePlayDB["IgnoreRepeatableQuests"] and C_QuestLog.IsRepeatableQuest(questID) then
                        elseif HelpMePlayDB["IgnoreDailyQuests"] and QuestIsDaily() then
                        else
                            SelectAvailableQuest(index)
                        end
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

local function OnEvent(_, event, ...)
    -- ADVENTURE_MAP_OPEN
    if event == "ADVENTURE_MAP_OPEN" then
        if HelpMePlayDB["UseAdventureMaps"] == false then return false end
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return false end

        local adventureMapID = C_AdventureMap.GetMapID()
        if adventureMapID then
            for _, questID in ipairs(HelpMePlay.AdventureMaps[adventureMapID]) do
                if not C_QuestLog.IsQuestFlaggedCompleted(questID) then
                    C_AdventureMap.StartQuest(questID)
                end
            end
        end
    end

    -- CHAT_MSG_LOOT
    if event == "CHAT_MSG_LOOT" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

        local message, _, _, _, _, _, _, _, _, _, _, playerGUID = ...
        if playerGUID ~= HelpMePlay.playerGUID then return end

        local function FindItem(itemLink)
            for bagID = 0, 4 do
                for slotID = 1, C_Container.GetContainerNumSlots(bagID) do
                    local bagItemLink = C_Container.GetContainerItemLink(bagID, slotID)
                    if bagItemLink and bagItemLink == itemLink then
                        local questInfo = C_Container.GetContainerItemQuestInfo(bagID, slotID)
                        if questInfo and questInfo.questID and (not questInfo.isActive) then
                            C_Container.UseContainerItem(bagID, slotID)
                            return
                        end
                    end
                end
            end
        end

        local itemLink = ""
        for _, pattern in ipairs(lootPatterns) do
            itemLink = string.match(message, string.sub(pattern, 1, -3) .. "(.*)")
            if itemLink then
                FindItem(itemLink)
            end
        end
    end

    -- PLAYER_CHOICE_UPDATE
    if event == "PLAYER_CHOICE_UPDATE" then
        if HelpMePlayDB["UsePlayerChoice"] == false then return false end

        local choiceInfo = C_PlayerChoice.GetCurrentPlayerChoiceInfo()
        if choiceInfo then
            local playerChoice = LHMP:GetPlayerChoiceByID(choiceInfo.choiceID)
            if playerChoice then
                C_PlayerChoice.SendPlayerChoiceResponse(choiceInfo.options[playerChoice].buttons[1].id)
                HideUIPanel(PlayerChoiceFrame)
            end
        end
    end

    -- PLAYER_INTERACTION_MANAGER_FRAME_SHOW
    if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
        local type = ...
        if type == 3 then
            if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

            QUEST_GOSSIP()
        elseif type == 30 then -- Garrison Architect
            if HelpMePlayDB.GarrisonArchitectTable == false then return end

            local garrisonLevel = C_Garrison.GetGarrisonInfo(2)
            if garrisonLevel ~= 1 then return end

            if HelpMePlay.playerFactionID == 0 then
                if not C_QuestLog.IsOnQuest(34461) then return end
            else
                if not C_QuestLog.IsOnQuest(34587) then return end
            end

            if HelpMePlayDB_Character.IsGarrisonBarracksPlaced then return end

            -- Get available plots and attempt to place the Barracks.
            local plots = C_Garrison.GetPlotsForBuilding(26)
            if plots then
                for _, plotID in next, plots do
                    local buildingID = C_Garrison.GetOwnedBuildingInfo(plotID)
                    if buildingID == nil then
                        C_Garrison.PlaceBuilding(plotID, 26)
                        PlaySound(SOUNDKIT.UI_GARRISON_ARCHITECT_TABLE_UPGRADE_START)
                        HelpMePlayDB_Character.IsGarrisonBarracksPlaced = true
                        HideUIPanel(GarrisonBuildingFrame)
                        return
                    end
                end
            end
        elseif type == 32 then -- Garrison Mission Table
            if HelpMePlayDB.GarrisonMissionTable == false then return end

            local garrisonLevel = C_Garrison.GetGarrisonInfo(2)
            if garrisonLevel ~= 1 then return end

            if HelpMePlay.playerFactionID == 0 then
                if not C_QuestLog.IsOnQuest(34775) then return end
            else
                if not C_QuestLog.IsOnQuest(34692) then return end
            end

            if HelpMePlayDB_Character.IsFirstGarrisonMissionSent then return end

            C_Timer.After(0.5, function()
                GarrisonMissionTutorialFrame:Hide()

                -- Retrieve available Garrison followers and missions.
                local missions = C_Garrison.GetAvailableMissions(1)
                local followers = C_Garrison.GetFollowers(1)

                if #followers == 0 then return end

                for _, mission in next, missions do
                    if not mission.inProgress then
                        local followerID = followers[1].followerID
                        C_Garrison.AddFollowerToMission(mission.missionID, followerID)
                        C_Garrison.StartMission(mission.missionID)
                        C_Garrison.CloseMissionNPC()
                        HideUIPanel(GarrisonMissionFrame)
                        break
                    end
                end
            end)
        elseif type == 45 then -- Chromie Time
            if HelpMePlayDB["ChromieTimeExpansionID"] == 0 or HelpMePlay.playerLevel >= HelpMePlay.Constants["CHROMIE_TIME_MAX_LEVEL"] then return end

            if UnitChromieTimeID("player") ~= HelpMePlayDB["ChromieTimeExpansionID"] then
                C_ChromieTime.SelectChromieTimeOption(HelpMePlayDB["ChromieTimeExpansionID"])
            end
        end
    end

    -- QUEST_ACCEPTED
    if event == "QUEST_ACCEPTED" then
        -- Automatically hides the quest popup when one is accepted.
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

        local questID = ...
        if questID then
            C_Timer.After(0.25, function()
                local numPopups = GetNumAutoQuestPopUps()
                if numPopups > 0 then
                    AcknowledgeAutoAcceptQuest()
                    RemoveAutoQuestPopUp(questID)
                end
            end)
        end
    end

    -- QUEST_AUTOCOMPLETE
    if event == "QUEST_AUTOCOMPLETE" then
        -- Automatically hides the quest popup when one is completed.
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

        local questID = ...
        if questID then
            if HelpMePlayDB["AcceptAndCompleteQuests"] then
                C_Timer.After(0.25, function() ShowQuestComplete(questID) end)
            end
        end
    end

    -- QUEST_COMPLETE
    if event == "QUEST_COMPLETE" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

        QUEST_COMPLETE()
    end

    -- QUEST_DETAIL
    if event == "QUEST_DETAIL" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

        QUEST_DETAIL()
    end

    -- QUEST_GREETING
    if event == "QUEST_GREETING" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

        QUEST_GREETING()
    end

    -- QUEST_LOG_UPDATE
    if event == "QUEST_LOG_UPDATE" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end
        if WorldMapFrame:IsShown() then return end

        QUEST_LOG_UPDATE()
    end

    -- QUEST_PROGRESS
    if event == "QUEST_PROGRESS" then
        if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return false end

        QUEST_PROGRESS()
    end

    -- UPDATE_MOUSEOVER_UNIT
    if event == "UPDATE_MOUSEOVER_UNIT" then
        if HelpMePlayDB["UseEmotes"] == false then return false end

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
end

-- This is for muting the talking head. They can be annoying, so let's
-- close it immediately if the setting is enabled.
hooksecurefunc(TalkingHeadFrame, "PlayCurrent", function(self)
    if HelpMePlayDB["MuteTalkingHead"] == false then return end

	self:CloseImmediately()
end)

eventHandler:RegisterEvent("ADVENTURE_MAP_OPEN")
eventHandler:RegisterEvent("CHAT_MSG_LOOT")
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
eventHandler:SetScript("OnEvent", OnEvent)