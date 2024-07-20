local _, _ = ...

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
function LHMP:IsPlayerHeroClass(classID)
    for _, heroClassID in next, LHMP.HeroClasses do
        if heroClassID == classID then
            return true
        end
    end
    return false
end
function LHMP:IsNewCharacter(playerLevel, playerClassID, playerGUID, characters)
    if playerLevel <= 10 or (playerClassID == 13 and playerLevel == 58) then
        for _, GUID in next, characters do
            if GUID == playerGUID then
                return false
            end
        end
        return true
    end
end

-------------
-- STRINGS --
-------------
function LHMP:ColorText(color, text)
    color = string.upper(color)
    if LHMP.Colors[color] then
        return format("|cff%s%s|r", LHMP.Colors[color], text)
    else
        -- A class color was given instead.
        local className = color
        if C_ClassColor.GetClassColor(className) then
            local classColor = C_ClassColor.GetClassColor(className):GenerateHexColor()
            return format("|c%s%s|r", classColor, text)
        end
    end
    return ""
end
function LHMP:SplitString(str, separator, nth)
    local strings = {}
    local pattern = ("([^%s]+)"):format(separator)
    for string in str:gmatch(pattern) do
        table.insert(strings, string)
    end

    if tonumber(strings[nth]) then
        return tonumber(strings[nth])
    elseif nth == "*" then
        return unpack(strings)
    end
    return strings[nth]
end
function LHMP:Truncate(str)
    if str:len() <= 15 then
		return str
	end
    return str:sub(1, 15) .. "..."
end

------------
-- TABLES --
------------
function LHMP:GetTableSize(tbl)
    local count = 0
    for i in next, tbl do
        count = count + 1
    end
    return count or 0
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

------------
-- EMOTES --
------------
function LHMP:IsEmoteSupportedForNPC(npcID)
    if not LHMP.Emotes[npcID] then
        return false
    end
    return true
end
function LHMP:GetEmoteForNPC(npcID)
    if not LHMP.Emotes[npcID] then
        return false
    end
    return LHMP.Emotes[npcID]
end

------------
-- QUESTS --
------------
function LHMP:IsQuestIgnored(questID)
    for _, id in next, LHMP.IgnoredQuests do
        if id == questID then
            return true
        end
    end
    return false
end

----------------
-- CONTAINERS --
----------------
function LHMP:IsItemContainer(itemID)
    for _, id in next, LHMP.Containers do
        if id == itemID then
            return true
        end
    end
    return false
end

------------------
-- WORLD EVENTS --
------------------
function LHMP:IsEventQueueable(eventID)
    if not LHMP.WorldEvents[eventID] then
        return false
    end

    local event = LHMP.WorldEvents[eventID]
    local isTimerunner = PlayerGetTimerunningSeasonID()
    if UnitLevel("player") < event.conditions.minLevel then
        return false
    end

    if event.conditions.isForTimerunning and isTimerunner ~= 1 then
        return false
    elseif (not event.conditions.isForTimerunning) and isTimerunner == 1 then
        return false
    end
    return true
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

-------------------
-- PLAYER CHOICE --
-------------------
function LHMP:GetPlayerChoiceByID(playerChoiceID)
    if not LHMP.PlayerChoices[playerChoiceID] then
        return nil
    end
    return LHMP.PlayerChoices[playerChoiceID]
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