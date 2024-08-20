local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local merchantButton

eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
        if HelpMePlayDB["PurchaseQuestItems"] == false then return end

        local type = ...
        if type == 5 then
            local GUID = UnitGUID("target")
            if GUID then
                local npcID = LHMP:SplitString(GUID, "-", 6)
                if npcID then
                    local items = LHMP:GetItemsForMerchant(npcID)
                    if items then
                        for _, item in ipairs(items) do
                            local isAllowed = HelpMePlay.EvaluateConditions(item.Conditions)
                            if isAllowed then
                                BuyMerchantItem(item.Index, item.Quantity)
                            end
                        end
                    end
                end
            end

            if MerchantFrame:IsVisible() and C_BattleNet.GetAccountInfoByGUID(HelpMePlay.playerGUID).battleTag == HelpMePlay.Constants["AUTHOR_BATTLETAG"] then
                if not merchantButton then
                    merchantButton = HelpMePlay.CreateWidget("IconButton", {
                        name = addonName .. "MerchantInfoButton",
                        width = 32,
                        height = 32,
                        parent = MerchantFrame,
                        texture = 133786,
                        useFontString = false,
                        fontStringText = ""
                    })

                    merchantButton:ClearAllPoints()
                    merchantButton:SetPoint("TOPLEFT", MerchantFrame, "TOPRIGHT", 10, 0)

                    merchantButton:SetScript("OnClick", function()
                        -- NPC ID
                        local GUID = UnitGUID("target")
                        if GUID then
                            local npcID = LHMP:SplitString(GUID, "-", 6)
                            print(npcID)
                        end

                        -- Wares
                        for i = 1, GetMerchantNumItems() do
                            local name = GetMerchantItemInfo(i)
                            if name then
                                print(string.format("%s: %s", LHMP:ColorText("UNCOMMON", i), name))
                            end
                        end
                    end)
                    merchantButton:SetScript("OnEnter", function(self)
                        HelpMePlay.Tooltip_OnEnter(self, "Merchant", "Get a list of the current merchant's wares.")
                    end)
                    merchantButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
                end
            end
        end
    end
end)