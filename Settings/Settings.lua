local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

-- Local references to Blizzard settings functions.
local RegisterAddOnSetting = Settings.RegisterAddOnSetting
local SetOnValueChangedCallback = Settings.SetOnValueChangedCallback
local CreateCheckbox = Settings.CreateCheckbox or Settings.CreateCheckBox
local CreateSlider = Settings.CreateSlider
local function CreateSliderOptions(minValue, maxValue, rate)
	local options = CreateFromMixins(SettingsSliderOptionsMixin)
	options.minValue = minValue
	options.maxValue = maxValue
	options.steps = rate
	return options
end

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

-- Compare's elements of a table, and then sorts them
-- alphabetically by the Name attribute.
local function Compare(a, b)
    return a.Name < b.Name
end

local GENERAL_SECTION = "General"
local QUEST_SECTION = "Quest"
local MERCHANT_SECTION = "Merchants & Trainers"
local GUILDBANK_SECTION = "Guild Bank"
local QUESTMOBS_SECTION = "Quest Mobs"
local NEW_CHARACTER_SECTION = "New Character Configuration"
local UTILITIES_SECTION = "Utilities"

-- Register the addon to the Settings panel as a category.
local category, layout = Settings.RegisterVerticalLayoutCategory(addonName)
Settings.RegisterAddOnCategory(category)

-- Add the variable to the namespace, so we can use it to
-- open the settings in a slash command.
addon.category = category
addon.layout = layout

-- Initialize a section for the addon's version and author text.
local author = C_AddOns.GetAddOnMetadata(addonName, "Author")
local version = C_AddOns.GetAddOnMetadata(addonName, "Version")
layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(format("|cffFFD100Author:|r %s\n|cffFFD100Version:|r %s", author, version)))

