local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local button

local function ResetAllMounts()
    -- Wipe out the mount tables.
    for _, mounts in ipairs(HelpMePlayDB["Mounts"]) do
        mounts = {}
    end

    -- Categorize the mounts.
    local mounts = C_MountJournal.GetMountIDs()
    for _, mountID in ipairs(mounts) do
        addon.CategorizeMountByID(mountID)
    end

    -- Refresh the mounts.
    for mountType in ipairs(HelpMePlayDB["Mounts"]) do
        addon.RefreshMountsByType(mountType)
    end
end

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
            tooltipText = format("Categorize all of your known mounts. Mounts will be summoned based on your current location, player level, and other character attributes.\n\n" ..
            "Current Keybind: %s", GetBindingKey("HELPMEPLAY_MOUNTUP") or "Not Set"),
            useFontString = true,
            fontStringText = "Categorize Mounts",
            onClick = function()
                if not InCombatLockdown() and not IsPlayerMoving() then
                    -- Reset the mount tables.
                    --[[HelpMePlayDB["Mounts"]["Ground"] = {}
                    HelpMePlayDB["Mounts"]["Aquatic"] = {}
                    HelpMePlayDB["Mounts"]["Flying"] = {}
                    HelpMePlayDB["Mounts"]["Dynamic"] = {}
                    HelpMePlayDB["Mounts"]["AQ"] = {}
                    HelpMePlayDB["Mounts"]["Vashjir"] = {}
                    HelpMePlayDB["Mounts"]["Unused"] = {}]]

                    ResetAllMounts()
                end
            end,
        }
        setmetatable(button, { __index = HelpMePlay.Button })
        button = button:IconButtonWithBorder()
    end
end)