local addonName, HelpMePlay = ...
local LHMP = LibStub("LibHelpMePlay")

local REMIX_SECTION = "Remix: Mists of Pandaria"
local GENERAL_SECTION = GENERAL
local QUEST_SECTION = "Quest"
local LFG_SECTION = "LFG"
local MERCHANT_SECTION = MERCHANT
local WARBAND_BANK_SECTION = "Warband Bank"
local QUESTMOBS_SECTION = "Quest Mobs"
local PET_BATTLES_SECTION = "Pet Battles"
local WARDROBE_SECTION = "Wardrobe"
local NEW_CHARACTER_SECTION = "New Character Configuration"
local UTILITIES_SECTION = "Utilities"

function HelpMePlay.ResetCharacterConfiguration()
    if HelpMePlayNewCharacterButton and HelpMePlayNewCharacterButton:IsVisible() then return end

    for index, GUID in next, HelpMePlayDB["Characters"] do
        if GUID == HelpMePlay.playerGUID then
            table.remove(HelpMePlayDB["Characters"], index)
            break
        end
    end
    HelpMePlay.NewCharacter()
end

function HelpMePlay.RegisterSettings()
    local category, layout = Settings.RegisterVerticalLayoutCategory(addonName)
    Settings.RegisterAddOnCategory(category)

    HelpMePlay.SettingsCategory = category
    HelpMePlay.SettingsCategoryID = category:GetID()
    HelpMePlay.SettingsLayout = layout

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
        "Automatically select the appropriate quest-related gossip options from non-player characters.\n\n" ..
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
        "Toggle if you wish to have the item comparison tooltips always visible or not when you hover an item."
    )

    ------------------------
    -- QUEST SECTION -------
    ------------------------
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(QUEST_SECTION))

    HelpMePlay.AddSettingCheckbox(
        category,
        "Accept and Complete Quests",
        "AcceptAndCompleteQuests",
        false,
        HelpMePlayDB["AcceptAndCompleteQuests"],
        "Toggle to accept and complete quests."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Ignore Daily Quests",
        "IgnoreDailyQuests",
        false,
        HelpMePlayDB["IgnoreDailyQuests"],
        "Toggle to ignore daily quests."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Ignore Repeatable Quests",
        "IgnoreRepeatableQuests",
        false,
        HelpMePlayDB["IgnoreRepeatableQuests"],
        "Toggle to ignore repeatable quests."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Adventure Maps",
        "UseAdventureMaps",
        false,
        HelpMePlayDB["UseAdventureMaps"],
        "Toggle to automatically accept quests from adventure maps.\n\n" ..
        LHMP:ColorText("RED", "The current support is only for the adventure map in The Waking Shores.")
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Purchase Quest Items",
        "PurchaseQuestItems",
        false,
        HelpMePlayDB["PurchaseQuestItems"],
        "Toggle to automatically purchase quest items from merchants."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Garrison: Architect Table",
        "GarrisonArchitectTable",
        false,
        HelpMePlayDB["GarrisonArchitectTable"],
        "Toggle to automatically process placing your Barracks in the Garrison during the corresponding quest."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Garrison: Mission Table",
        "GarrisonMissionTable",
        false,
        HelpMePlayDB["GarrisonMissionTable"],
        "Toggle to automatically process the first mission on your Garrison mission table during the corresponding quest."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Player Choice",
        "UsePlayerChoice",
        false,
        HelpMePlayDB["UsePlayerChoice"],
        "Toggle to allow the addon to decide quest-related player choices on your behalf."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Share Quests",
        "ShareQuests",
        false,
        HelpMePlayDB["ShareQuests"],
        "Toggle to automatically share quests with party members."
    )
    HelpMePlay.AddSettingDropdown(
        category,
        "Chromie Time",
        "ChromieTimeExpansionID",
        0,
        HelpMePlayDB["ChromieTimeExpansionID"],
        function()
            local container = Settings.CreateControlTextContainer()
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
        end,
        "Select the expansion to use when speaking with Chromie in Orgrimmar or Stormwind City."
    )
    HelpMePlay.AddSettingDropdown(
        category,
        "Quest Rewards",
        "QuestRewardSelectionTypeID",
        0,
        HelpMePlayDB["QuestRewardSelectionTypeID"],
        function()
            local container = Settings.CreateControlTextContainer()
            container:Add(1, "Item Level")
            container:Add(2, "Sell Price")
            container:Add(0, NONE)
            return container:GetData()
        end,
        format("Select how quest rewards should be chosen.\n\n" ..
        "If Item Level is selected, then chosen quest rewards are automatically equipped by %s.", addonName)
    )

    -------------------
    -- LFG SECTION ----
    -------------------
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(LFG_SECTION))

    HelpMePlay.AddSettingCheckbox(
        category,
        "Event Queue Button",
        "UseWorldEventQueue",
        false,
        HelpMePlayDB["UseWorldEventQueue"],
        "Toggle to add a button to the top middle of your screen. This button can be used to quickly queue into ongoing events.\n\n" ..
        LHMP:ColorText("RED", "Not all events are supported!")
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Accept Party Invites",
        "AcceptPartyInvites",
        false,
        HelpMePlayDB["AcceptPartyInvites"],
        "Toggle to automatically accept party invitations."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Ready Checks",
        "AcceptReadyChecks",
        false,
        HelpMePlayDB["AcceptReadyChecks"],
        "Toggle to automatically accept ready checks."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Role Checks",
        "AcceptRoleChecks",
        false,
        HelpMePlayDB["AcceptRoleChecks"],
        "Toggle to automatically accept role checks."
    )
    HelpMePlay.AddSettingDropdown(
        category,
        "Quick Proposal",
        "QuickProposal",
        0,
        HelpMePlayDB["QuickProposal"],
        function()
            local container = Settings.CreateControlTextContainer()
            container:Add(1, YES)
            container:Add(0, NO)
            return container:GetData()
        end,
        "Select whether or not the left mouse button can be used to quickly accept LFG proposals.\n\n" ..
        "If set to Yes, then the left mouse button can click anywhere on the screen to accept the proposal.\n\n" ..
        LHMP:ColorText("RED", "NOTE: ") .. "Changing the setting will require a UI reload."
    )

    ------------------------
    -- MERCHANT SECTION ----
    ------------------------
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(MERCHANT_SECTION))

    HelpMePlay.AddSettingCheckbox(
        category,
        "Automatic Repair",
        "shouldAutomaticRepair",
        false,
        HelpMePlayDB["shouldAutomaticRepair"],
        "Toggle to allow or prevent the addon from using your character's funds for automatic repair."
    )
    HelpMePlay.AddSettingSlider(
        category,
        "Trainer Protection Value",
        "TrainerProtectionValue",
        0,
        HelpMePlayDB["TrainerProtectionValue"] / 10000,
        0,
        1000,
        10,
        function()
            return HelpMePlayDB["TrainerProtectionValue"] / 10000
        end,
        "Set the minimum amount of gold you must have before the addon will automatically train for you.\n\n" ..
        LHMP:ColorText("RED", "This slider steps in increments of 10.")
    )

    --------------------------
    -- WARBAND BANK SECTION --
    --------------------------
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(WARBAND_BANK_SECTION))

    HelpMePlay.AddSettingSlider(
        category,
        "Deposit Keep Amount",
        "DepositKeepAmount",
        0,
        HelpMePlayDB["DepositKeepAmount"] / 10000,
        0,
        1000,
        10,
        function()
            return HelpMePlayDB["DepositKeepAmount"] / 10000
        end,
        "Set the minimum amount of gold you would like to keep on your character after making a deposit.\n\n" ..
        "Visiting your Warband bank while below this threshold will instead attempt a withdrawal, provided the bank has the funds.\n\n" ..
        LHMP:ColorText("RED", "This slider moves in increments of 10.")
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Keep Me Safe",
        "DepositKeepMeSafe",
        false,
        HelpMePlayDB["DepositKeepMeSafe"],
        "Toggle to add approval to every monetary transaction the addon conducts at your Warband bank."
    )

    --------------------------
    -- QUEST MOBS SECTION ----
    --------------------------
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(QUESTMOBS_SECTION))

    HelpMePlay.AddSettingDropdown(
        category,
        "Quest Mobs Icon",
        "QuestMobsIconID",
        0,
        HelpMePlayDB["QuestMobsIconID"],
        function()
            local container = Settings.CreateControlTextContainer()
            container:Add(1, "Quest")
            container:Add(2, "Treasure Goblin")
            container:Add(3, "Custom")
            container:Add(0, NONE)
            return container:GetData()
        end,
        "Select the icon that should appear on the nameplate of NPCs related to active quest(s)."
    )
    HelpMePlay.AddSettingDropdown(
        category,
        "Quest Mobs Icon Position",
        "QuestMobsIconPositionID",
        0,
        HelpMePlayDB["QuestMobsIconPositionID"],
        function()
            local container = Settings.CreateControlTextContainer()
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
        end,
        "Select the position the icon should appear on the nameplate."
    )
    HelpMePlay.AddSettingSlider(
        category,
        "Quest Mobs Icon X Offset",
        "QuestMobsIconXOffset",
        -5,
        HelpMePlayDB["QuestMobsIconXOffset"],
        -25,
        25,
        1,
        function()
            return HelpMePlayDB["QuestMobsIconXOffset"]
        end,
        "Use the slider to set the icon's X offset."
    )
    HelpMePlay.AddSettingSlider(
        category,
        "Quest Mobs Icon Y Offset",
        "QuestMobsIconYOffset",
        0,
        HelpMePlayDB["QuestMobsIconYOffset"],
        -25,
        25,
        1,
        function()
            return HelpMePlayDB["QuestMobsIconYOffset"]
        end,
        "Use the slider to set the icon's Y offset."
    )

    ------------------------
    -- PET BATTLES SECTION -
    ------------------------
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(PET_BATTLES_SECTION))

    HelpMePlay.AddSettingCheckbox(
        category,
        "Bandage Button",
        "ShowPetBattleBandageButton",
        false,
        HelpMePlayDB["ShowPetBattleBandageButton"],
        "Toggle to show or hide the pet battle bandage button."
    )

    ------------------------
    -- WARDROBE SECTION ----
    ------------------------
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(WARDROBE_SECTION))

    HelpMePlay.AddSettingCheckbox(
        category,
        "Wardrobe Button",
        "ShowWardrobeButton",
        false,
        HelpMePlayDB["ShowWardrobeButton"],
        "Toggle to show or hide the Wardrobe button on the character frame."
    )

    -------------------------------------------
    -- NEW CHARACTER CONFIGURATION SECTION ----
    -------------------------------------------
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(NEW_CHARACTER_SECTION))

    HelpMePlay.AddSettingCheckbox(
        category,
        "Action Bar 2",
        "NCC_ActionBar2",
        false,
        HelpMePlayDB["NCC_ActionBar2"],
        "Toggle to enable Action Bar 2 on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Action Bar 3",
        "NCC_ActionBar3",
        false,
        HelpMePlayDB["NCC_ActionBar3"],
        "Toggle to enable Action Bar 3 on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Action Bar 4",
        "NCC_ActionBar4",
        false,
        HelpMePlayDB["NCC_ActionBar4"],
        "Toggle to enable Action Bar 4 on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Action Bar 5",
        "NCC_ActionBar5",
        false,
        HelpMePlayDB["NCC_ActionBar5"],
        "Toggle to enable Action Bar 5 on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Action Bar 6",
        "NCC_ActionBar6",
        false,
        HelpMePlayDB["NCC_ActionBar6"],
        "Toggle to enable Action Bar 6 on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Action Bar 7",
        "NCC_ActionBar7",
        false,
        HelpMePlayDB["NCC_ActionBar7"],
        "Toggle to enable Action Bar 7 on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Action Bar 8",
        "NCC_ActionBar8",
        false,
        HelpMePlayDB["NCC_ActionBar8"],
        "Toggle to enable Action Bar 8 on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Clear All Tracking",
        "ClearAllTracking",
        false,
        HelpMePlayDB["ClearAllTracking"],
        "Toggle to clear all tracking options from the minimap on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Auto Loot",
        "AutoLoot",
        false,
        HelpMePlayDB["AutoLoot"],
        "Toggle to enable Auto Loot on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Disable Tutorials",
        "DisableTutorials",
        false,
        HelpMePlayDB["DisableTutorials"],
        "Toggle to disable tutorial popups on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Auto Push Spells",
        "AutoPushSpells",
        false,
        HelpMePlayDB["AutoPushSpells"],
        "Toggle to disable new spells from being automatically added to your action bar on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Class Color Frames",
        "ClassColorFrames",
        false,
        HelpMePlayDB["ClassColorFrames"],
        "Toggle to color the party and raid frames by class color on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Loot Under Mouse",
        "LootUnderMouse",
        false,
        HelpMePlayDB["LootUnderMouse"],
        "Toggle to keep the loot window under your mouse on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Disable Dialog",
        "DisableDialog",
        false,
        HelpMePlayDB["DisableDialog"],
        "Toggle to silence dialog on each new character."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Create Whisper Window",
        "CreateWhisperWindow",
        false,
        HelpMePlayDB["CreateWhisperWindow"],
        "Toggle to create a new window on your chat frame for Whispers and Blizzard Whispers."
    )
    HelpMePlay.AddSettingCheckbox(
        category,
        "Create Loot Window",
        "CreateLootWindow",
        false,
        HelpMePlayDB["CreateLootWindow"],
        "Toggle to create a new window on your chat frame for loot events."
    )
    HelpMePlay.AddSettingDropdown(
        category,
        "Edit Mode",
        "NCC_EditModeLayoutID",
        0,
        HelpMePlayDB["NCC_EditModeLayoutID"],
        function()
            local function GetEditModeLayouts()
                local layouts = {{1,"Modern"},{2,"Classic"}}
                local customLayouts = C_EditMode.GetLayouts()
                for index, design in ipairs(customLayouts.layouts) do
                    table.insert(layouts, (index + 2), { (index + 2), design.layoutName })
                end
                return layouts
            end
            local container = Settings.CreateControlTextContainer()
            local layouts = GetEditModeLayouts()
            for _, design in next, layouts do
                container:Add(design[1], design[2])
            end
            return container:GetData()
        end,
        "Select the default edit mode layout you would like to use on each new character."
    )
    HelpMePlay.AddSettingButton(
        "Reset Configuration",
        "Reset Configuration",
        function()
            HelpMePlay.ResetCharacterConfiguration()
        end,
        "Click to reset the character configuration for the current character.",
        true
    )

    -------------------------
    -- UTILITIES SECTION ----
    -------------------------
    layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(UTILITIES_SECTION))

    HelpMePlay.AddSettingButton(
        "Open Issue",
        "Open Issue",
        function()
            StaticPopupDialogs["HELPMEPLAY_OPEN_ISSUE"] = {
                text = format("Hi, %s! Thank you for taking the time to open an issue. I really appreciate it! %s", HelpMePlay.playerName, CreateAtlasMarkup("delves-scenario-heart-icon", 16, 16)),
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
        end,
        "Click to get the Github issue page.",
        true
    )
    HelpMePlay.AddSettingButton(
        "Talent Importer",
        "Talent Importer",
        function(_, button)
            if button == "LeftButton" then
                HideUIPanel(SettingsPanel)
                HelpMePlay.OpenTalentImporter()
            end
        end,
        "Click to open the Talent Importer utility.",
        true
    )
    HelpMePlay.AddSettingButton(
        "Randomize Adventurer",
        "Randomize Adventurer",
        function(_, button)
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
        end,
        "Don't know what to create next? Click to randomly generate a faction, race, class, and specialization combination for your next adventurer!",
        true
    )
end

function HelpMePlay.OnSettingChanged(_, setting, value)
    local variableName = setting:GetVariable()
    HelpMePlayDB[variableName] = value

    local functions = {
        QuestMobsIconID = function()
            if value == 1 or value == 2 then
                HelpMePlay.UpdateQuestMobsIcon()
            elseif value == 3 then
                StaticPopupDialogs["HMP_QUEST_MOBS_CUSTOM_ICON"] = {
                    text = "Please enter the texture ID for your custom icon.\n\n" ..
                    "The texture ID can be found in the URL on Wowhead. Please see the example below.\n\n" ..
                    "https://www.wowhead.com/icon=|cff33BBB0626003|r/classicon-paladin\n\n" ..
                    "The highlighted number is what you put in the text field below.",
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
                            HelpMePlay.Print(HelpMePlay.ErrorMessages["INVALID_INPUT"])
                        end
                    end,
                    OnCancel = function()
                    end,
                    preferredIndex = 3
                }
                StaticPopup_Show("HMP_QUEST_MOBS_CUSTOM_ICON")
            end
        end,
        DepositKeepAmount = function() HelpMePlayDB[variableName] = value * 10000 end,
        TrainerProtectionValue = function() HelpMePlayDB[variableName] = value * 10000 end,
        QuestMobsIconPositionID = function() HelpMePlay.UpdateQuestMobsIconPosition() end,
        QuestMobsIconXOffset = function() HelpMePlay.UpdateQuestMobsIconPosition() end,
        QuestMobsIconYOffset = function() HelpMePlay.UpdateQuestMobsIconPosition() end,
        ShowRemixScrapButton = function() HelpMePlay.CreateRemixScrapButton() end,
        ShowRemixUsablesButton = function() HelpMePlay.CreateRemixUsablesButton() end,
        UseWorldEventQueue = function() HelpMePlay.CreateEventQueueButton() end,
        ShowWardrobeButton = function() HelpMePlay.CreateWardrobeButton() end,
        ShowPetBattleBandageButton = function() HelpMePlay.CreatePetBattleBandageButton() end,
        QuickProposal = function()
            StaticPopupDialogs["HMP_QUICK_PROPOSAL_CHANGED"] = {
                text = format("The %s setting has changed. Would you like to reload the UI?", LHMP:ColorText("HEIRLOOM", "Quick Proposal")),
                button1 = YES,
                button2 = NO,
                explicitAcknowledge = true,
                OnAccept = function()
                    C_UI.Reload()
                end,
                OnCancel = function()
                end,
                preferredIndex = 3
            }
            StaticPopup_Show("HMP_QUICK_PROPOSAL_CHANGED")
        end,
    }

    local func = functions[variableName]
    if func then
        func()
    end
end

function HelpMePlay.AddSettingButton(controlLabel, buttonText, onClick, tooltip, addSearchTags)
    local button = CreateSettingsButtonInitializer(controlLabel, buttonText, onClick, tooltip, addSearchTags)
    HelpMePlay.SettingsLayout:AddInitializer(button)
end

function HelpMePlay.AddSettingCheckbox(category, controlLabel, variableName, defaultValue, currentValue, tooltip)
    local setting = Settings.RegisterAddOnSetting(category, controlLabel, variableName, type(defaultValue), currentValue)

    Settings.SetOnValueChangedCallback(variableName, HelpMePlay.OnSettingChanged)
    Settings.CreateCheckbox(category, setting, tooltip)

    return setting
end

function HelpMePlay.AddSettingDropdown(category, controlLabel, variableName, defaultValue, currentValue, options, tooltip)
    local setting = Settings.RegisterAddOnSetting(category, controlLabel, variableName, type(defaultValue), currentValue)

    Settings.SetOnValueChangedCallback(variableName, HelpMePlay.OnSettingChanged)
    Settings.CreateDropdown(category, setting, options, tooltip)

    return setting
end

function HelpMePlay.AddSettingSlider(category, controlLabel, variableName, defaultValue, currentValue, minValue, maxValue, increment, value, tooltip)
    local setting = Settings.RegisterAddOnSetting(category, controlLabel, variableName, type(defaultValue), currentValue)

    local options = Settings.CreateSliderOptions(minValue, maxValue, increment)
    options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
        return value
    end)

    Settings.SetOnValueChangedCallback(variableName, HelpMePlay.OnSettingChanged)
    Settings.CreateSlider(category, setting, options, tooltip)

    return setting
