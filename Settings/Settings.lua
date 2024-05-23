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

-- Register the addon to the Settings panel as a category.
local category, layout = Settings.RegisterVerticalLayoutCategory(addonName)
Settings.RegisterAddOnCategory(category)

-- Add the variable to the namespace, so we can use it to
-- open the settings in a slash command.
addon.category = category

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
                    if setting.Type == "CheckButton" then
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
                    if setting.Type == "CheckButton" then
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
                    if setting.Type == "CheckButton" then
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
                    if setting.Type == "CheckButton" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.SavedVariable)
                    elseif setting.Type == "DropDown" or setting.Type == "Slider" then
                        addon.New(setting.Type, setting.Name, category, setting.TooltipText, setting.Options, setting.SavedVariable)
                    end
                end

                --------------------------
                -- QUEST MOBS SECTION ----
                --------------------------
                -- Initialize a section for quest automation.
                layout:AddInitializer(CreateSettingsListSectionHeaderInitializer(QUESTMOBS_SECTION))

                -- Sort the table before we iterate through it.
                table.sort(addon.Settings.QuestMobs, Compare)

                -- Iterate through the now-sorted table and add them to
                -- the addon's category.
                for _, setting in ipairs(addon.Settings.QuestMobs) do
                    if setting.Type == "CheckButton" then
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

-- Basic Buttons
local openIssueButton
local talentImporterButton
local heirloomButton
--local routeBuilderButton

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

C_Timer.After(5, function()
    --[[talentImporterButton = {
        name = addonName .. "TalentImporterButton",
        parent = addonName .. "RepairsCheckButton",
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -20,
        width = 125,
        height = 25,
        text = "Talent Importer",
        tooltipHeader = "Talent Importer",
        tooltipText = "Click to open the Talent Importer utility.",
        onClick = nil,
    }
    setmetatable(talentImporterButton, { __index = HelpMePlay.Button })
    talentImporterButton = talentImporterButton:BaseButton()
    talentImporterButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            HideUIPanel(SettingsPanel)
            addon.OpenTalentImporter()
        end
    end)

    heirloomButton = {
        name = addonName .. "HeirloomButton",
        parent = talentImporterButton,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -10,
        width = 125,
        height = 25,
        text = "Heirlooms",
        tooltipHeader = "Heirlooms",
        tooltipText = "Click to open the Heirloom selection utility.",
        onClick = nil,
    }
    setmetatable(heirloomButton, { __index = HelpMePlay.Button })
    heirloomButton = heirloomButton:BaseButton()
    heirloomButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            HideUIPanel(SettingsPanel)
            addon.OpenHeirloomSelector()
        end
    end)]]

    --[[routeBuilderButton = {
        name = addonName .. "RouteBuilderButton",
        parent = heirloomButton,
        anchor = "LEFT",
        relativeAnchor = "RIGHT",
        oX = 10,
        oY = 0,
        width = 125,
        height = 25,
        text = "Route Builder",
        tooltipHeader = "Route Builder",
        tooltipText = "Click to open the Route Builder utility.",
        onClick = nil,
    }
    setmetatable(routeBuilderButton, { __index = HelpMePlay.Button })
    routeBuilderButton = routeBuilderButton:BaseButton()
    routeBuilderButton:SetScript("OnClick", function(self, button)
        if button == "LeftButton" then
            --HideUIPanel(SettingsPanel)
            --addon.OpenTalentImporter()
        end
    end)
    routeBuilderButton:SetEnabled(false)]]

    --[[openIssueButton = {
        name = addonName .. "OpenIssueButton",
        parent = Panel,
        anchor = "BOTTOMRIGHT",
        relativeAnchor = "BOTTOMRIGHT",
        oX = -10,
        oY = 10,
        width = 125,
        height = 25,
        text = "Open Issue",
        tooltipHeader = "Open Issue",
        tooltipText = "Click to get the Github issue page.",
        onClick = function()
            local popup = {
                name = "HELPMEPLAY_OPEN_ISSUE",
                text = "Hey! Thanks for being willing to open an issue. You rock! |T648207:16|t",
                button1Text = "Close",
                onShow = function(self)
                    local function HidePopup(self) self:GetParent():Hide() end
                    self.editBox:SetScript("OnKeyUp", function(self, key)
                        if IsControlKeyDown() and key == "C" then HidePopup(self) end
                    end)
                    self.editBox:SetText("https://github.com/Saaappi/HelpMePlay/issues/new")
                    self.editBox:HighlightText()
                end,
                showAlert = false,
                whileDead = false,
                hideOnEscape = true,
                hasEditBox = true,
                enterClicksFirstButton = true,
                preferredIndex = 3,
            }
            setmetatable(popup, { __index = HelpMePlay.Frame })
            popup = popup:Popup()
            StaticPopup_Show(popup.name)
        end,
    }
    setmetatable(openIssueButton, { __index = HelpMePlay.Button })
    openIssueButton = openIssueButton:BaseButton()]]
end)