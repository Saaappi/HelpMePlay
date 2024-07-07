local _, HelpMePlay = ...
local eventFrame = CreateFrame("Frame")

local function OnEvent(_, event, arg1)
    if event == "PARTY_INVITE_REQUEST" then
        if HelpMePlayDB["AcceptPartyInvites"] == nil or HelpMePlayDB["AcceptPartyInvites"] == false then return end

        AcceptGroup()
    end
end

eventFrame:RegisterEvent("PARTY_INVITE_REQUEST")
eventFrame:SetScript("OnEvent", OnEvent)