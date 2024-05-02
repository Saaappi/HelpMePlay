local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("LFG_ROLE_CHECK_SHOW")
eventHandler:SetScript("OnEvent", function(self, event, ...)
	if event == "LFG_ROLE_CHECK_SHOW" then
        if HelpMePlayDB["AcceptRoleChecks"] == false then return end

		LFDRoleCheckPopupAcceptButton:Click()
	end
end)