-- Initialize a section for general stuff.
layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(GENERAL_SECTION))

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            C_Timer.After(1, function()
                ------------------------
                -- GENERAL SECTION -----
                ------------------------
                -- Sort the table before we iterate through it.
                table.sort(addon.Settings.General, Compare)

                -- Iterate through the now-sorted table and add them to
                -- the addon's category.
                for _, setting in ipairs(addon.Settings.General) do
                    if setting.Type == "BasicButton" then
                        addon.New(setting.Type, setting.Name, setting.ButtonText, setting.ClickHandler, setting.TooltipText, setting.AddSearchTags)
                    elseif setting.Type == "CheckButton" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.SavedVariable)
                    elseif setting.Type == "DropDown" or setting.Type == "Slider" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.Options, setting.SavedVariable)
                    end
                end

                ------------------------
                -- QUEST SECTION -------
                ------------------------
                -- Initialize a section for quests.
                layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(QUEST_SECTION))

                -- Sort the table before we iterate through it.
                table.sort(addon.Settings.Quest, Compare)

                -- Iterate through the now-sorted table and add them to
                -- the addon's category.
                for _, setting in ipairs(addon.Settings.Quest) do
                    if setting.Type == "BasicButton" then
                        addon.New(setting.Type, setting.Name, setting.ButtonText, setting.ClickHandler, setting.TooltipText, setting.AddSearchTags)
                    elseif setting.Type == "CheckButton" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.SavedVariable)
                    elseif setting.Type == "DropDown" or setting.Type == "Slider" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.Options, setting.SavedVariable)
                    end
                end

                ------------------------
                -- MERCHANT SECTION ----
                ------------------------
                -- Initialize a section for merchants.
                layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(MERCHANT_SECTION))

                -- REPAIRS
                do
                    local variable = "shouldAutomaticRepair"
                    local name = "Automatic Repair"
                    local tooltipText = "Toggle to allow or prevent the addon from using your character's funds for automatic repair."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- TRAINER PROTECTION VALUE
                do
                    local variable = "TrainerProtectionValue"
                    local name = "Trainer Protection Value"
                    local tooltipText = "Set the minimum amount of gold you must have before the addon will automatically train for you.\n\n" ..
                    "This slider moves in increments of 10."
                    local minValue = 0
                    local maxValue = 1000
                    local step = 10

                    local function GetValue()
                        return HelpMePlayDB[variable] / 10000
                    end

                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    local options = Settings.CreateSliderOptions(minValue, maxValue, step)
                    options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, GetValue)
                    CreateSlider(category, setting, options, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                    setting:SetValue(HelpMePlayDB[variable])
                end

                --------------------------
                -- GUILD BANK SECTION ----
                --------------------------
                -- Initialize a section for guild banks.
                layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(GUILDBANK_SECTION))

                -- DEPOSIT KEEP AMOUNT
                do
                    local variable = "DepositKeepAmount"
                    local name = "Deposit Keep Amount"
                    local tooltipText = "Set the minimum amount of gold you would like to keep on your character after making a deposit.\n\n" ..
                    "Visiting a guild bank while below this threshold will instead attempt a withdrawal, provided the guild bank has the funds.\n\n" ..
                    "This slider moves in increments of 10."
                    local minValue = 0
                    local maxValue = 1000
                    local step = 10

                    local function GetValue()
                        return HelpMePlayDB[variable] / 10000
                    end

                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    local options = Settings.CreateSliderOptions(minValue, maxValue, step)
                    options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, GetValue)
                    CreateSlider(category, setting, options, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                    setting:SetValue(HelpMePlayDB[variable])
                end

                -- KEEP ME SAFE
                do
                    local variable = "DepositKeepMeSafe"
                    local name = "Keep Me Safe"
                    local tooltipText = "Toggle to add approval to every monetary transaction the addon conducts at a guild bank."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                --------------------------
                -- QUEST MOBS SECTION ----
                --------------------------
                -- Initialize a section for quest mobs.
                layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(QUESTMOBS_SECTION))

                -- Sort the table before we iterate through it.
                table.sort(addon.Settings.QuestMobs, Compare)

                -- Iterate through the now-sorted table and add them to
                -- the addon's category.
                for _, setting in ipairs(addon.Settings.QuestMobs) do
                    if setting.Type == "BasicButton" then
                        addon.New(setting.Type, setting.Name, setting.ButtonText, setting.ClickHandler, setting.TooltipText, setting.AddSearchTags)
                    elseif setting.Type == "CheckButton" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.SavedVariable)
                    elseif setting.Type == "DropDown" or setting.Type == "Slider" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.Options, setting.SavedVariable)
                    end
                end

                -------------------------------------------
                -- NEW CHARACTER CONFIGURATION SECTION ----
                -------------------------------------------
                -- Initialize a section for new character configuration.
                layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(NEW_CHARACTER_SECTION))

                -- Sort the table before we iterate through it.
                table.sort(addon.Settings.NewCharacter, Compare)

                -- Iterate through the now-sorted table and add them to
                -- the addon's category.
                for _, setting in ipairs(addon.Settings.NewCharacter) do
                    if setting.Type == "BasicButton" then
                        addon.New(setting.Type, setting.Name, setting.ButtonText, setting.ClickHandler, setting.TooltipText, setting.AddSearchTags)
                    elseif setting.Type == "CheckButton" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.SavedVariable)
                    elseif setting.Type == "DropDown" or setting.Type == "Slider" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.Options, setting.SavedVariable)
                    end
                end

                -------------------------
                -- UTILITIES SECTION ----
                -------------------------
                -- Initialize a section for utilities.
                layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(UTILITIES_SECTION))

                -- Sort the table before we iterate through it.
                table.sort(addon.Settings.Utilities, Compare)

                -- Iterate through the now-sorted table and add them to
                -- the addon's category.
                for _, setting in ipairs(addon.Settings.Utilities) do
                    if setting.Type == "BasicButton" then
                        addon.New(setting.Type, setting.Name, setting.ButtonText, setting.ClickHandler, setting.TooltipText, setting.AddSearchTags)
                    elseif setting.Type == "CheckButton" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.SavedVariable)
                    elseif setting.Type == "DropDown" or setting.Type == "Slider" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.Options, setting.SavedVariable)
                    end
                end
            end)

            -- Unregister the event for performance.
            eventHandler:UnregisterEvent("ADDON_LOADED")
        end
    end
end)

-- This is the date of the NEXT update. If the player's
-- installed version of the addon is older than the date
-- below, then the user hasn't updated their addon.
--[[local nextUpdate = {
    ["monthDay"] = 1,
    ["weekday"] = 1,
    ["month"] = 1,
    ["minute"] = 0,
    ["hour"] = 0,
    ["year"] = 1980
}]]