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
        button = addon.CreateWidget("IconButton", {
            name = format("%sCategorizeMountsButton", addonName),
            width = 32,
            height = 32,
            parent = MountJournalSummonRandomFavoriteButton,
            texture = 2143075,
            useFontString = true,
            fontStringText = "Categorize Mounts"
        })

        button:ClearAllPoints()
        button:SetPoint("TOPRIGHT", MountJournalSummonRandomFavoriteButton, "TOPLEFT", -125, 0)

        button:SetScript("OnClick", function()
            if not InCombatLockdown() and not IsPlayerMoving() then
                -- TODO: Remove this before official launch.
                if not HelpMePlayDB["HasRecategorizedMounts"] then
                    HelpMePlayDB["HasRecategorizedMounts"] = true
                end

                ResetAllMounts()
            end
        end)
        button:SetScript("OnEnter", function(self)
            addon.Tooltip_OnEnter(self, "Categorize Mounts", format("Categorize all of your known mounts. Mounts will be summoned based on your current location, player level, and other character attributes.\n\n" ..
            "Current Keybind: %s", GetBindingKey("HELPMEPLAY_MOUNTUP") or "Not Set"))
        end)
        button:SetScript("OnLeave", addon.Tooltip_OnLeave)
    end
end)