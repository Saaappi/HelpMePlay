local addonName, addon = ...

addon.Constants = {
    ["AUTHOR_BATTLETAG"] = "Lightsky#11682",
    ["PLAYER_MAX_LEVEL"] = GetMaxLevelForPlayerExpansion(),
    ["TIMER_DELAY"] = 0.1,
}

addon.ErrorMessages = {
    ["MOUNT_TYPE_UNKNOWN"] = "{%d} Mount type is unknown. Please screenshot this message and report it on Github."
}

-- It's not possible to do forward references in Lua during table creation.
-- So... let's create the Chromie Time max level entry after creation.
addon.Constants["CHROMIE_TIME_MAX_LEVEL"] = addon.Constants["PLAYER_MAX_LEVEL"] - 10