---@diagnostic disable: undefined-global
local addonName, addon = ...
local LHMP = LibStub("LibHelpMePlay")
local NOT_AVAILABLE_FOR_USE = "This setting is currently unavailable."

addon.Settings = {
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