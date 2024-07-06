local addonName, HelpMePlay = ...
local LHMP = LibStub("LibHelpMePlay")

HelpMePlay.Print = function(text)
    local str = format("%s: %s", LHMP:ColorText("LEGENDARY", addonName), text)
    print(str)
end