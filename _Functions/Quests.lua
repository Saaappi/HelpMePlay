local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            -- How to handle completing a quest.
            function HelpMePlay.CompleteQuest()
                if HelpMePlayDB["AcceptAndCompleteQuests"] == false then return end

                C_Timer.After(addon.Constants["TIMER_DELAY"], function()
                    local bestSellPrice = 0
                    local bestItemIndex = 0
                    local numQuestRewards = GetNumQuestRewards()
                    local numQuestChoices = GetNumQuestChoices()
                    if numQuestChoices > 1 or numQuestRewards > 1 then
                        if HelpMePlayDB["QuestRewardSelectionTypeID"] == 0 then return end

                        for index = 1, numQuestChoices do
                            local quantity = select(3, GetQuestItemInfo("choice", index))
                            local itemLink = GetQuestItemLink("choice", index)
                            if quantity and itemLink then
                                local sellPrice = select(11, C_Item.GetItemInfo(itemLink))
                                if sellPrice > 0 then
                                    sellPrice = sellPrice * quantity
                                    if sellPrice > bestSellPrice then
                                        bestSellPrice = sellPrice
                                        bestItemIndex = index
                                    end
                                end
                            end
                        end

                        if bestItemIndex == 0 then
                            -- All items sell for the same value, so pick a random reward.
                            GetQuestReward(math.random(1, numQuestChoices))
                        end
                    elseif numQuestChoices == 1 or numQuestRewards == 1 then
                        GetQuestReward(1)
                    else
                        QuestFrameCompleteButton:Click()
                        QuestFrameCompleteQuestButton:Click()
                    end
                end)
            end

            -- Determines if an NPC is ignored or not.
            function HelpMePlay.IsQuestGiverIgnored(npcID)
                if addon.IgnoredQuestGivers[npcID] then
                    return true
                end
                return false
            end

            -- Unload the event for performance.
            eventHandler:UnregisterEvent("ADDON_LOADED")
        end
    end
end)