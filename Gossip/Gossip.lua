local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local gossipButton
local questsButton

eventHandler:RegisterEvent("GOSSIP_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "GOSSIP_SHOW" then
        if HelpMePlayDB["AcceptGossip"] == false then return end

        local options = C_GossipInfo.GetOptions()
        if options then
            local GUID = UnitGUID("target")
            if GUID then
                local npcID = LHMP:SplitString(GUID, "-", 6)
                if npcID then
                    --[[ DEPRECATED - 2024/06/30
                    if LHMP:IsGossipTextNPC(npcID) then
                        local gossips = LHMP.GossipTextLookupByNPC[npcID]
                        for _, option in next, options do
                            for _, gossipID in next, gossips do
                                if gossipID == option.gossipOptionID then
                                    C_GossipInfo.SelectOption(gossipID)
                                end
                            end
                        end
                        ]]
                    if LHMP:IsGossipSupportedForNPC(npcID) then
                        local gossips = LHMP:GetGossipsForNPCByID(npcID)
                        for _, gossip in ipairs(gossips) do
                            local isAllowed = addon.EvaluateConditions(gossip.Conditions)
                            if isAllowed then
                                C_GossipInfo.SelectOption(gossip.ID)
                                if gossip.CanConfirm then
                                    StaticPopup1Button1:Click("LeftButton")
                                end
                            end
                        end
                    end
                end
            else
                for _, option in next, options do
                    for _, gossip in next, LHMP.Gossips[0] do
                        if gossip.ID == option.gossipOptionID then
                            local isAllowed = addon.EvaluateConditions(gossip.Conditions)
                            if isAllowed then
                                C_GossipInfo.SelectOption(gossip.ID)
                                if gossip.CanConfirm then
                                    StaticPopup1Button1:Click("LeftButton")
                                end
                            end
                        end
                    end
                end
            end
        end

        -- If the gossip from is visible, then add a button that can be used to
        -- quickly retrieve the NPC's ID, as well as the listed options.
        if GossipFrame:IsVisible() and C_BattleNet.GetAccountInfoByGUID(addon.playerGUID).battleTag == addon.Constants["AUTHOR_BATTLETAG"] then
            if not gossipButton then
                gossipButton = addon.CreateWidget("IconButton", {
                    name = format("%sGossipInfoButton", addonName),
                    width = 32,
                    height = 32,
                    parent = GossipFrame,
                    texture = 2056011,
                    useFontString = false,
                    fontStringText = ""
                })

                gossipButton:ClearAllPoints()
                gossipButton:SetPoint("TOPLEFT", GossipFrame, "TOPRIGHT", 10, 0)

                gossipButton:SetScript("OnClick", function()
                    -- NPC ID
                    local GUID = UnitGUID("target")
                    if GUID then
                        local npcID = LHMP:SplitString(GUID, "-", 6)
                        print(format("%d - %s", npcID, LHMP:ColorText("GOLD", GossipFrameTitleText:GetText())))
                    else
                        print(format("%d - %s", 0, LHMP:ColorText("GOLD", GossipFrameTitleText:GetText()))) -- This is for gossips associated to non-NPCs.
                    end

                    -- Gossips
                    local options = C_GossipInfo.GetOptions()
                    if options then
                        for _, option in ipairs(options) do
                            print(format("%s: %s", LHMP:ColorText("UNCOMMON", option.gossipOptionID), option.name))
                        end
                    end
                end)
                gossipButton:SetScript("OnEnter", function(self)
                    addon.Tooltip_OnEnter(self, "Gossip", "Get gossip options for the current NPC.")
                end)
                gossipButton:SetScript("OnLeave", addon.Tooltip_OnLeave)
            end
            if not questsButton then
                questsButton = addon.CreateWidget("IconButton", {
                    name = format("%sActiveQuestsInfoButton", addonName),
                    width = 32,
                    height = 32,
                    parent = gossipButton,
                    texture = 236668,
                    useFontString = false,
                    fontStringText = ""
                })

                questsButton:ClearAllPoints()
                questsButton:SetPoint("TOP", gossipButton, "BOTTOM", 0, -5)

                questsButton:SetScript("OnClick", function()
                    local numEntries = C_QuestLog.GetNumQuestLogEntries()
                    for i = 1, numEntries do
                        local info = C_QuestLog.GetInfo(i)
                        if info and (not info.isHeader) and info.isOnMap then
                            print(format("%s: %s", LHMP:ColorText("GOLD", info.questID), info.title))
                        end
                    end
                end)
                questsButton:SetScript("OnEnter", function(self)
                    addon.Tooltip_OnEnter(self, "Quests", "Get a list of your active quests in the current zone.")
                end)
                questsButton:SetScript("OnLeave", addon.Tooltip_OnLeave)
            end
        end
    end
end)