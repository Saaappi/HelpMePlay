local addonName, addon = ...
local events = CreateFrame("Frame")

events:RegisterEvent("LFG_ROLE_CHECK_SHOW")
events:SetScript("OnEvent", function(self, event, ...)
	if ( event == "LFG_ROLE_CHECK_SHOW" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end

		if ( HelpMePlayDB.QueuesEnabled ) then
			LFDRoleCheckPopupAcceptButton:Click()
		end
	end
end)