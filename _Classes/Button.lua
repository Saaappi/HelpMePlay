local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

addon.CreateWidget = function(widgetType, widgetData)
    --[[ DEPRECATED - 2024/06/30
    if widgetType == "BasicButton" then
        local basicButton = CreateFrame("Button", widgetData.name, widgetData.parent, "UIPanelButtonTemplate")
        basicButton:SetSize(widgetData.width, widgetData.height)
        basicButton:RegisterForClicks("LeftButtonUp")

        basicButton:SetText(widgetData.text)

        basicButton:SetScript("OnClick", widgetData.onClick)

        basicButton:SetPoint(widgetData.anchor, widgetData.parent, widgetData.relativeAnchor, widgetData.oX, widgetData.oY)

        return basicButton
    end]]
    if widgetType == "IconButton" then
        local iconButton = CreateFrame("Button", widgetData.name, widgetData.parent)
        iconButton:SetPoint(widgetData.anchor, widgetData.parent, widgetData.relativeAnchor, widgetData.xOff, widgetData.yOff)
        iconButton:SetSize(widgetData.width, widgetData.height)
        iconButton:RegisterForClicks("LeftButtonUp")

        local parent = iconButton:GetName()
        iconButton.icon = iconButton:CreateTexture(format("%sIcon", parent), "ARTWORK")
        iconButton.icon:SetTexture(widgetData.texture)
        iconButton.icon:SetAllPoints()

        iconButton.blackCover = iconButton:CreateTexture(format("%sBlackCover", parent), "OVERLAY")
        iconButton.blackCover:SetColorTexture(0, 0, 0, 0.6)

        iconButton.border = iconButton:CreateTexture(format("%sBorder", parent), "OVERLAY")
        iconButton.border:SetSize(42, 42)
        iconButton.border:SetPoint("CENTER")
        iconButton.border:SetAtlas("Forge-ColorSwatchHighlight", false)

        iconButton.highlightTexture = iconButton:CreateTexture(format("%sHighlightTexture", parent), "OVERLAY", nil, 1)
        iconButton.highlightTexture:SetAtlas("UI-HUD-ActionBar-IconFrame-Mouseover", false)
        iconButton.highlightTexture:SetSize(38, 38)
        iconButton.highlightTexture:SetPoint("CENTER")
        iconButton:SetHighlightTexture(iconButton.highlightTexture, "ADD")

        iconButton.pushedTexture = iconButton:CreateTexture(format("%sPushedTexture", parent), "OVERLAY", nil, 1)
        iconButton.pushedTexture:SetAtlas("UI-HUD-ActionBar-IconFrame-Mouseover", false)
        iconButton.pushedTexture:SetSize(36, 36)
        iconButton.pushedTexture:SetPoint("CENTER")
        iconButton:SetPushedTexture(iconButton.pushedTexture)

        if (not iconButton.buttonName) and widgetData.useFontString then
            iconButton.buttonName = iconButton:CreateFontString(format("%sButtonName", parent), "ARTWORK", "GameFontNormal")
            iconButton.buttonName:SetPoint("RIGHT", iconButton.border, "LEFT", -2, 0)
            iconButton.buttonName:SetMaxLines(2)
            iconButton.buttonName:SetText(format("|cffFFFFFF%s|r", widgetData.fontStringText))
            iconButton.buttonName:SetJustifyH("RIGHT")
            iconButton.buttonName:SetWordWrap(true)
        end

        return iconButton
    end
    if widgetType == "SecureButton" then
        -- Create the button and set its position.
        local secureButton = CreateFrame("Button", widgetData.name, widgetData.parent, "SecureActionButtonTemplate, ActionButtonTemplate")
        secureButton:SetPoint(widgetData.anchor, widgetData.parent, widgetData.relativeAnchor, widgetData.xOff, widgetData.yOff)

        -- Texture stuff.
        if type(widgetData.icon) == "string" then
            secureButton.icon:SetAtlas(widgetData.icon)
        else
            secureButton.icon:SetTexture(widgetData.icon)
        end

        -- Button registration.
        secureButton:RegisterForClicks("AnyUp")
        secureButton:SetMouseClickEnabled(true)

        -- Make the frame movable.
        if widgetData.isMovable then
            secureButton:SetMovable(true)
            secureButton:EnableMouse(true)
            secureButton:RegisterForDrag("LeftButton")
            secureButton:SetScript("OnDragStart", function(self)
                self:StartMoving()
            end)
            secureButton:SetScript("OnDragStop", function(self)
                -- Once the frame stops moving, get the position data so we
                -- can open the frame at that position next time.
                self:StopMovingOrSizing()
                local anchor, parent, relativeAnchor, x, y = self:GetPoint()
                HelpMePlayDB.Positions[widgetData.saveName] = {anchor = anchor, parent = parent, relativeAnchor = relativeAnchor, x = x, y = y}
            end)
        end

        return secureButton
    end
end

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            HelpMePlay.Button = {
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
                    actionButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
                    actionButton.icon:SetAtlas(button.atlas)

                    return actionButton
                end,
            }
        end

        -- Unload the event for performance.
        eventHandler:UnregisterEvent("ADDON_LOADED")
    end
end)