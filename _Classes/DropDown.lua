---@diagnostic disable: undefined-field
local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local LibDD = LibStub:GetLibrary("LibUIDropDownMenu-4.0")

eventHandler:RegisterEvent("ADDON_LOADED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local addonLoaded = ...
        if addonLoaded == addonName then
            HelpMePlay.DropDown = {
                DropDown = function(myDropDown)
                    local dropDown = LibDD:Create_UIDropDownMenu(myDropDown.name, myDropDown.parent)
                    UIDropDownMenu_SetWidth(dropDown, 125)

                    dropDown["title"] = dropDown:CreateFontString(nil, "OVERLAY", "GameTooltipText")
                    dropDown["title"]:SetPoint("BOTTOMLEFT", dropDown["title"]:GetParent(), "TOPLEFT", 15, 5)
                    dropDown["title"]:SetText(myDropDown.title)

                    dropDown:SetScript("OnEnter", function()
                        GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
                        GameTooltip:SetText(myDropDown.tooltipHeader)
                        GameTooltip:AddLine("|cffFFFFFF" .. myDropDown.tooltipText .. "|r", 1, 1, 1, true)
                        GameTooltip:Show()
                    end)
                    dropDown:SetScript("OnLeave", function()
                        GameTooltip:Hide()
                    end)

                    LibDD:UIDropDownMenu_Initialize(dropDown, function(self, level)
                        local info = LibDD:UIDropDownMenu_CreateInfo()
                        for key, option in ipairs(myDropDown.options) do
                            info.text = option.text
                            info.checked = false
                            info.menuList = key
                            info.disabled = option.disabled
                            info.func = option.func
                            LibDD:UIDropDownMenu_AddButton(info)
                        end
                    end)

                    dropDown:SetPoint(myDropDown.anchor, myDropDown.parent, myDropDown.relativeAnchor, myDropDown.oX, myDropDown.oY)

                    return dropDown
                end,
            }
        end

        -- Unload the event for performance.
        eventHandler:UnregisterEvent("ADDON_LOADED")
    end
end)