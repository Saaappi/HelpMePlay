local addonName, addon = ...
local e = CreateFrame("Frame")

e:RegisterEvent("READY_CHECK")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "READY_CHECK" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.ReadyChecksEnabled == false or HelpMePlayDB.ReadyChecksEnabled == nil then return false end
		
		if HelpMePlayDB.ReadyChecksEnabled then
			ConfirmReadyCheck(1)
		end
	end
end)