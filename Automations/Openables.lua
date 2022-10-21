local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("ITEM_PUSH")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "ITEM_PUSH" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.OpenablesEnabled == false or HelpMePlayDB.OpenablesEnabled == nil then return false end
		local _, fileIconId = ...
	end
end)