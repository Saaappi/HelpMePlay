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
                --[[elseif elementName == "CheckButton" then
                    local name, parent, position, tooltipHeader, tooltipText, savedVariable, onClick = ...
        
                    -- Create the check button.
                    local checkButton = CreateFrame("CheckButton", name, parent, "SettingsCheckBoxTemplate")
                    checkButton:ClearAllPoints()
                    checkButton:SetPoint(unpack(position))
        
                    -- Create a fontstring to rest next to the button.
                    checkButton.fontString = checkButton:CreateFontString(checkButton:GetName() .. "Text", "OVERLAY", "GameTooltipText")
                    checkButton.fontString:SetPoint("LEFT", checkButton, "RIGHT", 5, 0)
                    checkButton.fontString:SetText(addon.TruncateString(tooltipHeader))
        
                    -- Create the OnClick, OnEnter, and OnLeave handlers.
                    checkButton:SetScript("OnClick", onClick)
                    checkButton:SetScript("OnEnter", function(self)
                        addon.Tooltip_OnEnter(self, tooltipHeader, tooltipText)
                    end)
                    checkButton:SetScript("OnLeave", function()
                        GameTooltip:Hide()
                        addon.Tooltip_OnLeave()
                    end)
        
                    -- Set the checked status of the new check button.
                    checkButton:SetChecked(HelpMePlayDB[savedVariable])
        
                    -- Return the check button back to the caller in case we
                    -- want to manipulate it at the calling code.
                    return checkButton
                elseif elementName == "DropDown" then
                    local savedVariable, name, tooltipText, options = ...
        
                    local function GetValue()
                        return age
                    end
                    
                    local function SetValue(value)
                        age = value
                        print(age)
                    end
        
                    local function GetOptions()
                        local container = Settings.CreateControlTextContainer()
                        for index, option in ipairs(options) do
                            container:Add(index, option)
                        end
                        return container:GetData()
                    end
                    local setting = Settings.RegisterProxySetting(category, "AGE", HelpMePlayDB,
                        Settings.VarType.Number, name, 0, GetValue, SetValue)
                    Settings.CreateDropDown(category, setting, GetOptions, tooltipText)]]
                end
            end

            -- Unregister the event for performance.
            eventHandler:UnregisterEvent("ADDON_LOADED")
        end
    end
end)