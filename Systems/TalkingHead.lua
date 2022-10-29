local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

hooksecurefunc(TalkingHeadFrame, "PlayCurrent", function(self)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.TalkingHeadEnabled == false or HelpMePlayDB.TalkingHeadEnabled == nil then return end

	self:CloseImmediately()
end)