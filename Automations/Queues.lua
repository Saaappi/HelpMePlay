local addonName, addonTable = ...
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

--[[
	Description:
		If Queues automation is enabled, then automatically
		accept LFG queues.
]]--
LFGDungeonReadyDialogEnterDungeonButton:SetScript("OnShow", function()
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayOptionsDB.Queues then
		LFGDungeonReadyDialogEnterDungeonButton:Click()
	end
end)