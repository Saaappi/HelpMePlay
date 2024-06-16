local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local DressUpModelFrame
local HelpMePlayAlertSystem
local processedRares = {}
local processedVignettes = {}

local function GetCreatureDisplayByGUID(GUID)
    -- Set the creatureID to 0 by default. If it's still 0
    -- by the end, then we'll use a Westfall Chicken for
    -- the model.
    local creatureID = 0

    -- If the DressUpModelFrame doesn't exist, then let's create it.
    if not DressUpModelFrame then
        DressUpModelFrame = CreateFrame("PlayerModel", nil, UIParent, "ModelWithControlsTemplate")
        DressUpModelFrame:SetPoint("TOPRIGHT", 0, 0)
        DressUpModelFrame:SetSize(1, 1)
        DressUpModelFrame:Hide()
    end

    -- Get the creature type, and depending on its type, the process is
    -- slightly different to get the creatureID.
    local creatureType = LHMP:SplitString(GUID, "-", 1)
    if creatureType and creatureType == "Creature" then
        creatureID = LHMP:SplitString(GUID, "-", 6)
    elseif creatureType and creatureType == "Vignette" then
        local vignetteInfo = C_VignetteInfo.GetVignetteInfo(GUID)
        if vignetteInfo then
            creatureID = LHMP:SplitString(vignetteInfo.objectGUID, "-", 6)
        end
    end

    if creatureID ~= 0 then
        DressUpModelFrame:SetCreature(creatureID)
        DressUpModelFrame:SetCreature(creatureID)
        local displayID = DressUpModelFrame:GetDisplayInfo()
        if displayID and displayID ~= 0 then
            return displayID
        end
    end
    return 0
end

addon.CreateFauxPopup = function(frame, name, quality, GUID, label)
    -- Get the creature's display ID.
    local displayID = GetCreatureDisplayByGUID(GUID)

    -- If the displayID isn't valid or is 0, then we'll use the texture
    -- of the Fractured Necrolyte Skull.
    if displayID and displayID ~= 0 then
        frame:SetUpDisplay(frame.Icon, quality, name, label, "CosmeticIconFrame")
        SetPortraitTextureFromCreatureDisplayID(frame.Icon, displayID)
    else
        frame:SetUpDisplay(133731, quality, name, label, "CosmeticIconFrame")
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
            local vignettePosition = C_VignetteInfo.GetVignettePosition(GUID, addon.mapID)
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
        btn:SetAttribute("type1", "macro")
        btn:SetAttribute("macrotext1", format("/targetexact %s", name))
        btn:RegisterForClicks("AnyUp", "AnyDown")
    end)

    -- Play a sound. (HunterHorn)
	PlaySound(28625, "Master")
end

addon.ProcessVignette = function(vignetteGUID)
    -- If any of these are true, then return.
    if UnitOnTaxi("player") then return end

    local vignetteInfo = C_VignetteInfo.GetVignetteInfo(vignetteGUID)
    if vignetteInfo then
        if vignetteInfo.type == 0 and (not vignetteInfo.onMinimap) then return end
        local name, atlasName = vignetteInfo.name, vignetteInfo.atlasName
        if atlasName == "VignetteKill" then
            HelpMePlayAlertSystem = AlertFrame:AddQueuedAlertFrameSubSystem("NewCosmeticAlertFrameTemplate", addon.CreateFauxPopup)
            HelpMePlayAlertSystem:AddAlert(name, Enum.ItemQuality.Rare, vignetteGUID, CreateAtlasMarkup("VignetteKill") .. " Rare Detected")
        end
    end
end

eventHandler:RegisterEvent("NAME_PLATE_UNIT_ADDED")
eventHandler:RegisterEvent("VIGNETTE_MINIMAP_UPDATED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "VIGNETTE_MINIMAP_UPDATED" then
        if HelpMePlayDB["RareScan"] == false then return end

        -- If the GUID is valid and it hasn't been seen, then
        -- process it.
        local vignetteGUID = ...
        local spawnUID = LHMP:SplitString(vignetteGUID, "-", 7)
        if (vignetteGUID and spawnUID) and (not processedVignettes[spawnUID]) then
            processedVignettes[spawnUID] = true
            addon.ProcessVignette(vignetteGUID)
        end
    elseif event == "NAME_PLATE_UNIT_ADDED" then
        if HelpMePlayDB["RareScan"] == false then return end

        -- Get the unit's classification; if it's rare or rare elite, then
        -- inform the player.
        local unitClassification = UnitClassification(...)
        if (unitClassification == "rare" or unitClassification == "rareelite") and not UnitIsFriend(..., "player") then
            local GUID = UnitGUID(...)
            local spawnUID = LHMP:SplitString(GUID, "-", 7)
            if (GUID and spawnUID) and (not processedRares[spawnUID]) and (not processedVignettes[spawnUID]) then
                processedRares[spawnUID] = true
                SetRaidTarget(..., 7)
                HelpMePlayAlertSystem = AlertFrame:AddQueuedAlertFrameSubSystem("NewCosmeticAlertFrameTemplate", addon.CreateFauxPopup)
                HelpMePlayAlertSystem:AddAlert(UnitName(...), Enum.ItemQuality.Epic, GUID, CreateAtlasMarkup("VignetteKill") .. " Rare Detected")
            end
        end
    end
end)