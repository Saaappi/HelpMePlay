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
    General = {
        {
            Type = "CheckButton",
            Name = "Emotes",
            DefaultValue = false,
            TooltipText = "Toggle to automatically emote at appropriate NPCs.",
            SavedVariable = "UseEmotes",
        },
        {
            Type = "CheckButton",
            Name = "Gossip",
            DefaultValue = false,
            TooltipText = "Toggle the automatic selection of NPC gossips.\n\n" ..
            addon.RedText(NOT_AVAILABLE_FOR_USE),
            SavedVariable = "AcceptGossip",
        },
        {
            Type = "CheckButton",
            Name = "Mute Talking Head",
            DefaultValue = false,
            TooltipText = "Toggle to hide and prevent the talking head popup.",
            SavedVariable = "MuteTalkingHead",
        },
        {
            Type = "CheckButton",
            Name = "Ready Checks",
            DefaultValue = false,
            TooltipText = "Toggle to automatically accept ready checks.",
            SavedVariable = "AcceptReadyChecks",
        },
        {
            Type = "CheckButton",
            Name = "Repairs",
            DefaultValue = false,
            TooltipText = "Toggle to automatically repair at merchants.",
            SavedVariable = "ShouldRepair",
        },
        {
            Type = "CheckButton",
            Name = "Skip Cutscenes",
            DefaultValue = false,
            TooltipText = "Toggle skipping cutscenes and in-game movies.",
            SavedVariable = "SkipCutscenes",
        },
        {
            Type = "CheckButton",
            Name = "Role Checks",
            DefaultValue = false,
            TooltipText = "Toggle to automatically accept role checks.",
            SavedVariable = "AcceptRoleChecks",
        },
        {
            Type = "CheckButton",
            Name = "Skyriding",
            DefaultValue = false,
            TooltipText = "Toggle to add a button to the Skyriding UI to quickly learn its traits.",
            SavedVariable = "UseDynamicFlightButton",
        },
        {
            Type = "CheckButton",
            Name = "War Mode",
            DefaultValue = false,
            TooltipText = "Toggle to automatically enable War Mode when entering or logging into Orgrimmar or Stormwind City.\n\n" ..
            addon.RedText(format("This setting doesn't apply to players at or above level %d.", addon.Constants["CHROMIE_TIME_MAX_LEVEL"])),
            SavedVariable = "UseWarMode",
        },
        {
            Type = "CheckButton",
            Name = "Rare Scan",
            DefaultValue = false,
            TooltipText = "Toggle if you wish to receive a popup notification and sound for nearby rares.",
            SavedVariable = "RareScan",
        },
        {
            Type = "CheckButton",
            Name = "Event Queue",
            DefaultValue = false,
            TooltipText = "Toggle to add a button to the top middle of your screen. This button can be used to quickly queue into ongoing events.",
            SavedVariable = "UseWorldEventQueue",
        },
        {
            Type = "CheckButton",
            Name = "Open Holiday Items",
            DefaultValue = false,
            TooltipText = "Toggle to automatically open holiday items when you loot them.",
            SavedVariable = "OpenHolidayItems",
        },
        {
            Type = "CheckButton",
            Name = "Chat Icons",
            DefaultValue = false,
            TooltipText = "Toggle to show item and collection status (when appropriate) icons in the chat frame.",
            SavedVariable = "ShowChatIcons",
        },
    },
    Quest = {
        {
            Type = "CheckButton",
            Name = "Adventure Maps",
            DefaultValue = false,
            TooltipText = "Toggle to automatically accept quests from adventure maps.\n\n" ..
            addon.RedText("The current support is only for the adventure map in The Waking Shores."),
            SavedVariable = "UseAdventureMaps",
        },
        {
            Type = "CheckButton",
            Name = "Accept and Complete Guide Quests",
            DefaultValue = false,
            TooltipText = "Toggle the acceptance and completion of guide quests, as well as the selection of quest rewards.\n\n" ..
            addon.RedText("This setting is mutually exclusive with All Quests."),
            SavedVariable = "AcceptAndCompleteQuests",
        },
        {
            Type = "CheckButton",
            Name = "Accept and Complete All Quests",
            DefaultValue = false,
            TooltipText = "Toggle the acceptance and completion of all quests, as well as the selection of quest rewards.\n\n" ..
            addon.RedText("This setting is mutually exclusive with Quests."),
            SavedVariable = "AcceptAndCompleteAllQuests",
        },
        {
            Type = "CheckButton",
            Name = "Ignore Repeatable Quests",
            DefaultValue = false,
            TooltipText = "Toggle to ignore repeatable quests.",
            SavedVariable = "IgnoreRepeatableQuests",
        },
        {
            Type = "CheckButton",
            Name = "Ignore Daily Quests",
            DefaultValue = false,
            TooltipText = "Toggle to ignore daily quests.",
            SavedVariable = "IgnoreDailyQuests",
        },
        {
            Type = "CheckButton",
            Name = "Party Play",
            DefaultValue = false,
            TooltipText = "Toggle to make playing with friends a little easier.\n\n" ..
            addon.RedText("Party Play, by default, will only auto share quests with party members. Announcements have been removed."),
            SavedVariable = "UsePartyPlay",
        },
        {
            Type = "CheckButton",
            Name = "Purchase Quest Items",
            DefaultValue = false,
            TooltipText = "Toggle to automatically purchase quest items from merchants.\n\n" ..
            addon.RedText(NOT_AVAILABLE_FOR_USE),
            SavedVariable = "PurchaseQuestItems",
        },
    },
        --[[
        {
            Name = addonName .. "AllQuestsCheckButton",
            Parent = addon.Panel,
            Position = { "TOPLEFT", addonName .. "QuestsCheckButton", "BOTTOMLEFT", 15, -5 },
            Label = "All Quests",
            Tooltip = 
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
        },]]
}