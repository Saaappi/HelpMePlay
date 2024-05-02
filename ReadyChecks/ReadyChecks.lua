local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("READY_CHECK")
eventHandler:SetScript("OnEvent", function(self, event, ...)
	if event == "READY_CHECK" then
		if HelpMePlayDB["AcceptReadyChecks"] == false then return false end
		
		ConfirmReadyCheck(1)
	end
end)