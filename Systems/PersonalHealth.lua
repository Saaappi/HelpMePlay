local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function WaterReminder()
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.WaterReminderEnabled == false or HelpMePlayDB.WaterReminderEnabled == nil then return false end
		
	local interval = (math.random(HelpMePlayDB.WaterReminderMinDelay, HelpMePlayDB.WaterReminderMaxDelay))*60
	C_Timer.After(interval, function()
		UIErrorsFrame:SetTimeVisible(5)
		UIErrorsFrame:AddMessage("|cffFFD100" .. L_GLOBALSTRINGS["Text.Output.WaterReminder"] .. "|r", 1, 0, 0, nil)
		PlaySound(110896, "Master", true, true) -- SPELL_8.0_Stormsong_FoulTidewater_PickUp
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