end

function HelpMePlay.Init()
    if HelpMePlayDB == nil then
        HelpMePlayDB = {}
    end
    if HelpMePlayDB_Character == nil then
        HelpMePlayDB_Character = {}
    end

    local oldVariables = {
        "AcceptAndCompleteAllQuests",
        "AGE",
        "ButtonReset_RemixUsables",
        "DebugModeEnabled",
        "DynamicFlightTrait1",
        "DynamicFlightTrait2",
        "Enabled",
        "GuideGossips",
        "GuideQuestItems",
        "GuideQuests",
        "HasNotRecategorizedMounts",
        "HasRecategorizedMounts",
        "Heirlooms",
        "IgnoredCreatures",
        "isMinimapButtonEnabled",
        "Junker",
        "MerchantItems",
        "minimap",
        "MinimapIconEnabled",
        "NCCEnabled",
        "NCC_PlayerTitleID",
        "NONE",
        "OpenHolidayItems",
        "PlayerTalents",
        "RareScan",
        "ShouldRepair",
        "TheMawEnabled",
        "TimerunningHeroicDungeonQueue",
        "UseHeirloomAutomation",
        "UsePartyPlay"
    }
    for _, key in next, oldVariables do
        if HelpMePlayDB[key] then
            HelpMePlayDB[key] = nil
        end
    end

    local defaults = {
        AcceptAndCompleteQuests = false,
        AcceptGossip = false,
        AcceptPartyInvites = false,
        AcceptReadyChecks = false,
        AcceptRoleChecks = false,
        AlwaysCompareItems = true,
        AutoLoot = false,
        AutoPushSpells = true,
        ChromieTimeExpansionID = 0,
        ClassColorFrames = false,
        ClearAllTracking = false,
        CreateLootWindow = false,
        CreateWhisperWindow = false,
        DepositKeepAmount = 0,
        DepositKeepMeSafe = true,
        DisableDialog = false,
        DisableTutorials = false,
        GarrisonArchitectTable = false,
        GarrisonMissionTable = false,
        IgnoreDailyQuests = false,
        IgnoreRepeatableQuests = false,
        LootUnderMouse = false,
        MuteTalkingHead = false,
        NCC_ActionBar2 = false,
        NCC_ActionBar3 = false,
        NCC_ActionBar4 = false,
        NCC_ActionBar5 = false,
        NCC_ActionBar6 = false,
        NCC_ActionBar7 = false,
        NCC_ActionBar8 = false,
        NCC_EditModeLayoutID = 1,
        OpenContainers = false,
        PurchaseQuestItems = false,
        QuestMobsCustomIcon = "",
        QuestMobsIconID = 0,
        QuestMobsIconPositionID = 1,
        QuestMobsIconXOffset = -5,
        QuestMobsIconYOffset = 0,
        QuestRewardSelectionTypeID = 0,
        QuickProposal = 0,
        shouldAutomaticRepair = false,
        ShareQuests = false,
        ShowChatIcons = false,
        ShowPetBattleBandageButton = false,
        ShowRemixScrapButton = false,
        ShowRemixUsablesButton = false,
        ShowWardrobeButton = false,
        SkipCutscenes = false,
        TrainerProtectionValue = 0,
        UseAdventureMaps = false,
        UseDynamicFlightButton = false,
        UseEmotes = false,
        UsePlayerChoice = false,
        UseWarMode = false,
        UseWorldEventQueue = false,
    }
    for key, value in next, defaults do
        if HelpMePlayDB[key] == nil then
            HelpMePlayDB[key] = value
        end
    end

    if HelpMePlayDB["Positions"] == nil then
        HelpMePlayDB["Positions"] = {}
    end
    if HelpMePlayDB["Characters"] == nil then
        HelpMePlayDB["Characters"] = {}
    end
    if HelpMePlayDB["ClassTalents"] == nil then
        HelpMePlayDB["ClassTalents"] = {}
        for i = 1, MAX_CLASSES do
            HelpMePlayDB["ClassTalents"][i] = {}
        end
    end
    if HelpMePlayDB["TempSettings"] == nil then
        HelpMePlayDB["TempSettings"] = {}
    end
	if HelpMePlayDB["Mounts"] == nil then
        HelpMePlayDB["Mounts"] = {
            Ground = {},
            Aquatic = {},
            Flying = {},
            Dynamic = {},
            AQ = {},
            Vashjir = {},
            Unused = {}
        }
    end

    HelpMePlay.RegisterSettings()
end