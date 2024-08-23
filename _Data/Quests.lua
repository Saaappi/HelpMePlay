local _, HelpMePlay = ...

----------------------
-- Quest Automation --
----------------------
-- C_AdventureMap.GetMapID() for the map ID, then
-- use C_AdventureMap.GetZoneChoiceInfo(choiceIndex)
-- to get the quest IDs... or just look them up on WH.
HelpMePlay.AdventureMaps = {
    [2057] = { -- Dragon Isles
        72266, -- The Waking Shores
        72267, -- Ohn'ahran Plains
        72268, -- The Azure Span
        72269, -- Thaldraszus
    },
    [2276] = { -- Khaz Algar
        83550, -- The Ringing Deeps
        83551, -- Hallowfall
        83552, -- Azj-Kahet
    }
}

-- These are the options in the Chromie Time
-- dropdown.
HelpMePlay.CHROMIE_TIME_IDS = {
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
HelpMePlay.CanDualWield = {
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

HelpMePlay.InventoryType = {
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
HelpMePlay.EquipLoc = {
    [62] = { 10 }, -- Arcane Mage
    [63] = { 10 }, -- Fire Mage
    [64] = { 10 }, -- Frost Mage
    [65] = { 0, 1, 4, 5, 6, 7, 8 }, -- Holy Paladin
    [66] = { 0, 4, 7 }, -- Protection Paladin
    [70] = { 0, 1, 4, 5, 6, 7, 8 }, -- Retribution Paladin
    [71] = { 1, 5, 6, 8, 10 }, -- Arms Warrior
    [72] = { 0, 1, 4, 5, 6, 7, 8, 10 }, -- Fury Warrior
    [73] = { 0, 4, 7 }, -- Protection Warrior
    [102] = { 4, 6, 10 }, -- Balance Druid
    [103] = { 4, 6, 10 }, -- Feral Druid
    [104] = { 4, 6, 10 }, -- Guardian Druid
    [105] = { 4, 6, 10 }, -- Restoration Druid
    [250] = { 1, 5, 6, 8 }, -- Blood Death Knight
    [251] = { 0, 1, 4, 5, 6, 7, 8 }, -- Frost Death Knight
    [252] = { 1, 5, 6, 8 }, -- Unholy Death Knight
    [253] = { 2, 3, 18 }, -- Beast Mastery Hunter
    [254] = { 2, 3, 18 }, -- Marksmanship Hunter
    [255] = { 6, 10 }, -- Survival Hunter
    [256] = { 10 }, -- Discipline Priest
    [257] = { 10 }, -- Holy Priest
    [258] = { 10 }, -- Shadow Priest
    [259] = { 15 }, -- Assassination Rogue
    [260] = { 0, 4, 7, 11, 12, 13, 15 }, -- Outlaw Rogue
    [261] = { 15 }, -- Subtlety Rogue
    [262] = { 1, 5, 10 }, -- Elemental Shaman
    [263] = { 0, 4, 11, 12, 13 }, -- Enhancement Shaman
    [264] = { 1, 5, 10 }, -- Restoration Shaman
    [265] = { 10 }, -- Affliction Warlock
    [266] = { 10 }, -- Demonology Warlock
    [267] = { 10 }, -- Destruction Warlock
    [268] = { 0, 4, 6, 7, 10, 11, 12, 13 }, -- Brewmaster Monk
    [269] = { 0, 4, 6, 7, 10, 11, 12, 13 }, -- Windwalker Monk
    [270] = { 0, 4, 6, 7, 10, 11, 12, 13 }, -- Mistweaver Monk
    [577] = { 0, 1, 9, 11, 12, 13 }, -- Havoc Demon Hunter
    [581] = { 0, 1, 9, 11, 12, 13 }, -- Vengeance Demon Hunter
    [1444] = { 0, 4 }, -- Shaman (Initial)
    [1446] = { 0, 4, 7 }, -- Warrior (Initial)
    [1447] = { 10 }, -- Druid (Initial)
    [1448] = { 2, 3, 18 }, -- Hunter (Initial)
    [1449] = { 10 }, -- Mage (Initial)
    [1450] = { 10 }, -- Monk (Initial)
    [1451] = { 0, 4, 7 }, -- Paladin (Initial)
    [1452] = { 10 }, -- Priest (Initial)
    [1453] = { 15 }, -- Rogue (Initial)
    [1454] = { 10 }, -- Warlock (Initial)
    [1455] = { 1, 5, 8 }, -- Death Knight (Initial)
    [1456] = { 9 }, -- Demon Hunter (Initial)
    [1465] = { 0, 1, 4, 5, 7, 8, 10, 11, 12, 13, 15 }, -- Evoker (Initial)
    [1467] = { 0, 1, 4, 5, 7, 8, 10, 11, 12, 13, 15 }, -- Devastation Evoker
    [1468] = { 0, 1, 4, 5, 7, 8, 10, 11, 12, 13, 15 }, -- Preservation Evoker
    [1473] = { 0, 1, 4, 5, 7, 8, 10, 11, 12, 13, 15 }, -- Augmentation Evoker
}

-- These are the options in the Quest Rewards
-- dropdown.
HelpMePlay.QUEST_REWARDS_TYPES = {
    [2] = "Sell Price",
    [1] = "Item Level",
    [0] = NONE,
}