local _, HelpMePlay = ...
local LHMP = LibStub("LibHelpMePlay")

HelpMePlay.Tooltips = {
    ["MicroMenuButton"] = LHMP:ColorText("GOLD", "Click to open the settings.\n\n" ..
    "Shift-Click to open the Talent Importer utility.\n\n" ..
    "Ctrl-Click to reset the current character's configuration."),
    ["PetBattleBandageButton"] = LHMP:ColorText("GOLD", "Use left-click to heal your battle pets if they're injured. The " .. LHMP:ColorText("COMMON", "Revive Battle Pets") .. " ability is used before bandages.\n\n" ..
    "Use right-click to equip your " .. LHMP:ColorText("RARE", "[Safari Hat]") .. ".\n\n" ..
    "Click and hold to drag."),
}