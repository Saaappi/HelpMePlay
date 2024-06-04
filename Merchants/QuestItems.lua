local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")

eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
        if HelpMePlayDB["PurchaseQuestItems"] == false then return end

        local type = ...
        if type == 5 then
            local GUID = UnitGUID("target")
            if GUID then
                local npcID = addon.SplitString(GUID, "-", 6)
                if npcID then
                    local items = LHMP:GetItemsForMerchant(npcID)
                    if items then
                        for _, item in ipairs(items) do
                            local isAllowed = HelpMePlay.EvalConditions(item.Conditions)
                            if isAllowed then
                                BuyMerchantItem(item.Index, item.Quantity)
                            end
                        end
                    end
                end
            end
        end
    end
end)