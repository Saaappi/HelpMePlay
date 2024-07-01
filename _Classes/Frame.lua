local _, addon = ...

addon.CreateFrame = function(frameType, frameData)
    if frameType == "Portrait" then
        local frame = CreateFrame("Frame", frameData.name, frameData.parent, "PortraitFrameTemplate")
        frame:SetSize(frameData.width, frameData.height)

        -- Make the frame movable.
        frame:SetMovable(true)
        frame:SetScript("OnMouseDown", function(self)
            self:StartMoving()
        end)
        frame:SetScript("OnMouseUp", function(self)
            self:StopMovingOrSizing()
        end)

        -- Make sure the frame can't be moved off screen.
        frame:SetClampedToScreen(true)

        -- Hide the frame so it's not shown immediately after
        -- creation.
        frame:Hide()

        return frame
    end
end