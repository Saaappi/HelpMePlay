local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local worldEventQueueButton
local activeEvents = {}

local worldEvents = {
    [559] = {
        ["name"] = "Timewalking: The Burning Crusade",
        ["atlas"] = "ChromieTime-Portrait-Small-BurningCrusade",
        ["dungeonQueueID"] = 744,
        ["questID"] = 40168,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 40168",
        },
    },
    [562] = {
        ["name"] = "Timewalking: Wrath of the Lich King",
        ["atlas"] = "ChromieTime-Portrait-Small-WrathoftheLichKing",
        ["dungeonQueueID"] = 995,
        ["questID"] = 40173,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 40173",
        },
    },
    [587] = {
        ["name"] = "Timewalking: Cataclysm",
        ["atlas"] = "ChromieTime-Portrait-Small-Cataclysm",
        ["dungeonQueueID"] = 1146,
        ["questID"] = 40786,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 40786",
        },
    },
    [643] = {
        ["name"] = "Timewalking: Mists of Pandaria",
        ["atlas"] = "ChromieTime-Portrait-Small-MistsofPandaria",
        ["dungeonQueueID"] = 1453,
        ["questID"] = 45563,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 45563",
        },
    },
    [1056] = {
        ["name"] = "Timewalking: Warlords of Draenor",
        ["atlas"] = "ChromieTime-Portrait-Small-WarlordsofDraenor",
        ["dungeonQueueID"] = 1971,
        ["questID"] = 55499,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 55499",
        },
    },
    [1263] = {
        ["name"] = "Timewalking: Legion",
        ["atlas"] = "ChromieTime-Portrait-Small-Legion",
        ["dungeonQueueID"] = 2274,
        ["questID"] = 64710,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 64710",
        },
    },
    [423] = {
        ["name"] = "Love is in the Air",
        ["atlas"] = nil,
        ["texture"] = 135450,
        ["dungeonQueueID"] = 288,
        ["questID"] = 79104,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 79104",
        },
    },
    [341] = {
        ["name"] = "Midsummer Fire Festival",
        ["atlas"] = nil,
        ["texture"] = 135269,
        ["dungeonQueueID"] = 286,
        ["questID"] = 11976,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 11976",
        },
    },
    [372] = {
        ["name"] = "Brewfest",
        ["atlas"] = nil,
        ["texture"] = 133201,
        ["dungeonQueueID"] = 287,
        ["questID"] = 77775,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 77775",
        },
    },
    [324] = {
        ["name"] = "Hallow's End",
        ["atlas"] = nil,
        ["texture"] = 5222578,
        ["dungeonQueueID"] = 285,
        ["questID"] = 78474,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 78474",
        },
    },
}

local function RefreshEvents()
    if next(activeEvents) == nil then
        worldEventQueueButton:Hide()
        HelpMePlay.Print("No more active events. Hiding button...")
    end

    for eventID, event in pairs(activeEvents) do
        if event.atlas then
            worldEventQueueButton.icon:SetAtlas(event.atlas)
        else
            worldEventQueueButton.icon:SetTexture(event.texture)
        end
        worldEventQueueButton["name"] = event.name
        worldEventQueueButton["dungeonQueueID"] = event.dungeonQueueID
        break
    end
end

eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:RegisterEvent("QUEST_TURNED_IN")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        if HelpMePlayDB["UseWorldEventQueue"] == false or UnitLevel("player") < addon.Constants["PLAYER_MAX_LEVEL"] then
            -- Unregister the event for performance.
            eventHandler:UnregisterEvent("PLAYER_LOGIN")

            return
        end
        local currentDate = C_DateAndTime.GetCurrentCalendarTime()

        local events = addon.GetActiveEvents(currentDate)
        if next(events) ~= nil then
            for _, evt in ipairs(events) do
                if worldEvents[evt.eventID] then
                    local isWorldEventValid = HelpMePlay.EvalConditions(worldEvents[evt.eventID].conditions)
                    if isWorldEventValid then
                        activeEvents[evt.eventID] = worldEvents[evt.eventID]
                    end
                end
            end
        end

        if not worldEventQueueButton then
            if next(activeEvents) ~= nil then
                worldEventQueueButton = CreateFrame("Button", addonName .. "WorldEventQueueButton", UIParent, "ActionButtonTemplate")
                worldEventQueueButton:RegisterForClicks("LeftButtonUp")
                RefreshEvents()

                worldEventQueueButton:SetScript("OnClick", function()
                    ---@diagnostic disable-next-line: undefined-global
                    LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, worldEventQueueButton.dungeonQueueID, LFDDungeonList, LFDHiddenByCollapseList)
                end)
                worldEventQueueButton:SetScript("OnEnter", function(self)
                    GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
                    GameTooltip:SetText(self.name)
                    GameTooltip:Show()
                end)
                worldEventQueueButton:SetScript("OnLeave", function()
                    GameTooltip:Hide()
                end)

                worldEventQueueButton:SetPoint("TOP", worldEventQueueButton:GetParent(), "TOP", 0, -20)
                worldEventQueueButton:Show()
            end
        end

        -- Unregister the event for performance.
        eventHandler:UnregisterEvent("PLAYER_LOGIN")
    end

    if event == "QUEST_TURNED_IN" then
        if HelpMePlayDB["UseWorldEventQueue"] == false or UnitLevel("player") < addon.Constants["PLAYER_MAX_LEVEL"] then return end
        local questID = ...
        for eventID, event in pairs(activeEvents) do
            if event.questID == questID then
                activeEvents[eventID] = nil
                break
            end
        end
        RefreshEvents()
    end
end)