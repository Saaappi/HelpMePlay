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
            TooltipText = "Toggle to automatically emote at appropriate NPCs.",
            SavedVariable = "UseEmotes",
        },
        {
            Type = "CheckButton",
            Name = "Gossip",
            TooltipText = "Toggle the automatic selection of NPC gossips.\n\n" ..
            addon.RedText(NOT_AVAILABLE_FOR_USE),
            SavedVariable = "AcceptGossip",
        },
        {
            Type = "CheckButton",
            Name = "Mute Talking Head",
            TooltipText = "Toggle to hide and prevent the talking head popup.",
            SavedVariable = "MuteTalkingHead",
        },
        {
            Type = "CheckButton",
            Name = "Ready Checks",
            TooltipText = "Toggle to automatically accept ready checks.",
            SavedVariable = "AcceptReadyChecks",
        },
        {
            Type = "CheckButton",
            Name = "Skip Cutscenes",
            TooltipText = "Toggle skipping cutscenes and in-game movies.",
            SavedVariable = "SkipCutscenes",
        },
        {
            Type = "CheckButton",
            Name = "Role Checks",
            TooltipText = "Toggle to automatically accept role checks.",
            SavedVariable = "AcceptRoleChecks",
        },
        {
            Type = "CheckButton",
            Name = "Skyriding",
            TooltipText = "Toggle to add a button to the Skyriding UI to quickly learn its traits.",
            SavedVariable = "UseDynamicFlightButton",
        },
        {
            Type = "CheckButton",
            Name = "War Mode",
            TooltipText = "Toggle to automatically enable War Mode when entering or logging into Orgrimmar or Stormwind City.\n\n" ..
            addon.RedText(format("This setting doesn't apply to players at or above level %d.", addon.Constants["CHROMIE_TIME_MAX_LEVEL"])),
            SavedVariable = "UseWarMode",
        },
        {
            Type = "CheckButton",
            Name = "Rare Scan",
            TooltipText = "Toggle if you wish to receive a popup notification and sound for nearby rares.",
            SavedVariable = "RareScan",
        },
        {
            Type = "CheckButton",
            Name = "Event Queue",
            TooltipText = "Toggle to add a button to the top middle of your screen. This button can be used to quickly queue into ongoing events.",
            SavedVariable = "UseWorldEventQueue",
        },
        {
            Type = "CheckButton",
            Name = "Open Holiday Items",
            TooltipText = "Toggle to automatically open holiday items when you loot them.",
            SavedVariable = "OpenHolidayItems",
        },
        {
            Type = "CheckButton",
            Name = "Chat Icons",
            TooltipText = "Toggle to show item and collection status (when appropriate) icons in the chat frame.",
            SavedVariable = "ShowChatIcons",
        },
    },
    Quest = {
        {
            Type = "CheckButton",
            Name = "Adventure Maps",
            TooltipText = "Toggle to automatically accept quests from adventure maps.\n\n" ..
            addon.RedText("The current support is only for the adventure map in The Waking Shores."),
            SavedVariable = "UseAdventureMaps",
        },
        {
            Type = "CheckButton",
            Name = "Accept and Complete Quests",
            TooltipText = "Toggle the acceptance and completion of quests, as well as the selection of quest rewards.",
            SavedVariable = "AcceptAndCompleteQuests",
        },
        --[[{
            Type = "CheckButton",
            Name = "Accept and Complete All Quests",
            TooltipText = "Toggle the acceptance and completion of all quests, as well as the selection of quest rewards.",
            SavedVariable = "AcceptAndCompleteAllQuests",
        },]]
        {
            Type = "CheckButton",
            Name = "Ignore Repeatable Quests",
            TooltipText = "Toggle to ignore repeatable quests.",
            SavedVariable = "IgnoreRepeatableQuests",
        },
        {
            Type = "CheckButton",
            Name = "Ignore Daily Quests",
            TooltipText = "Toggle to ignore daily quests.",
            SavedVariable = "IgnoreDailyQuests",
        },
        {
            Type = "CheckButton",
            Name = "Party Play",
            TooltipText = "Toggle to make playing with friends a little easier.\n\n" ..
            addon.RedText("Party Play, by default, will only auto share quests with party members. Announcements have been removed."),
            SavedVariable = "UsePartyPlay",
        },
        {
            Type = "CheckButton",
            Name = "Purchase Quest Items",
            TooltipText = "Toggle to automatically purchase quest items from merchants.\n\n" ..
            addon.RedText(NOT_AVAILABLE_FOR_USE),
            SavedVariable = "PurchaseQuestItems",
        },
        {
            Type = "DropDown",
            Name = "Chromie Time",
            TooltipText = "Select the expansion to use when speaking with Chromie in Orgrimmar or Stormwind City.",
            Options = {
                --{ 16, "Dragonflight" }, -- Dragonflight isn't supported yet (not until The War Within).
                { 14, EXPANSION_NAME8 },
                { 15, EXPANSION_NAME7 },
                { 10, EXPANSION_NAME6 },
                { 9, EXPANSION_NAME5 },
                { 8, EXPANSION_NAME4 },
                { 5, EXPANSION_NAME3 },
                { 7, EXPANSION_NAME2 },
                { 6, EXPANSION_NAME1 },
                { 0, NONE },
            },
            SavedVariable = "ChromieTimeExpansionID",
        },
        {
            Type = "DropDown",
            Name = "Quest Rewards",
            TooltipText = format("Select how quest rewards should be chosen.\n\n" ..
            "If Item Level is selected, then chosen quest rewards are automatically equipped by %s.", addonName),
            Options = {
                { 1, "Item Level" },
                { 2, "Sell Price" },
                { 0, NONE },
            },
            SavedVariable = "QuestRewardSelectionTypeID",
        },
    },
    Merchant = {
        {
            Type = "CheckButton",
            Name = "Repairs",
            TooltipText = "Toggle to allow automatic repair.",
            SavedVariable = "ShouldRepair",
        },
        {
            Type = "Slider",
            Name = "Trainer Protection Value",
            TooltipText = "Use the slider to set the minimum amount of gold you must have before the addon will automatically train for you.",
            Options = {
                minValue = 0,
                maxValue = 1000,
                step = 10,
            },
            SavedVariable = "TrainerProtectionValue",
        },
    },
}