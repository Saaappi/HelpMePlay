local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:RegisterEvent("TRAINER_UPDATE")
eventHandler:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
		local type = ...
		if type == 7 then
	        C_Timer.After(addon.Constants["TIMER_DELAY"], function()
	            HelpMePlay.Learn()
	        end)
		end
    elseif event == "TRAINER_UPDATE" then
        C_Timer.After(addon.Constants["TIMER_DELAY"], function()
            HelpMePlay.Learn()
        end)
	end
end)