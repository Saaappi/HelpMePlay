---@diagnostic disable: undefined-global
local addonName, addon = ...
local LHMP = LibStub("LibHelpMePlay")
local NOT_AVAILABLE_FOR_USE = "This setting is currently unavailable."

local function GetEditModeLayouts()
    local layouts={{1,"Modern"},{2,"Classic"}}
    local customLayouts = C_EditMode.GetLayouts()
    for index, layout in ipairs(customLayouts.layouts) do
        table.insert(layouts, (index + 2), { (index + 2), layout.layoutName })
    end
    return layouts
end

addon.Settings = {
    QuestMobs = {
        {
            Type = "DropDown",
            Name = "Quest Mobs Icon",
            TooltipText = "Select the icon that should appear on the nameplate of NPCs related to active quest(s).",
            Options = {
                { 1, "Quest" },
                { 2, "Treasure Goblin" },
                { 3, "Custom" },
                { 0, NONE },
            },
            SavedVariable = "QuestMobsIconID",
        },
        {
            Type = "DropDown",
            Name = "Quest Mobs Icon Position",
            TooltipText = "Select the position the icon should appear on the nameplate.",
            Options = {
                { 1, "LEFT" },
                { 2, "TOPLEFT" },
                { 3, "TOP" },
                { 4, "TOPRIGHT" },
                { 5, "RIGHT" },
                { 6, "BOTTOMRIGHT" },
                { 7, "BOTTOM" },
                { 8, "BOTTOMLEFT" },
            },
            SavedVariable = "QuestMobsIconPositionID",
        },
        {
            Type = "Slider",
            Name = "X Offset",
            TooltipText = "Use the slider to set the icon's X offset.",
            Options = {
                minValue = -25,
                maxValue = 25,
                step = 50,
            },
            SavedVariable = "QuestMobsIconXOffset",
        },
        {
            Type = "Slider",
            Name = "Y Offset",
            TooltipText = "Use the slider to set the icon's Y offset.",
            Options = {
                minValue = -25,
                maxValue = 25,
                step = 50,
            },
            SavedVariable = "QuestMobsIconYOffset",
        },
    },
    NewCharacter = {
        {
            Type = "CheckButton",
            Name = "Action Bar 2",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar2",
        },
        {
            Type = "CheckButton",
            Name = "Action Bar 3",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar3",
        },
        {
            Type = "CheckButton",
            Name = "Action Bar 4",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar4",
        },
        {
            Type = "CheckButton",
            Name = "Action Bar 5",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar5",
        },
        {
            Type = "CheckButton",
            Name = "Action Bar 6",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar6",
        },
        {
            Type = "CheckButton",
            Name = "Action Bar 7",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar7",
        },
        {
            Type = "CheckButton",
            Name = "Action Bar 8",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar8",
        },
        {
            Type = "CheckButton",
            Name = "Clear All Tracking",
            TooltipText = "Toggle to clear all tracking options from the minimap. De-toggle to keep the default tracking options enabled.",
            SavedVariable = "ClearAllTracking",
        },
        {
            Type = "CheckButton",
            Name = "Auto Loot",
            TooltipText = "Toggle to enable Auto Loot. De-toggle to disable Auto Loot.",
            SavedVariable = "AutoLoot",
        },
        {
            Type = "CheckButton",
            Name = "Disable Tutorials",
            TooltipText = "Toggle to disable the tutorial popups. De-toggle if you wish to see the tutorial popups.",
            SavedVariable = "DisableTutorials",
        },
        {
            Type = "CheckButton",
            Name = "Auto Push Spells",
            TooltipText = "Toggle to automatically push spells to your action bars. De-toggle if you don't want spells to automatically push to your action bars.",
            SavedVariable = "AutoPushSpells",
        },
        {
            Type = "CheckButton",
            Name = "Class Color Frames",
            TooltipText = "Toggle to make the PvP and raid frames use class colors instead of health. De-toggle to keep health as the defining color.",
            SavedVariable = "ClassColorFrames",
        },
        {
            Type = "CheckButton",
            Name = "Loot Under Mouse",
            TooltipText = "Toggle to make the loot window appear under your mouse. De-toggle to make the loot window appear near the top-left corner.",
            SavedVariable = "LootUnderMouse",
        },
        {
            Type = "CheckButton",
            Name = "Disable Dialog",
            TooltipText = "Toggle to silence dialog. De-toggle to enable dialog.",
            SavedVariable = "DisableDialog",
        },
        {
            Type = "DropDown",
            Name = "Edit Mode",
            TooltipText = "Select the default layout you would like all your new characters to use.",
            Options = GetEditModeLayouts(),
            SavedVariable = "NCC_EditModeLayoutID",
        },
    },
    Utilities = {
        {
            Type = "BasicButton",
            Name = "",
            ButtonText = "Open Issue",
            ClickHandler = function()
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
            end,
            TooltipText = "Click to get the Github issue page.",
            AddSearchTags = true,
        },
        {
            Type = "BasicButton",
            Name = "",
            ButtonText = "Talent Importer",
            ClickHandler = function(_, button)
                if button == "LeftButton" then
                    HideUIPanel(SettingsPanel)
                    addon.OpenTalentImporter()
                end
            end,
            TooltipText = "Click to open the Talent Importer utility.",
            AddSearchTags = true,
        },
        {
            Type = "BasicButton",
            Name = "",
            ButtonText = "Heirlooms",
            ClickHandler = function(_, button)
                if button == "LeftButton" then
                    HideUIPanel(SettingsPanel)
                    addon.OpenHeirloomSelector()
                end
            end,
            TooltipText = "Click to open the Heirloom selection utility.",
            AddSearchTags = true,
        },
        {
            Type = "BasicButton",
            Name = "",
            ButtonText = "Randomize Adventurer",
            ClickHandler = function(_, button)
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
            TooltipText = "Don't know what to create next? Click to randomly generate a race, class, and specialization combination for your next character!",
            AddSearchTags = true,
        },
    }
}