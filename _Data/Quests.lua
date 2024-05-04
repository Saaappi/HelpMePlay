local addonName, addon = ...

----------------------
-- Quest Automation --
----------------------
addon.AdventureMaps = {
    -- Dragon Isles
    [2057] = {
        72266, -- The Waking Shores
        72267, -- Ohn'ahran Plains
        72268, -- The Azure Span
        72269, -- Thaldraszus
    },
}

addon.Emotes = {}

addon.IgnoredQuestGivers = {}

--------------------------------
-- Quest Rewards (Item Level) --
--------------------------------
-- These are specialization IDs.
addon.CanDualWield = {
    251, -- Frost DK
    577, -- Havoc DH
    581, -- Vengeance DH
    268, -- Brewmaster Monk
    269, -- Windwalker Monk
    259, -- Assassination Rogue
    260, -- Outlaw Rogue
    261, -- Subtlety Rogue
    263, -- Enhancement Shaman
    72, -- Fury Warrior
}