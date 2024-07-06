local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")

-- Local references to Blizzard settings functions.
local RegisterAddOnSetting = Settings.RegisterAddOnSetting
local SetOnValueChangedCallback = Settings.SetOnValueChangedCallback
local CreateCheckbox = Settings.CreateCheckbox or Settings.CreateCheckBox
local CreateSlider = Settings.CreateSlider
local CreateDropDown = Settings.CreateDropDown
local CreateControlTextContainer = Settings.CreateControlTextContainer

local REMIX_SECTION = "Remix: Mists of Pandaria"
local GENERAL_SECTION = GENERAL
local QUEST_SECTION = "Quest"
local LFG_SECTION = "LFG"
local MERCHANT_SECTION = MERCHANT
local GUILDBANK_SECTION = GUILD_BANK
local QUESTMOBS_SECTION = "Quest Mobs"
local WARDROBE_SECTION = "Wardrobe"
local NEW_CHARACTER_SECTION = "New Character Configuration"
local UTILITIES_SECTION = "Utilities"

function HelpMePlay.RegisterSettings()
    local category, layout = Settings.RegisterVerticalLayoutCategory(addonName)
    Settings.RegisterAddOnCategory(category)

    -- Add the variable to the namespace, so we can use it to
    -- open the settings in a slash command.
    HelpMePlay.Category = category
    HelpMePlay.Layout = layout

    -- Initialize a section for the addon's version and author text.
    --local author = C_AddOns.GetAddOnMetadata(addonName, "Author")
    --local version = C_AddOns.GetAddOnMetadata(addonName, "Version")
    --layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(format("|cffFFD100Author:|r %s\n|cffFFD100Version:|r %s", author, version)))

    -- Toggle All Button
    HelpMePlay.AddSettingButton(
        "Toggle All",
        "Toggle All",
        function()
            if next(HelpMePlayDB["TempSettings"]) == nil then
                for key, value in next, HelpMePlayDB do
                    if type(HelpMePlayDB[key]) == "boolean" then
                        HelpMePlayDB["TempSettings"][key] = value
                        Settings.SetValue(key, false)
                    elseif key == "DepositKeepAmount" or key == "TrainerProtectionValue" then
                        HelpMePlayDB["TempSettings"][key] = value / 10000
                        Settings.SetValue(key, 0)
                    elseif type(HelpMePlayDB[key]) == "number" then
                        HelpMePlayDB["TempSettings"][key] = value
                        Settings.SetValue(key, 0)
                    end
                end
            else
                for key, value in next, HelpMePlayDB["TempSettings"] do
                    Settings.SetValue(key, value)
                end
                HelpMePlayDB["TempSettings"] = {}
            end
        end,
        "Click to toggle all settings off. Click again to restore the settings to their previous state.",
        true
    )

    ----------------------
    -- REMIX SECTION -----
    ----------------------
    -- Initialize a section for remix stuff.
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(REMIX_SECTION))

    HelpMePlay.AddSettingCheckbox(
        category,
        "Remix Usables Button",
        "ShowRemixUsablesButton",
        false,
        HelpMePlayDB["ShowRemixUsablesButton"],
        "Toggle to show the usables button. This button can be used to combine gems and add threads to your cloak."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Remix Scrap Button",
        "ShowRemixScrapButton",
        false,
        HelpMePlayDB["ShowRemixScrapButton"],
        "Toggle to show the scrap button. This button can be used to quickly scrap unwanted items."
    )

    ------------------------
    -- GENERAL SECTION -----
    ------------------------
    -- Initialize a section for remix stuff.
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(GENERAL_SECTION))

    HelpMePlay.AddSettingCheckbox(
        category,
        "Chat Icons",
        "ShowChatIcons",
        false,
        HelpMePlayDB["ShowChatIcons"],
        "Toggle to show item and appearance collection status icons in the chat frame."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Emotes",
        "UseEmotes",
        false,
        HelpMePlayDB["UseEmotes"],
        "Automatically use the appropriate emote against quest-related non-player characters."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Gossip",
        "AcceptGossip",
        false,
        HelpMePlayDB["AcceptGossip"],
        "Automatically select the appropriate quest-related gossip options from non-player characters." ..
        LHMP:ColorText("RED", "Not all gossips are supported!")
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Mute Talking Head",
        "MuteTalkingHead",
        false,
        HelpMePlayDB["MuteTalkingHead"],
        "Toggle to silence the talking head popup."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Open Containers",
        "OpenContainers",
        false,
        HelpMePlayDB["OpenContainers"],
        "Toggle to automatically open containers when you loot them.\n\n" ..
        LHMP:ColorText("RED", "Not all items are supported!")
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Rare Scan",
        "RareScan",
        false,
        HelpMePlayDB["RareScan"],
        "Toggle if you wish to receive a popup notification and sound for nearby rares."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Skip Cutscenes",
        "SkipCutscenes",
        false,
        HelpMePlayDB["SkipCutscenes"],
        "Toggle skipping cutscenes and in-game movies."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Skyriding",
        "UseDynamicFlightButton",
        false,
        HelpMePlayDB["UseDynamicFlightButton"],
        "Toggle to add a button to the Skyriding UI to quickly learn its traits."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "War Mode",
        "UseWarMode",
        false,
        HelpMePlayDB["UseWarMode"],
        "Toggle to automatically enable War Mode when entering or logging into Orgrimmar or Stormwind City.\n\n" ..
        LHMP:ColorText("RED", format("This setting doesn't apply to players at or above level %d.", HelpMePlay.Constants["CHROMIE_TIME_MAX_LEVEL"]))
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Always Compare Items",
        "AlwaysCompareItems",
        false,
        HelpMePlayDB["AlwaysCompareItems"],
        "Toggle if you wish to have the item comparison tooltips always visible when you hover an item."
    )
