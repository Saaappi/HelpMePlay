local _, HelpMePlay = ...
local eventFrame = CreateFrame("Frame")

local function OnEvent(_, event, arg1)
    if event == "PARTY_INVITE_REQUEST" then
        if HelpMePlayDB["AcceptPartyInvites"] == nil or HelpMePlayDB["AcceptPartyInvites"] == false then return end

        if not UnitInAnyGroup("player") then
            AcceptGroup()
            StaticPopup1Button1:Click()
        end
    end
end

eventFrame:RegisterEvent("PARTY_INVITE_REQUEST")
eventFrame:SetScript("OnEvent", OnEvent)