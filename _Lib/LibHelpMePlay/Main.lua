local addonName, addon = ...

-- Set the major and minor version.
local MAJOR, MINOR = "LibHelpMePlay", 1
assert(LibStub, MAJOR .. " requires LibStub")

-- Initialization.
local LHMP, oldversion = LibStub:NewLibrary(MAJOR, MINOR)
if not LHMP then
    return false
end

-------------
-- GENERAL --
-------------
function LHMP:GetUnlocalizedUnitFaction(unit)
    return UnitFactionGroup(unit)
end

-------------
-- GOSSIPS --
-------------
function LHMP:IsGossipSupportedForNPC(npcID)
    if not LHMP.Gossips[npcID] then
        return false
    end
    return true
end
function LHMP:IsGossipTextNPC(npcID)
    if not LHMP.GossipTextLookupByNPC[npcID] then
        return false
    end
    return true
end
function LHMP:GetGossipsForNPCByID(npcID)
    if not LHMP.Gossips[npcID] then
        return false
    end
    return LHMP.Gossips[npcID]
end

----------------
-- CONTAINERS --
----------------
function LHMP:IsItemContainer(itemID)
    if not LHMP.Containers[itemID] then
        return false
    end
    return true
end

------------------
-- WORLD EVENTS --
------------------
function LHMP:IsEventQueueable(eventID)
    if not LHMP.WorldEvents[eventID] then
        return false
    end

    local faction = LHMP:GetUnlocalizedUnitFaction("player")
    local conditionString = LHMP.WorldEvents[eventID]["conditions"][faction]
    local questID = conditionString:match("= (.+)")
    if not C_QuestLog.IsQuestFlaggedCompleted(questID) then
        return true
    end
    return false
end
function LHMP:GetWorldEvent(eventID)
    if not LHMP.WorldEvents[eventID] then
        return false
    end
    return LHMP.WorldEvents[eventID]
end

---------------
-- MERCHANTS --
---------------
function LHMP:GetItemsForMerchant(npcID)
    if not LHMP.QuestMerchants[npcID] then
        return false
    end
    return LHMP.QuestMerchants[npcID]
end

----------------------------
-- NEW CHARACTER (RANDOM) --
----------------------------
function LHMP:GetRaceFactionByID(raceID)
    if not LHMP.RaceFactions[raceID] then
        return false
    end
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
    if not LHMP.RaceClassCombinations[raceID] then
        return false
    end

    local numClassCombos = #LHMP.RaceClassCombinations[raceID]
    local randomIndex = math.random(1, numClassCombos)
    return LHMP.RaceClassCombinations[raceID][randomIndex]
end
function LHMP:GetRandomSpecIDByClassID(classID)
    local numSpecs = GetNumSpecializationsForClassID(classID)
    local specIndex = math.random(1, numSpecs)
    local specName = select(2, GetSpecializationInfoForClassID(classID, specIndex))
    return specName
end