local addonName, addon = ...

addon.HolidayItems = {
    [21746] = true,     -- Lucky Red Envelope
    [37586] = true,     -- Handful of Treats
    [54537] = true,     -- Heart-Shaped Box
    [117392] = true,    -- Loot-Filled Pumpkin
    [117393] = true,    -- Keg-Shaped Treasure Chest
    [216874] = true,    -- Loot-Filled Basket
}

addon.WorldEvents = {
    [559] = {
        ["name"] = "Timewalking: The Burning Crusade",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 744,
        ["questID"] = 40168,
        ["texture"] = 630783,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 40168",
        },
    },
    [562] = {
        ["name"] = "Timewalking: Wrath of the Lich King",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 995,
        ["questID"] = 40173,
        ["texture"] = 630787,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 40173",
        },
    },
    [587] = {
        ["name"] = "Timewalking: Cataclysm",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 1146,
        ["questID"] = 40786,
        ["texture"] = 630784,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 40786",
        },
    },
    [643] = {
        ["name"] = "Timewalking: Mists of Pandaria",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 1453,
        ["questID"] = 45563,
        ["texture"] = 630786,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 45563",
        },
    },
    [1056] = {
        ["name"] = "Timewalking: Warlords of Draenor",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 1971,
        ["questID"] = 55499,
        ["texture"] = 2838050,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 55499",
        },
    },
    [1263] = {
        ["name"] = "Timewalking: Legion",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 2274,
        ["questID"] = 64710,
        ["texture"] = 1408999,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 64710",
        },
    },
    [423] = {
        ["name"] = "Love is in the Air",
        ["atlas"] = nil,
        ["texture"] = 135450,
        ["dungeonQueueID"] = 288,
        ["questID"] = 79104,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 79104",
        },
    },
    [341] = {
        ["name"] = "Midsummer Fire Festival",
        ["atlas"] = nil,
        ["texture"] = 135269,
        ["dungeonQueueID"] = 286,
        ["questID"] = 11976,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 11976",
        },
    },
    [372] = {
        ["name"] = "Brewfest",
        ["atlas"] = nil,
        ["texture"] = 133201,
        ["dungeonQueueID"] = 287,
        ["questID"] = 77775,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 77775",
        },
    },
    [324] = {
        ["name"] = "Hallow's End",
        ["atlas"] = nil,
        ["texture"] = 5222578,
        ["dungeonQueueID"] = 285,
        ["questID"] = 78474,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 78474",
        },
    },
}