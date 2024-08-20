local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")

local iconString = string.format("%sQuestMobsIcon", addonName)
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

local function CreateIcon(nameplate)
    local icon = nameplate:CreateTexture()
    local position = HelpMePlay.QUEST_MOBS_POSITION_TYPES[HelpMePlayDB["QuestMobsIconPositionID"]]
    nameplate[iconString] = icon
    icon:ClearAllPoints()
    icon:SetSize(12, 12)
    icon:SetPoint(HelpMePlay.GetRelativeAnchor(position), nameplate, position, HelpMePlayDB["QuestMobsIconXOffset"], HelpMePlayDB["QuestMobsIconYOffset"])
    if HelpMePlayDB["QuestMobsIconID"] == 1 then
        icon:SetAtlas(iconType1)
    elseif HelpMePlayDB["QuestMobsIconID"] == 2 then
        icon:SetAtlas(iconType2)
    elseif HelpMePlayDB["QuestMobsIconID"] == 3 then
        icon:SetTexture(HelpMePlayDB["QuestMobsCustomIcon"])
    end
end

local function RefreshIcon(nameplate)
    if nameplate[iconString] then
        nameplate[iconString]:ClearAllPoints()
        local position = HelpMePlay.QUEST_MOBS_POSITION_TYPES[HelpMePlayDB["QuestMobsIconPositionID"]]
        nameplate[iconString]:SetPoint(HelpMePlay.GetRelativeAnchor(position), nameplate, position, HelpMePlayDB["QuestMobsIconXOffset"], HelpMePlayDB["QuestMobsIconYOffset"])
        if HelpMePlayDB["QuestMobsIconID"] == 1 then
            nameplate[iconString]:SetAtlas(iconType1)
        elseif HelpMePlayDB["QuestMobsIconID"] == 2 then
            nameplate[iconString]:SetAtlas(iconType2)
        elseif HelpMePlayDB["QuestMobsIconID"] == 3 then
            nameplate[iconString]:SetTexture(HelpMePlayDB["QuestMobsCustomIcon"])
        end
    else
        CreateIcon(nameplate)
    end
    nameplate[iconString]:Show()
end

local function HideIcon(nameplate)
    if nameplate[iconString] then
        nameplate[iconString]:Hide()
    end
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
                        HideIcon(nameplate)
                    else
                        RefreshIcon(nameplate)
                    end
                end
            end
        end
    end
end

HelpMePlay.UpdateQuestMobsIcon = function()
    local nameplates = C_NamePlate.GetNamePlates()
    if nameplates then
        for index = 1, #nameplates do
            local unit = nameplates[index].namePlateUnitToken
            if unit and (not UnitIsPlayer(unit)) then
                local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
                if nameplate then
                    if HelpMePlayDB["QuestMobsIconID"] == 0 or HelpMePlayDB["QuestMobsIconPositionID"] == 0 then
                        HideIcon(nameplate)
                    else
                        local unitIsRelatedToActiveQuest = C_QuestLog.UnitIsRelatedToActiveQuest(nameplate.namePlateUnitToken)
                        if unitIsRelatedToActiveQuest then
                            if HelpMePlayDB["QuestMobsIconID"] == 0 then
                                HideIcon(nameplate)
                            else
                                if nameplate[iconString] then
                                    RefreshIcon(nameplate)
                                else
                                    CreateIcon(nameplate)
                                end
                            end
                        else
                            HideIcon(nameplate)
                        end
                    end
                end
            end
        end
    end
end

function HelpMePlay.RefreshNamePlate(nameplate)
    if UnitIsPlayer(nameplate.namePlateUnitToken) then return false end

    if HelpMePlayDB["QuestMobsIconID"] == 0 or HelpMePlayDB["QuestMobsIconPositionID"] == 0 then
        HideIcon(nameplate)
        return true
    end

    local unitIsRelatedToActiveQuest = C_QuestLog.UnitIsRelatedToActiveQuest(nameplate.namePlateUnitToken)
    if unitIsRelatedToActiveQuest then
        if not nameplate[iconString] then
            CreateIcon(nameplate)
        else
            RefreshIcon(nameplate)
        end
    else
        HideIcon(nameplate)
    end
end

local function OnEvent(_, event, arg1)
    if HelpMePlayDB["QuestMobsIconID"] == 0 then return end
    if event == "NAME_PLATE_UNIT_ADDED" then
        local nameplate = C_NamePlate.GetNamePlateForUnit(arg1)
        if nameplate then
            HelpMePlay.RefreshNamePlate(nameplate)
        end
    end
    if event == "NAME_PLATE_UNIT_REMOVED" then
        local nameplate = C_NamePlate.GetNamePlateForUnit(arg1)
        if nameplate then
            HideIcon(nameplate)
        end
    end
    if event == "QUEST_ACCEPTED" then
        HelpMePlay.UpdateQuestMobsIcon()
    end
    if event == "QUEST_LOG_UPDATE" then
        HelpMePlay.UpdateQuestMobsIcon()
    end
    if event == "QUEST_REMOVED" or "QUEST_TURNED_IN" then
        HelpMePlay.UpdateQuestMobsIcon()
    end
end

eventHandler:RegisterEvent("NAME_PLATE_UNIT_ADDED")
eventHandler:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
eventHandler:RegisterEvent("QUEST_ACCEPTED")
eventHandler:RegisterEvent("QUEST_LOG_UPDATE")
eventHandler:RegisterEvent("QUEST_REMOVED")
eventHandler:RegisterEvent("QUEST_TURNED_IN")
eventHandler:SetScript("OnEvent", OnEvent)