local addonName, addon = ...
local LibDD = LibStub:GetLibrary("LibUIDropDownMenu-4.0")

-- DropDowns
local iconDropDown
local positionDropDown

-- Sliders
local xOffsetSlider
local yOffsetSlider

local questMobsPanel = CreateFrame("Frame", addonName .. "QuestMobsSettingsPanel")
questMobsPanel["name"] = "Quest Mobs"
questMobsPanel["parent"] = _G[addonName .. "SettingsPanel"].name
InterfaceOptions_AddCategory(questMobsPanel)

C_Timer.After(5, function()
    iconDropDown = {
        name = addonName .. "QuestMobsIconDropDown",
        parent = questMobsPanel,
        anchor = "TOPLEFT",
        relativeAnchor = "TOPLEFT",
        oX = -5,
        oY = -25,
        width = 150,
        height = 38,
        title = "Icon",
        tooltipHeader = "Quest Mobs Icon",
        tooltipText = "Select the icon that should appear on the nameplate of NPCs related to active quest(s).",
        options = {
            {
                ["text"] = addon.QUEST_MOBS_ICON_TYPES[1],
                ["disabled"] = false,
                ["func"] = function()
                    local value = 1
                    HelpMePlayDB["QuestMobsIconID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(iconDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(iconDropDown, addon.QUEST_MOBS_ICON_TYPES[value])
                    addon.UpdateQuestMobsIcon()
                end,
            },
            {
                ["text"] = addon.QUEST_MOBS_ICON_TYPES[2],
                ["disabled"] = false,
                ["func"] = function()
                    local value = 2
                    HelpMePlayDB["QuestMobsIconID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(iconDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(iconDropDown, addon.QUEST_MOBS_ICON_TYPES[value])
                    addon.UpdateQuestMobsIcon()
                end,
            },
            {
                ["text"] = addon.QUEST_MOBS_ICON_TYPES[3],
                ["disabled"] = false,
                ["func"] = function()
                    local popup = {
                        name = "HELPMEPLAY_QUESTMOBS_CUSTOM_ICON",
                        text = "Please enter the texture ID for your custom icon. The texture ID can be found in the URL at |cffFFD100https://www.wowhead.com/icons/|r.\n\n" ..
                        "Search for an icon, click it, then take the number after |cffFFD100icon=|r in the URL.",
                        button1 = ACCEPT,
                        button2 = CANCEL,
                        onAccept = function(self)
                            local text = self.editBox:GetText()
                            if tonumber(text, 10) then
                                local value = 3
                                HelpMePlayDB["QuestMobsIconID"] = value
                                LibDD:UIDropDownMenu_SetSelectedValue(iconDropDown, value, value)
                                LibDD:UIDropDownMenu_SetText(iconDropDown, addon.QUEST_MOBS_ICON_TYPES[value])
                                HelpMePlayDB["QuestMobsCustomIcon"] = tonumber(text, 10)
                                addon.UpdateQuestMobsIcon()
                            else
                                HelpMePlay.Print("Input was invalid.")
                            end
                        end,
                        onCancel = function(self)
                            self:Hide()
                        end,
                        showAlert = false,
                        whileDead = false,
                        hideOnEscape = true,
                        hasEditBox = true,
                        enterClicksFirstButton = false,
                        preferredIndex = 3,
                    }
                    setmetatable(popup, { __index = HelpMePlay.Frame })
                    popup = popup:Popup()
                    StaticPopup_Show(popup.name)
                end,
            },
            {
                ["text"] = addon.QUEST_MOBS_ICON_TYPES[0],
                ["disabled"] = false,
                ["func"] = function()
                    local value = 0
                    HelpMePlayDB["QuestMobsIconID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(iconDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(iconDropDown, addon.QUEST_MOBS_ICON_TYPES[value])
                    addon.UpdateQuestMobsIcon()
                end,
            }
        },
    }
    setmetatable(iconDropDown, { __index = HelpMePlay.DropDown })
    iconDropDown = iconDropDown:DropDown()
    LibDD:UIDropDownMenu_SetText(iconDropDown, addon.QUEST_MOBS_ICON_TYPES[HelpMePlayDB["QuestMobsIconID"]])

    positionDropDown = {
        name = addonName .. "QuestMobsPositionDropDown",
        parent = iconDropDown,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -30,
        width = 150,
        height = 38,
        title = "Position",
        tooltipHeader = "Quest Mobs Position",
        tooltipText = "Select the position the icon should appear on the nameplate.",
        options = {
            {
                ["text"] = addon.QUEST_MOBS_POSITION_TYPES[1],
                ["disabled"] = false,
                ["func"] = function()
                    local value = 1
                    HelpMePlayDB["QuestMobsIconPositionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(positionDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(positionDropDown, addon.QUEST_MOBS_POSITION_TYPES[value])
                    addon.UpdateQuestMobsIconPosition()
                end,
            },
            {
                ["text"] = addon.QUEST_MOBS_POSITION_TYPES[2],
                ["disabled"] = false,
                ["func"] = function()
                    local value = 2
                    HelpMePlayDB["QuestMobsIconPositionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(positionDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(positionDropDown, addon.QUEST_MOBS_POSITION_TYPES[value])
                    addon.UpdateQuestMobsIconPosition()
                end,
            },
            {
                ["text"] = addon.QUEST_MOBS_POSITION_TYPES[3],
                ["disabled"] = false,
                ["func"] = function()
                    local value = 3
                    HelpMePlayDB["QuestMobsIconPositionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(positionDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(positionDropDown, addon.QUEST_MOBS_POSITION_TYPES[value])
                    addon.UpdateQuestMobsIconPosition()
                end,
            },
            {
                ["text"] = addon.QUEST_MOBS_POSITION_TYPES[4],
                ["disabled"] = false,
                ["func"] = function()
                    local value = 4
                    HelpMePlayDB["QuestMobsIconPositionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(positionDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(positionDropDown, addon.QUEST_MOBS_POSITION_TYPES[value])
                    addon.UpdateQuestMobsIconPosition()
                end,
            },
            {
                ["text"] = addon.QUEST_MOBS_POSITION_TYPES[5],
                ["disabled"] = false,
                ["func"] = function()
                    local value = 5
                    HelpMePlayDB["QuestMobsIconPositionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(positionDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(positionDropDown, addon.QUEST_MOBS_POSITION_TYPES[value])
                    addon.UpdateQuestMobsIconPosition()
                end,
            },
            {
                ["text"] = addon.QUEST_MOBS_POSITION_TYPES[6],
                ["disabled"] = false,
                ["func"] = function()
                    local value = 6
                    HelpMePlayDB["QuestMobsIconPositionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(positionDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(positionDropDown, addon.QUEST_MOBS_POSITION_TYPES[value])
                    addon.UpdateQuestMobsIconPosition()
                end,
            },
            {
                ["text"] = addon.QUEST_MOBS_POSITION_TYPES[7],
                ["disabled"] = false,
                ["func"] = function()
                    local value = 7
                    HelpMePlayDB["QuestMobsIconPositionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(positionDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(positionDropDown, addon.QUEST_MOBS_POSITION_TYPES[value])
                    addon.UpdateQuestMobsIconPosition()
                end,
            },
            {
                ["text"] = addon.QUEST_MOBS_POSITION_TYPES[8],
                ["disabled"] = false,
                ["func"] = function()
                    local value = 8
                    HelpMePlayDB["QuestMobsIconPositionID"] = value
                    LibDD:UIDropDownMenu_SetSelectedValue(positionDropDown, value, value)
                    LibDD:UIDropDownMenu_SetText(positionDropDown, addon.QUEST_MOBS_POSITION_TYPES[value])
                    addon.UpdateQuestMobsIconPosition()
                end,
            }
        },
    }
    setmetatable(positionDropDown, { __index = HelpMePlay.DropDown })
    positionDropDown = positionDropDown:DropDown()
    LibDD:UIDropDownMenu_SetText(positionDropDown, addon.QUEST_MOBS_POSITION_TYPES[HelpMePlayDB["QuestMobsIconPositionID"]])

    xOffsetSlider = {
        name = addonName .. "QuestMobsIconXOffsetSlider",
        parent = iconDropDown,
        width = 144,
        height = 17,
        minValue = -25,
        maxValue = 25,
        valueStep = 1,
        anchor = "LEFT",
        relativeAnchor = "RIGHT",
        oX = 150,
        oY = 0,
        tooltipHeader = "X Offset",
    }
    setmetatable(xOffsetSlider, { __index = HelpMePlay.Slider })
    xOffsetSlider = xOffsetSlider:Slider()

    xOffsetSlider["value"]:SetText(HelpMePlayDB["QuestMobsIconXOffset"])

    xOffsetSlider:SetValue(HelpMePlayDB["QuestMobsIconXOffset"])
    xOffsetSlider:SetScript("OnValueChanged", function(self, value)
        value = tonumber(value)
        HelpMePlayDB["QuestMobsIconXOffset"] = value
        xOffsetSlider["value"]:SetText(value)
        addon.UpdateQuestMobsIconPosition()
    end)

    yOffsetSlider = {
        name = addonName .. "QuestMobsIconYOffsetSlider",
        parent = xOffsetSlider,
        width = 144,
        height = 17,
        minValue = -25,
        maxValue = 25,
        valueStep = 1,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -40,
        tooltipHeader = "Y Offset",
    }
    setmetatable(yOffsetSlider, { __index = HelpMePlay.Slider })
    yOffsetSlider = yOffsetSlider:Slider()

    yOffsetSlider["value"]:SetText(HelpMePlayDB["QuestMobsIconYOffset"])

    yOffsetSlider:SetValue(HelpMePlayDB["QuestMobsIconYOffset"])
    yOffsetSlider:SetScript("OnValueChanged", function(self, value)
        value = tonumber(value)
        HelpMePlayDB["QuestMobsIconYOffset"] = value
        yOffsetSlider["value"]:SetText(value)
        addon.UpdateQuestMobsIconPosition()
    end)
end)