local _, HelpMePlay = ...
local eventFrame = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")

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
            local randNumMinutes = GetRandomNumMinutes(20, 30)
            DEFAULT_CHAT_FRAME:AddMessage(format("\n%s %s %s", CreateAtlasMarkup("ElementalStorm-Lesser-Water"), LHMP:ColorText("HEIRLOOM", "HEY, YOU! DRINK SOME WATER!"), CreateAtlasMarkup("ElementalStorm-Lesser-Water")))
            C_Timer.After(randNumMinutes, SendReminder)
        end
    end
end

local function OnEvent(_, event, ...)
    if event == "PLAYER_LOGIN" then
        eventFrame:UnregisterEvent(event)

        if HelpMePlayDB["UseWaterReminder"] then
            SendReminder()
        end
    end
end

eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:SetScript("OnEvent", OnEvent)

HelpMePlay.SendReminderProxy = SendReminder