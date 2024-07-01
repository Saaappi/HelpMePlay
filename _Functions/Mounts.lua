local addonName, addon = ...
local LHMP = LibStub("LibHelpMePlay")
local mounts = {}

addon.RefreshMountsByType = function(type)
    if mounts[type] == nil then
        mounts[type] = {}
    end

    for _, mount in pairs(HelpMePlayDB["Mounts"][type]) do
        table.insert(mounts[type], mount)
    end
end

local function GetPlayerDurability(threshold)
    local slots = { 1, 3, 5, 6, 7, 8, 9, 10, 16, 17 }
    local totalCurrentDurability = 0
    local totalMaxDurability = 0
    for _, slotID in ipairs(slots) do
        local itemLocation = ItemLocation:CreateFromEquipmentSlot(slotID)
        if itemLocation:IsValid() then
            local currentDurability, maxDurability = GetInventoryItemDurability(slotID)
            if currentDurability and maxDurability then
                totalCurrentDurability = totalCurrentDurability + currentDurability
                totalMaxDurability = totalMaxDurability + maxDurability
            end
        end
    end
    if totalCurrentDurability > 0 and totalMaxDurability > 0 then
        local durability = (totalCurrentDurability / totalMaxDurability) * 100
        if durability <= threshold then
            return true
        end
    end
    return false
end

local function GetFreeInventorySpacePercentage(numFreeSlots, numTotalSlots, threshold)
    local spaceUsed = (numFreeSlots / numTotalSlots) * 100
    if (100 - spaceUsed) >= (100 - threshold) then
        return true
    end
    return false
end


-- Get the mount type name from Data\Mounts.lua.
local function GetMountTypeNameByID(mountTypeID)
    if addon.MountTypes[mountTypeID] then
        return addon.MountTypes[mountTypeID]
    end
    return "UNK"
end

-- If the mount hasn't been categorized, then let's categorize
-- it.
addon.CategorizeMountByID = function(mountID)
    local name, spellID, icon, isActive, _, sourceType, isFavorite, isFactionSpecific, factionID, shouldHideOnChar, isCollected, _, isForDragonriding = C_MountJournal.GetMountInfoByID(mountID)
    if isCollected then
        local creatureDisplayInfoID, description, source, isSelfMount, mountTypeID, uiModelSceneID, animID, spellVisualKitID, disablePlayerMountPreview = C_MountJournal.GetMountInfoExtraByID(mountID)
        if mountTypeID then
            local mountTypeName = GetMountTypeNameByID(mountTypeID)
            if mountTypeName ~= "UNK" then
                local isUsable = C_MountJournal.GetMountUsabilityByID(mountID, false)
                table.insert(HelpMePlayDB["Mounts"][mountTypeName], {name = name, mountID = mountID})
            else
                HelpMePlay.Print(format(addon.ErrorMessages["MOUNT_TYPE_UNKNOWN"], mountTypeID))
            end
        end
    end
    return false
end

