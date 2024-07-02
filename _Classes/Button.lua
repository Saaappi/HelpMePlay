local _, addon = ...

addon.CreateWidget = function(widgetType, widgetData)
    if widgetType == "ActionButton" then
        local actionButton = CreateFrame("Button", widgetData.name, widgetData.parent, "ActionButtonTemplate")
        actionButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")

        return actionButton
    end
    if widgetType == "BasicButton" then
        local basicButton = CreateFrame("Button", widgetData.name, widgetData.parent, "UIPanelButtonTemplate")
        basicButton:SetSize(widgetData.width, widgetData.height)
        basicButton:RegisterForClicks("LeftButtonUp")

        basicButton:SetText(widgetData.text)

        return basicButton
    end
    if widgetType == "IconButton" then
        local iconButton = CreateFrame("Button", widgetData.name, widgetData.parent)
        iconButton:SetSize(widgetData.width, widgetData.height)
        iconButton:RegisterForClicks("LeftButtonUp")

        local parent = iconButton:GetName()
        iconButton.icon = iconButton:CreateTexture(format("%sIcon", parent), "ARTWORK")
        iconButton.icon:SetTexture(widgetData.texture)
        iconButton.icon:SetAllPoints()

        iconButton.blackCover = iconButton:CreateTexture(format("%sBlackCover", parent), "OVERLAY")
        iconButton.blackCover:SetColorTexture(0, 0, 0, 0.6)

        iconButton.border = iconButton:CreateTexture(format("%sBorder", parent), "OVERLAY")
        iconButton.border:SetSize(widgetData.width + 10, widgetData.height + 10)
        iconButton.border:SetPoint("CENTER")
        iconButton.border:SetAtlas("Forge-ColorSwatchHighlight", false)

        iconButton.highlightTexture = iconButton:CreateTexture(format("%sHighlightTexture", parent), "OVERLAY", nil, 1)
        iconButton.highlightTexture:SetAtlas("UI-HUD-ActionBar-IconFrame-Mouseover", false)
        iconButton.highlightTexture:SetSize(widgetData.width + 6, widgetData.height + 6)
        iconButton.highlightTexture:SetPoint("CENTER")
        iconButton:SetHighlightTexture(iconButton.highlightTexture, "ADD")

        iconButton.pushedTexture = iconButton:CreateTexture(format("%sPushedTexture", parent), "OVERLAY", nil, 1)
        iconButton.pushedTexture:SetAtlas("UI-HUD-ActionBar-IconFrame-Mouseover", false)
        iconButton.pushedTexture:SetSize(widgetData.width + 4, widgetData.height + 4)
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
        -- Create the button and set its scale.
        local secureButton = CreateFrame("Button", widgetData.name, widgetData.parent, "SecureActionButtonTemplate, ActionButtonTemplate")
        secureButton:SetScale(widgetData.scale)

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
            secureButton.saveName = widgetData.saveName
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
                local anchor, parent, relativeAnchor, xOff, yOff = self:GetPoint()
                HelpMePlayDB.Positions[widgetData.saveName] = {anchor = anchor, parent = parent, relativeAnchor = relativeAnchor, xOff = xOff, yOff = yOff}
            end)
        end

        return secureButton
    end
end

addon.ResetWidgetPosition = function(saveName, position)
    if HelpMePlayDB.Positions[saveName] then
        HelpMePlayDB.Positions[saveName] = nil
        widget:SetPoint(position.anchor, position.parent, position.relativeAnchor, position.xOff, position.yOff)
    end
end