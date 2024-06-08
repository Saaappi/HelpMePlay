local LHMP = LibStub("LibHelpMePlay")
if not LHMP then return end

LHMP.WorldEvents = {
    [559] = {
        ["name"] = EXPANSION_NAME1,
        ["atlas"] = nil,
        ["dungeonQueueID"] = 744,
        ["texture"] = 630783,
        ["conditions"] = {
            ["Alliance"] = "QUEST_ACTIVE = 40168",
            ["Horde"] = "QUEST_ACTIVE = 40168"
        }
    },
    [562] = {
        ["name"] = EXPANSION_NAME2,
        ["atlas"] = nil,
        ["dungeonQueueID"] = 995,
        ["texture"] = 630787,
        ["conditions"] = {
            ["Alliance"] = "QUEST_ACTIVE = 40173",
            ["Horde"] = "QUEST_ACTIVE = 40173"
        }
    },
    [587] = {
        ["name"] = EXPANSION_NAME3,
        ["atlas"] = nil,
        ["dungeonQueueID"] = 1146,
        ["texture"] = 630784,
        ["conditions"] = {
            ["Alliance"] = "QUEST_ACTIVE = 40787",
            ["Horde"] = "QUEST_ACTIVE = 40786"
        }
    },
    [643] = {
        ["name"] = EXPANSION_NAME4,
        ["atlas"] = nil,
        ["dungeonQueueID"] = 1453,
        ["texture"] = 630786,
        ["conditions"] = {
            ["Alliance"] = "QUEST_ACTIVE = 45563",
            ["Horde"] = "QUEST_ACTIVE = 45563"
        }
    },
    [1056] = {
        ["name"] = EXPANSION_NAME5,
        ["atlas"] = nil,
        ["dungeonQueueID"] = 1971,
        ["texture"] = 2838050,
        ["conditions"] = {
            ["Alliance"] = "QUEST_ACTIVE = 55499",
            ["Horde"] = "QUEST_ACTIVE = 55499"
        }
    },
    [1263] = {
        ["name"] = EXPANSION_NAME6,
        ["atlas"] = nil,
        ["dungeonQueueID"] = 2274,
        ["texture"] = 1408999,
        ["conditions"] = {
            ["Alliance"] = "QUEST_ACTIVE = 64710",
            ["Horde"] = "QUEST_ACTIVE = 64710"
        }
    },
    [423] = {
        ["name"] = "",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 288,
        ["texture"] = 135450,
        ["conditions"] = {
            ["Alliance"] = "QUEST_ACTIVE = 79104",
            ["Horde"] = "QUEST_ACTIVE = 79104"
        }
    },
    [341] = {
        ["name"] = "",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 286,
        ["texture"] = 135269,
        ["conditions"] = {
            ["Alliance"] = "QUEST_ACTIVE = 11976",
            ["Horde"] = "QUEST_ACTIVE = 11976"
        }
    },
    [372] = {
        ["name"] = "",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 287,
        ["texture"] = 132621,
        ["conditions"] = {
            ["Alliance"] = "QUEST_ACTIVE = 77775",
            ["Horde"] = "QUEST_ACTIVE = 77775"
        }
    },
    [324] = {
        ["name"] = "",
        ["atlas"] = nil,
        ["dungeonQueueID"] = 285,
        ["texture"] = 133661,
        ["conditions"] = {
            ["Alliance"] = "QUEST_ACTIVE = 78474",
            ["Horde"] = "QUEST_ACTIVE = 78474"
        }
    }
}