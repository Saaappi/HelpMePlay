local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local button

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
    if not button then
        button = {
            name = addonName .. "CategorizeMountsButton",
            anchor = "TOPRIGHT",
            relativeAnchor = "TOPLEFT",
            oX = -125,
            oY = 0,
            parent = MountJournalSummonRandomFavoriteButton,
            texture = 2143075,
            tooltipHeader = "Categorize Mounts",
            tooltipText = "Automatically categorize all of your known mounts. Mounts will be summoned based on your current location.",
            useFontString = true,
            fontStringText = "Categorize Mounts",
            onClick = function()
                if not UnitAffectingCombat("player") then
                    local mounts = C_MountJournal.GetMountIDs()
                    for _, mountID in ipairs(mounts) do
                        addon.CategorizeMountByID(mountID)
                    end
                end
            end,
        }
        setmetatable(button, { __index = HelpMePlay.Button })
        button = button:IconButtonWithBorder()
    end
end)