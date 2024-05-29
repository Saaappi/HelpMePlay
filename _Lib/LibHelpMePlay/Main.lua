local addonName, addon = ...

-- Set major/minor version
local MAJOR, MINOR = "LibHelpMePlay", 1
assert(LibStub, MAJOR .. " requires LibStub")

-- Initialize library
local LHMP, oldversion = LibStub:NewLibrary(MAJOR, MINOR)
if not LHMP then return end

function LHMP:IsItemContainer(itemID)
    -- Ensure the supplied itemID is valid.
    if not LHMP.Containers[itemID] then return false end

    -- Return true if the itemID is a supported container.
    return true
end