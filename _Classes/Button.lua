local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            HelpMePlay.Button = {
                BaseButton = function(button)
                    local basicButton = CreateFrame("Button", button.name, button.parent, "UIPanelButtonTemplate")
                    basicButton:SetSize(button.width, button.height)
                    basicButton:RegisterForClicks("LeftButtonUp")

                    basicButton:SetText(button.text)

                    basicButton:SetScript("OnClick", button.onClick)
                    basicButton:SetScript("OnEnter", function()
                        GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
                        GameTooltip:SetText(button.tooltipHeader)
                        GameTooltip:AddLine("|cffFFFFFF" .. button.tooltipText .. "|r")
                        GameTooltip:Show()
                    end)
                    basicButton:SetScript("OnLeave", function()
                        GameTooltip:Hide()
                    end)

                    basicButton:SetPoint(button.anchor, button.parent, button.relativeAnchor, button.oX, button.oY)

                    return basicButton
                end,
                IconButton = function(button)
                    local iconButton = CreateFrame("Button", button.name, button.parent, "UIPanelButtonTemplate")
                    iconButton:SetSize(button.width, button.height)
                    iconButton:RegisterForClicks("LeftButtonUp")

                    iconButton["texture"] = iconButton:CreateTexture()
                    iconButton["texture"]:SetTexture(button.texture)
                    iconButton["texture"]:SetAllPoints()

                    iconButton["highlightTexture"] = iconButton:CreateTexture()
                    iconButton["highlightTexture"]:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
                    iconButton["highlightTexture"]:SetSize(button.width, button.height)
                    iconButton:SetHighlightTexture(iconButton["highlightTexture"], "ADD")

                    iconButton["pushedTexture"] = iconButton:CreateTexture()
                    iconButton["pushedTexture"]:SetTexture("Interface\\Buttons\\UI-Quickslot-Depress")
                    iconButton["pushedTexture"]:SetSize(button.width, button.height)
                    iconButton:SetPushedTexture(iconButton["pushedTexture"])

                    iconButton:SetScript("OnClick", button.onClick)
                    iconButton:SetScript("OnEnter", function()
                        GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
                        GameTooltip:SetText(button.tooltipHeader)
                        GameTooltip:AddLine(button.tooltipText, 1, 1, 1, true)
                        GameTooltip:Show()
                    end)
                    iconButton:SetScript("OnLeave", function()
                        GameTooltip:Hide()
                    end)

                    iconButton:SetPoint(button.anchor, button.parent, button.relativeAnchor, button.oX, button.oY)

                    return iconButton
                end,
                IconButtonSelfTooltip = function(button)
                    local iconButton = CreateFrame("Button", button.name, button.parent, "UIPanelButtonTemplate")
                    iconButton:SetSize(button.width, button.height)
                    iconButton:RegisterForClicks("LeftButtonUp")

                    iconButton["texture"] = iconButton:CreateTexture()
                    iconButton["texture"]:SetTexture(button.texture)
                    iconButton["texture"]:SetAllPoints()

                    iconButton["highlightTexture"] = iconButton:CreateTexture()
                    iconButton["highlightTexture"]:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
                    iconButton["highlightTexture"]:SetSize(button.width, button.height)
                    iconButton:SetHighlightTexture(iconButton["highlightTexture"], "ADD")

                    iconButton["pushedTexture"] = iconButton:CreateTexture()
                    iconButton["pushedTexture"]:SetTexture("Interface\\Buttons\\UI-Quickslot-Depress")
                    iconButton["pushedTexture"]:SetSize(button.width, button.height)
                    iconButton:SetPushedTexture(iconButton["pushedTexture"])

                    iconButton:SetScript("OnEnter", button.onEnter)
                    iconButton:SetScript("OnClick", button.onClick)
                    iconButton:SetScript("OnLeave", function()
                        GameTooltip:Hide()
                    end)

                    iconButton:SetPoint(button.anchor, button.parent, button.relativeAnchor, button.oX, button.oY)

                    return iconButton
                end,
                SecureButton = function(button)
                    local secureButton = CreateFrame("Button", button.name, button.parent, "SecureActionButtonTemplate")
                    secureButton:ClearAllPoints()
                    secureButton:SetSize(button.width, button.height)
                    secureButton:SetPoint(button.anchor, button.parent, button.relativeAnchor, button.oX, button.oY)

                    secureButton["texture"] = secureButton:CreateTexture()
                    secureButton["texture"]:SetTexture(button.texture)
                    secureButton["texture"]:SetAllPoints()

                    secureButton["highlightTexture"] = secureButton:CreateTexture()
                    secureButton["highlightTexture"]:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
                    secureButton["highlightTexture"]:SetSize(button.width, button.height)
                    secureButton:SetHighlightTexture(secureButton["highlightTexture"], "ADD")

                    secureButton["pushedTexture"] = secureButton:CreateTexture()
                    secureButton["pushedTexture"]:SetTexture("Interface\\Buttons\\UI-Quickslot-Depress")
                    secureButton["pushedTexture"]:SetSize(button.width, button.height)
                    secureButton:SetPushedTexture(secureButton["pushedTexture"])

                    secureButton:RegisterForClicks("AnyUp", "AnyDown")
                    secureButton:SetMouseClickEnabled(true)
                    secureButton:SetAttribute("type", button.attribute)
                    secureButton:SetAttribute(button.attribute, button.attributeValue)

                    secureButton:SetScript("PostClick", button.postClick)

                    return secureButton
                end,
                CheckButton = function(button)
                    local checkButton = CreateFrame("CheckButton", button.name, button.parent, "SettingsCheckBoxTemplate")
                    checkButton:ClearAllPoints()
                    checkButton:SetPoint(button.anchor, button.parent, button.relativeAnchor, button.oX, button.oY)

                    checkButton["text"] = checkButton:CreateFontString(button.name .. "Text", nil, "GameTooltipText")
                    checkButton["text"]:SetPoint("LEFT", checkButton, "RIGHT", 5, 0)
                    checkButton["text"]:SetText(button.tooltipHeader)

                    checkButton:SetScript("OnClick", button.onClick)
                    checkButton:SetScript("OnEnter", function()
                        GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
                        GameTooltip:SetText(button.tooltipHeader)
                        GameTooltip:AddLine(button.tooltipText, 1, 1, 1, true)
                        GameTooltip:Show()
                    end)
                    checkButton:SetScript("OnLeave", function()
                        GameTooltip:Hide()
                    end)

                    return checkButton
                end,
                HelpButton = function(button)
                    local helpButton = CreateFrame("Button", button.name, button.parent, "UIPanelButtonTemplate")
                    helpButton:SetSize(button.width, button.height)
                    helpButton:RegisterForClicks("LeftButtonUp")

                    helpButton:SetHighlightTexture("Interface/Minimap/UI-Minimap-ZoomButton-Highlight")
                    helpButton:SetNormalTexture("Interface/FriendsFrame/InformationIcon")

                    helpButton:SetScript("OnEnter", function()
                        GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
                        GameTooltip:AddLine(button.tooltipText, 1, 1, 1, true)
                        GameTooltip:Show()
                    end)
                    helpButton:SetScript("OnLeave", function()
                        GameTooltip:Hide()
                    end)

                    helpButton:SetPoint(button.anchor, button.parent, button.relativeAnchor, button.oX, button.oY)

                    return helpButton
                end,
                ActionButton = function(button)
                    local actionButton = CreateFrame("Button", button.name, button.parent, "ActionButtonTemplate")
                    actionButton.ID = button.ID
                    actionButton.classID = button.classID
                    actionButton:RegisterForClicks("LeftButton")
                    actionButton.icon:SetAtlas(button.atlas)

                    return actionButton
                end,
            }
        end

        -- Unload the event for performance.
        eventHandler:UnregisterEvent("ADDON_LOADED")
    end
end)