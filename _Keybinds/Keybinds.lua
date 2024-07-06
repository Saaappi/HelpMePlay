local _, HelpMePlay = ...

BINDING_HEADER_HELPMEPLAY = "HelpMePlay"
BINDING_NAME_HELPMEPLAY_MOUNTUP = "Mount Up"
BINDING_NAME_HELPMEPLAY_DELETECURSORITEM = "Delete Cursor Item"
BINDING_NAME_HELPMEPLAY_QUICKQUESTABANDON = "Quick Quest Abandon"

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
        local focus = GetMouseFocus() -- This changes to GetMouseFoci() in 11.0
        if focus then
            local focusedIndexInfo = C_QuestLog.GetInfo(focus.questLogIndex)
            if focusedIndexInfo then
                if focusedIndexInfo.isHeader then
                    -- This is a header that has quests beneath it. As such,
                    -- let's give the player a popup to choose if they want to
                    -- abandon all the quests in the zone.
                    StaticPopupDialogs["HMP_QUICK_QUEST_ABANDON_CONFIRMATION"] = {
                        text = format("You're about to abandon all quests within |cffFFD100%s|r. Do you want to continue?", focus:GetText()),
                        button1 = YES,
                        button2 = NO,
                        explicitAcknowledge = true,
                        OnAccept = function()
                            local startingIndex = focus.questLogIndex + 1
                            local endingIndex = C_QuestLog.GetNumQuestLogEntries()
                            for i = startingIndex, endingIndex do
                                local childIndexInfo = C_QuestLog.GetInfo(i)
                                if childIndexInfo then
                                    if not childIndexInfo.isHeader then
                                        AbandonQuestByID(childIndexInfo.questID)
                                    else
                                        return
                                    end
                                end
                            end
                        end,
                        OnCancel = function()
                        end,
                        preferredIndex = 3
                    }
                    StaticPopup_Show("HMP_QUICK_QUEST_ABANDON_CONFIRMATION")
                else
                    AbandonQuestByID(focusedIndexInfo.questID)
                end
            end
        end
    end
end