local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local currentEventIndex = 1

-- LibHelpMePlay
local LHMP = LibStub("LibHelpMePlay")

-- Queue Button Variables
local button
local leftChevron
local rightChevron

local function GetActiveEventsFromCalendarByDate()
    local events = {}
    local date = C_DateAndTime.GetCurrentCalendarTime()
    local numEvents = C_Calendar.GetNumDayEvents(0, date.monthDay)
    if numEvents > 0 then
        for index = 1, numEvents do
            local event = C_Calendar.GetDayEvent(0, date.monthDay, index)
            if event and LHMP:IsEventQueueable(event.eventID) then
                local worldEvent = LHMP:GetWorldEvent(event.eventID)
                table.insert(events, { name = worldEvent.name or event.title, dungeonQueueID = worldEvent.dungeonQueueID, texture = worldEvent.atlas or worldEvent.texture })
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
local function SetEvent(event)
    if type(event.texture) == "string" then
        button.icon:SetAtlas(event.texture)
    else
        button.icon:SetTexture(event.texture)
    end
    button.name = event.name
    button.dungeonQueueID = event.dungeonQueueID
end

HelpMePlay.CreateEventQueueButton = function()
    if HelpMePlayDB["UseWorldEventQueue"] == false then
        if button then
            button:Hide()
        end
        return
    end

    local events = GetActiveEventsFromCalendarByDate()

    if not button then
        button = CreateFrame("Button", addonName .. "WorldEventQueueButton", UIParent, "ActionButtonTemplate")
        button:RegisterForClicks("LeftButtonUp")

        local extraActionButtonBinding = GetBindingKey("HELPMEPLAY_QUICKWORLDEVENTQUEUE")

        -- There are multiple events active, so let's make the chevron
        -- buttons so the player can toggle between the active events.
        if (#events > 1) then
            if not leftChevron then
                leftChevron = CreateFrame("Button", nil, button)
                leftChevron:SetSize(20, 20)
                leftChevron:SetPoint("RIGHT", button, "LEFT", -2, 0)
                leftChevron.texture = leftChevron:CreateTexture()
                leftChevron.texture:SetAtlas("common-icon-backarrow")
                leftChevron:SetNormalTexture(leftChevron.texture)
                leftChevron:SetHighlightAtlas("common-icon-backarrow", "ADD")

                leftChevron:SetScript("OnClick", function()
                    if currentEventIndex == 1 then
                        currentEventIndex = #events
                    else
                        currentEventIndex = currentEventIndex - 1
                    end
                    SetEvent(events[currentEventIndex])
                end)
                leftChevron:SetScript("OnEnter", function(self)
                    local previewIndex = 0
                    if currentEventIndex == 1 then
                        previewIndex = #events
                    else
                        previewIndex = currentEventIndex - 1
                    end
                    HelpMePlay.Tooltip_OnEnter(self, events[previewIndex].name, "")
                end)
                leftChevron:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)

                rightChevron = CreateFrame("Button", nil, button)
                rightChevron:SetSize(20, 20)
                rightChevron:SetPoint("LEFT", button, "RIGHT", 2, 0)
                rightChevron.texture = rightChevron:CreateTexture()
                rightChevron.texture:SetAtlas("common-icon-forwardarrow")
                rightChevron:SetNormalTexture(rightChevron.texture)
                rightChevron:SetHighlightAtlas("common-icon-forwardarrow", "ADD")

                rightChevron:SetScript("OnClick", function()
                    if currentEventIndex == (#events) then
                        currentEventIndex = 1
                    else
                        currentEventIndex = currentEventIndex + 1
                    end
                    SetEvent(events[currentEventIndex])
                end)
                rightChevron:SetScript("OnEnter", function(self)
                    local previewIndex = 0
                    if currentEventIndex == (#events) then
                        previewIndex = 1
                    else
                        previewIndex = currentEventIndex + 1
                    end
                    HelpMePlay.Tooltip_OnEnter(self, events[previewIndex].name, "")
                end)
                rightChevron:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)

                SetEvent(events[currentEventIndex])
            end
        elseif (#events == 1) then
            SetEvent(events[1])
        else
            -- There aren't any events, so hide the button and return.
            button:Hide()
            return
        end

        button:SetScript("OnClick", function(self)
            LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, self.dungeonQueueID, LFDDungeonList, LFDHiddenByCollapseList)
        end)
        button:SetScript("OnEnter", function(self)
            extraActionButtonBinding = GetBindingKey("HELPMEPLAY_QUICKWORLDEVENTQUEUE")
            if extraActionButtonBinding then
                HelpMePlay.Tooltip_OnEnter(self, self.name, format("%s Use |cff06BEC6%s|r for quick use.\n\nClick and hold to drag.", LHMP:ColorText("UNCOMMON", "TIP:"), extraActionButtonBinding))
            else
                print(extraActionButtonBinding)
                HelpMePlay.Tooltip_OnEnter(self, self.name, LHMP:ColorText("UNCOMMON", "TIP: ") .. "You can set a keybind in the Keybindings menu for quick use.\n\nClick and hold to drag.")
            end
        end)
        button:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)

        -- Clear all anchors from the button.
        button:ClearAllPoints()

        -- Make the World Event queue button movable.
        button:SetMovable(true)
        button:EnableMouse(true)
        button:RegisterForDrag("LeftButton")
        button:SetScript("OnDragStart", function(self)
            self:StartMoving()
        end)
        button:SetScript("OnDragStop", function(self)
            self:StopMovingOrSizing()
            local anchor, parent, relativeAnchor, x, y = self:GetPoint()
            HelpMePlayDB.Positions["button"] = {anchor = anchor, parent = parent, relativeAnchor = relativeAnchor, x = x, y = y}
        end)

        -- If the player has moved the queue button, then set its position to
        -- their location. Otherwise, default to the top center of the screen.
        if HelpMePlayDB.Positions["button"] then
            local pos = HelpMePlayDB.Positions["button"]
            button:SetPoint(pos.anchor, pos.parent, pos.relativeAnchor, pos.x, pos.y)
        else
            button:SetPoint("TOP", button:GetParent(), "TOP", 0, -20)
        end
        button:Show()
    else
        if not button:IsVisible() then
            button:Show()
        end
    end
end

HelpMePlay.IsCalendarLoaded = function()
    local function DelayedUpdate()
        if type(CalendarFrame) ~= "table" or not CalendarFrame:IsShown() then
            local date = C_DateAndTime.GetCurrentCalendarTime()
            C_Calendar.SetAbsMonth(date.month, date.year)
            C_Calendar.OpenCalendar()
        end
    end

    DelayedUpdate()
    C_Timer.After(10, DelayedUpdate)
end

local function OnEvent(self, event, ...)
    if event == "PLAYER_LOGIN" then
        eventHandler:UnregisterEvent(event)
        if HelpMePlayDB["UseWorldEventQueue"] == false then return false end

        HelpMePlay.IsCalendarLoaded()

        C_Timer.After(10, HelpMePlay.CreateEventQueueButton)
    end
end

eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:SetScript("OnEvent", OnEvent)