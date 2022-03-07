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
		--[[for i=GetInboxNumItems(), 1, -1 do
			TakeInboxMoney(i)
		end]]
		for i=GetInboxNumItems(), 1, -1 do
			TakeInboxMoney(i)
			for j=1,16 do
				TakeInboxItem(i, j)
			end
		end
	end
end)