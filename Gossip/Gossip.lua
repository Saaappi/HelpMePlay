local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local userGossipButton
local gossipButton
local questsButton

eventHandler:RegisterEvent("GOSSIP_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "GOSSIP_SHOW" then
        if HelpMePlayDB["AcceptGossip"] == false then return end
        if IsShiftKeyDown() then return end

        local options = C_GossipInfo.GetOptions()
        if options then
            local GUID = UnitGUID("target")
            if GUID then
                local npcID = LHMP:SplitString(GUID, "-", 6)
                if npcID then
                    if LHMP:IsGossipSupportedForNPC(npcID) then
                        local gossips = LHMP:GetGossipsForNPCByID(npcID)
                        for _, gossip in ipairs(gossips) do
                            local isAllowed = HelpMePlay.EvaluateConditions(gossip.Conditions)
                            if isAllowed then
                                C_GossipInfo.SelectOption(gossip.ID)
                                if gossip.CanConfirm then
                                    StaticPopup1Button1:Click("LeftButton")
                                end
                            end
                        end
                    end
                    if HelpMePlayDB.PlayerGossips[npcID] then
                        for _, gossipOptionID in ipairs(HelpMePlayDB.PlayerGossips[npcID]) do
                            for _, option in ipairs(options) do
                                if option.gossipOptionID == gossipOptionID then
                                    C_GossipInfo.SelectOption(option.gossipOptionID)
                                    break
                                end
                            end
                        end
                    end
                end
            else
                for _, option in next, options do
                    for _, gossip in next, LHMP.Gossips[0] do
                        if gossip.ID == option.gossipOptionID then
                            local isAllowed = HelpMePlay.EvaluateConditions(gossip.Conditions)
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
        if GossipFrame:IsVisible() and C_BattleNet.GetAccountInfoByGUID(HelpMePlay.playerGUID).battleTag == HelpMePlay.Constants["AUTHOR_BATTLETAG"] then
            if not gossipButton then
                gossipButton = HelpMePlay.CreateWidget("IconButton", {
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
                    HelpMePlay.Tooltip_OnEnter(self, "Gossip", "Get gossip options for the current NPC.")
                end)
                gossipButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
            end
            if not questsButton then
                questsButton = HelpMePlay.CreateWidget("IconButton", {
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
                        if info and
                            info.hasLocalPOI and
                            not info.isHeader then

                            print(format("%s: %s", LHMP:ColorText("GOLD", info.questID), info.title))
                        end
                    end
                end)
                questsButton:SetScript("OnEnter", function(self)
                    HelpMePlay.Tooltip_OnEnter(self, "Quests", "Get a list of your active quests in the current zone.")
                end)
                questsButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
            end
        end
    end
end)

GossipFrame:HookScript("OnShow", function(self)
    if not userGossipButton then
        userGossipButton = HelpMePlay.CreateWidget("BasicButton", {
            name = format("%sUserGossipButton", addonName),
            parent = UIParent,
            width = 120,
            height = 25,
            text = "Gossip",
        })

        userGossipButton:ClearAllPoints()
        userGossipButton:SetPoint("BOTTOM", GossipFrame, "TOP", 0, 2)

        userGossipButton:SetScript("OnClick", function()
            StaticPopupDialogs["HMP_CUSTOM_GOSSIP_OPTION"] = {
                text = "Please enter the index of the option you would like to add.\n\n" ..
                LHMP:ColorText("RED", "Please keep in mind, the addon has priority in the Gossip subsystem."),
                button1 = YES,
                button2 = NO,
                explicitAcknowledge = true,
                hasEditBox = true,
                OnAccept = function(self)
                    local input = self.editBox:GetText()
                    if tonumber(input) then
                        input = tonumber(input)
                        local GUID = UnitGUID("target")
                        if GUID then
                            local npcID = LHMP:SplitString(GUID, "-", 6)
                            if npcID then
                                local options = C_GossipInfo.GetOptions()
                                if options then
                                    if not HelpMePlayDB.PlayerGossips[npcID] then
                                        HelpMePlayDB.PlayerGossips[npcID] = {}
                                    end
                                    for index, gossipOptionID in ipairs(HelpMePlayDB.PlayerGossips[npcID]) do
                                        if gossipOptionID == options[input].gossipOptionID then
                                            table.remove(HelpMePlayDB.PlayerGossips[npcID], index)
                                            return
                                        end
                                    end
                                    table.insert(HelpMePlayDB.PlayerGossips[npcID], options[input].gossipOptionID)
                                end
                            end
                        end
                    end
                end,
                OnCancel = function()
                end,
                preferredIndex = 3
            }
            StaticPopup_Show("HMP_CUSTOM_GOSSIP_OPTION")
        end)
        userGossipButton:SetScript("OnEnter", function(self)
            if UnitExists("target") and
                not UnitIsPlayer("target") then

                HelpMePlay.Tooltip_OnEnter(self, "Gossip", format("Click to add or remove a custom gossip option for %s.", LHMP:ColorText("UNCOMMON", UnitName("target"))))
            end
        end)
        userGossipButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
    end
    userGossipButton:Show()
end)

GossipFrame:HookScript("OnHide", function()
    if userGossipButton and
        userGossipButton:IsVisible() then

        userGossipButton:Hide()
    end
end)