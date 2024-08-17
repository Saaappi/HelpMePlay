local _, _ = ...
local eventHandler = CreateFrame("Frame")

local function BuyService()
	local numServices = GetNumTrainerServices()
    for index = 1, numServices do
        -- The player's money must be greater than the protection value for
        -- the automation to work.
        if GetMoney() > (HelpMePlayDB["TrainerProtectionValue"] * 10000) and HelpMePlayDB["TrainerProtectionValue"] ~= 0 then
            SelectTrainerService(index)
            BuyTrainerService(index)
        end
    end
end

eventHandler:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
eventHandler:RegisterEvent("TRAINER_UPDATE")
eventHandler:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
		local type = ...
		if type == 7 then
			BuyService()
		end
    elseif event == "TRAINER_UPDATE" then
        C_Timer.After(0.1, function()
            BuyService()
        end)
	end
end)