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
                "NONE = NONE",
            }
        }
    },
    [62538] = {
        {
            ID = 35587,
            CanConfirm = true,
            Conditions = {
                "QUEST_ACTIVE = 31661 AND 31008",
                --"QUEST_ACTIVE = 31007 OR 31660 OR 31175",
            }
        }
    },
}