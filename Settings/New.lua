local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

local function OnSettingChanged(_, setting, value)
    -- Get the variable name from the setting.
    local variable = setting:GetVariable()

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
                    if tonumber(input) then
                        HelpMePlayDB["QuestMobsCustomIcon"] = tonumber(input)
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
                exclusive = true,
                enterClicksFirstButton = true,
                preferredIndex = STATICPOPUP_NUMDIALOGS,
            }
            StaticPopup_Show("HELPMEPLAY_QUESTMOBS_CUSTOM_ICON")
        end
    elseif variable == "DepositKeepAmount" or variable == "TrainerProtectionValue" then
        HelpMePlayDB[variable] = value * 10000
    elseif variable == "QuestMobsIconPositionID" then
        addon.UpdateQuestMobsIconPosition()
    elseif variable == "QuestMobsIconXOffset" or variable == "QuestMobsIconXOffset" then
        addon.UpdateQuestMobsIconPosition()
    elseif variable == "UseWorldEventQueue" then
        addon.CreateEventQueueButton()
    else
        HelpMePlayDB[variable] = value
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
                end
            end

            -- Unregister the event for performance.
            eventHandler:UnregisterEvent("ADDON_LOADED")
        end
    end
end)