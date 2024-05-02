local addonName, addon = ...

addon.Constants = {
    ["CHROMIE_TIME_MAX_LEVEL"] = 60,
    ["PLAYER_MAX_LEVEL"] = 70,
    ["TIMER_DELAY"] = 0.1,
}

addon.CHROMIE_TIME_IDS = {
    [16] = "Dragonflight",
    [15] = EXPANSION_NAME7,
    [14] = EXPANSION_NAME8,
    [10] = EXPANSION_NAME6,
    [9] = EXPANSION_NAME5,
    [8] = EXPANSION_NAME4,
    [7] = EXPANSION_NAME2,
    [6] = EXPANSION_NAME1,
    [5] = EXPANSION_NAME3,
    [0] = NONE,
}

addon.QUEST_REWARDS_TYPES = {
    [2] = "Sell Price",
    [1] = "Item Level",
    [0] = NONE,
}