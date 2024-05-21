local addonName, addon = ...

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
    if not addon.IsMountCategorized(mountID) then
        local mountInfo = { C_MountJournal.GetMountInfoByID(mountID) }
        if mountInfo then
            local isCollected = select(11, mountInfo)
            if isCollected then
                local isUsable = select(5, mountInfo)
                if isUsable then
                    local unitFactionGroupID = UnitFactionGroup("player")
                    if unitFactionGroupID == "Alliance" then
                        unitFactionGroupID = 1
                    elseif unitFactionGroupID == "Horde" then
                        unitFactionGroupID = 0
                    else -- This is a neutral mount.
                        unitFactionGroupID = nil
                    end
                    local factionID = select(9, mountInfo)
                    if factionID == nil or factionID == unitFactionGroupID then
                        local mountTypeID = select(5, C_MountJournal.GetMountInfoExtraByID(mountID))
                        if mountTypeID then
                            local mountTypeName = addon.GetMountTypeNameByID(mountTypeID)
                            if mountTypeName ~= "UNK" then
                                local mountName = select(1, mountInfo)
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