end

--[[
                ------------------------
                -- QUEST SECTION -------
                ------------------------
                -- Initialize a section for quests.
                layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(QUEST_SECTION))

                -- Accept and Complete Quests
                do
                    local variable = "AcceptAndCompleteQuests"
                    local name = "Accept and Complete Quests"
                    local tooltipText = "Toggle to accept and complete quests."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Ignore Daily Quests
                do
                    local variable = "IgnoreDailyQuests"
                    local name = "Ignore Daily Quests"
                    local tooltipText = "Toggle to ignore daily quests."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Ignore Repeatable Quests
                do
                    local variable = "IgnoreRepeatableQuests"
                    local name = "Ignore Repeatable Quests"
                    local tooltipText = "Toggle to ignore repeatable quests."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Adventure Maps
                do
                    local variable = "UseAdventureMaps"
                    local name = "Adventure Maps"
                    local tooltipText = "Toggle to automatically accept quests from adventure maps.\n\n" ..
                    LHMP:ColorText("RED", "The current support is only for the adventure map in The Waking Shores.")
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Purchase Quest Items
                do
                    local variable = "PurchaseQuestItems"
                    local name = "Purchase Quest Items"
                    local tooltipText = "Toggle to automatically purchase quest items from merchants."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Player Choice
                do
                    local variable = "UsePlayerChoice"
                    local name = "Player Choice"
                    local tooltipText = "Toggle to allow the addon to decide quest-related player choices on your behalf."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Party Play
                do
                    local variable = "UsePartyPlay"
                    local name = "Party Play"
                    local tooltipText = "Toggle to make playing with friends a little easier.\n\n" ..
                    LHMP:ColorText("RED", "Party Play, by default, will only auto share quests with party members. Announcements have been removed.")
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Chromie Time
                do
                    local variable = "ChromieTimeExpansionID"
                    local name = "Chromie Time"
                    local tooltipText = "Select the expansion to use when speaking with Chromie in Orgrimmar or Stormwind City."

                    local function GetOptions()
                        local container = CreateControlTextContainer()
                        --container:Add(16, EXPANSION_NAME9), -- Dragonflight isn't supported yet (not until The War Within).
                        container:Add(14, EXPANSION_NAME8)
                        container:Add(15, EXPANSION_NAME7)
                        container:Add(10, EXPANSION_NAME6)
                        container:Add(9, EXPANSION_NAME5)
                        container:Add(8, EXPANSION_NAME4)
                        container:Add(5, EXPANSION_NAME3)
                        container:Add(7, EXPANSION_NAME2)
                        container:Add(6, EXPANSION_NAME1)
                        container:Add(0, NONE)
                        return container:GetData()
                    end

                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateDropDown(category, setting, GetOptions, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Quest Rewards
                do
                    local variable = "QuestRewardSelectionTypeID"
                    local name = "Quest Rewards"
                    local tooltipText = format("Select how quest rewards should be chosen.\n\n" ..
                    "If Item Level is selected, then chosen quest rewards are automatically equipped by %s.", addonName)

                    local function GetOptions()
                        local container = CreateControlTextContainer()
                        container:Add(1, "Item Level")
                        container:Add(2, "Sell Price")
                        container:Add(0, NONE)
                        return container:GetData()
                    end

                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateDropDown(category, setting, GetOptions, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -------------------
                -- LFG SECTION ----
                -------------------
                -- Initialize a section for LFG.
                layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(LFG_SECTION))

                -- Event Queue
                do
                    local variable = "UseWorldEventQueue"
                    local name = "Event Queue"
                    local tooltipText = "Toggle to add a button to the top middle of your screen. This button can be used to quickly queue into ongoing events."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Ready Checks
                do
                    local variable = "AcceptReadyChecks"
                    local name = "Ready Checks"
                    local tooltipText = "Toggle to automatically accept ready checks."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Role Checks
                do
                    local variable = "AcceptRoleChecks"
                    local name = "Role Checks"
                    local tooltipText = "Toggle to automatically accept role checks."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
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

                -- Quest Mobs Icon
                do
                    local variable = "QuestMobsIconID"
                    local name = "Quest Mobs Icon"
                    local tooltipText = "Select the icon that should appear on the nameplate of NPCs related to active quest(s)."

                    local function GetOptions()
                        local container = CreateControlTextContainer()
                        container:Add(1, "Quest")
                        container:Add(2, "Treasure Goblin")
                        container:Add(3, "Custom")
                        container:Add(0, NONE)
                        return container:GetData()
                    end

                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateDropDown(category, setting, GetOptions, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Quest Mobs Icon Position
                do
                    local variable = "QuestMobsIconPositionID"
                    local name = "Quest Mobs Icon Position"
                    local tooltipText = "Select the position the icon should appear on the nameplate."

                    local function GetOptions()
                        local container = CreateControlTextContainer()
                        container:Add(1, "LEFT")
                        container:Add(2, "TOPLEFT")
                        container:Add(3, "TOP")
                        container:Add(4, "TOPRIGHT")
                        container:Add(5, "RIGHT")
                        container:Add(6, "BOTTOMRIGHT")
                        container:Add(7, "BOTTOM")
                        container:Add(8, "BOTTOMLEFT")
                        container:Add(0, NONE)
                        return container:GetData()
                    end

                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateDropDown(category, setting, GetOptions, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Quest Mobs Icon X Offset
                do
                    local variable = "QuestMobsIconXOffset"
                    local name = "X Offset"
                    local tooltipText = "Use the slider to set the icon's X offset."
                    local minValue = -25
                    local maxValue = 25
                    local step = 1

                    local function GetValue()
                        return HelpMePlayDB[variable]
                    end

                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    local options = Settings.CreateSliderOptions(minValue, maxValue, step)
                    options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, GetValue)
                    CreateSlider(category, setting, options, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                    setting:SetValue(HelpMePlayDB[variable])
                end

                -- Quest Mobs Icon Y Offset
                do
                    local variable = "QuestMobsIconYOffset"
                    local name = "Y Offset"
                    local tooltipText = "Use the slider to set the icon's Y offset."
                    local minValue = -25
                    local maxValue = 25
                    local step = 1

                    local function GetValue()
                        return HelpMePlayDB[variable]
                    end

                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    local options = Settings.CreateSliderOptions(minValue, maxValue, step)
                    options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, GetValue)
                    CreateSlider(category, setting, options, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                    setting:SetValue(HelpMePlayDB[variable])
                end

                ------------------------
                -- WARDROBE SECTION ----
                ------------------------
                -- Initialize a section for wardrobe.
                layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(WARDROBE_SECTION))

                -- Wardrobe Button
                do
                    local variable = "ShowWardrobeButton"
                    local name = "Wardrobe Button"
                    local tooltipText = "Toggle to show or hide the Wardrobe button."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -------------------------------------------
                -- NEW CHARACTER CONFIGURATION SECTION ----
                -------------------------------------------
                -- Initialize a section for new character configuration.
                layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(NEW_CHARACTER_SECTION))

                -- Action Bar 2
                do
                    local barID = 2
                    local variable = "NCC_ActionBar" .. barID
                    local name = "Action Bar " .. barID
                    local tooltipText = "Toggle to enable Action Bar " .. barID .. " on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Action Bar 3
                do
                    local barID = 3
                    local variable = "NCC_ActionBar" .. barID
                    local name = "Action Bar " .. barID
                    local tooltipText = "Toggle to enable Action Bar " .. barID .. " on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Action Bar 4
                do
                    local barID = 4
                    local variable = "NCC_ActionBar" .. barID
                    local name = "Action Bar " .. barID
                    local tooltipText = "Toggle to enable Action Bar " .. barID .. " on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Action Bar 5
                do
                    local barID = 5
                    local variable = "NCC_ActionBar" .. barID
                    local name = "Action Bar " .. barID
                    local tooltipText = "Toggle to enable Action Bar " .. barID .. " on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Action Bar 6
                do
                    local barID = 6
                    local variable = "NCC_ActionBar" .. barID
                    local name = "Action Bar " .. barID
                    local tooltipText = "Toggle to enable Action Bar " .. barID .. " on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Action Bar 7
                do
                    local barID = 7
                    local variable = "NCC_ActionBar" .. barID
                    local name = "Action Bar " .. barID
                    local tooltipText = "Toggle to enable Action Bar " .. barID .. " on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Action Bar 8
                do
                    local barID = 8
                    local variable = "NCC_ActionBar" .. barID
                    local name = "Action Bar " .. barID
                    local tooltipText = "Toggle to enable Action Bar " .. barID .. " on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Clear All Tracking
                do
                    local variable = "ClearAllTracking"
                    local name = "Clear All Tracking"
                    local tooltipText = "Toggle to clear all tracking options from the minimap on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Auto Loot
                do
                    local variable = "AutoLoot"
                    local name = "Auto Loot"
                    local tooltipText = "Toggle to enable Auto Loot on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Disable Tutorials
                do
                    local variable = "DisableTutorials"
                    local name = "Disable Tutorials"
                    local tooltipText = "Toggle to disable tutorial popups on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Auto Push Spells
                do
                    local variable = "AutoPushSpells"
                    local name = "Auto Push Spells"
                    local tooltipText = "Toggle to disable new spells from being automatically added to your action bar on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Class Color Frames
                do
                    local variable = "ClassColorFrames"
                    local name = "Class Color Frames"
                    local tooltipText = "Toggle to color the party and raid frames by class color on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Loot Under Mouse
                do
                    local variable = "LootUnderMouse"
                    local name = "Loot Under Mouse"
                    local tooltipText = "Toggle to keep the loot window under your mouse on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Disable Dialog
                do
                    local variable = "DisableDialog"
                    local name = "Disable Dialog"
                    local tooltipText = "Toggle to silence dialog on each new character."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Create Whisper Window
                do
                    local variable = "CreateWhisperWindow"
                    local name = "Create Whisper Window"
                    local tooltipText = "Toggle to create a new window on your chat frame for Whispers and Blizzard Whispers."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Create Loot Window
                do
                    local variable = "CreateLootWindow"
                    local name = "Create Loot Window"
                    local tooltipText = "Toggle to create a new window on your chat frame for loot events."
                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateCheckbox(category, setting, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Edit Mode
                do
                    local variable = "NCC_EditModeLayoutID"
                    local name = "Edit Mode"
                    local tooltipText = "Select the default edit mode layout you would like to use on each new character."

                    local function GetEditModeLayouts()
                        local layouts={{1,"Modern"},{2,"Classic"}}
                        local customLayouts = C_EditMode.GetLayouts()
                        for index, design in ipairs(customLayouts.layouts) do
                            table.insert(layouts, (index + 2), { (index + 2), design.layoutName })
                        end
                        return layouts
                    end

                    local function GetOptions()
                        local container = CreateControlTextContainer()
                        local layouts = GetEditModeLayouts()
                        for _, design in next, layouts do
                            container:Add(design[1], design[2])
                        end
                        return container:GetData()
                    end

                    local setting = RegisterAddOnSetting(category, name, variable, type(HelpMePlayDB[variable]), HelpMePlayDB[variable])
                    CreateDropDown(category, setting, GetOptions, tooltipText)
                    SetOnValueChangedCallback(variable, OnSettingChanged)
                end

                -- Reset New Character Configuration Button
                do
                    local name = ""
                    local buttonText = "Reset Configuration"
                    local tooltipText = "Click to wipe the current character as a 'new character' and re-execute the New Character configuration."
                    local clickHandler = function()
                        for index, GUID in next, HelpMePlayDB["Characters"] do
                            if GUID == HelpMePlay.playerGUID then
                                table.remove(HelpMePlayDB["Characters"], index)
                                break
                            end
                        end
                        HelpMePlay.NewCharacter()
                    end

                    local initializer = CreateSettingsButtonInitializer(name, buttonText, clickHandler, tooltipText, true)
                    HelpMePlay.layout:AddInitializer(initializer)
                end

                -- Reset Heirlooms Button
                do
                    local name = ""
                    local buttonText = "Reset Heirlooms"
                    local tooltipText = "Click to wipe heirlooms for the current class and specialization.\n\n" ..
                    LHMP:ColorText("RED", "This will force a UI reload.")
                    local clickHandler = function()
                        HelpMePlayDB["Heirlooms"][HelpMePlay.playerClassID][HelpMePlay.playerSpecID] = nil
                        C_UI.Reload()
                    end

                    local initializer = CreateSettingsButtonInitializer(name, buttonText, clickHandler, tooltipText, true)
                    HelpMePlay.layout:AddInitializer(initializer)
                end

                -------------------------
                -- UTILITIES SECTION ----
                -------------------------
                -- Initialize a section for utilities.
                layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(UTILITIES_SECTION))

                -- Open Issue Button
                do
                    local name = ""
                    local buttonText = "Open Issue"
                    local tooltipText = "Click to get the Github issue page."
                    local clickHandler = function()
                        StaticPopupDialogs["HELPMEPLAY_OPEN_ISSUE"] = {
                            text = "Hey! Thanks for being willing to open an issue. You rock! |T648207:16|t",
                            button1 = CLOSE,
                            OnShow = function(self)
                                local function HidePopup(self) self:GetParent():Hide() end
                                self.editBox:SetScript("OnKeyUp", function(self, key)
                                    if IsControlKeyDown() and key == "C" then HidePopup(self) end
                                end)
                                self.editBox:SetText("https://github.com/Saaappi/HelpMePlay/issues/new")
                                self.editBox:HighlightText()
                            end,
                            timeout = 0,
                            showAlert = false,
                            whileDead = false,
                            hideOnEscape = true,
                            hasEditBox = true,
                            enterClicksFirstButton = true,
                            preferredIndex = 3,
                        }
                        StaticPopup_Show("HELPMEPLAY_OPEN_ISSUE")
                    end

                    local initializer = CreateSettingsButtonInitializer(name, buttonText, clickHandler, tooltipText, true)
                    HelpMePlay.layout:AddInitializer(initializer)
                end

                -- Talent Importer
                do
                    local name = ""
                    local buttonText = "Talent Importer"
                    local tooltipText = "Click to open the Talent Importer utility."
                    local clickHandler = function(_, button)
                        if button == "LeftButton" then
                            HideUIPanel(SettingsPanel)
                            HelpMePlay.OpenTalentImporter()
                        end
                    end

                    local initializer = CreateSettingsButtonInitializer(name, buttonText, clickHandler, tooltipText, true)
                    HelpMePlay.layout:AddInitializer(initializer)
                end

                -- Randomize Adventurer
                do
                    local name = ""
                    local buttonText = "Randomize Adventurer"
                    local tooltipText = "Don't know what to create next? Click to randomly generate a race, class, and specialization combination for your next adventurer!"
                    local clickHandler = function(_, button)
                        if button == "LeftButton" then
                            local raceID = LHMP:GetRandomRaceID()
                            if raceID then
                                local factionID = LHMP:GetRaceFactionByID(raceID)
                                local race = C_CreatureInfo.GetRaceInfo(raceID)
                                if race then
                                    local classID = LHMP:GetRandomClassByRaceID(raceID)
                                    if classID then
                                        local class = C_CreatureInfo.GetClassInfo(classID)
                                        local specName = LHMP:GetRandomSpecIDByClassID(classID)
                                        if class then
                                            if factionID and factionID == 0 then
                                                HelpMePlay.Print(format("%s %s %s %s", CreateAtlasMarkup("bfa-landingbutton-horde-up", 16, 16), race.raceName, specName, class.className))
                                            elseif factionID and factionID == 1 then
                                                HelpMePlay.Print(format("%s %s %s %s", CreateAtlasMarkup("bfa-landingbutton-alliance-up", 16, 16), race.raceName, specName, class.className))
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end

                    local initializer = CreateSettingsButtonInitializer(name, buttonText, clickHandler, tooltipText, true)
                    HelpMePlay.layout:AddInitializer(initializer)
                end
            --end)

            -- Unregister the event for performance.
            --eventHandler:UnregisterEvent("ADDON_LOADED")
        --end
    --end
--end)]]

