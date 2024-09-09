local addonName, HelpMePlay = ...
local LHMP = LibStub("LibHelpMePlay")

HelpMePlay.Constants = {
    ["AUTHOR_BATTLETAG"] = "Lightsky#11682",
    ["PLAYER_MAX_LEVEL"] = GetMaxLevelForPlayerExpansion(),
    ["TIMER_DELAY"] = 0.1,
}

HelpMePlay.ErrorMessages = {
    ["COMMAND_NOT_FOUND"] = "Your entry is an unknown command.",
    ["INVALID_INPUT"] = "Your input was invalid.",
    ["IN_COMBAT_LOCKDOWN"] = LHMP:ColorText("RED", "This action is not permitted while in combat."),
    ["MOUNT_TYPE_UNKNOWN"] = "{%d} Mount type is unknown. Please screenshot this message and report it on Github.",
    ["MESSAGE_REGISTRATION_FAILED"] = "The addon was unable to register with the server. Please reload.",
    ["GROUP_JOINED_PARTY_PLAY_ENABLED"] = string.format("[%s] You've joined a group with Party Play enabled.", LHMP:ColorText("RED", "WARNING")),
    ["ADDON_VERSION_OUTDATED"] = string.format("This version of %s is outdated.", addonName),
    ["IMPORT_STRING_CORRUPTED"] = "Import string is corrupted. Node type mismatch at %d. First option will be selected. [%d]"
}

-- It's not possible to do forward references in Lua during table creation.
-- So... let's create the Chromie Time max level entry after creation.
HelpMePlay.Constants["CHROMIE_TIME_MAX_LEVEL"] = HelpMePlay.Constants["PLAYER_MAX_LEVEL"] - 10