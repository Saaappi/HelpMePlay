local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, addonLoaded)
    if event == "ADDON_LOADED" then
        if addonLoaded == addonName then
            function HelpMePlay.Learn()
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
        end

        -- Unload the event for performance.
        eventHandler:UnregisterEvent("ADDON_LOADED")
    end
end)