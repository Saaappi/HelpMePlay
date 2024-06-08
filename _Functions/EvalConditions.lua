local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

local function CheckLevel(string, condition)
    local level = string:match("= (.+)")
    if level and tonumber(level) then
        level = tonumber(level)
        if condition == "<" then
            if addon.playerLevel < level then
                return true
            end
        elseif condition == "<=" then
            if addon.playerLevel <= level then
                return true
            end
        elseif condition == "==" then
            if addon.playerLevel == level then
                return true
            end
        elseif condition == ">=" then
            if addon.playerLevel >= level then
                return true
            end
        elseif condition == ">" then
            if addon.playerLevel > level then
                return true
            end
        end
    else
        local lowLevel, highLevel = string.split(",", level)
        if lowLevel and highLevel then
            lowLevel = tonumber(lowLevel)
            highLevel = tonumber(highLevel)
            if addon.playerLevel >= lowLevel and addon.playerLevel <= highLevel then
                return true
            end
        end
    end
    return false
end

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            function HelpMePlay.EvalConditions(conditions)
                local warModeAuras = { 269083, 282559 }
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
                        print(C_QuestLog.IsQuestFlaggedCompleted(questID))
                        if not C_QuestLog.IsQuestFlaggedCompleted(questID) then
                            numConditions = numConditions - 1
                        end
                    elseif cond == "QUEST_OBJECTIVE_COMPLETE" then
                        local string = condition:match("= (.+)")
                        local questID, objectiveIndex = string:gmatch("(%d+),(%w+)")
                        if C_QuestLog.IsOnQuest(questID) then
                            local objectives = C_QuestLog.GetQuestObjectives(questID)
                            if objectives[objectiveIndex].finished then
                                numConditions = numConditions - 1
                            end
                        end
                    elseif cond == "QUEST_OBJECTIVE_INCOMPLETE" then
                        local string = condition:match("= (.+)")
                        local questID, objectiveIndex = string:gmatch("(%d+),(%w+)")
                        if C_QuestLog.IsOnQuest(questID) then
                            local objectives = C_QuestLog.GetQuestObjectives(questID)
                            if not objectives[objectiveIndex].finished then
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
                        local chromieTimeID = condition:match("= (.+)")
                        if chromieTimeID and tonumber(chromieTimeID) then
                            if UnitChromieTimeID("player") == chromieTimeID then
                                numConditions = numConditions - 1
                            end
                        end
                    elseif cond == "CHROMIE_TIME_INACTIVE" then
                        local chromieTimeID = condition:match("= (.+)")
                        if chromieTimeID and tonumber(chromieTimeID) then
                            if not UnitChromieTimeID("player") == chromieTimeID then
                                numConditions = numConditions - 1
                            end
                        end
                    elseif cond == "WAR_MODE_ACTIVE" then
                        -- Blizzard made me this way...
                        local isEnlisted = false
                        for _, spellID in ipairs(warModeAuras) do
                            local aura = C_UnitAuras.GetPlayerAuraBySpellID(spellID)
                            if aura then
                                isEnlisted = true
                                break
                            end
                        end
                        if isEnlisted then
                            numConditions = numConditions - 1
                        end
                    elseif cond == "WAR_MODE_INACTIVE" then
                        -- Blizzard made me this way...
                        local isEnlisted = false
                        for _, spellID in ipairs(warModeAuras) do
                            local aura = C_UnitAuras.GetPlayerAuraBySpellID(spellID)
                            if aura then
                                isEnlisted = true
                                break
                            end
                        end
                        if not isEnlisted then
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
                    end
                end
                if numConditions == 0 then
                    return true
                end
                return false
            end
        end
    end
    -- Unload the event for performance.
    eventHandler:UnregisterEvent("ADDON_LOADED")
end)