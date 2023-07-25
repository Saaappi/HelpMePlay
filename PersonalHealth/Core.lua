local addonName, addon = ...
local events = CreateFrame("Frame")

local function WaterReminder()
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.WaterReminderEnabled == false or HelpMePlayDB.WaterReminderEnabled == nil then return false end
		
	local interval = (math.random(HelpMePlayDB.WaterReminderMinDelay, HelpMePlayDB.WaterReminderMaxDelay)) * 60
	C_Timer.After(interval, function()
		UIErrorsFrame:SetTimeVisible(5)
		UIErrorsFrame:AddMessage("|cffFFD100" .. "|T463570:0|t Hey, listen! You should take a sip of water! |T463570:0|t" .. "|r", 1, 0, 0, nil)
		PlaySound(110896, "Master", true, true) -- SPELL_8.0_Stormsong_FoulTidewater_PickUp
		WaterReminder()
	end)
end

events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:SetScript("OnEvent", function(self, event, ...)
	if ( event == "PLAYER_ENTERING_WORLD" ) then
	    events:UnregisterEvent("PLAYER_ENTERING_WORLD")

		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.WaterReminderEnabled == false or HelpMePlayDB.WaterReminderEnabled == nil then return false end
		
		WaterReminder()
	end
end)