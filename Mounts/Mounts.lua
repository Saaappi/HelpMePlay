local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("NEW_MOUNT_ADDED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "NEW_MOUNT_ADDED" then
        local mountID = ...
        if mountID then
            addon.CategorizeMountByID(mountID)
        end
    end
end)