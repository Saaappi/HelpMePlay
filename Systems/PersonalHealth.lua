local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function WaterReminder()
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.WaterReminderEnabled == false or HelpMePlayDB.WaterReminderEnabled == nil then return false end
		
	local interval = (math.random(10, 20))*60
	C_Timer.After(interval, function()
		print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.WaterReminder"])
		PlaySound(182170) -- PutDownWoodLarge
		WaterReminder()
	end)
end

e:RegisterEvent("PLAYER_ENTERING_WORLD")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.WaterReminderEnabled == false or HelpMePlayDB.WaterReminderEnabled == nil then return false end
		
		WaterReminder()
	end
end)