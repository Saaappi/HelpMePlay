local addonName, _ = ...
local iconPath = string.format("Interface\\AddOns\\%s\\ChatIcons\\Icons", addonName)

local function IsAppearanceCollected(visualID)
    local sources = C_TransmogCollection.GetAppearanceSources(visualID)
    if sources then
        for _, source in next, sources do
            if source.isCollected then
                return true
            end
        end
    end
    return false
end

-- Add a message event filter for CHAT_MSG_LOOT. The code is pretty self explanatory.
-- The only gotcha may be the formats near the bottom.
--
-- \124 is the ASCII code for |. I feel it's a bit more readable and it's how the game
-- parses it anyway (and how it's returned to the chat frame.)
--
-- Icon Credit: AmiYuy (Can I Mog It?) ♥
ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", function(_, _, message, ...)
    if HelpMePlayDB["ShowChatIcons"] == false then return end

    local function GetCollectedTexture(bindType, isCollected, canCollect, iconPath)
        if isCollected then
            return string.format("%s\\KNOWN", iconPath)
        end

        if bindType == 1 then
            -- Soulbound
            if canCollect then
                return string.format("%s\\UNKNOWN", iconPath)
            else
                return string.format("%s\\UNKNOWABLE_SOULBOUND", iconPath)
            end
        elseif bindType == 2 then
            -- Bind-on-equip
            if canCollect then
                return string.format("%s\\UNKNOWN", iconPath)
            else
                return string.format("%s\\UNKNOWABLE_BY_CHARACTER", iconPath)
            end
        end
    end

    local function GetItemInfoData(itemLink)
        local sourceId = select(2, C_TransmogCollection.GetItemInfo(itemLink))
        if not sourceId then return end

        local visualId = select(2, C_TransmogCollection.GetAppearanceSourceInfo(sourceId))
        if not visualId then return end

        local isCollected = IsAppearanceCollected(visualId)
        local canCollectAppearance = select(2, C_TransmogCollection.PlayerCanCollectSource(sourceId))

        return isCollected, canCollectAppearance
    end

    local function GetItemIconHMP(itemLink)
        local texture = C_Item.GetItemIconByID(itemLink)
        local itemType, _, _, _, _, _, _, _, bindType = select(6, C_Item.GetItemInfo(itemLink))
        if texture and (itemType == "Armor" or itemType == "Weapon") then
            local isCollected, canCollectAppearance = GetItemInfoData(itemLink)
            if isCollected ~= nil then
                local collectedTexture = GetCollectedTexture(bindType, isCollected, canCollectAppearance, iconPath)
                return string.format("\124T%s:12\124t %s \124T%s:12\124t", texture, itemLink, collectedTexture)
            end
        end
        return string.format("\124T%s:12\124t %s", texture, itemLink)
    end
    message = message:gsub("(\124c%x+\124Hitem:.-\124h\124r)", GetItemIconHMP)
    return false, message, ...
end)