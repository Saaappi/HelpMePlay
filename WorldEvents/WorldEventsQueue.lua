local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local worldEventQueueButton
local leftChevron
local rightChevron
local activeEvents
local currentEventIndex = 1

local function GetActiveEventsFromCalendarByDate(date)
    local events = {}
    local numEvents = C_Calendar.GetNumDayEvents(0, date.monthDay)
    if numEvents > 0 then
        for index = 1, numEvents do
            local event = C_Calendar.GetDayEvent(0, date.monthDay, index)
            if event and LHMP:IsEventQueueable(event.eventID) then
                local worldEvent = LHMP:GetWorldEvent(event.eventID)
                table.insert(events, { name = LHMP:ColorText("COMMON", event.title), dungeonQueueID = worldEvent.dungeonQueueID, texture = worldEvent.atlas or worldEvent.texture, conditions = worldEvent.conditions })
            end
        end
    end
    return events
end

-- This function is used to update (refresh) the button when the player
-- completes an active event.
--[[ DEPRECATED - 2024/06/24
local function RefreshEvents()
    if activeEvents == nil or activeEvents == {} then
        if worldEventQueueButton then
            worldEventQueueButton:Hide()
        end
        return
    end

    if worldEventQueueButton then
        for _, event in next, activeEvents do
            if type(event.texture) == "string" then
                worldEventQueueButton.icon:SetAtlas(event.texture)
            else
                worldEventQueueButton.icon:SetTexture(event.texture)
            end
            worldEventQueueButton.name = event.name
            worldEventQueueButton.dungeonQueueID = event.dungeonQueueID
            break
        end
    end
end]]

-- This function is used to update the button to the next event in the
-- table based on the chevron the player clicked (left or right).
--
-- This allows the player to select the event they're interested in rather
-- than being forced to participate in an event they may not want to do.
local function SetWorldEventQueueButtonToEvent(event)
    if type(event.texture) == "string" then
        worldEventQueueButton.icon:SetAtlas(event.texture)
    else
        worldEventQueueButton.icon:SetTexture(event.texture)
    end
    worldEventQueueButton.name = event.name
    worldEventQueueButton.dungeonQueueID = event.dungeonQueueID
end

addon.CreateEventQueueButton = function()
    if HelpMePlayDB["UseWorldEventQueue"] == false or UnitLevel("player") < addon.Constants["PLAYER_MAX_LEVEL"] then
        if worldEventQueueButton then
            worldEventQueueButton:Hide()
        end
        return
    end

    local currentDate = C_DateAndTime.GetCurrentCalendarTime()
    activeEvents = GetActiveEventsFromCalendarByDate(currentDate)

    if not worldEventQueueButton then
        worldEventQueueButton = CreateFrame("Button", addonName .. "WorldEventQueueButton", UIParent, "ActionButtonTemplate")
        worldEventQueueButton:RegisterForClicks("LeftButtonUp")

        -- There are multiple events active, so let's make the chevron
        -- buttons so the player can toggle between the active events.
        if (#activeEvents > 1) then
            if not leftChevron then
                leftChevron = CreateFrame("Button", nil, worldEventQueueButton, "UIPanelButtonTemplate")
                leftChevron:SetSize(20, 20)
                leftChevron:SetPoint("TOPLEFT", worldEventQueueButton, "BOTTOMLEFT", 2, -5)
                leftChevron.texture = leftChevron:CreateTexture()
                leftChevron.texture:SetPoint("CENTER")
                leftChevron.texture:SetAtlas("uitools-icon-chevron-left", true)

                leftChevron:SetNormalTexture(leftChevron.texture)

                leftChevron:SetScript("OnClick", function()
                    if currentEventIndex == 1 then
                        currentEventIndex = #activeEvents
                    else
                        currentEventIndex = currentEventIndex - 1
                    end
                    SetWorldEventQueueButtonToEvent(activeEvents[currentEventIndex])
                end)

                rightChevron = CreateFrame("Button", nil, worldEventQueueButton, "UIPanelButtonTemplate")
                rightChevron:SetSize(20, 20)
                rightChevron:SetPoint("TOPRIGHT", worldEventQueueButton, "BOTTOMRIGHT", -2, -5)
                rightChevron.texture = rightChevron:CreateTexture()
                rightChevron.texture:SetPoint("CENTER")
                rightChevron.texture:SetAtlas("uitools-icon-chevron-right", true)

                rightChevron:SetNormalTexture(rightChevron.texture)

                rightChevron:SetScript("OnClick", function()
                    if currentEventIndex == (#activeEvents) then
                        currentEventIndex = 1
                    else
                        currentEventIndex = currentEventIndex + 1
                    end
                    SetWorldEventQueueButtonToEvent(activeEvents[currentEventIndex])
                end)
                SetWorldEventQueueButtonToEvent(activeEvents[currentEventIndex])
            end
        elseif (#activeEvents == 1) then
            SetWorldEventQueueButtonToEvent(activeEvents[1])
        else
            -- There aren't any events, so hide the button and return.
            worldEventQueueButton:Hide()
            return
        end

        worldEventQueueButton:SetScript("OnClick", function(self)
            LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, self.dungeonQueueID, LFDDungeonList, LFDHiddenByCollapseList)
        end)
        worldEventQueueButton:SetScript("OnEnter", function(self) addon.Tooltip_OnEnter(self, self.name, "") end)
        worldEventQueueButton:SetScript("OnLeave", addon.Tooltip_OnLeave)

        worldEventQueueButton:SetPoint("TOP", worldEventQueueButton:GetParent(), "TOP", 0, -20)
        worldEventQueueButton:Show()
    else
        if not worldEventQueueButton:IsVisible() then
            worldEventQueueButton:Show()
        end
    end
end

eventHandler:RegisterEvent("PLAYER_LOGIN")
--eventHandler:RegisterEvent("QUEST_TURNED_IN")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        -- Unregister the event for performance.
        eventHandler:UnregisterEvent("PLAYER_LOGIN")

        if HelpMePlayDB["UseWorldEventQueue"] == false or UnitLevel("player") < addon.Constants["PLAYER_MAX_LEVEL"] then return false end
        if PlayerGetTimerunningSeasonID() == 1 then return false end

        -- If there are events, then create the button.
        C_Timer.After(1, function() addon.CreateEventQueueButton() end)
    end
    --[[ DEPRECATED - 2024/06/24
    if event == "QUEST_TURNED_IN" then
        if HelpMePlayDB["UseWorldEventQueue"] == false or UnitLevel("player") < addon.Constants["PLAYER_MAX_LEVEL"] then return false end
        if not activeEvents or activeEvents == {} then return false end

        local questID = ...
        if questID then
            for index, evt in next, activeEvents do
                if evt.questID == questID then
                    activeEvents[index] = nil
                    break
                end
            end
        end

        RefreshEvents()
    end]]
end)