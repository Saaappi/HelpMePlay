local LHMP = LibStub("LibHelpMePlay")
if not LHMP then return end

LHMP.QuestMerchants={
    [54982] = {
        {
            Index = 1,
            Quantity = 3,
            Conditions = {
                "QUEST_ACTIVE = 29627",
            }
        }
    }
}