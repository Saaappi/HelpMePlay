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
                "LEVEL_LOWER = 30",
            }
        }
    },
    [62538] = {
        {
            ID = 35587,
            CanConfirm = false,
            Conditions = {
                "LEVEL_LOWER = 30",
            }
        }
    },
}