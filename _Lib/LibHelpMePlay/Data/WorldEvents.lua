local LHMP = LibStub("LibHelpMePlay")
if not LHMP then return end

LHMP.WorldEvents = {
    [559] = {
        ["name"] = format("Timewalking: %s", EXPANSION_NAME1),
        ["atlas"] = nil,
        ["dungeonQueueID"] = 744,
        ["questIDForVisibility"] = 40168,
        ["texture"] = 630783,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 40168",
        },
    },
    [562] = {
        ["name"] = format("Timewalking: %s", EXPANSION_NAME2),
        ["atlas"] = nil,
        ["dungeonQueueID"] = 995,
        ["questIDForVisibility"] = 40173,
        ["texture"] = 630787,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 40173",
        },
    },
    [587] = {
        ["name"] = format("Timewalking: %s", EXPANSION_NAME3),
        ["atlas"] = nil,
        ["dungeonQueueID"] = 1146,
        ["questIDForVisibility"] = 40786,
        ["texture"] = 630784,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 40786",
        },
    },
    [643] = {
        ["name"] = format("Timewalking: %s", EXPANSION_NAME4),
        ["atlas"] = nil,
        ["dungeonQueueID"] = 1453,
        ["questIDForVisibility"] = 45563,
        ["texture"] = 630786,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 45563",
        },
    },
    [1056] = {
        ["name"] = format("Timewalking: %s", EXPANSION_NAME5),
        ["atlas"] = nil,
        ["dungeonQueueID"] = 1971,
        ["questIDForVisibility"] = 55499,
        ["texture"] = 2838050,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 55499",
        },
    },
    [1263] = {
        ["name"] = format("Timewalking: %s", EXPANSION_NAME6),
        ["atlas"] = nil,
        ["dungeonQueueID"] = 2274,
        ["questIDForVisibility"] = 64710,
        ["texture"] = 1408999,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 64710",
        },
    },
    [423] = {
        ["name"] = "Love is in the Air",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 288,
        ["questIDForVisibility"] = 79104,
        ["texture"] = 135450,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 79104",
        },
    },
    --[[[341] = {
        ["name"] = "Midsummer Fire Festival",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 286,
        ["questIDForVisibility"] = 11976,
        ["texture"] = 135269,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 11976",
        },
    },]]
    [372] = {
        ["name"] = "Brewfest",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 287,
        ["questIDForVisibility"] = 77775,
        ["texture"] = 132621,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 77775",
        },
    },
    [324] = {
        ["name"] = "Hallow's End",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 285,
        ["questIDForVisibility"] = 78474,
        ["texture"] = 133661,
        ["conditions"] = {
            "QUEST_INCOMPLETE = 78474",
        },
    },
}