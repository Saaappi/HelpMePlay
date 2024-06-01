local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local gossipButton
local questsButton

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

        -- If the gossip from is visible, then add a button that can be used to
        -- quickly retrieve the NPC's ID, as well as the listed options.
        if GossipFrame:IsVisible() and C_BattleNet.GetAccountInfoByGUID(addon.playerGUID).battleTag == "Lightsky#11682" then
            if not gossipButton then
                gossipButton = {
                    name = addonName .. "GossipInfoButton",
                    anchor = "TOPLEFT",
                    relativeAnchor = "TOPRIGHT",
                    oX = 10,
                    oY = 0,
                    parent = GossipFrame,
                    texture = 2056011,
                    tooltipHeader = "Get Gossip Information",
                    tooltipText = "Get gossip information for the current NPC.",
                    useFontString = false,
                    fontStringText = "",
                    onClick = function()
                        if not UnitAffectingCombat("player") then
                            -- NPC ID
                            local GUID = UnitGUID("target")
                            if GUID then
                                local npcID = addon.SplitString(GUID, "-", 6)
                                print(npcID)
                            else
                                print(0) -- This is for gossips associated to non-NPCs.
                            end

                            -- Gossips
                            local options = C_GossipInfo.GetOptions()
                            if options then
                                for _, option in ipairs(options) do
                                    print(format("%s: %s", addon.ColorText("UNCOMMON", option.gossipOptionID), option.name))
                                end
                            end
                        end
                    end,
                }
                setmetatable(gossipButton, { __index = HelpMePlay.Button })
                gossipButton = gossipButton:IconButtonWithBorder()
            end
            if not questsButton then
                questsButton = {
                    name = addonName .. "QuestsButton",
                    anchor = "TOP",
                    relativeAnchor = "BOTTOM",
                    oX = 0,
                    oY = -5,
                    parent = gossipButton,
                    texture = 236668,
                    tooltipHeader = "Get Quests",
                    tooltipText = "Get a list of your active quests.",
                    useFontString = false,
                    fontStringText = "",
                    onClick = function()
                        if not UnitAffectingCombat("player") then
                            local numEntries = C_QuestLog.GetNumQuestLogEntries()
                            for i = 1, numEntries do
                                local info = C_QuestLog.GetInfo(i)
                                if info and (not info.isHeader) then
                                    print(format("%s: %s", addon.ColorText("GOLD", info.questID), info.title))
                                end
                            end
                        end
                    end,
                }
                setmetatable(questsButton, { __index = HelpMePlay.Button })
                questsButton = questsButton:IconButtonWithBorder()
            end
        end
    end
end)