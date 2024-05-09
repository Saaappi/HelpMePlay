local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

local function GetHeirloomArmorTypeIDByClassID(classID)
    return addon.HeirloomArmorTypeIDByClass[classID]
end

local function IsHeirloomValidForClassID(classID, itemSubClassID)
    if addon.HeirloomEquipLoc[classID] then
        for _, v in ipairs(addon.HeirloomEquipLoc[classID]) do
            if itemSubClassID == v then
                return true
            end
        end
    end
    return false
end

eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        C_Timer.After(1, function()
            -- Get the player's armor type by their class ID.
            local armorTypeID = GetHeirloomArmorTypeIDByClassID(addon.playerClassID)

            -- Get the item IDs of all the heirlooms in the game.
            local heirlooms = C_Heirloom.GetHeirloomItemIDs()
            for _, heirloomItemID in ipairs(heirlooms) do
                -- If the player has the heirloom in question, then continue.
                if C_Heirloom.PlayerHasHeirloom(heirloomItemID) then
                    local itemClassID, itemSubClassID = select(6, C_Item.GetItemInfoInstant(heirloomItemID))
                    local inventoryType = addon.InventoryType[C_Item.GetItemInventoryTypeByID(heirloomItemID)]
                    if itemClassID == 2 then -- Weapon
                        local isHeirloomValid = IsHeirloomValidForClassID(addon.playerClassID, itemSubClassID)
                        if isHeirloomValid then
                            local heirloomMaxLevel = select(10, C_Heirloom.GetHeirloomInfo(heirloomItemID))
                            if heirloomMaxLevel > addon.playerLevel then
                                --local itemLink = C_Heirloom.GetHeirloomLink(heirloomItemID)
                                --print(itemLink)
                            end
                        end
                    elseif itemClassID == 4 then
                        local isHeirloomValid = (itemSubClassID == armorTypeID)
                        if isHeirloomValid then
                            local heirloomMaxLevel = select(10, C_Heirloom.GetHeirloomInfo(heirloomItemID))
                            if heirloomMaxLevel > addon.playerLevel then
                                local itemLink = C_Heirloom.GetHeirloomLink(heirloomItemID)
                                table.insert(addon.Heirlooms[inventoryType], itemLink)
                            end
                        end
                    end
                end
            end
        end)
    end
end)