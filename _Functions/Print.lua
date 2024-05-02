local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, addonLoaded)
    if event == "ADDON_LOADED" then
        if addonLoaded == addonName then
            function HelpMePlay.Print(text)
                local str = string.format("|cffFF7C0A%s:|r %s", addonName, text)
                print(str)
            end
        end

        -- Unload the event for performance.
        eventHandler:UnregisterEvent("ADDON_LOADED")
    end
end)