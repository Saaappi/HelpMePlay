local addonName, addon = ...
local events = CreateFrame("Frame")

events:RegisterEvent("READY_CHECK")
events:SetScript("OnEvent", function(self, event, ...)
	if ( event == "READY_CHECK" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.ReadyChecksEnabled == false or HelpMePlayDB.ReadyChecksEnabled == nil then return false end
		
		if ( HelpMePlayDB.ReadyChecksEnabled ) then
			ConfirmReadyCheck(1)
		end
	end
end)