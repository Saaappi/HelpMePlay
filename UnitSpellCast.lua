--[[local _, HelpMePlay = ...

local LHMP = LibStub("LibHelpMePlay")
if not LHMP then
    return false
end
local eventFrame = CreateFrame("Frame")

local targetSpellId = 189052

local function OnEvent(_, event, ...)
    if event == "PLAYER_REGEN_DISABLED" then
        HelpMePlay.Print("Entered combat: " .. date("%H:%M:%S"))
    elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
        local unit, castString = ...
        if string.find(unit, "nameplate") then
            local spellId = LHMP:SplitString(castString, "-", 6)
            if spellId == targetSpellId then
                HelpMePlay.Print("Spell cast: " .. date("%H:%M:%S"))
            end
        end
    end
end

eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
eventFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
eventFrame:SetScript("OnEvent", OnEvent)]]