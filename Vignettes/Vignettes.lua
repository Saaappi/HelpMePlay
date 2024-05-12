local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

local processed = {}
addon.ProcessVignette = function(vignetteGUID)
    -- If any of these are true, then return.
    if processed[vignetteGUID] then return end
    if UnitOnTaxi("player") then return end
    if not addon.mapID then return end

    local vignetteInfo = C_VignetteInfo.GetVignetteInfo(vignetteGUID)
    local vignettePosition = C_VignetteInfo.GetVignettePosition(vignetteGUID, addon.mapID)
    local currentTime = date("%X")
    if vignetteInfo and addon.mapID then
        processed[vignetteGUID] = true
        if vignetteInfo.type == 0 and not vignetteInfo.onMinimap then return end
        local name, atlasName, vignetteID = vignetteInfo.name, vignetteInfo.atlasName, vignetteInfo.vignetteID
        local msg = CreateAtlasMarkup(atlasName, 16, 16) .. " |cff06BEC6" .. name .. "|r spotted! [" .. currentTime .. "]"
        if msg and atlasName == "VignetteKill" then
            PlaySound(3175, "Master")
            if vignettePosition then
                local x, y = vignettePosition:GetXY()
                if C_AddOns.IsAddOnLoaded("TomTom") then
                    local waypoint = {
                        from = addonName,
                        title = name,
                        minimap = true,
                        world = true,
                        silent = true,
                        persistent = false
                    }
                    TomTom:AddWaypoint(addon.mapID, x, y, waypoint)
                end
                HelpMePlay.Print(msg)
            end
        end
    end
end

eventHandler:RegisterEvent("NAME_PLATE_UNIT_ADDED")
eventHandler:RegisterEvent("VIGNETTE_MINIMAP_UPDATED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "NAME_PLATE_UNIT_ADDED" then
        if HelpMePlayDB["RareScan"] == false then return end

        -- Get the unit's classification; if it's rare or rare elite, then
        -- inform the player.
        local unitClassification = UnitClassification(...)
        if unitClassification == "rare" or unitClassification == "rareelite" then
            local GUID = UnitGUID(...)
            if GUID and (not processed[GUID]) then
                processed[GUID] = true
                local name = UnitName(...)
                SetRaidTarget(..., 7)
                PlaySound(3175, "Master")
                HelpMePlay.Print(format("|cff06BEC6%s|r spotted!", name))
            end
        end
    elseif event == "VIGNETTE_MINIMAP_UPDATED" then
        if HelpMePlayDB["RareScan"] == false then return end

        local vignetteGUID = ...
        if vignetteGUID then
            addon.ProcessVignette(vignetteGUID)
        end
    end
end)