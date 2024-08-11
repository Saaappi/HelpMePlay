local _, HelpMePlay = ...
local LHMP = LibStub("LibHelpMePlay")

local function CheckLevel(string, condition)
    local level = string:match("= (.+)")
    if level and tonumber(level) then
        level = tonumber(level)
        if condition == "<" then
            if HelpMePlay.playerLevel < level then
                return true
            end
        elseif condition == "<=" then
            if HelpMePlay.playerLevel <= level then
                return true
            end
        elseif condition == "==" then
            if HelpMePlay.playerLevel == level then
                return true
            end
        elseif condition == ">=" then
            if HelpMePlay.playerLevel >= level then
                return true
            end
        elseif condition == ">" then
            if HelpMePlay.playerLevel > level then
                return true
            end
        end
    else
        local lowLevel, highLevel = string.split(",", level)
        if lowLevel and highLevel then
            lowLevel = tonumber(lowLevel)
            highLevel = tonumber(highLevel)
            if HelpMePlay.playerLevel >= lowLevel and HelpMePlay.playerLevel <= highLevel then
                return true
            end
        end
    end
    return false
end

HelpMePlay.EvaluateConditions = function(conditions)
    local numConditions = #conditions
    for _, condition in ipairs(conditions) do
        local cond = condition:match("([%w_]+)")
        if cond == "NONE" then
            numConditions = numConditions - 1
        elseif cond == "QUEST_ACTIVE" then
            local questID = condition:match("= (.+)")
            if C_QuestLog.IsOnQuest(questID) then
                numConditions = numConditions - 1
            end
        elseif cond == "QUEST_INACTIVE" then
            local questID = condition:match("= (.+)")
            if not C_QuestLog.IsOnQuest(questID) then
                numConditions = numConditions - 1
            end
        elseif cond == "QUEST_COMPLETE" then
            local questID = condition:match("= (.+)")
            if C_QuestLog.IsQuestFlaggedCompleted(questID) then
                numConditions = numConditions - 1
            end
        elseif cond == "QUEST_INCOMPLETE" then
            local questID = condition:match("= (.+)")
            if not C_QuestLog.IsQuestFlaggedCompleted(questID) then
                numConditions = numConditions - 1
            end
        elseif cond == "QUEST_OBJECTIVE_COMPLETE" then
            local string = condition:match("= (.+)")
            local questID, objectiveIndex = LHMP:SplitString(string, ",", "*")
            if C_QuestLog.IsOnQuest(questID) then
                local objectives = C_QuestLog.GetQuestObjectives(questID)
                if objectives and objectives[tonumber(objectiveIndex)].finished then
                    numConditions = numConditions - 1
                end
            end
        elseif cond == "QUEST_OBJECTIVE_INCOMPLETE" then
            local string = condition:match("= (.+)")
            local questID, objectiveIndex = LHMP:SplitString(string, ",", "*")
            if C_QuestLog.IsOnQuest(questID) then
                local objectives = C_QuestLog.GetQuestObjectives(questID)
                if objectives and (not objectives[tonumber(objectiveIndex)].finished) then
                    numConditions = numConditions - 1
                end
            end
        elseif cond == "LEVEL_LOWER" then
            local isTrue = CheckLevel(condition, "<")
            if isTrue then
                numConditions = numConditions - 1
            end
        elseif cond == "LEVEL_LOWER_OR_EQUAL" then
            local isTrue = CheckLevel(condition, "<=")
            if isTrue then
                numConditions = numConditions - 1
            end
        elseif cond == "LEVEL_EQUAL" then
            local isTrue = CheckLevel(condition, "==")
            if isTrue then
                numConditions = numConditions - 1
            end
        elseif cond == "LEVEL_GREATER_OR_EQUAL" then
            local isTrue = CheckLevel(condition, ">=")
            if isTrue then
                numConditions = numConditions - 1
            end
        elseif cond == "LEVEL_GREATER" then
            local isTrue = CheckLevel(condition, ">")
            if isTrue then
                numConditions = numConditions - 1
            end
        elseif cond == "LEVEL_BETWEEN" then
            local isTrue = CheckLevel(condition, ">=<=")
            if isTrue then
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
            local spellID = condition:match("= (.+)")
            for i = 1, 40 do
                local aura = C_UnitAuras.GetAuraDataByIndex("player", i, "HELPFUL")
                if aura and aura.spellId == spellID then
                    numConditions = numConditions - 1
                    break
                else
                    break
                end
            end
        elseif cond == "BUFF_INACTIVE" then
            local isActive = false
            local spellID = condition:match("= (.+)")
            for i = 1, 40 do
                local aura = C_UnitAuras.GetAuraDataByIndex("player", i, "HELPFUL")
                if aura and aura.spellId == spellID then
                    isActive = true
                    break
                end
            end

            if not isActive then
                numConditions = numConditions - 1
            end
        elseif cond == "HAS_ITEM" then
            local itemID = condition:match("= (.+)")
            if itemID and tonumber(itemID) then
                local breakParentLoop = false
                for bagID = 0, 4 do
                    for slotID = 1, C_Container.GetContainerNumSlots(bagID) do
                        local containerItemID = C_Container.GetContainerItemID(bagID, slotID)
                        if containerItemID then
                            if containerItemID == tonumber(itemID) then
                                numConditions = numConditions - 1
                                breakParentLoop = true
                                break
                            end
                        end
                    end
                    if breakParentLoop then break end
                end
            end
        elseif cond == "MISSING_ITEM" then
            local hasItem = false
            local itemID = condition:match("= (.+)")
            if itemID and tonumber(itemID) then
                local breakParentLoop = false
                for bagID = 0, 4 do
                    for slotID = 1, C_Container.GetContainerNumSlots(bagID) do
                        local containerItemID = C_Container.GetContainerItemID(bagID, slotID)
                        if containerItemID then
                            if containerItemID == tonumber(itemID) then
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