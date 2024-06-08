local addonName, addon = ...
local LHMP = LibStub("LibHelpMePlay")

addon.GetActiveEventsFromCalendar = function(currentDate)
    local events = {}
    local numEvents = C_Calendar.GetNumDayEvents(0, currentDate.monthDay)
    if numEvents > 0 then
        for index = 1, numEvents do
            local event = C_Calendar.GetDayEvent(0, currentDate.monthDay, index)
            if event and LHMP:IsEventQueueable(event.eventID) then
                print(event.title)
                local worldEvent = LHMP:GetWorldEvent(event.eventID)
                events[event.eventID] = worldEvent
                events[event.eventID].name = format("%s: %s", addon.ColorText("COMMON", event.title), addon.ColorText("COMMON", worldEvent.name))
            end
        end
    end
    return events
end