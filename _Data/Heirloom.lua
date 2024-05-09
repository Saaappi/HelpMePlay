local addonName, addon = ...

addon.Heirlooms = {
    {}, -- Head
    {}, -- Neck
    {}, -- Shoulder
    {}, -- ?
    {}, -- Chest
    {}, -- ?
    {}, -- Legs
    {}, -- ?
    {}, -- ?
    {}, -- ?
    {}, -- Ring 1
    {}, -- Ring 2
    {}, -- Trinket 1
    {}, -- Trinket 2
    {}, -- Back
    {}, -- Weapon 1
    {}, -- Weapon 2
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
    --
    [1] = { 0, 1, 4, 5, 6, 7, 8 }, -- Warrior
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