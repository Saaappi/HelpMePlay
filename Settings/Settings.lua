local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

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

                -- Sort the table before we iterate through it.
                table.sort(addon.Settings.Merchant, Compare)

                -- Iterate through the now-sorted table and add them to
                -- the addon's category.
                for _, setting in ipairs(addon.Settings.Merchant) do
                    if setting.Type == "BasicButton" then
                        addon.New(setting.Type, setting.Name, setting.ButtonText, setting.ClickHandler, setting.TooltipText, setting.AddSearchTags)
                    elseif setting.Type == "CheckButton" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.SavedVariable)
                    elseif setting.Type == "DropDown" or setting.Type == "Slider" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.Options, setting.SavedVariable)
                    end
                end

                --------------------------
                -- GUILD BANK SECTION ----
                --------------------------
                -- Initialize a section for guild banks.
                layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(GUILDBANK_SECTION))

                -- Sort the table before we iterate through it.
                table.sort(addon.Settings.GuildBank, Compare)

                -- Iterate through the now-sorted table and add them to
                -- the addon's category.
                for _, setting in ipairs(addon.Settings.GuildBank) do
                    if setting.Type == "BasicButton" then
                        addon.New(setting.Type, setting.Name, setting.ButtonText, setting.ClickHandler, setting.TooltipText, setting.AddSearchTags)
                    elseif setting.Type == "CheckButton" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.SavedVariable)
                    elseif setting.Type == "DropDown" or setting.Type == "Slider" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.Options, setting.SavedVariable)
                    end
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