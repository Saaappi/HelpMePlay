local addonName, HelpMePlay = ...
local questId = 0

BINDING_HEADER_HELPMEPLAY = "HelpMePlay"
BINDING_NAME_HELPMEPLAY_MOUNTUP = "Mount Up"
BINDING_NAME_HELPMEPLAY_DELETECURSORITEM = "Delete Cursor Item"
BINDING_NAME_HELPMEPLAY_QUICKQUESTABANDON = "Quick Quest Abandon"
BINDING_NAME_HELPMEPLAY_QUICKWORLDEVENTQUEUE = "World Event Queue"

local function AbandonQuestByID(questID)
    C_QuestLog.SetSelectedQuest(questID)
    C_QuestLog.SetAbandonQuest()
    C_QuestLog.AbandonQuest()
end

function HelpMePlayKeybind(key)
    if key == GetBindingKey("HELPMEPLAY_MOUNTUP") then
        HelpMePlay.Mount()
    elseif key == GetBindingKey("HELPMEPLAY_DELETECURSORITEM") then
        DeleteCursorItem()
    elseif key == GetBindingKey("HELPMEPLAY_QUICKQUESTABANDON") then
        local mouseFoci = GetMouseFoci()
        if mouseFoci then
            local focus = mouseFoci[1]
            if focus and focus.info then -- Not a header
                AbandonQuestByID(focus.info.questID)
            elseif focus and focus.questLogIndex then
                local info = C_QuestLog.GetInfo(focus.questLogIndex)
                if info and info.isHeader then
                    -- This is a header that has quests beneath it. As such,
                    -- let's give the player a popup to choose if they want to
                    -- abandon all the quests in the zone.
                    StaticPopupDialogs["HMP_QUICK_QUEST_ABANDON_CONFIRMATION"] = {
                        text = string.format("You're about to abandon all quests within |cffFFD100%s|r. Do you want to continue?", info.title),
                        button1 = YES,
                        button2 = NO,
                        explicitAcknowledge = true,
                        OnAccept = function()
                            local startingIndex = focus.questLogIndex + 1
                            local endingIndex = C_QuestLog.GetNumQuestLogEntries()
                            for i = startingIndex, endingIndex do
                                local child = C_QuestLog.GetInfo(i)
                                if child and (not child.isHeader) then
                                    AbandonQuestByID(child.questID)
                                else
                                    return
                                end
                            end
                        end,
                        OnCancel = function()
                        end,
                        preferredIndex = 3
                    }
                    StaticPopup_Show("HMP_QUICK_QUEST_ABANDON_CONFIRMATION")
                end
            else -- Handle abandoning quests from the quest objective tracker
                if questId and tonumber(questId) then
                    if C_QuestLog.IsOnQuest(questId) then
                        AbandonQuestByID(questId)
                        questId = 0
                    end
                end
            end
        end
    elseif key == GetBindingKey("HELPMEPLAY_QUICKWORLDEVENTQUEUE") then
        local buttonName = string.format("%sWorldEventQueueButton", addonName)
        if _G[buttonName]:IsVisible() then
            _G[buttonName]:Click("LeftButton")
        end
    end
end

EventRegistry:RegisterCallback("OnQuestBlockHeader.OnEnter", function(_, _, blockQuestId)
    if blockQuestId and tonumber(blockQuestId) then
        questId = blockQuestId
    end
end)

hooksecurefunc(QuestObjectiveTracker, "OnBlockHeaderLeave", function()
    questId = 0
end)