local _, HelpMePlay = ...
local eventFrame = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")

local function GetRandomMessage()
    local size = LHMP:GetTableSize(HelpMePlay.Strings.WaterReminder)
    local randomIndex = math.random(1, size)
    return HelpMePlay.Strings.WaterReminder[randomIndex]
end

local function GetRandomNumMinutes(m, n)
    return math.random(m * 60, n * 60)
end

local function IsInCombat()
    return InCombatLockdown()
end

local function SendReminder()
    if IsInCombat() then
        C_Timer.After(10, SendReminder)
    else
        if HelpMePlayDB["WaterReminderSoundId"] ~= 0 then
            PlaySound(HelpMePlayDB["WaterReminderSoundId"], "Master", false, false)
        end
        if HelpMePlayDB["UseWaterReminder"] then
            local randNumMinutes = GetRandomNumMinutes(15, 25)
            DEFAULT_CHAT_FRAME:AddMessage(string.format("\n%s %s", LHMP:ColorText("HEIRLOOM", GetRandomMessage()), LHMP:ColorText("ARTIFACT", string.format("[The next reminder will be sent in %d minutes.]", math.floor(randNumMinutes / 60)))))
            C_Timer.After(randNumMinutes, SendReminder)
        end
    end
end

local function OnEvent(_, event, ...)
    if event == "PLAYER_LOGIN" then
        eventFrame:UnregisterEvent(event)

        if HelpMePlayDB["UseWaterReminder"] then
            C_Timer.After(15, SendReminder)
        end
    end
end

eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", OnEvent)

HelpMePlay.SendReminderProxy = SendReminder