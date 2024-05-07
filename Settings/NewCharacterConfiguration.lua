local addonName, addon = ...

-- Font Strings
local actionBarsSectionFont

local Panel = CreateFrame("Frame", addonName .. "NewCharacterConfigurationPanel")
Panel.name = "New Character Config"
Panel.parent = _G[addonName .. "SettingsPanel"].name
InterfaceOptions_AddCategory(Panel)

C_Timer.After(5, function()
    actionBarsSectionFont = Panel:CreateFontString(addonName .. "ActionBars", nil, "GameTooltipText")
    actionBarsSectionFont:SetPoint("TOPLEFT", 15, -10)
    actionBarsSectionFont:SetText("Action Bars")

    for i = 2, 8 do
        local actionBarCheckButton = CreateFrame("CheckButton", (addonName .. "ActionBarButtonCB" .. i), Panel, "SettingsCheckBoxTemplate")
        actionBarCheckButton:ClearAllPoints()
        if i == 2 then
            actionBarCheckButton:SetPoint("TOPLEFT", Panel, "TOPLEFT", 15, -20)
        else
            actionBarCheckButton:SetPoint("TOPLEFT", _G[addonName .. "ActionBarButtonCB" .. i], "BOTTOMLEFT", 0, -5)
        end

        actionBarCheckButton.text = actionBarCheckButton:CreateFontString(nil, nil, "GameTooltipText")
        actionBarCheckButton.text:SetPoint("LEFT", actionBarCheckButton, "RIGHT", 5, 0)
        actionBarCheckButton.text:SetText("Action Bar " .. i)

        actionBarCheckButton:SetScript("OnClick", function()
            HelpMePlayDB["NCC_ActionBar" .. i] = actionBarCheckButton:GetChecked()
        end)
    end
end)