---@diagnostic disable: undefined-global
local addonName, addon = ...
local NOT_AVAILABLE_FOR_USE = "This setting is currently unavailable."

-- Returns red text.
addon.RedText = function(str)
    return format("|cffFF0000%s|r", str)
end

--[[addon.Panel = CreateFrame("Frame", addonName .. "SettingsPanel", SettingsPanel)
addon.Panel:Hide()
addon.Panel.name = addonName
InterfaceOptions_AddCategory(addon.Panel)]]

addon.Settings = {
    CheckButtons = {
        General = {
            {
                Name = "Emotes",
                DefaultValue = false,
                TooltipText = "Toggle to automatically emote at appropriate NPCs.",
                SavedVariable = "UseEmotes",
            },
            {
                Name = "Gossip",
                DefaultValue = false,
                TooltipText = "Toggle the automatic selection of NPC gossips.\n\n" ..
                addon.RedText(NOT_AVAILABLE_FOR_USE),
                SavedVariable = "AcceptGossip",
            },
            {
                Name = "Mute Talking Head",
                DefaultValue = false,
                TooltipText = "Toggle to hide and prevent the talking head popup.",
                SavedVariable = "MuteTalkingHead",
            },
            {
                Name = "Ready Checks",
                DefaultValue = false,
                TooltipText = "Toggle to automatically accept ready checks.",
                SavedVariable = "AcceptReadyChecks",
            },
            {
                Name = "Repairs",
                DefaultValue = false,
                TooltipText = "Toggle to automatically repair at merchants.",
                SavedVariable = "ShouldRepair",
            },
            {
                Name = "Skip Cutscenes",
                DefaultValue = false,
                TooltipText = "Toggle skipping cutscenes and in-game movies.",
                SavedVariable = "SkipCutscenes",
            },
            {
                Name = "Role Checks",
                DefaultValue = false,
                TooltipText = "Toggle to automatically accept role checks.",
                SavedVariable = "AcceptRoleChecks",
            },
            {
                Name = "Skyriding",
                DefaultValue = false,
                TooltipText = "Toggle to add a button to the Skyriding UI to quickly learn its traits.",
                SavedVariable = "UseDynamicFlightButton",
            },
            {
                Name = "War Mode",
                DefaultValue = false,
                TooltipText = "Toggle to automatically enable War Mode when entering or logging into Orgrimmar or Stormwind City.\n\n" ..
                addon.RedText(format("This setting doesn't apply to players at or above level %d.", addon.Constants["CHROMIE_TIME_MAX_LEVEL"])),
                SavedVariable = "UseWarMode",
            },
            {
                Name = "Rare Scan",
                DefaultValue = false,
                TooltipText = "Toggle if you wish to receive a popup notification and sound for nearby rares.",
                SavedVariable = "RareScan",
            },
            {
                Name = "Event Queue",
                DefaultValue = false,
                TooltipText = "Toggle to add a button to the top middle of your screen. This button can be used to quickly queue into ongoing events.",
                SavedVariable = "UseWorldEventQueue",
            },
            {
                Name = "Open Holiday Items",
                DefaultValue = false,
                TooltipText = "Toggle to automatically open holiday items when you loot them.",
                SavedVariable = "OpenHolidayItems",
            },
            {
                Name = "Chat Icons",
                DefaultValue = false,
                TooltipText = "Toggle to show item and collection status (when appropriate) icons in the chat frame.",
                SavedVariable = "ShowChatIcons",
            },
        },
        --[[{
            Name = "Adventure Maps",
            DefaultValue = false,
            TooltipText = "Toggle to automatically accept quests from adventure maps.\n\n" ..
            addon.RedText("The current support is only for the adventure map in The Waking Shores."),
            SavedVariable = "UseAdventureMaps",
        },]]
        --[[
        {
            Name = addonName .. "QuestsCheckButton",
            Parent = addon.Panel,
            Position = { "TOPLEFT", addonName .. "AdventureMapsCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Quests",
            Tooltip = "Toggle the acceptance and completion of guide quests, as well as the selection of quest rewards.\n\n" ..
            addon.RedText("This setting is mutually exclusive with All Quests."),
            SavedVariable = "AcceptAndCompleteQuests",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "AllQuestsCheckButton",
            Parent = addon.Panel,
            Position = { "TOPLEFT", addonName .. "QuestsCheckButton", "BOTTOMLEFT", 15, -5 },
            Label = "All Quests",
            Tooltip = "Toggle the acceptance and completion of all quests, as well as the selection of quest rewards.\n\n" ..
            addon.RedText("This setting is mutually exclusive with Quests."),
            SavedVariable = "AcceptAndCompleteAllQuests",
            OnClick = function(self)
                local questsCheckButton = addonName .. "QuestsCheckButton"
                HelpMePlayDB[self.SavedVariable] = self:GetChecked()
                if self:GetChecked() then
                    questsCheckButton:SetEnabled(false)
                    HelpMePlayDB["AcceptAndCompleteQuests"] = false
                    questsCheckButton:SetChecked(HelpMePlayDB["AcceptAndCompleteQuests"])
                else
                    questsCheckButton:SetEnabled(true)
                    HelpMePlayDB["AcceptAndCompleteQuests"] = true
                    questsCheckButton:SetChecked(HelpMePlayDB["AcceptAndCompleteQuests"])
                end
            end,
        },
        {
            Name = addonName .. "IgnoreRepeatableQuestsCheckButton",
            Parent = addon.Panel,
            Position = { "TOPLEFT", addonName .. "AllQuestsCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Ignore Repeatable Quests",
            Tooltip = "Toggle to ignore repeatable quests.",
            SavedVariable = "IgnoreRepeatableQuests",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "IgnoreDailyQuestsCheckButton",
            Parent = addon.Panel,
            Position = { "TOPLEFT", addonName .. "IgnoreRepeatableQuestsCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Ignore Daily Quests",
            Tooltip = "Toggle to ignore daily quests.",
            SavedVariable = "IgnoreDailyQuests",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "PartyPlayCheckButton",
            Parent = addon.Panel,
            Position = { "TOPLEFT", addonName .. "GossipCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Party Play",
            Tooltip = "Toggle to make playing with friends a little easier.\n\n" ..
            addon.RedText("Party Play, by default, will only auto share quests with party members. Announcements have been removed."),
            SavedVariable = "UsePartyPlay",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "PurchaseQuestItemsCheckButton",
            Parent = addon.Panel,
            Position = { "LEFT", addonName .. "SkipCutscenesCheckButton", "RIGHT", 225, 0 },
            Label = "Purchase Quest Items",
            Tooltip = "Toggle to automatically purchase quest items from merchants.\n\n" ..
            addon.RedText(NOT_AVAILABLE_FOR_USE),
            SavedVariable = "ShouldRepair",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },]]
    }
}