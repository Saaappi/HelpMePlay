local addonName, addon = ...

-- Set major/minor version
local MAJOR, MINOR = "LibHelpMePlay", 1
assert(LibStub, MAJOR .. " requires LibStub")

-- Initialize library
local LHMP, oldversion = LibStub:NewLibrary(MAJOR, MINOR)
if not LHMP then return end

function LHMP:IsItemContainer(itemID)
    if not LHMP.Containers[itemID] then return false end
    return true
end

function LHMP:IsEventQueueable(eventID)
    if not LHMP.WorldEvents[eventID] then return false end
    return true
end

function LHMP:GetWorldEvent(eventID)
    if not LHMP.WorldEvents[eventID] then return false end
    return LHMP.WorldEvents[eventID]
end