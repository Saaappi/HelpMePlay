local addonName, addon = ...

addon.Heirlooms = {
    [1] = {}, -- Head
    [2] = {}, -- Neck
    [3] = {}, -- Shoulder
    [5] = {}, -- Chest
    [7] = {}, -- Legs
    [11] = {}, -- Ring 1
    [12] = {}, -- Ring 2
    [13] = {}, -- Trinket 1
    [14] = {}, -- Trinket 2
    [15] = {}, -- Back
    [16] = {}, -- Weapon 1
    [17] = {}, -- Weapon 2
}

addon.HeirloomArmorTypeIDByClass = {
    [1] = 4, -- Warrior
    [2] = 4, -- Paladin
    [3] = 3, -- Hunter
    [4] = 2, -- Rogue
    [5] = 1, -- Priest
    [6] = 4, -- Death Knight
    [7] = 3, -- Shaman
    [8] = 1, -- Mage
    [9] = 1, -- Warlock
    [10] = 2, -- Monk
    [11] = 2, -- Druid
    [12] = 2, -- Demon Hunter
    [13] = 3, -- Evoker
}

addon.HeirloomEquipLoc = {
    [1] = { 0, 1, 4, 5, 6, 7, 8 }, -- Warrior
    [2] = { 0, 1, 4, 5, 6, 7, 8 }, -- Paladin
    [3] = { 2, 3, 6, 18 }, -- Hunter
    [4] = { 0, 4, 7, 11, 12, 13, 15 }, -- Rogue
    [5] = { 10 }, -- Priest
    [6] = { 0, 1, 4, 5, 6, 7, 8 }, -- Death Knight
    [7] = { 0, 1, 4, 5, 10, 11, 12, 13 }, -- Shaman
    [8] = { 10 }, -- Mage
    [9] = { 10 }, -- Warlock
    [10] = { 0, 4, 6, 7, 10, 11, 12, 13 }, -- Monk
    [11] = { 4, 6, 10 }, -- Druid
    [12] = { 0, 1, 9, 11, 12, 13 }, -- Demon Hunter
    [13] = {  0, 1, 4, 5, 7, 8, 10, 11, 12, 13, 15 }, -- Evoker
}

addon.HeirloomDropDowns = {
    { ["name"] = "Head", ["id"] = 1 },
    { ["name"] = "Neck", ["id"] = 2 },
    { ["name"] = "Shoulder", ["id"] = 3 },
    { ["name"] = "Back", ["id"] = 15 },
    { ["name"] = "Chest", ["id"] = 5 },
    { ["name"] = "Legs", ["id"] = 7 },
    { ["name"] = "Ring 1", ["id"] = 11 },
    { ["name"] = "Ring 2", ["id"] = 12 },
    { ["name"] = "Trinket 1", ["id"] = 13 },
    { ["name"] = "Trinket 2", ["id"] = 14 },
    { ["name"] = "Weapon 1", ["id"] = 16 },
    { ["name"] = "Weapon 2", ["id"] = 17 },
}