local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("MAIL_SHOW")
e:RegisterEvent("MAIL_INBOX_UPDATE")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "MAIL_SHOW" then
		CheckInbox()
	end
	
	if event == "MAIL_INBOX_UPDATE" then
		if HelpMePlayOptionsDB.Mail == false or HelpMePlayOptionsDB.Mail == nil then return end
		local numMailItems = GetInboxNumItems()
		for index = numMailItems, 1, -1 do
			TakeInboxMoney(index)
		end
	end
end)