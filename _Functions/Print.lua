local addonName, addon = ...
local LHMP = LibStub("LibHelpMePlay")

addon.Print = function(text)
    local str = format("%s: %s", LHMP:ColorText("LEGENDARY", addonName), text)
    print(str)
end