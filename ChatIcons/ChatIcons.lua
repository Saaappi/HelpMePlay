local addonName, addon = ...
local iconPath = format("Interface\\AddOns\\%s\\ChatIcons\\Icons", addonName)

-- Add a message event filter for CHAT_MSG_LOOT. The code is pretty self explanatory.
-- The only gotcha may be the formats near the bottom.
--
-- \124 is the ASCII code for |. I feel it's a bit more readable and it's how the game
-- parses it anyway (and how it's returned to the chat frame.)
--
-- Icon Credit: AmiYuy (Can I Mog It?) ♥
ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", function(self, event, message, ...)
    if HelpMePlayDB["ShowChatIcons"] == false then return end
    local function GetItemIconHMP(itemLink)
        local texture = C_Item.GetItemIconByID(itemLink)
        local collectedTexture
        local item = { C_Item.GetItemInfo(itemLink) }
        if item then
            local itemType = item[6]
            if itemType == "Armor" or itemType == "Weapon" then
                local sourceID = select(2, C_TransmogCollection.GetItemInfo(itemLink))
                if sourceID then
                    local isCollected = select(5, C_TransmogCollection.GetAppearanceSourceInfo(sourceID))
                    local canPlayerCollectSource = select(2, C_TransmogCollection.PlayerCanCollectSource(sourceID))
                    local bindType = item[14]
                    if bindType == 1 then -- Soulbound
                        if not isCollected then
                            if canPlayerCollectSource then
                                collectedTexture = format("%s\\UNKNOWN", iconPath)
                            else
                                collectedTexture = format("%s\\UNKNOWABLE_SOULBOUND", iconPath)
                            end
                        end
                    elseif bindType == 0 then -- BoE
                        if not isCollected then
                            if canPlayerCollectSource then
                                collectedTexture = format("%s\\UNKNOWN", iconPath)
                            else
                                collectedTexture = format("%s\\UNKNOWABLE_BY_CHARACTER", iconPath)
                            end
                        end
                    end
                    collectedTexture = format("%s\\KNOWN", iconPath)
                end
                return format("\124T%s:12\124t %s \124T%s:12\124t", texture, itemLink, collectedTexture)
            end
        end
        return format("\124T%s:12\124t %s", texture, itemLink)
    end
    message = message:gsub("(\124c%x+\124Hitem:.-\124h\124r)", GetItemIconHMP)
    return false, message, ...
end)