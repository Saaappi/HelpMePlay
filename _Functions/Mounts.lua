local addonName, addon = ...

addon.GetPlayerDurability = function(durabilityThreshold)
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
        if durability <= durabilityThreshold then
            return true
        end
    end
    return false
end

addon.GetFreeInventorySpace = function(numFreeSlots, numTotalSlots, inventoryThreshold)
    local spaceUsed = (numFreeSlots / numTotalSlots) * 100
    if (100 - spaceUsed) <= inventoryThreshold then
        return true
    end
    return false
end

-- Get the mount type name from Data\Mounts.lua.
addon.GetMountTypeNameByID = function(mountTypeID)
    if addon.MountTypes[mountTypeID] then
        return addon.MountTypes[mountTypeID]
    end
    return "UNK"
end

-- This function is used to determine if a mount was
-- previously categorized.
addon.IsMountCategorized = function(mountID)
    local mergedTable = addon.MergeTables(
        HelpMePlayDB["Mounts"]["Ground"],
        HelpMePlayDB["Mounts"]["Aquatic"],
        HelpMePlayDB["Mounts"]["Flying"],
        HelpMePlayDB["Mounts"]["Dynamic"],
        HelpMePlayDB["Mounts"]["Vashjir"],
        HelpMePlayDB["Mounts"]["AQ"],
        HelpMePlayDB["Mounts"]["Unused"]
    )

    for id, _ in pairs(mergedTable) do
        if id == mountID then
            return true
        end
    end
    return false
end

-- If the mount hasn't been categorized, then let's categorize
-- it.
addon.CategorizeMountByID = function(mountID)
    local isMountCategorized = addon.IsMountCategorized(mountID)
    if not isMountCategorized then
        local mountInfo = { C_MountJournal.GetMountInfoByID(mountID) }
        if mountInfo then
            local isCollected = select(11, unpack(mountInfo))
            if isCollected then
                local isUsable = select(5, unpack(mountInfo))
                if isUsable then
                    local unitFactionGroupID = UnitFactionGroup("player")
                    if unitFactionGroupID == "Alliance" then
                        unitFactionGroupID = 1
                    elseif unitFactionGroupID == "Horde" then
                        unitFactionGroupID = 0
                    else -- This is a neutral mount.
                        unitFactionGroupID = nil
                    end
                    local factionID = select(9, unpack(mountInfo))
                    if factionID == nil or factionID == unitFactionGroupID then
                        local mountTypeID = select(5, C_MountJournal.GetMountInfoExtraByID(mountID))
                        if mountTypeID then
                            local mountTypeName = addon.GetMountTypeNameByID(mountTypeID)
                            if mountTypeName ~= "UNK" then
                                local mountName = select(1, unpack(mountInfo))
                                HelpMePlayDB["Mounts"][mountTypeName][mountID] = mountName
                            else
                                HelpMePlay.Print(format("{DEBUG} {%d} Mount type is unknown. Please screenshot this message and report it on Github.", mountTypeID))
                            end
                        end
                    end
                end
            end
        end
    end
    return false
end

-- Gets a random mount based on the given type.
addon.GetRandomMountByType = function(type)
    local mountIDs = {}
    for mountID in pairs(HelpMePlayDB["Mounts"][type]) do
        table.insert(mountIDs, mountID)
    end

    return mountIDs[math.random(1, #mountIDs)]
end

addon.IsMountCollected = function(mountID)
    local isCollected = select(11, C_MountJournal.GetMountInfoByID(mountID))
    if isCollected then
        return true
    end
    return false
end

addon.Mount = function()
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

    if addon.playerLevel <= 10 and IsOutdoors() then
        -- If the player is outdoors and is less than level 10, then
        -- use the chauffered chopper mount based on their faction.
        if UnitFactionGroup("player") == "Alliance" then
            if addon.IsMountCollected(679) then
                C_MountJournal.SummonByID(679)
            end
        elseif UnitFactionGroup("player") == "Horde" then
            if addon.IsMountCollected(678) then
                C_MountJournal.SummonByID(678)
            end
        else
            HelpMePlay.Print("{DEBUG} Faction not supported for mount use. Please screenshot this message and report it on Github.")
        end
    elseif IsSubmerged() and IsOutdoors() then
        -- If the player is submerged/swimming and they're outdoors,
        -- then summon an aquatic mount.
        --
        -- If the player is in a special map (like Vashj'ir), then use
        -- the appropriate mount. If they don't have it, then use an
        -- aquatic mount.
        if addon.SpecialMaps[addon.mapID] then
            local mountID = addon.SpecialMaps[addon.mapID][1]
            if addon.IsMountCollected(mountID) then
                C_MountJournal.SummonByID(mountID)
            else
                C_MountJournal.SummonByID(addon.GetRandomMountByType("Aquatic"))
            end
        else
            C_MountJournal.SummonByID(addon.GetRandomMountByType("Aquatic"))
        end
    elseif addon.SpecialMaps[addon.mapID] and IsOutdoors() then
        -- If the player is in a special map, such as Ahn'Qiraj,
        -- then use a random mount from the list.
        local randomNum = random(1, #addon.SpecialMaps[addon.mapID])
        local mountID = addon.SpecialMaps[addon.mapID][randomNum]
        if addon.IsMountCollected(mountID) then
            C_MountJournal.SummonByID(mountID)
        end
    elseif addon.GetFreeInventorySpace(numFreeSlots, numTotalSlots, 20) or addon.GetPlayerDurability(70) then
        -- If the player's available bag space is less than or equal
        -- to 20%, then use a vendor mount.
        --
        -- If the player's durability is less than or equal to 70%,
        -- then use a vendor mount.
        local mountID = 460
        if addon.IsMountCollected(mountID) then
            C_MountJournal.SummonByID(mountID)
        else
            if UnitFactionGroup("player") == "Alliance" then
                mountID = 280
            else
                mountID = 284
            end
            if addon.IsMountCollected(mountID) then
                C_MountJournal.SummonByID(mountID)
            else
                -- The player doesn't have the Traveler's Tundra Mammoth
                -- or the Grand Expedition Yak. Inventory space is an issue
                -- but we can't do anything about it.
                --
                -- Pick a random mount to use instead based on the player's
                -- level.
                if addon.playerLevel >= 10 and addon.playerLevel < 30 then
                    C_MountJournal.SummonByID(addon.GetRandomMountByType("Ground"))
                elseif addon.playerLevel >= 30 and addon.playerLevel < 60 then
                    C_MountJournal.SummonByID(addon.GetRandomMountByType("Flying"))
                else
                    C_MountJournal.SummonByID(addon.GetRandomMountByType("Dynamic"))
                end
            end
        end
    elseif IsAdvancedFlyableArea() and IsOutdoors() and (not IsShiftKeyDown()) then
        -- Use a Dragonriding (Skyriding) mount.
        C_MountJournal.SummonByID(addon.GetRandomMountByType("Dynamic"))
    elseif (IsFlyableArea() and addon.playerLevel >= 30) and IsOutdoors() then
        -- Use a normal flying mount.
        C_MountJournal.SummonByID(addon.GetRandomMountByType("Flying"))
    else
        -- Use a ground mount.
        C_MountJournal.SummonByID(addon.GetRandomMountByType("Ground"))
    end
end