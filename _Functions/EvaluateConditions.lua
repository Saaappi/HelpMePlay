local _, HelpMePlay = ...
local LHMP = LibStub("LibHelpMePlay")

HelpMePlay.EvaluateConditions = function(conditions)
    local numConditions = #conditions
    if numConditions > 0 then
        for _, condition in ipairs(conditions) do
            local cond = condition[1]
            if cond == "QUESTS_ACTIVE" then
                local quests = condition[2]
                local numQuests = #quests
                for _, questId in ipairs(quests) do
                    if C_QuestLog.IsOnQuest(questId) then
                        numQuests = numQuests - 1
                    end
                end
                if numQuests == 0 then
                    numConditions = numConditions - 1
                end
            elseif cond == "QUESTS_INACTIVE" then
                local quests = condition[2]
                local numQuests = #quests
                for _, questId in ipairs(quests) do
                    if not C_QuestLog.IsOnQuest(questId) then
                        numQuests = numQuests - 1
                    end
                end
                if numQuests == 0 then
                    numConditions = numConditions - 1
                end
            elseif cond == "QUESTS_COMPLETE" then
                local quests = condition[2]
                local numQuests = #quests
                for _, questId in ipairs(quests) do
                    if C_QuestLog.IsQuestFlaggedCompleted(questId) then
                        numQuests = numQuests - 1
                    end
                end
                if numQuests == 0 then
                    numConditions = numConditions - 1
                end
            elseif cond == "QUESTS_INCOMPLETE" then
                local quests = condition[2]
                local numQuests = #quests
                for _, questId in ipairs(quests) do
                    if not C_QuestLog.IsQuestFlaggedCompleted(questId) then
                        numQuests = numQuests - 1
                    end
                end
                if numQuests == 0 then
                    numConditions = numConditions - 1
                end
            elseif cond == "QUEST_OBJECTIVES_COMPLETE" then
                local quests = condition[2]
                local numQuests = #quests

                for _, quest in ipairs(quests) do
                    local questId = quest[1]
                    local objectiveIndex = quest[2]

                    if C_QuestLog.IsOnQuest(questId) then
                        local objectives = C_QuestLog.GetQuestObjectives(questId)
                        if objectives and objectives[objectiveIndex].finished then
                            numQuests = numQuests - 1
                        end
                    end

                    if numQuests == 0 then
                        numConditions = numConditions - 1
                    end
                end
            elseif cond == "QUEST_OBJECTIVES_INCOMPLETE" then
                local quests = condition[2]
                local numQuests = #quests

                for _, quest in ipairs(quests) do
                    local questId = quest[1]
                    local objectiveIndex = quest[2]

                    if C_QuestLog.IsOnQuest(questId) then
                        local objectives = C_QuestLog.GetQuestObjectives(questId)
                        if objectives and (not objectives[objectiveIndex].finished) then
                            numQuests = numQuests - 1
                        end
                    end

                    if numQuests == 0 then
                        numConditions = numConditions - 1
                    end
                end
            elseif cond == "LEVEL_LOWER" then
                local level = condition[2]
                if HelpMePlay.playerLevel < level then
                    numConditions = numConditions - 1
                end
            elseif cond == "LEVEL_LOWER_OR_EQUAL" then
                local level = condition[2]
                if HelpMePlay.playerLevel <= level then
                    numConditions = numConditions - 1
                end
            elseif cond == "LEVEL_EQUAL" then
                local level = condition[2]
                if HelpMePlay.playerLevel == level then
                    numConditions = numConditions - 1
                end
            elseif cond == "LEVEL_GREATER" then
                local level = condition[2]
                if HelpMePlay.playerLevel > level then
                    numConditions = numConditions - 1
                end
            elseif cond == "LEVEL_GREATER_OR_EQUAL" then
                local level = condition[2]
                if HelpMePlay.playerLevel >= level then
                    numConditions = numConditions - 1
                end
            elseif cond == "LEVEL_BETWEEN" then
                local lowerLevel = condition[2][1]
                local higherLevel = condition[2][2]
                if HelpMePlay.playerLevel >= lowerLevel and HelpMePlay.playerLevel <= higherLevel then
                    numConditions = numConditions - 1
                end
            elseif cond == "CHROMIE_TIME_ACTIVE" then
                if UnitChromieTimeID("player") == HelpMePlayDB["ChromieTimeExpansionID"] then
                    numConditions = numConditions - 1
                end
            elseif cond == "CHROMIE_TIME_INACTIVE" then
                if UnitChromieTimeID("player") ~= HelpMePlayDB["ChromieTimeExpansionID"] then
                    numConditions = numConditions - 1
                end
            elseif cond == "BUFF_ACTIVE" then
                local spellId = condition[2]
                for i = 1, 40 do
                    local aura = C_UnitAuras.GetAuraDataByIndex("player", i, "HELPFUL")
                    if aura and aura.spellId == spellId then
                        numConditions = numConditions - 1
                        break
                    else
                        break
                    end
                end
            elseif cond == "BUFF_INACTIVE" then
                local isActive = false
                local spellId = condition[2]
                for i = 1, 40 do
                    local aura = C_UnitAuras.GetAuraDataByIndex("player", i, "HELPFUL")
                    if aura and aura.spellId == spellId then
                        isActive = true
                        break
                    end
                end

                if not isActive then
                    numConditions = numConditions - 1
                end
            elseif cond == "HAS_ITEM" then
                local itemId = condition[2]
                local breakParentLoop = false
                for bagId = 0, 4 do
                    for slotId = 1, C_Container.GetContainerNumSlots(bagId) do
                        local containerItemID = C_Container.GetContainerItemID(bagId, slotId)
                        if containerItemID then
                            if containerItemID == tonumber(itemId) then
                                numConditions = numConditions - 1
                                breakParentLoop = true
                                break
                            end
                        end
                    end
                    if breakParentLoop then break end
                end
            elseif cond == "MISSING_ITEM" then
                local hasItem = false
                local itemId = condition[2]
                local breakParentLoop = false
                for bagId = 0, 4 do
                    for slotId = 1, C_Container.GetContainerNumSlots(bagId) do
                        local containerItemId = C_Container.GetContainerItemID(bagId, slotId)
                        if containerItemId then
                            if containerItemId == tonumber(itemId) then
                                hasItem = true
                                breakParentLoop = true
                                break
                            end
                        end
                    end
                    if breakParentLoop then break end
                end
                if not hasItem then
                    numConditions = numConditions - 1
                end
            end
        end
    end
    if numConditions == 0 then
        return true
    end
    return false
end