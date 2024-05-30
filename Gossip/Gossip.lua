local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")

eventHandler:RegisterEvent("GOSSIP_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "GOSSIP_SHOW" then
        if HelpMePlayDB["AcceptGossip"] == false then return end

        C_Timer.After(addon.Constants["TIMER_DELAY"], function()
            local options = C_GossipInfo.GetOptions()
            if options then
                local npcID = addon.SplitString(UnitGUID("target"), "-", 6)
                if npcID then
                    if LHMP:IsGossipSupportedForNPC(npcID) then
                        local gossips = LHMP:GetGossipsForNPCByID(npcID)
                        for _, gossip in ipairs(gossips) do
                            local isAllowed = HelpMePlay.EvalConditions(gossip.Conditions)
                            if isAllowed then
                                C_GossipInfo.SelectOption(gossip.ID)
                                if gossip.CanConfirm then
                                    StaticPopup1Button1:Click("LeftButton")
                                    return
                                end
                            end
                        end
                    end

                    -- Debug Mode output to help identify missing gossips.
                    if HelpMePlayDB["DebugModeEnabled"] then
                        print("{DEBUG} Unsupported gossip detected.")
                        HelpMePlay.Print(npcID)
                        for _, option in ipairs(options) do
                            print(format("|cffFFD100%d|r: %s,", option.gossipOptionID, option.name))
                        end
                    end
                end
            end
        end)
    end
end)