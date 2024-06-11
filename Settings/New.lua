local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            addon.New = function(elementName, ...)
                if elementName == "BasicButton" then
                    local name, buttonText, clickHandler, tooltipText, addSearchTags = ...

                    local initializer = CreateSettingsButtonInitializer(name, buttonText, clickHandler, tooltipText, addSearchTags)
                    addon.layout:AddInitializer(initializer)
                end
            end

            -- Unregister the event for performance.
            eventHandler:UnregisterEvent("ADDON_LOADED")
        end
    end
end)