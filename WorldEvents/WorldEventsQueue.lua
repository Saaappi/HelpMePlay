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
                table.insert(events, { name = event.title, dungeonQueueID = worldEvent.dungeonQueueID, texture = worldEvent.atlas or worldEvent.texture, conditions = worldEvent.conditions })
            end
        end
    end
    return events
end

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
                leftChevron = CreateFrame("Button", nil, worldEventQueueButton)
                leftChevron:SetSize(20, 20)
                leftChevron:SetPoint("RIGHT", worldEventQueueButton, "LEFT", -2, 0)
                leftChevron.texture = leftChevron:CreateTexture()
                leftChevron.texture:SetAtlas("common-icon-backarrow")
                leftChevron:SetNormalTexture(leftChevron.texture)
                leftChevron:SetHighlightAtlas("common-icon-backarrow", "ADD")

                leftChevron:SetScript("OnClick", function()
                    if currentEventIndex == 1 then
                        currentEventIndex = #activeEvents
                    else
                        currentEventIndex = currentEventIndex - 1
                    end
                    SetWorldEventQueueButtonToEvent(activeEvents[currentEventIndex])
                end)
                leftChevron:SetScript("OnEnter", function(self)
                    local previewIndex = 0
                    if currentEventIndex == 1 then
                        previewIndex = #activeEvents
                    else
                        previewIndex = currentEventIndex - 1
                    end
                    addon.Tooltip_OnEnter(self, activeEvents[previewIndex].name, "")
                end)
                leftChevron:SetScript("OnLeave", addon.Tooltip_OnLeave)

                rightChevron = CreateFrame("Button", nil, worldEventQueueButton)
                rightChevron:SetSize(20, 20)
                rightChevron:SetPoint("LEFT", worldEventQueueButton, "RIGHT", 2, 0)
                rightChevron.texture = rightChevron:CreateTexture()
                rightChevron.texture:SetAtlas("common-icon-forwardarrow")
                rightChevron:SetNormalTexture(rightChevron.texture)
                rightChevron:SetHighlightAtlas("common-icon-forwardarrow", "ADD")

                rightChevron:SetScript("OnClick", function()
                    if currentEventIndex == (#activeEvents) then
                        currentEventIndex = 1
                    else
                        currentEventIndex = currentEventIndex + 1
                    end
                    SetWorldEventQueueButtonToEvent(activeEvents[currentEventIndex])
                end)
                rightChevron:SetScript("OnEnter", function(self)
                    local previewIndex = 0
                    if currentEventIndex == (#activeEvents) then
                        previewIndex = 1
                    else
                        previewIndex = currentEventIndex + 1
                    end
                    addon.Tooltip_OnEnter(self, activeEvents[previewIndex].name, "")
                end)
                rightChevron:SetScript("OnLeave", addon.Tooltip_OnLeave)

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
        worldEventQueueButton:SetScript("OnEnter", function(self)
            addon.Tooltip_OnEnter(self, self.name, "\nClick and hold to drag.")
        end)
        worldEventQueueButton:SetScript("OnLeave", addon.Tooltip_OnLeave)

        -- Make the World Event queue button movable.
        worldEventQueueButton:SetMovable(true)
        worldEventQueueButton:EnableMouse(true)
        worldEventQueueButton:RegisterForDrag("LeftButton")
        worldEventQueueButton:SetScript("OnDragStart", function(self)
            self:StartMoving()
        end)
        worldEventQueueButton:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
            local anchor, parent, relativeAnchor, x, y = self:GetPoint()
            HelpMePlayDB.Positions["WorldEventQueueButton"] = {anchor = anchor, parent = parent, relativeAnchor = relativeAnchor, x = x, y = y}
        end)

        -- If the player has moved the queue button, then set its position to
        -- their location. Otherwise, default to the top center of the screen.
        if HelpMePlayDB.Positions["WorldEventQueueButton"] then
            local pos = HelpMePlayDB.Positions["WorldEventQueueButton"]
            worldEventQueueButton:SetPoint(pos.anchor, pos.parent, pos.relativeAnchor, pos.x, pos.y)
        else
            worldEventQueueButton:SetPoint("TOP", worldEventQueueButton:GetParent(), "TOP", 0, -20)
        end
        worldEventQueueButton:Show()
    else
        if not worldEventQueueButton:IsVisible() then
            worldEventQueueButton:Show()
        end
    end
end

eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        -- Unregister the event for performance.
        eventHandler:UnregisterEvent("PLAYER_LOGIN")

        if HelpMePlayDB["UseWorldEventQueue"] == false or UnitLevel("player") < addon.Constants["PLAYER_MAX_LEVEL"] then return false end
        if PlayerGetTimerunningSeasonID() == 1 then return false end

        -- If there are events, then create the button.
        C_Timer.After(1, function() addon.CreateEventQueueButton() end)
    end
end)