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

addon.InventoryType = {
    [1] = 1,            -- Head
    [2] = 2,            -- Neck
    [3] = 3,            -- Shoulder
    --[4] = 4,          -- Shirt
    [5] = 5,            -- Chest
    [6] = 6,            -- Waist
    [7] = 7,            -- Legs
    [8] = 8,            -- Feet
    [9] = 9,            -- Wrist
    [10] = 10,          -- Hands
    [11] = { 11, 12 },  -- Finger1, Finger2
    [12] = { 13, 14 },  -- Trinket1, Trinket2
    [13] = { 16, 17 },  -- One-Hand Weapons
    [14] = 17,          -- Shield
    [15] = 16,          -- Ranged (Bows, Crossbows, Guns)
    [16] = 15,          -- Back
    [17] = 16,          -- Two-Hand Weapons
    --[18] = 0,         -- Bag
    --[19] = 19,        -- Tabard
    [20] = 5,           -- Robe (Chest)
    [21] = 16,          -- Main-Hand Weapon
    [22] = 16,          -- Off-Hand Weapon
    [23] = 17,          -- Holdable
    --[24] = 0,         -- Ammo
    [25] = 16,          -- Thrown
    [26] = 16,          -- Ranged (Bows, Crossbows, Guns)
    -- Everything after 26 is useless.
}

-- The value on the left is a specID. Not every spec is necessary
-- to support. The value on the right is the type of weapons they
-- can (and should) use.
--
-- The numbers on the right are subclass IDs from C_Item.GetItemInfo.
addon.EquipLoc = {
    [72] = { 0, 1, 4, 5, 6, 7, 8, 10 }, -- Fury Warrior
    [255] = { 6, 10 }, -- Survival Hunter (They should use Polearms or Staves.)
    [260] = { 0, 4, 7, 11, 12, 13, 15 }, -- Outlaw Rogue (They can use anything in their offhand, but the mainhand must be a slow 1H weapon.)
    [261] = { 15 }, -- Subtlety Rogue (They can use anything, but most abilities REQUIRE daggers.)
    [263] = { 0, 4, 11, 12, 13 }, -- Enhancement Shaman
}

-- These are the options in the Quest Rewards
-- dropdown.
addon.QUEST_REWARDS_TYPES = {
    [2] = "Sell Price",
    [1] = "Item Level",
    [0] = NONE,
}