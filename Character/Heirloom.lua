local addonName, addon = ...
local button

EventRegistry:RegisterCallback("CollectionsJournal.TabSet", function(_, _, tabID)
    if PlayerGetTimerunningSeasonID() == 1 then return false end
    if _G["CollectionsJournalTab" .. tabID]:GetText() ~= HEIRLOOMS then
        if button then
            button:Hide()
        end
        return false
    end

    if not button and tabID == 4 then
        button = addon.CreateSecureButton({
            name = format("%s%s", addonName, "EquipHeirloomsButton"),
            parent = CollectionsJournal,
            anchor = "TOPLEFT",
            relativeAnchor = "TOPRIGHT",
            xOff = 10,
            yOff = 0,
            icon = 133071
        })

        button:SetScript("PreClick", function(_, _, isDown)
            if not isDown then
                for bag = 0, 4 do
                    for slot = 1, C_Container.GetContainerNumSlots(bag) do
                        local item = Item:CreateFromBagAndSlot(bag, slot)
                        if not item:IsItemEmpty() then
                            local itemID = item:GetItemID()
                            if C_Heirloom.IsItemHeirloom(itemID) then
                                local itemLink = item:GetItemLink()
                                local heirloomMaxLevel = select(10, C_Heirloom.GetHeirloomInfo(itemID))
                                if heirloomMaxLevel >= addon.playerLevel then
                                    EquipItemByName(itemLink)
                                end
                            end
                        end
                    end
                end
            end
        end)
        button:SetScript("OnEnter", function(self)
            addon.Tooltip_OnEnter(self, "Equip Heirlooms", "Create heirlooms by clicking them in the nearby window.\n\nOnce all heirlooms have been created, click this button to equip them.")
        end)
        button:SetScript("OnLeave", addon.Tooltip_OnLeave)

        button:Show()
    elseif tabID == 4 then
        button:Show()
    else
        button:Hide()
    end
end)