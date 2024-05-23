---@diagnostic disable: undefined-global
local addonName, addon = ...
local NOT_AVAILABLE_FOR_USE = "This setting is currently unavailable."

-- Returns red text.
addon.RedText = function(str)
    return format("|cffFF0000%s|r", str)
end

local Panel = CreateFrame("Frame", addonName .. "SettingsPanel", SettingsPanel)
Panel:Hide()
Panel.name = addonName
InterfaceOptions_AddCategory(Panel)

addon.Settings = {
    CheckButtons = {
        {
            Name = addonName .. "SkipCutscenesCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", Panel, "TOPLEFT", 15, -60 },
            Label = "Skip Cutscenes",
            Tooltip = "Toggle skipping cutscenes and in-game movies.",
            SavedVariable = "SkipCutscenes",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "AdventureMapsCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "SkipCutscenesCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Adventure Maps",
            Tooltip = "Toggle to automatically accept quests from adventure maps.\n\n" ..
            addon.RedText("The current support is only for the adventure map in The Waking Shores."),
            SavedVariable = "UseAdventureMaps",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "QuestsCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "AdventureMapsCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Quests",
            Tooltip = "Toggle the acceptance and completion of guide quests, as well as the selection of quest rewards.\n\n" ..
            addon.RedText("This setting is mutually exclusive with All Quests."),
            SavedVariable = "AcceptAndCompleteQuests",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "AllQuestsCheckButton",
            Parent = Panel,
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
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "AllQuestsCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Ignore Repeatable Quests",
            Tooltip = "Toggle to ignore repeatable quests.",
            SavedVariable = "IgnoreRepeatableQuests",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "IgnoreDailyQuestsCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "IgnoreRepeatableQuestsCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Ignore Daily Quests",
            Tooltip = "Toggle to ignore daily quests.",
            SavedVariable = "IgnoreDailyQuests",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "EmotesCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "IgnoreDailyQuestsCheckButton", "BOTTOMLEFT", -15, -5 },
            Label = "Emotes",
            Tooltip = "Toggle to automatically emote at appropriate NPCs.",
            SavedVariable = "UseEmotes",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "MuteTalkingHeadCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "EmotesCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Mute Talking Head",
            Tooltip = "Toggle to automatically emote at appropriate NPCs.",
            SavedVariable = "UseEmotes",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "MuteTalkingHeadCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "EmotesCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Mute Talking Head",
            Tooltip = "Toggle to hide and prevent the talking head popup.",
            SavedVariable = "UseEmotes",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "GossipCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "MuteTalkingHeadCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Gossip",
            Tooltip = "Toggle the automatic selection of NPC gossips.\n\n" ..
            addon.RedText(NOT_AVAILABLE_FOR_USE),
            SavedVariable = "UseEmotes",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "PartyPlayCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "GossipCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Party Play",
            Tooltip = "Toggle to make playing with friends a little easier.\n\n" ..
            addon.RedText("Party Play, by default, will only auto share quests with party members. Announcements have been removed."),
            SavedVariable = "UsePartyPlay",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "ReadyChecksCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "PartyPlayCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Ready Checks",
            Tooltip = "Toggle to automatically accept ready checks.",
            SavedVariable = "AcceptReadyChecks",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "RoleChecksCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "ReadyChecksCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Role Checks",
            Tooltip = "Toggle to automatically accept role checks.",
            SavedVariable = "AcceptRoleChecks",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "RepairsCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "RoleChecksCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Repairs",
            Tooltip = "Toggle to automatically repair at merchants.",
            SavedVariable = "ShouldRepair",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "PurchaseQuestItemsCheckButton",
            Parent = Panel,
            Position = { "LEFT", addonName .. "SkipCutscenesCheckButton", "RIGHT", 225, 0 },
            Label = "Purchase Quest Items",
            Tooltip = "Toggle to automatically purchase quest items from merchants.\n\n" ..
            addon.RedText(NOT_AVAILABLE_FOR_USE),
            SavedVariable = "ShouldRepair",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "SkyridingCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "PurchaseQuestItemsCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Skyriding",
            Tooltip = "Toggle to add a button to the Skyriding UI to quickly learn its traits.",
            SavedVariable = "UseDynamicFlightButton",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "EventQueueCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "SkyridingCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Event Queue",
            Tooltip = "Toggle to add a button to the top middle of your screen. This button can be used to quickly queue into ongoing events.",
            SavedVariable = "UseWorldEventQueue",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "OpenHolidayItemsCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "EventQueueCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Open Holiday Items",
            Tooltip = "Toggle to automatically open holiday items when you loot them.",
            SavedVariable = "OpenHolidayItems",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "WarModeCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "OpenHolidayItemsCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "War Mode",
            Tooltip = "Toggle to automatically enable War Mode when entering or logging into Orgrimmar or Stormwind City.\n\n" ..
            addon.RedText(format("This setting doesn't apply to players at or above level %d.", addon.Constants["CHROMIE_TIME_MAX_LEVEL"])),
            SavedVariable = "UseWarMode",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "RareScanCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "WarModeCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Rare Scan",
            Tooltip = "Toggle if you wish to receive a popup notification and sound for nearby rares.",
            SavedVariable = "RareScan",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
        {
            Name = addonName .. "ChatIconsCheckButton",
            Parent = Panel,
            Position = { "TOPLEFT", addonName .. "RareScanCheckButton", "BOTTOMLEFT", 0, -5 },
            Label = "Chat Icons",
            Tooltip = "Toggle to show item and collection status (when appropriate) icons in the chat frame.",
            SavedVariable = "ShowChatIcons",
            OnClick = function(self) HelpMePlayDB[self.SavedVariable] = self:GetChecked() end,
        },
    }
}