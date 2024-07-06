local _, HelpMePlay = ...
local LHMP = LibStub("LibHelpMePlay")

HelpMePlay.Constants = {
    ["AUTHOR_BATTLETAG"] = "Lightsky#11682",
    ["PLAYER_MAX_LEVEL"] = GetMaxLevelForPlayerExpansion(),
    ["TIMER_DELAY"] = 0.1,
}

HelpMePlay.ErrorMessages = {
    ["COMMAND_NOT_FOUND"] = "Your entry is an unknown command.",
    ["INVALID_INPUT"] = "Your input was invalid.",
    ["IN_COMBAT_LOCKDOWN"] = "This action is not permitted while in combat.",
    ["MOUNT_TYPE_UNKNOWN"] = "{%d} Mount type is unknown. Please screenshot this message and report it on Github.",
    ["HAS_NOT_RECATEGORIZED_MOUNTS"] = "The Mount automation has received a substantial rework. You must use the Categorize Mounts button before this feature will work.",
    ["UNHANDLED_SETTING"] = "Unhandled setting change: %s",
    ["MESSAGE_REGISTRATION_FAILED"] = "The addon was unable to register with the server. Please reload.",
    ["GROUP_JOINED_PARTY_PLAY_ENABLED"] = format("[%s] You've joined a group with Party Play enabled.", LHMP:ColorText("RED", "WARNING")),
}

-- It's not possible to do forward references in Lua during table creation.
-- So... let's create the Chromie Time max level entry after creation.
HelpMePlay.Constants["CHROMIE_TIME_MAX_LEVEL"] = HelpMePlay.Constants["PLAYER_MAX_LEVEL"] - 10