local _, HelpMePlay = ...

local LHMP = LibStub("LibHelpMePlay")
if not LHMP then
    return false
end
local eventFrame = CreateFrame("Frame")

local targetSpellId = 194140

local function OnEvent(_, event, ...)
    if event == "PLAYER_REGEN_DISABLED" then
        HelpMePlay.Print("Entered combat: " .. (GetTime()*1000))
    elseif event == "UNIT_SPELLCAST_START" then
        local unit, _, spellId = ...
        if string.find(unit, "nameplate") then
            --local spellId = LHMP:SplitString(castGUID, "-", 6)
            if spellId == targetSpellId then
                HelpMePlay.Print("Spell cast: " .. (GetTime()*1000))
            end
        end
    end
end

eventFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
eventFrame:RegisterEvent("UNIT_SPELLCAST_START")
eventFrame:SetScript("OnEvent", OnEvent)