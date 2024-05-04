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

-- TODO: Can this be removed? Do I need this table
-- if players will have Route Builder eventually?
addon.Emotes = {}

-- TODO: Can this be removed? Do I need this table
-- if players will have Route Builder eventually?
addon.IgnoredQuestGivers = {}

-- These are the options in the Chromie Time
-- dropdown.
addon.CHROMIE_TIME_IDS = {
    [16] = "Dragonflight",
    [15] = EXPANSION_NAME7,
    [14] = EXPANSION_NAME8,
    [10] = EXPANSION_NAME6,
    [9] = EXPANSION_NAME5,
    [8] = EXPANSION_NAME4,
    [7] = EXPANSION_NAME2,
    [6] = EXPANSION_NAME1,
    [5] = EXPANSION_NAME3,
    [0] = NONE,
}

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

-- These are the options in the Quest Rewards
-- dropdown.
addon.QUEST_REWARDS_TYPES = {
    [2] = "Sell Price",
    [1] = "Item Level",
    [0] = NONE,
}