-- Gets a random mount based on the given type.
local function GetRandomMountByType(type)
    -- If we ran out of mounts for a given type, then
    -- refresh the mounts for that type.
    if mounts[type] == nil or (#mounts[type] == 0) then
        addon.RefreshMountsByType(type)
    end

    -- Get a random index from the mounts table, then get the
    -- mountID at that index.
    if mounts[type] then
        local index = math.random(1, #mounts[type])
        local mount = mounts[type][index]

        -- Remove the mount from the original table.
        table.remove(mounts[type], index)

        -- Return the mount ID
        return mount.mountID
    end
end

local function IsMountCollected(mountID)
    local isCollected = select(11, C_MountJournal.GetMountInfoByID(mountID))
    if isCollected then
        return true
    end
    return false
end

local function IsMountUsable(mountID)
    local isUsable = C_MountJournal.GetMountUsabilityByID(mountID, false)
    if isUsable then
        return true
    end
    return false
end

local function SummonMountByType(type)
    local mountID = GetRandomMountByType(type)
    if mountID then
        local isUsable = IsMountUsable(mountID)
        if isUsable then
            C_MountJournal.SummonByID(mountID)
        else
            SummonMountByType(type)
        end
    end
end

addon.Mount = function()
    -- Check if the player is in combat.
    if InCombatLockdown() or IsPlayerMoving() then return false end

    -- The mount automation received a rework and the player must
    -- manually recategorize their mounts. If they haven't done
    -- that yet, then return.
    if not HelpMePlayDB["HasRecategorizedMounts"] then
        HelpMePlay.Print(addon.ErrorMessages["HAS_NOT_RECATEGORIZED_MOUNTS"])
        return false
    end

    -- If the player is already mounted, then dismount them and return.
    -- This will save me from creating a keybind for dismount.
    if IsMounted() and (not IsFlying()) then
        Dismount()
        return
    elseif IsMounted() and IsFlying() then
        return
    end

    -- Get some information about the player's inventory. We'll use these
    -- values to determine if we need to summon a vendor mount or not.
    local numTotalSlots = 0
    local numFreeSlots = 0
    for bagID = 0, 4 do
        numTotalSlots = numTotalSlots + C_Container.GetContainerNumSlots(bagID)
        numFreeSlots = numFreeSlots + C_Container.GetContainerNumFreeSlots(bagID)
    end

    if addon.playerLevel < 10 and IsOutdoors() and (not LHMP:IsPlayerHeroClass(addon.playerClassID)) then -- Chauffer Mount
        if UnitFactionGroup("player") == "Alliance" then
            local mountID = 679
            if IsMountCollected(mountID) then
                C_MountJournal.SummonByID(mountID)
            end
        elseif UnitFactionGroup("player") == "Horde" then
            local mountID = 678
            if IsMountCollected(mountID) then
                C_MountJournal.SummonByID(mountID)
            end
        end
    elseif IsSubmerged() and IsOutdoors() then -- Aquatic Mounts
        -- If the player is submerged/swimming and they're outdoors,
        -- then summon an aquatic mount.
        --
        -- If the player is in a special map (like Vashj'ir), then use
        -- the appropriate mount. If they don't have it, then use an
        -- aquatic mount.
        if addon.SpecialMaps[addon.mapID] then
            local mountID = addon.SpecialMaps[addon.mapID][1]
            if IsMountCollected(mountID) then
                C_MountJournal.SummonByID(mountID)
            else
                SummonMountByType("Aquatic")
            end
        else
            SummonMountByType("Aquatic")
        end
    elseif addon.SpecialMaps[addon.mapID] and IsOutdoors() then -- Ahn'Qiraj Mounts
        -- If the player is in a special map, such as Ahn'Qiraj,
        -- then use a random mount from the list.
        local randomNum = random(1, #addon.SpecialMaps[addon.mapID])
        local mountID = addon.SpecialMaps[addon.mapID][randomNum]
        if IsMountCollected(mountID) then
            C_MountJournal.SummonByID(mountID)
        end
    elseif GetFreeInventorySpacePercentage(numFreeSlots, numTotalSlots, 20) or GetPlayerDurability(70) then -- Inventory Mounts (to repair/vendor)
        -- If the player's available bag space is less than or equal
        -- to 20%, then use a vendor mount.
        --
        -- If the player's durability is less than or equal to 70%,
        -- then use a vendor mount.
        local mountID = 460
        if IsMountCollected(mountID) then
            C_MountJournal.SummonByID(mountID)
        else
            if UnitFactionGroup("player") == "Alliance" then
                mountID = 280
            else
                mountID = 284
            end
            if IsMountCollected(mountID) then
                C_MountJournal.SummonByID(mountID)
            else
                -- The player doesn't have the Traveler's Tundra Mammoth
                -- or the Grand Expedition Yak. Inventory space is an issue
                -- but we can't do anything about it.
                --
                -- Pick a random mount to use instead based on the player's
                -- level.
                if addon.playerLevel >= 10 and addon.playerLevel < 30 then
                    SummonMountByType("Ground")
                elseif addon.playerLevel >= 30 and addon.playerLevel < 60 then
                    SummonMountByType("Flying")
                else
                    SummonMountByType("Dynamic")
                end
            end
        end
    elseif IsAdvancedFlyableArea() and IsOutdoors() and (not IsShiftKeyDown()) then -- Skyriding Mounts
        SummonMountByType("Dynamic")
    elseif (IsFlyableArea() and addon.playerLevel >= 30) and IsOutdoors() then -- Static Flying Mounts
        SummonMountByType("Flying")
    else -- Ground Mounts
        SummonMountByType("Ground")
    end
end