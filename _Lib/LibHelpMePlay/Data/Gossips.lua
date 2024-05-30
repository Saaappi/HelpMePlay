local LHMP = LibStub("LibHelpMePlay")
if not LHMP then return end

-- The first ID is an NPC ID, then nested are the gossip IDs
-- and their condition(s).
LHMP.Gossips = {
    [0] = {},
    [62202] = {
        {
            ID = 35586,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 31006",
            }
        }
    },
    [62538] = {
        {
            ID = 35587,
            CanConfirm = true,
            Conditions = {
                "QUEST_ACTIVE = 31007 OR 31660 OR 31175",
            }
        }
    },
    [63876] = {
        {
            ID = 28603,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 31091",
            }
        }
    },
    [62667] = {
        {
            ID = 35828,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 31129",
            }
        }
    },
    [62845] = {
        {
            ID = 35823,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 31129",
            }
        }
    },
    [62666] = {
        {
            ID = 35825,
            CanConfirm = false,
            Conditions = {
                "QUEST_ACTIVE = 31129",
            }
        }
    },
}