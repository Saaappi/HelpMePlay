local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local DressUpModelFrame
local HelpMePlayAlertSystem

addon.CreateFauxPopup = function(frame, name, vignetteOrCreatureGUID, label)
    -- If the DressUpModelFrame doesn't exist, then let's create it.
    -- We'll use the frame to get a creature's display ID from their
    -- NPC ID.
    if not DressUpModelFrame then
        DressUpModelFrame = CreateFrame("DressUpModel", nil, UIParent)
        DressUpModelFrame:SetPoint("TOPRIGHT", 0, 0)
        DressUpModelFrame:SetSize(1, 1)
        DressUpModelFrame:Hide()
    end

    -- Get the creature ID from the provided GUID.
    local vignetteInfo
    local creatureID = 0
    local type = ""
    if vignetteOrCreatureGUID then
        type = addon.SplitString(vignetteOrCreatureGUID, "-", 1)
        if type == "Creature" then
            creatureID = addon.SplitString(vignetteOrCreatureGUID, "-", 6)
        elseif type == "Vignette" then
            vignetteInfo = C_VignetteInfo.GetVignetteInfo(vignetteOrCreatureGUID)
            if vignetteInfo then
                creatureID = addon.SplitString(vignetteInfo.objectGUID, "-", 6)
            end
        end
    end

    -- Set the popup's quality and label.
    local quality = Enum.ItemQuality.Epic

    -- Set the model of the frame using the creature's NPC ID.
    --
    -- Get the display info for that creature ID.
    DressUpModelFrame:SetCreature(creatureID)
    local displayID = DressUpModelFrame:GetDisplayInfo()
    if displayID and displayID ~= 0 then
        frame:SetUpDisplay(frame.Icon, quality, name, label, "CosmeticIconFrame")
        SetPortraitTextureFromCreatureDisplayID(frame.Icon, displayID)
    else
        frame:SetUpDisplay(237272, quality, name, label, "CosmeticIconFrame")
    end

    frame.timers = {}
	local effectID1 = 135;
	local effectID2 = 136;

	-- stagger effect timings
	frame.LeftModelScene:AddEffect(effectID1, frame.LeftModelScene);
	table.insert(frame.timers, C_Timer.NewTimer(0.25, function() frame.LeftModelScene:AddEffect(effectID2, frame.LeftModelScene); end));
	table.insert(frame.timers, C_Timer.NewTimer(0.5, function() frame.LeftModelScene:AddEffect(effectID1, frame.LeftModelScene); end));

	table.insert(frame.timers, C_Timer.NewTimer(0.3, function() frame.RightModelScene:AddEffect(effectID1, frame.RightModelScene); end));
	table.insert(frame.timers, C_Timer.NewTimer(0.55, function() frame.RightModelScene:AddEffect(effectID2, frame.RightModelScene); end));
	table.insert(frame.timers, C_Timer.NewTimer(0.8, function() frame.RightModelScene:AddEffect(effectID1, frame.RightModelScene); end));

    -- Set the frame's onclick function. Clicking the popup
    -- will plot a waypoint (if it's a vignette) and try to
    -- target the rare.
    frame:SetScript("OnClick", function()
        if type == "Vignette" then
            local vignettePosition = C_VignetteInfo.GetVignettePosition(vignetteOrCreatureGUID, addon.mapID)
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
        end
        local btn = CreateFrame("Button", nil, frame, "SecureActionButtonTemplate")
        btn:SetPoint("CENTER", 0, 0)
        btn:SetSize(frame:GetWidth(), frame:GetHeight())
        btn:SetAlpha(0)
        btn:EnableMouse(true)
        btn:SetMouseClickEnabled(true)
        btn:SetAttribute("type", "macro")
        btn:SetAttribute("macrotext1", format("/cleartarget\n/targetexact %s", name))
        btn:RegisterForClicks("AnyUp", "AnyDown")
    end)

    -- Play a sound.
	PlaySound(SOUNDKIT.MAP_PING, "Master")
end

local processed = {}
addon.ProcessVignette = function(vignetteGUID)
    -- If any of these are true, then return.
    if processed[vignetteGUID] then return end
    if UnitOnTaxi("player") then return end
    if not addon.mapID then return end

    local vignetteInfo = C_VignetteInfo.GetVignetteInfo(vignetteGUID)
    local currentTime = date("%X")
    if vignetteInfo and addon.mapID then
        processed[vignetteGUID] = true
        if vignetteInfo.type == 0 and not vignetteInfo.onMinimap then return end
        local name, atlasName, vignetteID = vignetteInfo.name, vignetteInfo.atlasName, vignetteInfo.vignetteID
        local msg = CreateAtlasMarkup(atlasName, 16, 16) .. " |cff06BEC6" .. name .. "|r spotted! [" .. currentTime .. "]"
        if msg and atlasName == "VignetteKill" then
            HelpMePlayAlertSystem = AlertFrame:AddQueuedAlertFrameSubSystem("NewCosmeticAlertFrameTemplate", addon.CreateFauxPopup)
            HelpMePlayAlertSystem:AddAlert(name, vignetteGUID, CreateAtlasMarkup("VignetteKill") .. " Rare Detected")
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
                SetRaidTarget(..., 7)
                HelpMePlayAlertSystem = AlertFrame:AddQueuedAlertFrameSubSystem("NewCosmeticAlertFrameTemplate", addon.CreateFauxPopup)
                HelpMePlayAlertSystem:AddAlert(UnitName(...), GUID, CreateAtlasMarkup("VignetteKill") .. " Rare Detected")
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