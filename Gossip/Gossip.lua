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
                local GUID = UnitGUID("target")
                if GUID then
                    local npcID = addon.SplitString(GUID, "-", 6)
                    if npcID then
                        if LHMP:IsGossipSupportedForNPC(npcID) then
                            local gossips = LHMP:GetGossipsForNPCByID(npcID)
                            for _, gossip in ipairs(gossips) do
                                local isAllowed = HelpMePlay.EvalConditions(gossip.Conditions)
                                if isAllowed then
                                    C_GossipInfo.SelectOption(gossip.ID)
                                    if gossip.CanConfirm then
                                        StaticPopup1Button1:Click("LeftButton")
                                    end
                                end
                            end
                            return
                        end
                    end
                end
            end
        end)
    end
end)