local addonName, addon = ...

addon.GetActiveEventsFromCalendar = function(currentDate)
    local events = {}
    local numEvents = C_Calendar.GetNumDayEvents(0, currentDate.monthDay)
    if numEvents > 0 then
        for index = 1, numEvents do
            local event = C_Calendar.GetDayEvent(0, currentDate.monthDay, index)
            table.insert(events, event)
        end
    end
    return events
end