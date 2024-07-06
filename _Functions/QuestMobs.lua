local addonName, HelpMePlay = ...
local iconSize = 12
local iconType1 = "UI-HUD-UnitFrame-Target-PortraitOn-Boss-Quest"
local iconType2 = "BuildanAbomination-32x32"

HelpMePlay.QUEST_MOBS_ICON_TYPES = {
    [1] = "Quest",
    [2] = "Treasure Goblin",
    [3] = "Custom",
    [0] = NONE,
}

-- The values displayed here are the parent anchors (the nameplate).
HelpMePlay.QUEST_MOBS_POSITION_TYPES = {
    [1] = "LEFT",
    [2] = "TOPLEFT",
    [3] = "TOP",
    [4] = "TOPRIGHT",
    [5] = "RIGHT",
    [6] = "BOTTOMRIGHT",
    [7] = "BOTTOM",
    [8] = "BOTTOMLEFT",
}

HelpMePlay.anchorMapping = {
    LEFT = "RIGHT",
    TOPLEFT = "BOTTOMRIGHT",
    TOP = "BOTTOM",
    TOPRIGHT = "BOTTOMLEFT",
    RIGHT = "LEFT",
    BOTTOMRIGHT = "TOPLEFT",
    BOTTOM = "TOP",
    BOTTOMLEFT = "TOPRIGHT",
}

HelpMePlay.GetRelativeAnchor = function(anchor)
    return HelpMePlay.anchorMapping[anchor]
end

HelpMePlay.UpdateQuestMobsIcon = function()
    local nameplates = C_NamePlate.GetNamePlates()
    C_Timer.After(HelpMePlay.Constants["TIMER_DELAY"], function()
        if nameplates then
            for index = 1, #nameplates do
                local unit = nameplates[index].namePlateUnitToken
                if unit and (not UnitIsPlayer(unit)) then
                    local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
                    if nameplate then
                        if HelpMePlayDB["QuestMobsIconID"] == 0 or HelpMePlayDB["QuestMobsIconPositionID"] == 0 then
                            if nameplate[addonName .. "QuestMobsIcon"] then
                                nameplate[addonName .. "QuestMobsIcon"]:Hide()
                            end
                        else
                            if nameplate[addonName .. "QuestMobsIcon"] then
                                local isUnitRelatedToActiveQuest = HelpMePlay.IsNameplateUnitRelatedToActiveQuest(nameplate.namePlateUnitToken)
                                if isUnitRelatedToActiveQuest then
                                    if HelpMePlayDB["QuestMobsIconID"] == 0 then
                                        nameplate[addonName .. "QuestMobsIcon"]:Hide()
                                    elseif HelpMePlayDB["QuestMobsIconID"] == 1 then
                                        nameplate[addonName .. "QuestMobsIcon"]:SetAtlas(iconType1)
                                        nameplate[addonName .. "QuestMobsIcon"]:Show()
                                    elseif HelpMePlayDB["QuestMobsIconID"] == 2 then
                                        nameplate[addonName .. "QuestMobsIcon"]:SetAtlas(iconType2)
                                        nameplate[addonName .. "QuestMobsIcon"]:Show()
                                    else
                                        nameplate[addonName .. "QuestMobsIcon"]:SetTexture(HelpMePlayDB["QuestMobsCustomIcon"])
                                        nameplate[addonName .. "QuestMobsIcon"]:Show()
                                    end
                                end
                            else
                                HelpMePlay.UpdateNamePlate(nameplate)
                            end
                        end
                    end
                end
            end
        end
    end)
end

