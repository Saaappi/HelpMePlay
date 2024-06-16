local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")
local btn
local itemQueue = {}

local function MakeButton(anchor, parent, relativeAnchor, xOff, yOff)
    if not btn then
        btn = CreateFrame("Button", addonName .. "RemixSecureButton", parent, "SecureActionButtonTemplate, ActionButtonTemplate")
        btn:ClearAllPoints()
        btn:SetPoint(anchor, parent, relativeAnchor, xOff, yOff)

        btn.icon:SetTexture(626190)

        btn:RegisterForClicks("AnyUp", "AnyDown")
        btn:SetMouseClickEnabled(true)

        btn:SetScript("PreClick", function(self, button, isDown)
            if not isDown and not UnitAffectingCombat("player") then
                for bagID = 0, 4 do
                    for slotID = C_Container.GetContainerNumSlots(bagID), 1, -1 do
                        local itemID = C_Container.GetContainerItemID(bagID, slotID)
                        local itemLink = C_Container.GetContainerItemLink(bagID, slotID)
                        if itemID and itemLink then
                            local minCount = LHMP:GetRemixMinItemCount(itemID)
                            if LHMP:IsRemixItem(itemID) and (C_Item.GetItemCount(itemID) >= minCount) and minCount > 0 then
                                --table.insert(itemQueue, { itemLink = itemLink, ID = itemID })
                                btn.icon:SetTexture(C_Item.GetItemIconByID(itemLink))
                                btn:SetAttribute("type1", "item")
                                btn:SetAttribute("item", itemLink)
                            end
                        end
                    end
                end
            end
        end)
        btn:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
            GameTooltip:SetText("Remix: Mists of Pandaria")
            GameTooltip:AddLine("Click to combine gems and add threads to your Cloak of Infinite Potential.", 1, 1, 1, true)
            GameTooltip:Show()
        end)
        btn:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)
    end
end

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            if PlayerGetTimerunningSeasonID() == 1 then
                EventRegistry:RegisterCallback("CharacterFrame.Show", function()
                    MakeButton("TOPLEFT", CharacterFrame, "TOPRIGHT", 10, 0)
                end)
            end

            -- Unregister the event for performance.
            eventHandler:UnregisterEvent("ADDON_LOADED")
        end
    end
end)