local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local buttonSize = 32
local usableButton
local itemQueue = {}

local function MakeButton(anchorPoint, parent, relativeAnchorPoint, anchorX, anchorY)
    if not usableButton then
        usableButton = CreateFrame("Button", addonName .. "UsablesSecureButton", parent, "SecureActionButtonTemplate")
        usableButton:ClearAllPoints()
        usableButton:SetSize(buttonSize, buttonSize)
        usableButton:SetPoint(anchorPoint, parent, relativeAnchorPoint, anchorX, anchorY)

        usableButton.texture = usableButton:CreateTexture()
        usableButton.texture:SetTexture(626190)
        usableButton.texture:SetAllPoints()

        usableButton.highlightTexture = usableButton:CreateTexture()
        usableButton.highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
        usableButton.highlightTexture:SetSize(buttonSize, buttonSize)
        usableButton:SetHighlightTexture(usableButton.highlightTexture, "ADD")

        usableButton.pushedTexture = usableButton:CreateTexture()
        usableButton.pushedTexture:SetTexture("Interface\\Buttons\\UI-Quickslot-Depress")
        usableButton.pushedTexture:SetSize(buttonSize, buttonSize)
        usableButton:SetPushedTexture(usableButton.pushedTexture)

        usableButton:RegisterForClicks("AnyUp", "AnyDown")
        usableButton:SetMouseClickEnabled(true)

        usableButton:SetScript("PreClick", function(self, button, isDown)
            if not isDown then
                if next(itemQueue) == nil then
                    for bagID = 0, 4 do
                        for slotID = C_Container.GetContainerNumSlots(bagID), 1, -1 do
                            local itemID = C_Container.GetContainerItemID(bagID, slotID)
                            local itemLink = C_Container.GetContainerItemLink(bagID, slotID)
                            if itemID and itemLink then
                                local minCount = LHMP:GetRemixMinItemCount(itemID)
                                if LHMP:IsRemixItem(itemID) and (C_Item.GetItemCount(itemID) >= minCount) and minCount > 0 then
                                    table.insert(itemQueue, { itemLink = itemLink, ID = itemID })
                                end
                            end
                        end
                    end
                end
            end
        end)
        usableButton:SetScript("PostClick", function(self, button, isDown)
            if not isDown then
                if itemQueue then
                    for index, item in next, itemQueue do
                        local minCount = LHMP:GetRemixMinItemCount(item.ID)
                        if (C_Item.GetItemCount(item.itemLink) >= minCount) and minCount > 0 then
                            usableButton:SetAttribute("type", "item")
                            usableButton:SetAttribute("item", item.itemLink)
                        end
                        table.remove(itemQueue, index)
                    end
                    if next(itemQueue) == nil then
                        itemQueue = {}
                    end
                end
            end
        end)
        usableButton:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
            GameTooltip:SetText("Remix: Mists of Pandaria")
            GameTooltip:AddLine("Click to combine gems or add threads to your Cloak of Infinite Potential.\n\n" ..
            "The first click will find all the appropriate items and add them to a table. The second click and beyond will use the items.", 1, 1, 1, true)
            GameTooltip:Show()
        end)
        usableButton:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end
end

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, addonLoaded)
    if addonLoaded == addonName then
        if PlayerGetTimerunningSeasonID() == 1 then
            if C_AddOns.IsAddOnLoaded("Baganator") then
                --
            else
                if C_CVar.GetCVar("combinedBags") == "1" then
                    EventRegistry:RegisterCallback("ContainerFrame.OpenBag", function()
                        MakeButton("TOPRIGHT", ContainerFrameCombinedBags, "TOPLEFT", -10, -125)
                    end)
                else
                    EventRegistry:RegisterCallback("ContainerFrame.OpenBag", function()
                        MakeButton("BOTTOMLEFT", ContainerFrame1, "BOTTOMRIGHT", 10, 0)
                    end)
                end
            end
        end

        -- Unregister the event for performance.
        eventHandler:UnregisterEvent("ADDON_LOADED")
    end
end)