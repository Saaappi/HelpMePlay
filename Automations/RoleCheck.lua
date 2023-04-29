local addonName, addonTable = ...
local e = CreateFrame("Frame")
local normalTexture = e:CreateTexture()
local highlightTexture = e:CreateTexture()

e:RegisterEvent("LFG_ROLE_CHECK_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "LFG_ROLE_CHECK_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QueuesEnabled then
			LFDRoleCheckPopupAcceptButton:Click()
		end
	end
end)