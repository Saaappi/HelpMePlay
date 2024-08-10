local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local button

local function GetAvailableSlot(inventoryType)
    local invSlots = HelpMePlay.InventoryType[inventoryType]
    if invSlots then
        if type(invSlots) == "table" then
            for _, invSlotId in ipairs(invSlots) do
                local invSlot = Item:CreateFromEquipmentSlot(invSlotId)
                local invSlotItemId = invSlot:GetItemID()
                if invSlot:IsItemEmpty() or (not C_Heirloom.IsItemHeirloom(invSlotItemId)) then
                    return invSlotId
                end
            end
        else
            local invSlot = invSlots
            return invSlot
        end
    end
end

local function Equip()
    local hasEquippedItem = false
    for bagId = 0, 4 do
        local numSlots = C_Container.GetContainerNumSlots(bagId)
        for slotId = 1, numSlots do
            local item = Item:CreateFromBagAndSlot(bagId, slotId)
            if not item:IsItemEmpty() then
                local itemId = item:GetItemID()
                if C_Heirloom.IsItemHeirloom(itemId) then
                    local heirloomMaxLevel = select(10, C_Heirloom.GetHeirloomInfo(itemId))
                    if heirloomMaxLevel and (heirloomMaxLevel > HelpMePlay.playerLevel) then
                        local itemLink = item:GetItemLink()
                        local inventoryType = item:GetInventoryType()
                        if inventoryType then
                            local invSlotId = GetAvailableSlot(inventoryType)
                            C_Item.EquipItemByName(itemLink, invSlotId)
                            hasEquippedItem = true
                            break
                        end
                    end
                end
            end
        end
        if hasEquippedItem then
            break
        end
    end
    if hasEquippedItem then
        C_Timer.After(0.25, Equip)
    end
end

local function CreateButton()
    if PlayerGetTimerunningSeasonID() == 1 then return false end
    if HelpMePlay.playerLevel == HelpMePlay.Constants["MAX_PLAYER_LEVEL"] then return false end

    if not button then
        button = HelpMePlay.CreateWidget("SecureButton", {
            name = format("%s%s", addonName, "EquipHeirloomsButton"),
            scale = 0.65,
            icon = 1805932,
            isMovable = false,
            saveName = ""
        })

        button:ClearAllPoints()
        button:SetPoint("TOPLEFT", CollectionsJournal, "TOPRIGHT", 10, 0)

        button:SetScript("PreClick", function(_, _, isDown)
            if not isDown then
                Equip()
            end
        end)
        button:SetScript("OnEnter", function(self)
            HelpMePlay.Tooltip_OnEnter(self, "Equip Heirlooms", "Create heirlooms by clicking them in the nearby window.\n\nOnce you've created the heirlooms, click this button to equip them all.\n\nHeirlooms that have been outleveled will NOT be equipped.")
        end)
        button:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
    end
    button:Show()
end

EventRegistry:RegisterCallback("CollectionsJournal.TabSet", function(_, _, tabID)
    if PlayerGetTimerunningSeasonID() == 1 then return false end
    if HelpMePlay.playerLevel == HelpMePlay.Constants["MAX_PLAYER_LEVEL"] then return false end

    if _G["CollectionsJournalTab" .. tabID]:GetText() ~= HEIRLOOMS then
        if button then
            button:Hide()
        end
    else
        CreateButton()
    end
end)

local function OnEvent(_, event, arg1)
    if event == "ADDON_LOADED" then
        if arg1 == "Blizzard_Collections" then
            CollectionsJournal:HookScript("OnHide", function()
                if button then button:Hide() end
            end)
            if CollectionsJournalTitleText:GetText() == HEIRLOOMS then
                CreateButton()
            end
        end
    end
end

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", OnEvent)