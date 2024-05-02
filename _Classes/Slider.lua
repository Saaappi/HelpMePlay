local addonName, addon = ...
local eventHandler = CreateFrame("Frame")

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            HelpMePlay.Slider = {
                Slider = function(mySlider)
                    local slider = CreateFrame("Slider", mySlider.name, mySlider.parent, "UISliderTemplateWithLabels")
                    slider:SetSize(mySlider.width, mySlider.height)

                    slider:SetMinMaxValues(mySlider.minValue, mySlider.maxValue)
                    --slider:SetValue(HelpMePlayDB["QuestMobsIconXOffset"])
                    slider:SetValueStep(mySlider.valueStep)

                    slider:SetObeyStepOnDrag(true)

                    slider["title"] = slider:CreateFontString(mySlider.name .. "TitleText", nil, "GameTooltipText")
                    slider["title"]:SetPoint("BOTTOMLEFT", slider, "TOPLEFT", 0, 3)
                    slider["title"]:SetText(mySlider.tooltipHeader)

                    slider.Low:SetText(mySlider.minValue)
                    slider.High:SetText(mySlider.maxValue)

                    slider["value"] = slider:CreateFontString(mySlider.name .. "ValueText", nil, "GameTooltipText")
                    slider["value"]:SetPoint("BOTTOMRIGHT", slider, "TOPRIGHT", 0, 3)

                    slider:SetPoint(mySlider.anchor, mySlider.parent, mySlider.relativeAnchor, mySlider.oX, mySlider.oY)

                    return slider
                end,
            }
        end

        -- Unload the event for performance.
        eventHandler:UnregisterEvent("ADDON_LOADED")
    end
end)