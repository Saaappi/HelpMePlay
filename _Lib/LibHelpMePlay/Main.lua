local addonName, addon = ...

-- Set the major and minor version.
local MAJOR, MINOR = "LibHelpMePlay", 1
assert(LibStub, MAJOR .. " requires LibStub")

-- Initialization.
local LHMP, oldversion = LibStub:NewLibrary(MAJOR, MINOR)
if not LHMP then return end

-------------
-- GOSSIPS --
-------------
function LHMP:IsGossipSupportedForNPC(npcID)
    if not LHMP.Gossips[npcID] then return false end
    return true
end
function LHMP:GetGossipsForNPCByID(npcID)
    if not LHMP.Gossips[npcID] then return false end
    return LHMP.Gossips[npcID]
end

----------------
-- CONTAINERS --
----------------
function LHMP:IsItemContainer(itemID)
    if not LHMP.Containers[itemID] then return false end
    return true
end

------------------
-- WORLD EVENTS --
------------------
function LHMP:IsEventQueueable(eventID)
    if not LHMP.WorldEvents[eventID] then return false end
    return true
end
function LHMP:GetWorldEvent(eventID)
    if not LHMP.WorldEvents[eventID] then return false end
    return LHMP.WorldEvents[eventID]
end

-------------------
-- NEW CHARACTER --
-------------------
function LHMP:GetRaceFactionByID(raceID)
    if not LHMP.RaceFactions[raceID] then return false end
    return LHMP.RaceFactions[raceID]
end
function LHMP:GetRandomRaceID()
    local keys = {}
    for key, _ in pairs(LHMP.RaceClassCombinations) do
        table.insert(keys, key)
    end
    local randomKey = keys[math.random(1, #keys)]
    return randomKey
end
function LHMP:GetRandomClassByRaceID(raceID)
    if not LHMP.RaceClassCombinations[raceID] then return false end

    local numClassCombos = #LHMP.RaceClassCombinations[raceID]
    local randomIndex = math.random(1, numClassCombos)
    return LHMP.RaceClassCombinations[raceID][randomIndex]
end
function LHMP:GetRandomSpecIDByClassID(classID)

end