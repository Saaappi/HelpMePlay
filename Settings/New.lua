local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            addon.New = function(elementName, ...)
                if elementName == "BasicButton" then
                elseif elementName == "CheckButton" then
                    local name, category, defaultValue, tooltipText, savedVariable = ...
                    do
                        local function GetValue()
                            return HelpMePlayDB[savedVariable]
                        end

                        local function SetValue(value)
                            if savedVariable == "AcceptAndCompleteAllQuests" and value then
                                HelpMePlayDB["AcceptAndCompleteQuests"] = not value
                            elseif savedVariable == "AcceptAndCompleteQuests" and value then
                                HelpMePlayDB["AcceptAndCompleteAllQuests"] = not value
                            end
                            HelpMePlayDB[savedVariable] = value
                        end

                        local setting = Settings.RegisterProxySetting(category, savedVariable, HelpMePlayDB, Settings.VarType.Boolean, name, defaultValue, GetValue, SetValue)
                        Settings.CreateCheckBox(category, setting, tooltipText)
                    end
                elseif elementName == "DropDown" then
                    local name, category, defaultValue, tooltipText, options, savedVariable = ...

                    local function GetValue()
                        return HelpMePlayDB[savedVariable]
                    end

                    local function SetValue(value)
                        HelpMePlayDB[savedVariable] = value
                    end

                    local function GetOptions()
                        local container = Settings.CreateControlTextContainer()
                        for index, option in ipairs(options) do
                            container:Add(option[1], option[2])
                        end
                        return container:GetData()
                    end
                    local setting = Settings.RegisterProxySetting(category, savedVariable, HelpMePlayDB, Settings.VarType.Number, name, defaultValue, GetValue, SetValue)
                    Settings.CreateDropDown(category, setting, GetOptions, tooltipText)
                end
            end

            -- Unregister the event for performance.
            eventHandler:UnregisterEvent("ADDON_LOADED")
        end
    end
end)