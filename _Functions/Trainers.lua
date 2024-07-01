local _, addon = ...

addon.BuyTrainerService = function()
    local numServices = GetNumTrainerServices()
    for index = 1, numServices do
        -- The player's money must be greater than the protection value for
        -- the automation to work.
        if GetMoney() > HelpMePlayDB["TrainerProtectionValue"] and HelpMePlayDB["TrainerProtectionValue"] ~= 0 then
            SelectTrainerService(index)
            BuyTrainerService(index)
        end
    end
end