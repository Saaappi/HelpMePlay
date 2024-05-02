local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("NAME_PLATE_UNIT_ADDED")
eventHandler:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
eventHandler:RegisterEvent("QUEST_ACCEPTED")
eventHandler:RegisterEvent("QUEST_REMOVED")
eventHandler:RegisterEvent("QUEST_TURNED_IN")
eventHandler:RegisterEvent("UI_INFO_MESSAGE")
eventHandler:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "NAME_PLATE_UNIT_ADDED" then
        if HelpMePlayDB["QuestMobsIconID"] == 0 then return end

        local unit = ...
        local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
        if nameplate then
            unit = nameplate.namePlateUnitToken
            if not UnitIsPlayer(unit) then
                addon.UpdateNamePlate(nameplate)
            end
        end
    end
    if event == "NAME_PLATE_UNIT_REMOVED" then
        if HelpMePlayDB["QuestMobsIconID"] == 0 then return end

        local unit = ...
        local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
        if nameplate then
            addon.UpdateNamePlate(nameplate)
        end
    end
    if event == "QUEST_ACCEPTED" then
        if HelpMePlayDB["QuestMobsIconID"] == 0 then return end

        addon.UpdateQuestMobsIcon()
    end
    if event == "QUEST_REMOVED" or event == "QUEST_TURNED_IN" then
        if HelpMePlayDB["QuestMobsIconID"] == 0 then return end

        addon.UpdateQuestMobsIcon()
    end
    if event == "UI_INFO_MESSAGE" then
        if HelpMePlayDB["QuestMobsIconID"] == 0 then return end

        local message = select(2, ...)
        if message == "Objective Complete." then
            local nameplates = C_NamePlate.GetNamePlates()
            if nameplates then
                for index = 1, #nameplates do
                    local unit = nameplates[index].namePlateUnitToken
                    if unit and (not UnitIsPlayer(unit)) then
                        local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
                        addon.UpdateNamePlate(nameplate)
                    end
                end
            end
        end
    end
    if event == "UPDATE_MOUSEOVER_UNIT" then
        if not UnitIsPlayer("mouseover") then
            local nameplate = C_NamePlate.GetNamePlateForUnit("mouseover")
            if nameplate then
                addon.UpdateNamePlate(nameplate)
            end
        end
    end
end)