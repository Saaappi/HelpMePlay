local addonName, addon = ...

addon.QUEST_MOBS_ICON_TYPES = {
    [1] = "Quest",
    [2] = "Treasure Goblin",
    [3] = "Custom",
    [0] = NONE,
}

-- The values displayed here are the parent anchors (the nameplate).
addon.QUEST_MOBS_POSITION_TYPES = {
    [1] = "LEFT",
    [2] = "TOPLEFT",
    [3] = "TOP",
    [4] = "TOPRIGHT",
    [5] = "RIGHT",
    [6] = "BOTTOMRIGHT",
    [7] = "BOTTOM",
    [8] = "BOTTOMLEFT",
}

addon.anchorMapping = {
    LEFT = "RIGHT",
    TOPLEFT = "BOTTOMRIGHT",
    TOP = "BOTTOM",
    TOPRIGHT = "BOTTOMLEFT",
    RIGHT = "LEFT",
    BOTTOMRIGHT = "TOPLEFT",
    BOTTOM = "TOP",
    BOTTOMLEFT = "TOPRIGHT",
}