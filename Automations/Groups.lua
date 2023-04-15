local addonName, addonTable = ...
local e = CreateFrame("Frame")

e:RegisterEvent("PARTY_INVITE_REQUEST")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PARTY_INVITE_REQUEST" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.GroupsEnabled == false or HelpMePlayDB.GroupsEnabled == nil then return false end
		
		StaticPopup1Button1:Click("LeftButton")
	end
end)