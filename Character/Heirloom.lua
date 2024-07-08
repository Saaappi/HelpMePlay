local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local button

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
                for bag = 0, 4 do
                    for slot = 1, C_Container.GetContainerNumSlots(bag) do
                        local item = Item:CreateFromBagAndSlot(bag, slot)
                        if not item:IsItemEmpty() then
                            local itemID = item:GetItemID()
                            if C_Heirloom.IsItemHeirloom(itemID) then
                                local itemLink = item:GetItemLink()
                                local heirloomMaxLevel = select(10, C_Heirloom.GetHeirloomInfo(itemID))
                                if heirloomMaxLevel > HelpMePlay.playerLevel then
                                    EquipItemByName(itemLink)
                                end
                            end
                        end
                    end
                end
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