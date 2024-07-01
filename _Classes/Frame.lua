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
                end
            }
        end

        -- Unload the event for performance.
        eventHandler:UnregisterEvent("ADDON_LOADED")
    end
end)