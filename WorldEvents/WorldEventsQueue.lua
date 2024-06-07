local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local worldEventQueueButton
local leftChevron
local rightChevron
local activeEvents = {}
local currentEventIndex = 1

-- This function is used to update (refresh) the button when the player
-- completes an active event.
local function RefreshEvents()
    if next(activeEvents) == nil then
        worldEventQueueButton:Hide()
    end

    for _, event in pairs(activeEvents) do
        if event.atlas then
            worldEventQueueButton.icon:SetAtlas(event.atlas)
        else
            worldEventQueueButton.icon:SetTexture(event.texture)
        end
        worldEventQueueButton.name = event.name
        worldEventQueueButton.dungeonQueueID = event.dungeonQueueID
        break
    end
end

-- This function is used to update the button to the next event in the
-- table based on the chevron the player clicked (left or right).
--
-- This allows the player to select the event they're interested in rather
-- than being forced to participate in an event they may not want to do.
local function SetWorldEventQueueButtonToEvent(event)
    if event.atlas then
        worldEventQueueButton.icon:SetAtlas(event.atlas)
    else
        worldEventQueueButton.icon:SetTexture(event.texture)
    end
    worldEventQueueButton.name = event.name
    worldEventQueueButton.dungeonQueueID = event.dungeonQueueID
end

local function GetEvents()
    local currentDate = C_DateAndTime.GetCurrentCalendarTime()
    local events = addon.GetActiveEvents(currentDate)
    if next(events) ~= nil then
        for _, evt in ipairs(events) do
            if LHMP:IsEventQueueable(evt.eventID) then
                local worldEvent = LHMP:GetWorldEvent(evt.eventID)
                local isWorldEventValid = HelpMePlay.EvalConditions(worldEvent.conditions)
                if isWorldEventValid then
                    activeEvents[evt.eventID] = worldEvent
                end
            end
        end
    end
end

addon.CreateEventQueueButton = function()
    if HelpMePlayDB["UseWorldEventQueue"] == false or UnitLevel("player") < addon.Constants["PLAYER_MAX_LEVEL"] then
        if worldEventQueueButton then
            worldEventQueueButton:Hide()
        end
        return
    end

    GetEvents()

    if not worldEventQueueButton then
        if next(activeEvents) ~= nil then
            worldEventQueueButton = CreateFrame("Button", addonName .. "WorldEventQueueButton", UIParent, "ActionButtonTemplate")
            worldEventQueueButton:RegisterForClicks("LeftButtonUp")

            RefreshEvents()

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
                end
            end

            worldEventQueueButton:SetScript("OnClick", function()
                LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, worldEventQueueButton.dungeonQueueID, LFDDungeonList, LFDHiddenByCollapseList)
            end)
            worldEventQueueButton:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
                GameTooltip:SetText(self.name)
                local _, isTank, isHealer, isDamage = GetLFGRoles()
                GameTooltip:AddLine(format("\nSelected Role(s):\n" ..
                "Tank: |cffFFFFFF%s|r\n" ..
                "Healer: |cffFFFFFF%s|r\n" ..
                "Damage: |cffFFFFFF%s|r", tostring(isTank), tostring(isHealer), tostring(isDamage)))
                GameTooltip:Show()
            end)
            worldEventQueueButton:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)

            worldEventQueueButton:SetPoint("TOP", worldEventQueueButton:GetParent(), "TOP", 0, -20)
            worldEventQueueButton:Show()
        end
    else
        if not worldEventQueueButton:IsVisible() then
            worldEventQueueButton:Show()
        end
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

        GetEvents()
        addon.CreateEventQueueButton()

        -- Unregister the event for performance.
        eventHandler:UnregisterEvent("PLAYER_LOGIN")
    end

    if event == "QUEST_TURNED_IN" then
        if HelpMePlayDB["UseWorldEventQueue"] == false or UnitLevel("player") < addon.Constants["PLAYER_MAX_LEVEL"] then return end
        local questID = ...
        for eventID, evt in pairs(activeEvents) do
            if evt.questIDForVisibility == questID then
                activeEvents[eventID] = nil
                break
            end
        end
        RefreshEvents()
    end
end)