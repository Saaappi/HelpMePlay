local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            HelpMePlay.Frame = {
                PortraitFrame = function(portraitFrame)
                    local frame = CreateFrame("Frame", portraitFrame.name, portraitFrame.parent, "PortraitFrameTemplate")
                    frame:SetSize(portraitFrame.width, portraitFrame.height)

                    -- Make the frame movable.
                    frame:SetMovable(true)
                    frame:SetScript("OnMouseDown", function(frm)
                        frm:StartMoving()
                    end)
                    frame:SetScript("OnMouseUp", function(frm)
                        frm:StopMovingOrSizing()
                    end)

                    -- Make sure the frame can't be moved off screen.
                    frame:SetClampedToScreen(true)

                    -- Hide the frame so it's not shown immediately after
                    -- creation.
                    frame:Hide()

                    return frame
                end,
                EditBox = function(myEditBox)
                    local editBox = CreateFrame("EditBox", myEditBox.name, myEditBox.parent, "InputBoxTemplate")
                    editBox:SetAutoFocus(false)
                    editBox:SetSize(myEditBox.width, myEditBox.height)
                    editBox:SetFontObject("ChatFontNormal")
                    editBox:SetMaxLetters(myEditBox.maxLetters)

                    editBox["title"] = editBox:CreateFontString(nil, "OVERLAY", "GameTooltipText")
                    editBox["title"]:SetPoint("BOTTOMLEFT", editBox["title"]:GetParent(), "TOPLEFT", 0, 10)
                    editBox["title"]:SetText(myEditBox.title)

                    editBox:SetScript("OnEnterPressed", myEditBox.onEnterPressed)
                    editBox:SetScript("OnEnter", function()
                        GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
                        GameTooltip:SetText(myEditBox.tooltipHeader)
                        GameTooltip:AddLine(myEditBox.tooltipText, 1, 1, 1, true)
                        GameTooltip:Show()
                    end)
                    editBox:SetScript("OnLeave", function()
                        GameTooltip:Hide()
                    end)

                    editBox:SetPoint(myEditBox.anchor, myEditBox.parent, myEditBox.relativeAnchor, myEditBox.oX, myEditBox.oY)

                    return editBox
                end,
            }
        end

        -- Unload the event for performance.
        eventHandler:UnregisterEvent("ADDON_LOADED")
    end
end)