local _, HelpMePlay = ...
local LHMP = LibStub("LibHelpMePlay")

HelpMePlay.Tooltips = {
    ["MicroMenuButton"] = LHMP:ColorText("GOLD", "Click to open the settings.\n\n" ..
    "Shift-Click to open the Talent Importer utility.\n\n" ..
    "Ctrl-Click to reset the current character's configuration."),
    ["PetBattleBandageButton"] = LHMP:ColorText("GOLD", "Use left-click to heal your battle pets if they're injured. The " .. LHMP:ColorText("COMMON", "Revive Battle Pets") .. " ability is used before bandages.\n\n" ..
    "Use right-click to equip your " .. LHMP:ColorText("RARE", "[Safari Hat]") .. ".\n\n" ..
    "Click and hold to drag."),
    ["FeatureIsWorkInProgress"] = LHMP:ColorText("RED", "This feature is a work in progress."),
    ["LEARN_RANDOM_TALENT"] = LHMP:ColorText("COMMON", "Click to learn a random talent for your specialization."),
    ["LEARNED_TALENT"] = "Learned: %s",
    ["SPECIALIZATION_UNSUPPORTED"] = LHMP:ColorText("POOR", "Your current specialization is unsupported."),
    ["LEARN_GENERIC_TALENTS"] = LHMP:ColorText("COMMON", "Click to learn %s talents.")
}