local _, HelpMePlay = ...
local LHMP = LibStub("LibHelpMePlay")

HelpMePlay.Tooltips = {
    ["MicroMenuButton"] = LHMP:ColorText("GOLD", "Click to open the settings.\n\n" ..
    "Shift-Click to open the Talent Importer utility.\n\n" ..
    "Ctrl-Click to reset the current character's configuration."),
    ["PetBattleBandageButton"] = LHMP:ColorText("GOLD", "Left-Click to heal your battle pets if they're injured. The addon will prioritize the Revive Battle Pets ability over bandages.\n\n" ..
    "Right-Click to equip your Safari Hat.\n\n" ..
    "Click and hold to drag."),
}