local addonName, addon = ...

ChatFrame_AddMessageEventFilter("CHAT_MSG_LOOT", function(self, event, message, ...)
    if HelpMePlayDB["ShowChatIcons"] == false then return end
    local function GetItemIconHMP(itemLink)
        local texture = C_Item.GetItemIconByID(itemLink)
        local collectedTexture
        local item = { C_Item.GetItemInfo(itemLink) }
        if item then
            local itemType = item[6]
            if itemType == "Armor" or itemType == "Weapon"then
                local sourceID = select(2, C_TransmogCollection.GetItemInfo(itemLink))
                if sourceID then
                    local isCollected = select(5, C_TransmogCollection.GetAppearanceSourceInfo(sourceID))
                    local canPlayerCollectSource = select(2, C_TransmogCollection.PlayerCanCollectSource(sourceID))
                    local bindType = item[14]
                    if bindType == 1 then -- Soulbound
                        if not isCollected then
                            if canPlayerCollectSource then
                                collectedTexture = format("Interface\\AddOns\\%s\\Chat\\Icons\\UNKNOWN", addonName)
                            else
                                collectedTexture = format("Interface\\AddOns\\%s\\Chat\\Icons\\UNKNOWABLE_SOULBOUND", addonName)
                            end
                        end
                    elseif bindType == 0 then -- BoE
                        if not isCollected then
                            if canPlayerCollectSource then
                                collectedTexture = format("Interface\\AddOns\\%s\\Chat\\Icons\\UNKNOWN", addonName)
                            else
                                collectedTexture = format("Interface\\AddOns\\%s\\Chat\\Icons\\UNKNOWABLE_BY_CHARACTER", addonName)
                            end
                        end
                    end
                    collectedTexture = format("Interface\\AddOns\\%s\\Chat\\Icons\\KNOWN", addonName)
                end
                return format("\124T%s:12\124t %s |T%s:12|t", texture, itemLink, collectedTexture)
            end
        end
        return format("\124T%s:12\124t %s", texture, itemLink)
    end
    message = message:gsub("(\124c%x+\124Hitem:.-\124h\124r)", GetItemIconHMP)
    return false, message, ...
end)