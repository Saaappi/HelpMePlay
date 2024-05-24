local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

local function OnSettingChanged(_, setting, value)
    local variable = setting:GetVariable()
    HelpMePlayDB[variable] = value

    -- Handler for the Quest Mobs icon/position.
    if variable == "QuestMobsIconID" then
        if value == 1 or value == 2 then
            addon.UpdateQuestMobsIcon()
        elseif value == 3 then
            StaticPopupDialogs["HELPMEPLAY_QUESTMOBS_CUSTOM_ICON"] = {
                text = "Please enter the texture ID for your custom icon. The texture ID can be found in the URL at |cffFFD100https://www.wowhead.com/icons/|r.\n\n" ..
                "Search for an icon, click it, then take the number after |cffFFD100icon=|r in the URL.",
                button1 = YES,
                button2 = NO,
                OnAccept = function(self)
                    local input = self.editBox:GetText()
                    if tonumber(input, 10) then
                        HelpMePlayDB["QuestMobsCustomIcon"] = tonumber(input, 10)
                        addon.UpdateQuestMobsIcon()
                    else
                        HelpMePlay.Print("Input was invalid.")
                    end
                end,
                timeout = 0,
                showAlert = false,
                whileDead = false,
                hideOnEscape = true,
                hasEditBox = true,
                enterClicksFirstButton = false,
                preferredIndex = 3,
            }
            StaticPopup_Show("HELPMEPLAY_QUESTMOBS_CUSTOM_ICON")
        end
    elseif variable == "QuestMobsIconPositionID" then
        addon.UpdateQuestMobsIconPosition()
    elseif variable == "QuestMobsIconXOffset" or variable == "QuestMobsIconXOffset" then
        addon.UpdateQuestMobsIconPosition()
    end
end

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            addon.New = function(elementName, ...)
                if elementName == "BasicButton" then
                    local name, buttonText, clickHandler, tooltipText, addSearchTags = ...

                    local initializer = CreateSettingsButtonInitializer(name, buttonText, clickHandler, tooltipText, addSearchTags)
                    addon.layout:AddInitializer(initializer)
                elseif elementName == "CheckButton" then
                    local name, category, tooltipText, savedVariable = ...
                    do
                        local setting = Settings.RegisterAddOnSetting(category, name, savedVariable, Settings.VarType.Boolean, HelpMePlayDB[savedVariable])
                        Settings.CreateCheckBox(category, setting, tooltipText)
                        Settings.SetOnValueChangedCallback(savedVariable, OnSettingChanged)
                    end
                elseif elementName == "DropDown" then
                    local name, category, tooltipText, options, savedVariable = ...

                    local function GetOptions()
                        local container = Settings.CreateControlTextContainer()
                        for _, option in ipairs(options) do
                            container:Add(option[1], option[2])
                        end
                        return container:GetData()
                    end
                    local setting = Settings.RegisterAddOnSetting(category, name, savedVariable, Settings.VarType.Number, HelpMePlayDB[savedVariable])
                    Settings.CreateDropDown(category, setting, GetOptions, tooltipText)
                    Settings.SetOnValueChangedCallback(savedVariable, OnSettingChanged)
                elseif elementName == "Slider" then
                    local name, category, tooltipText, options, savedVariable = ...

                    local function GetValue()
                        return tonumber(HelpMePlayDB[savedVariable], 10)
                    end

                    local setting = Settings.RegisterAddOnSetting(category, name, savedVariable, Settings.VarType.Number, HelpMePlayDB[savedVariable])
                    local opt = Settings.CreateSliderOptions(options.minValue, options.maxValue, options.step)
                    opt:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, GetValue)
                    Settings.CreateSlider(category, setting, opt, tooltipText)
                    Settings.SetOnValueChangedCallback(savedVariable, OnSettingChanged)
                end
            end

            -- Unregister the event for performance.
            eventHandler:UnregisterEvent("ADDON_LOADED")
        end
    end
end)