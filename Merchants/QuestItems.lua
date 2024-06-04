local addonName, addon = ...
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

            if MerchantFrame:IsVisible() and C_BattleNet.GetAccountInfoByGUID(addon.playerGUID).battleTag == addon.Constants["AUTHOR_BATTLETAG"] then
                if not merchantButton then
                    merchantButton = {
                        name = addonName .. "MerchantInfoButton",
                        anchor = "TOPLEFT",
                        relativeAnchor = "TOPRIGHT",
                        oX = 10,
                        oY = 0,
                        parent = MerchantFrame,
                        texture = 133786,
                        tooltipHeader = "Get Merchant Information",
                        tooltipText = "Get information about this merchant.",
                        useFontString = false,
                        fontStringText = "",
                        onClick = function()
                            -- NPC ID
                            local GUID = UnitGUID("target")
                            if GUID then
                                local npcID = addon.SplitString(GUID, "-", 6)
                                print(npcID)
                            end

                            -- Wares
                            for i = 1, GetMerchantNumItems() do
                                local name = GetMerchantItemInfo(i)
                                if name then
                                    print(format("%d: %s", addon.ColorText("UNCOMMON", i), name))
                                end
                            end
                        end,
                    }
                    setmetatable(merchantButton, { __index = HelpMePlay.Button })
                    merchantButton = merchantButton:IconButtonWithBorder()
                end
            end
        end
    end
end)