function HelpMePlay.OnSettingChanged(_, setting, value)
    -- Get the variable name from the setting.
    local variable = setting:GetVariable()

    -- Set the variable to the value.
    HelpMePlayDB[variable] = value

    -- Handler for the Quest Mobs icon/position.
    if variable == "QuestMobsIconID" then
        if value == 1 or value == 2 then
            HelpMePlay.UpdateQuestMobsIcon()
        elseif value == 3 then
            StaticPopup_Show("HELPMEPLAY_QUESTMOBS_CUSTOM_ICON")
            StaticPopupDialogs["HMP_QUEST_MOBS_CUSTOM_ICON"] = {
                text = "Please enter the texture ID for your custom icon. The texture ID can be found in the URL at |cffFFD100https://www.wowhead.com/icons/|r.\n\n" ..
                "Search for an icon, click it, then take the number after |cffFFD100icon=|r in the URL.",
                button1 = YES,
                button2 = NO,
                explicitAcknowledge = true,
                hasEditBox = true,
                OnAccept = function(self)
                    local input = self.editBox:GetText()
                    if tonumber(input) then
                        HelpMePlayDB["QuestMobsCustomIcon"] = tonumber(input)
                        HelpMePlay.UpdateQuestMobsIcon()
                    else
                        HelpMePlay.Print("Input was invalid.")
                    end
                end,
                OnCancel = function()
                end,
                preferredIndex = 3
            }
            StaticPopup_Show("HMP_QUEST_MOBS_CUSTOM_ICON")
        end
    elseif variable == "DepositKeepAmount" or variable == "TrainerProtectionValue" then
        HelpMePlayDB[variable] = value * 10000
    elseif variable == "QuestMobsIconPositionID" then
        HelpMePlay.UpdateQuestMobsIconPosition()
    elseif variable == "QuestMobsIconXOffset" or variable == "QuestMobsIconXOffset" then
        HelpMePlay.UpdateQuestMobsIconPosition()
    elseif variable == "ShowRemixScrapButton" then
        HelpMePlay.CreateRemixScrapButton()
    elseif variable == "ShowRemixUsablesButton" then
        HelpMePlay.CreateRemixUsablesButton()
    elseif variable == "ShowWardrobeButton" then
        HelpMePlay.CreateWardrobeButton()
    elseif variable == "UseWorldEventQueue" then
        HelpMePlay.CreateEventQueueButton()
    end
end

function HelpMePlay.AddSettingButton(name, buttonText, onClick, tooltip, addSearchTags)
    local button = CreateSettingsButtonInitializer(name, buttonText, onClick, tooltip, addSearchTags)
    HelpMePlay.Layout:AddInitializer(button)
end

function HelpMePlay.AddSettingCheckbox(category, controlLabel, variableName, defaultValue, currentValue, tooltip)
    local setting = Settings.RegisterAddOnSetting(category, controlLabel, variableName, type(defaultValue), currentValue)

    Settings.SetOnValueChangedCallback(variableName, HelpMePlay.OnSettingChanged)
    Settings.CreateCheckBox(category, setting, tooltip)

    return setting
end

function HelpMePlay.AddSettingDropdown()

end

function HelpMePlay.AddSettingSlider()

end