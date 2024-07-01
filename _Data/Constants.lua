local addonName, addon = ...

addon.Constants = {
    ["AUTHOR_BATTLETAG"] = "Lightsky#11682",
    ["PLAYER_MAX_LEVEL"] = GetMaxLevelForPlayerExpansion(),
    ["TIMER_DELAY"] = 0.1,
}

addon.ErrorMessages = {
    ["COMMAND_NOT_FOUND"] = "Your entry is an unknown command.",
    ["IN_COMBAT_LOCKDOWN"] = "This action is not permitted while in combat.",
    ["MOUNT_TYPE_UNKNOWN"] = "{%d} Mount type is unknown. Please screenshot this message and report it on Github.",
    ["HAS_NOT_RECATEGORIZED_MOUNTS"] = "The Mount automation has received a substantial rework. You must use the Categorize Mounts button before this feature will work."
}

-- It's not possible to do forward references in Lua during table creation.
-- So... let's create the Chromie Time max level entry after creation.
addon.Constants["CHROMIE_TIME_MAX_LEVEL"] = addon.Constants["PLAYER_MAX_LEVEL"] - 10