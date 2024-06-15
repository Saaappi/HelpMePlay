local LHMP = LibStub("LibHelpMePlay")
if not LHMP then return end

LHMP.QuestMerchants = {
    [54982] = {
        {
            Index = 1,
            Quantity = 3,
            Conditions = {
                "QUEST_ACTIVE = 29627",
                "QUEST_OBJECTIVE_INCOMPLETE = 29627,3",
            }
        }
    },
    [54981] = {
        {
            Index = 1,
            Quantity = 1,
            Conditions = {
                "QUEST_ACTIVE = 29627",
                "QUEST_OBJECTIVE_INCOMPLETE = 29627,2",
            }
        }
    },
    [73306] = {
        {
            Index = 6,
            Quantity = 1,
            Conditions = {
                "QUEST_ACTIVE = 33343",
                "QUEST_OBJECTIVE_INCOMPLETE = 33343,1",
            }
        }
    },
    [156800] = {
        {
            Index = 1,
            Quantity = 1,
            Conditions = {
                "QUEST_ACTIVE = 55194",
                "QUEST_OBJECTIVE_INCOMPLETE = 55194,1",
            }
        }
    },
    [167213] = {
        {
            Index = 1,
            Quantity = 1,
            Conditions = {
                "QUEST_ACTIVE = 59950",
                "QUEST_OBJECTIVE_INCOMPLETE = 59950,1",
            }
        }
    }
}