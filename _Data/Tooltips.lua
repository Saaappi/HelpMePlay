local _, HelpMePlay = ...
local LHMP = LibStub("LibHelpMePlay")

HelpMePlay.Tooltips = {
    ["MicroMenuButton"] = LHMP:ColorText("GOLD", "Click to open the settings.\n\n" ..
    "Shift-Click to open the Talent Importer utility.\n\n" ..
    "Ctrl-Click to reset the current character's configuration."),
    ["PetBattleBandageButton"] = LHMP:ColorText("GOLD", "Click to heal your battle pets if they're injured.\n\n" ..
    "Click and hold to drag."),
}