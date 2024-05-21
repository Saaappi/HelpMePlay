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

EventRegistry:RegisterCallback("MountJournal.OnShow", function()
    local button = {
        name = addonName .. "CategorizeMountsButton",
        anchor = "TOPRIGHT",
        relativeAnchor = "TOPLEFT",
        oX = -125,
        oY = 0,
        parent = MountJournalSummonRandomFavoriteButton,
        texture = 2143075,
        --tooltipHeader = "Categorize Mounts",
        --tooltipText = "Automatically categorize all of your known mounts.\nMounts will be summoned based on your current location.",
        --width = 32,
        -- = 32,
        onClick = function()
            if not UnitAffectingCombat("player") then
                print("HELLO WORLD!")
            end
        end,
    }
    setmetatable(button, { __index = HelpMePlay.Button })
    button = button:IconButtonWithBorder()
end)