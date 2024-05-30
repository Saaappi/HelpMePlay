local LHMP = LibStub("LibHelpMePlay")
if not LHMP then return end

-- The first ID is an NPC ID, then nested are the gossip IDs
-- and their condition(s).
LHMP.Gossips = {
    [0] = {
        -- The 0 ID is used for any gossip associated with a non-creature.
    },
    [62202] = {
        {
            ID = 35586,
            CanConfirm = false,
            Conditions = {
                "NONE = NONE",
            }
        }
    },
}