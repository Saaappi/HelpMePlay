local LHMP = LibStub("LibHelpMePlay")
if not LHMP then return end

LHMP.QuestMerchants = {
    [54982] = {
        {
            Index = 1,
            Quantity = 3,
            Conditions = {
                "QUEST_OBJECTIVES_INCOMPLETE = 29627,3",
            }
        }
    },
    [54981] = {
        {
            Index = 1,
            Quantity = 1,
            Conditions = {
                "QUEST_OBJECTIVES_INCOMPLETE = 29627,2",
            }
        }
    }
}