HelpMePlay.UpdateQuestMobsIconPosition = function()
    local nameplates = C_NamePlate.GetNamePlates()
    if nameplates then
        for index = 1, #nameplates do
            local unit = nameplates[index].namePlateUnitToken
            if unit and (not UnitIsPlayer(unit)) then
                local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
                if nameplate then
                    if HelpMePlayDB["QuestMobsIconID"] == 0 or HelpMePlayDB["QuestMobsIconPositionID"] == 0 then
                        if nameplate[addonName .. "QuestMobsIcon"] then
                            nameplate[addonName .. "QuestMobsIcon"]:Hide()
                        end
                    else
                        if nameplate[addonName .. "QuestMobsIcon"] then
                            nameplate[addonName .. "QuestMobsIcon"]:ClearAllPoints()
                            local position = HelpMePlay.QUEST_MOBS_POSITION_TYPES[HelpMePlayDB["QuestMobsIconPositionID"]]
                            if position then
                                nameplate[addonName .. "QuestMobsIcon"]:SetPoint(HelpMePlay.GetRelativeAnchor(position), nameplate, position, HelpMePlayDB["QuestMobsIconXOffset"], HelpMePlayDB["QuestMobsIconYOffset"])
                            end
                        end
                    end
                end
            end
        end
    end
end

-- Determines if a unit is related to an active quest.
HelpMePlay.IsNameplateUnitRelatedToActiveQuest = function(unit)
    if unit then
        local isUnitRelatedToActiveQuest = C_QuestLog.UnitIsRelatedToActiveQuest(unit)
        if isUnitRelatedToActiveQuest then
            return true
        end
    end
    return false
end

-- Adds or removes the Quest Mobs icon from the nameplate.
HelpMePlay.UpdateNamePlate = function(nameplate)
    if HelpMePlayDB["QuestMobsIconID"] == 0 or HelpMePlayDB["QuestMobsIconPositionID"] == 0 then
        if nameplate[addonName .. "QuestMobsIcon"] then
            nameplate[addonName .. "QuestMobsIcon"]:Hide()
        end
        return true
    end
    local isUnitRelatedToActiveQuest = HelpMePlay.IsNameplateUnitRelatedToActiveQuest(nameplate.namePlateUnitToken)
    C_Timer.After(HelpMePlay.Constants["TIMER_DELAY"], function()
        if isUnitRelatedToActiveQuest then
            if not nameplate[addonName .. "QuestMobsIcon"] then
                local icon = nameplate:CreateTexture()
                local position = HelpMePlay.QUEST_MOBS_POSITION_TYPES[HelpMePlayDB["QuestMobsIconPositionID"]]
                nameplate[addonName .. "QuestMobsIcon"] = icon
                icon:ClearAllPoints()
                icon:SetSize(iconSize, iconSize)
                icon:SetPoint(HelpMePlay.GetRelativeAnchor(position), nameplate, position, HelpMePlayDB["QuestMobsIconXOffset"], HelpMePlayDB["QuestMobsIconYOffset"])
                if HelpMePlayDB["QuestMobsIconID"] == 1 then
                    icon:SetAtlas(iconType1)
                elseif HelpMePlayDB["QuestMobsIconID"] == 2 then
                    icon:SetAtlas(iconType2)
                elseif HelpMePlayDB["QuestMobsIconID"] == 3 then
                    icon:SetTexture(HelpMePlayDB["QuestMobsCustomIcon"])
                end
            else
                local position = HelpMePlay.QUEST_MOBS_POSITION_TYPES[HelpMePlayDB["QuestMobsIconPositionID"]]
                nameplate[addonName .. "QuestMobsIcon"]:SetPoint(HelpMePlay.GetRelativeAnchor(position), nameplate, position, HelpMePlayDB["QuestMobsIconXOffset"], HelpMePlayDB["QuestMobsIconYOffset"])
                if HelpMePlayDB["QuestMobsIconID"] == 1 then
                    nameplate[addonName .. "QuestMobsIcon"]:SetAtlas(iconType1)
                elseif HelpMePlayDB["QuestMobsIconID"] == 2 then
                    nameplate[addonName .. "QuestMobsIcon"]:SetAtlas(iconType2)
                elseif HelpMePlayDB["QuestMobsIconID"] == 3 then
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