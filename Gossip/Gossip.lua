local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("GOSSIP_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "GOSSIP_SHOW" then
        if HelpMePlayDB["AcceptGossip"] == false then return end

        C_Timer.After(addon.Constants["TIMER_DELAY"], function()
            local mapID = C_Map.GetBestMapForUnit("player")
            local options = C_GossipInfo.GetOptions()
            if mapID and options then
                if HelpMePlayDB["GuideGossips"][mapID] then
                    for _, option in ipairs(options) do
                        if HelpMePlayDB["GuideGossips"][mapID][option.gossipOptionID] then
                            local isGossipAllowed = HelpMePlay.EvalConditions(HelpMePlayDB["GuideGossips"][mapID][option.gossipOptionID].conditions)
                            if isGossipAllowed then
                                C_GossipInfo.SelectOption(option.gossipOptionID)
                                if HelpMePlayDB["GuideGossips"][mapID][option.gossipOptionID].canConfirm then
                                    StaticPopup1Button1:Click("LeftButton")
                                    return
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end)