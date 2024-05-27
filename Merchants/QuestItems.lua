local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:RegisterEvent("QUEST_ACCEPTED")
eventHandler:RegisterEvent("QUEST_REMOVED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
        if HelpMePlayDB["PurchaseQuestItems"] == false then return end

        local type = ...
        if type == 5 then
            for index = 1, GetMerchantNumItems() do
                local itemID = GetMerchantItemID(index)
                if itemID then
                    local item = Item:CreateFromItemID(itemID)
                    item:ContinueOnItemLoad(function()
                        local name = GetMerchantItemInfo(index)
                        for _, quest in pairs(HelpMePlayDB["GuideQuestItems"]) do
                            for _, questItem in ipairs(quest) do
                                if questItem.itemName == name then
                                    BuyMerchantItem(index, questItem.quantity)
                                end
                            end
                        end
                    end)
                end
            end
        end
    end

    if event == "QUEST_ACCEPTED" then
        if HelpMePlayDB["PurchaseQuestItems"] == false then return end

        local questID = ...
        if questID then
            C_Timer.After(0.25, function()
                local objectives = C_QuestLog.GetQuestObjectives(questID)
                if objectives then
                    for index, objective in ipairs(objectives) do
                        if objective.type == "item" then
                            local criteria = GetQuestObjectiveInfo(questID, index, false)
                            if criteria then
                                local quantity, match = criteria:match("%d+/(%d+) (.+)")
                                if quantity and match then
                                    if not HelpMePlayDB["GuideQuestItems"][questID] then
                                        HelpMePlayDB["GuideQuestItems"][questID] = {}
                                    end
                                    table.insert(HelpMePlayDB["GuideQuestItems"][questID], { quantity = tonumber(quantity), itemName = match })
                                end
                            end
                        end
                    end
                end
            end)
        end
    end

    if event == "QUEST_REMOVED" then
        if HelpMePlayDB["PurchaseQuestItems"] == false then return end

        local questID = ...
        if questID and HelpMePlayDB["GuideQuestItems"][questID] then
            HelpMePlayDB["GuideQuestItems"][questID] = nil
        end
    end
end)