local addonName, addonTable = ...
local L = addonTable.L

LFGDungeonReadyDialogEnterDungeonButton:SetScript("OnShow", function()
	if HelpMePlayOptionsDB.Queues then
		LFGDungeonReadyDialogEnterDungeonButton:Click()
		print(L["Colored Addon Name"] .. ": " .. L["Auto Accept Queue Text"])
	end
end)