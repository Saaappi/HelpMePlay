local addonName, addon = ...

addon.GetRelativeAnchor = function(anchor)
    return addon.anchorMapping[anchor]
end

addon.UpdateQuestMobsIcon = function()
    local nameplates = C_NamePlate.GetNamePlates()
    C_Timer.After(addon.Constants["TIMER_DELAY"], function()
        if nameplates then
            for index = 1, #nameplates do
                local unit = nameplates[index].namePlateUnitToken
                if unit and (not UnitIsPlayer(unit)) then
                    local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
                    if nameplate then
                        if nameplate[addonName .. "QuestMobsIcon"] then
                            local isUnitRelatedToActiveQuest = addon.IsNameplateUnitRelatedToActiveQuest(nameplate.namePlateUnitToken)
                            if isUnitRelatedToActiveQuest then
                                if HelpMePlayDB["QuestMobsIconID"] == 0 then
                                    nameplate[addonName .. "QuestMobsIcon"]:Hide()
                                elseif HelpMePlayDB["QuestMobsIconID"] == 1 then
                                    nameplate[addonName .. "QuestMobsIcon"]:SetAtlas("QuestNormal")
                                    nameplate[addonName .. "QuestMobsIcon"]:Show()
                                elseif HelpMePlayDB["QuestMobsIconID"] == 2 then
                                    nameplate[addonName .. "QuestMobsIcon"]:SetAtlas("BuildanAbomination-32x32")
                                    nameplate[addonName .. "QuestMobsIcon"]:Show()
                                else
                                    nameplate[addonName .. "QuestMobsIcon"]:SetTexture(HelpMePlayDB["QuestMobsCustomIcon"])
                                    nameplate[addonName .. "QuestMobsIcon"]:Show()
                                end
                            end
                        else
                            addon.UpdateNamePlate(nameplate)
                        end
                    end
                end
            end
        end
    end)
end

addon.UpdateQuestMobsIconPosition = function()
    local nameplates = C_NamePlate.GetNamePlates()
    if nameplates then
        for index = 1, #nameplates do
            local unit = nameplates[index].namePlateUnitToken
            if unit and (not UnitIsPlayer(unit)) then
                local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
                if nameplate then
                    if nameplate[addonName .. "QuestMobsIcon"] then
                        nameplate[addonName .. "QuestMobsIcon"]:ClearAllPoints()
                        local position = addon.QUEST_MOBS_POSITION_TYPES[HelpMePlayDB["QuestMobsIconPositionID"]]
                        nameplate[addonName .. "QuestMobsIcon"]:SetPoint(addon.GetRelativeAnchor(position), nameplate, position, HelpMePlayDB["QuestMobsIconXOffset"], HelpMePlayDB["QuestMobsIconYOffset"])
                    end
                end
            end
        end
    end
end

-- Determines if a unit is related to an active quest.
addon.IsNameplateUnitRelatedToActiveQuest = function(unit)
    if unit then
        local isUnitRelatedToActiveQuest = C_QuestLog.UnitIsRelatedToActiveQuest(unit)
        if isUnitRelatedToActiveQuest then
            return true
        end
        --[[local tooltipData = C_TooltipInfo.GetUnit(unit)
        if tooltipData then
            for index = 1, #tooltipData.lines do
                local line = tooltipData.lines[index]
                if line then
                    local numComplete, numRequired = line.leftText:match("(%d)/(%d+)")
                    if numComplete and numRequired then
                        numComplete, numRequired = tonumber(numComplete), tonumber(numRequired)
                        if numComplete ~= numRequired then
                            return true
                        end
                    end
                end
            end
        end]]
    end
    return false
end

-- Adds or removes the Quest Mobs icon from the nameplate.
addon.UpdateNamePlate = function(nameplate)
    local isUnitRelatedToActiveQuest = addon.IsNameplateUnitRelatedToActiveQuest(nameplate.namePlateUnitToken)
    C_Timer.After(addon.Constants["TIMER_DELAY"], function()
        if isUnitRelatedToActiveQuest then
            if not nameplate[addonName .. "QuestMobsIcon"] then
                local icon = nameplate:CreateTexture()
                local position = addon.QUEST_MOBS_POSITION_TYPES[HelpMePlayDB["QuestMobsIconPositionID"]]
                nameplate[addonName .. "QuestMobsIcon"] = icon
                icon:ClearAllPoints()
                icon:SetSize(16, 16)
                icon:SetPoint(addon.GetRelativeAnchor(position), nameplate, position, HelpMePlayDB["QuestMobsIconXOffset"], HelpMePlayDB["QuestMobsIconYOffset"])
                if HelpMePlayDB["QuestMobsIconID"] == 1 then -- Quest
                    icon:SetAtlas("QuestNormal")
                elseif HelpMePlayDB["QuestMobsIconID"] == 2 then -- Treasure Goblin
                    icon:SetAtlas("BuildanAbomination-32x32")
                elseif HelpMePlayDB["QuestMobsIconID"] == 3 then -- Custom
                    icon:SetTexture(HelpMePlayDB["QuestMobsCustomIcon"])
                end
            else
                local position = addon.QUEST_MOBS_POSITION_TYPES[HelpMePlayDB["QuestMobsIconPositionID"]]
                nameplate[addonName .. "QuestMobsIcon"]:SetPoint(addon.GetRelativeAnchor(position), nameplate, position, HelpMePlayDB["QuestMobsIconXOffset"], HelpMePlayDB["QuestMobsIconYOffset"])
                if HelpMePlayDB["QuestMobsIconID"] == 1 then -- Quest
                    nameplate[addonName .. "QuestMobsIcon"]:SetAtlas("QuestNormal")
                elseif HelpMePlayDB["QuestMobsIconID"] == 2 then -- Treasure Goblin
                    nameplate[addonName .. "QuestMobsIcon"]:SetAtlas("BuildanAbomination-32x32")
                elseif HelpMePlayDB["QuestMobsIconID"] == 3 then -- Custom
                    nameplate[addonName .. "QuestMobsIcon"]:SetTexture(HelpMePlayDB["QuestMobsCustomIcon"])
                end
                nameplate[addonName .. "QuestMobsIcon"]:Show()
            end
        else
            if nameplate[addonName .. "QuestMobsIcon"] then
                nameplate[addonName .. "QuestMobsIcon"]:Hide()
            end
        end
    end)
end