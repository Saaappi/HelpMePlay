local addonName, addon = ...
local LibDD = LibStub:GetLibrary("LibUIDropDownMenu-4.0")

-- Font Strings
local actionBarsSectionFont
local cVarsSectionFont

-- Check Buttons
local clearAllTrackingCB
local autoLootCB
local disableTutorialsCB
local autoPushSpellsCB
local classColorFramesCB
local lootWindowUnderMouseCB
local disableDialogCB

-- DropDowns
local editModeDropDown

local Panel = CreateFrame("Frame", addonName .. "NewCharacterConfigurationPanel")
Panel.name = "New Character Config"
Panel.parent = _G[addonName .. "SettingsPanel"].name
InterfaceOptions_AddCategory(Panel)

-- Get all the player's Edit Mode layouts and return them
-- so the dropdown menu can populate its options with
-- the player's layouts.
local function GetLayouts()
    local layouts = {
        {
            ["text"] = "Modern",
            ["disabled"] = false,
            ["func"] = function()
                local layoutID = 1
                HelpMePlayDB["NCC_EditModeLayoutID"] = layoutID
                LibDD:UIDropDownMenu_SetSelectedValue(editModeDropDown, layoutID, layoutID)
                LibDD:UIDropDownMenu_SetText(editModeDropDown, "Modern")
            end,
        },
        {
            ["text"] = "Classic",
            ["disabled"] = false,
            ["func"] = function()
                local layoutID = 2
                HelpMePlayDB["NCC_EditModeLayoutID"] = layoutID
                LibDD:UIDropDownMenu_SetSelectedValue(editModeDropDown, layoutID, layoutID)
                LibDD:UIDropDownMenu_SetText(editModeDropDown, "Classic")
            end,
        },
    }
    local gameLayouts = C_EditMode.GetLayouts()
    for index, layout in ipairs(gameLayouts.layouts) do
        table.insert(layouts, (index + 2),
            {
                ["text"] = layout.layoutName,
                ["disabled"] = false,
                ["func"] = function()
                    local layoutID = index + 2
                    HelpMePlayDB["NCC_EditModeLayoutID"] = layoutID
                    LibDD:UIDropDownMenu_SetSelectedValue(editModeDropDown, layoutID, layoutID)
                    LibDD:UIDropDownMenu_SetText(editModeDropDown, layout.layoutName)
                end,
            }
        )
    end

    return layouts
end

C_Timer.After(5, function()
    -- Create an enable button. If it's enabled, then the new character
    -- button will appear for new characters. If it's disabled, then
    -- the button won't appear.
    local nccEnabledCB = CreateFrame("CheckButton", addonName .. "NewCharacterConfigurationEnabledCB", Panel, "SettingsCheckBoxTemplate")
    nccEnabledCB:SetPoint("TOPRIGHT", -15, -10)

    nccEnabledCB.text = nccEnabledCB:CreateFontString(nil, nil, "GameTooltipText")
    nccEnabledCB.text:SetPoint("RIGHT", nccEnabledCB, "LEFT", -5, 0)
    nccEnabledCB.text:SetText("Enabled")

    nccEnabledCB:SetScript("OnClick", function()
        HelpMePlayDB["NCCEnabled"] = nccEnabledCB:GetChecked()
        if nccEnabledCB:GetChecked() then
            addon.NewCharacter()
        end
    end)
    nccEnabledCB:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
        GameTooltip:SetText("New Character Configuration")
        GameTooltip:AddLine("Toggle the New Character Configuration system on or off.", 1, 1, 1, true)
        GameTooltip:Show()
    end)
    nccEnabledCB:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    nccEnabledCB:SetChecked(HelpMePlayDB["NCCEnabled"])

    -- Action Bars Section Title
    actionBarsSectionFont = Panel:CreateFontString(addonName .. "ActionBars", nil, "GameTooltipText")
    actionBarsSectionFont:SetPoint("TOPLEFT", 15, -10)
    actionBarsSectionFont:SetText("Action Bars")

    -- Using a loop, create 7 check buttons, each corresponding to
    -- the action bar toggles in the settings.
    for i = 2, 8 do
        local actionBarCheckButton = CreateFrame("CheckButton", (addonName .. "ActionBarButtonCB" .. i), Panel, "SettingsCheckBoxTemplate")
        if i == 2 then
            actionBarCheckButton:SetPoint("TOPLEFT", Panel, "TOPLEFT", 15, -30)
        else
            actionBarCheckButton:SetPoint("TOPLEFT", _G[addonName .. "ActionBarButtonCB" .. (i - 1)], "BOTTOMLEFT", 0, -5)
        end

        actionBarCheckButton.text = actionBarCheckButton:CreateFontString(nil, nil, "GameTooltipText")
        actionBarCheckButton.text:SetPoint("LEFT", actionBarCheckButton, "RIGHT", 5, 0)
        actionBarCheckButton.text:SetText("Action Bar " .. i)

        actionBarCheckButton:SetScript("OnClick", function()
            HelpMePlayDB["NCC_ActionBar" .. i] = actionBarCheckButton:GetChecked()
        end)
        actionBarCheckButton:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
            GameTooltip:SetText("Action Bar " .. i)
            GameTooltip:AddLine(format("Toggle to control visibility for Action Bar %d.", i), 1, 1, 1, true)
            GameTooltip:Show()
        end)
        actionBarCheckButton:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)

        actionBarCheckButton:SetChecked(HelpMePlayDB["NCC_ActionBar" .. i])
    end

    -- CVars Section Title
    cVarsSectionFont = Panel:CreateFontString(addonName .. "CVars", nil, "GameTooltipText")
    cVarsSectionFont:SetPoint("TOPLEFT", _G[addonName .. "ActionBarButtonCB" .. 8], "BOTTOMLEFT", 0, -20)
    cVarsSectionFont:SetText("CVars")

    -- This check button toggles automation to clear the minimap of all
    -- tracking options.
    clearAllTrackingCB = {
        name = addonName .. "ClearAllTrackingCB",
        parent = _G[addonName .. "ActionBarButtonCB" .. 8],
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -40,
        tooltipHeader = "Clear All Tracking",
        tooltipText = "Toggle to clear all tracking options from the minimap. De-toggle to keep the default tracking options enabled.",
        onClick = function()
            HelpMePlayDB["ClearAllTracking"] = clearAllTrackingCB:GetChecked()
        end,
    }
    setmetatable(clearAllTrackingCB, { __index = HelpMePlay.Button })
    clearAllTrackingCB = clearAllTrackingCB:CheckButton()
    clearAllTrackingCB:SetChecked(HelpMePlayDB["ClearAllTracking"])

    -- This check button toggles Auto Loot on.
    autoLootCB = {
        name = addonName .. "AutoLootCB",
        parent = clearAllTrackingCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Auto Loot",
        tooltipText = "Toggle to enable Auto Loot. De-toggle to disable Auto Loot.",
        onClick = function()
            HelpMePlayDB["AutoLoot"] = autoLootCB:GetChecked()
        end,
    }
    setmetatable(autoLootCB, { __index = HelpMePlay.Button })
    autoLootCB = autoLootCB:CheckButton()
    autoLootCB:SetChecked(HelpMePlayDB["AutoLoot"])

    -- This check button will prevent the tutorial popups.
    disableTutorialsCB = {
        name = addonName .. "DisableTutorialsCB",
        parent = autoLootCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Disable Tutorials",
        tooltipText = "Toggle to disable the tutorial popups. De-toggle if you wish to see the tutorial popups.",
        onClick = function()
            HelpMePlayDB["DisableTutorials"] = disableTutorialsCB:GetChecked()
        end,
    }
    setmetatable(disableTutorialsCB, { __index = HelpMePlay.Button })
    disableTutorialsCB = disableTutorialsCB:CheckButton()
    disableTutorialsCB:SetChecked(HelpMePlayDB["DisableTutorials"])

    -- This check button will prevent new spells from being pushed
    -- to the action bars automatically.
    autoPushSpellsCB = {
        name = addonName .. "AutoPushSpellsCB",
        parent = disableTutorialsCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Auto Push Spells",
        tooltipText = "Toggle to automatically push spells to your action bars. De-toggle if you don't want spells to automatically push to your action bars.",
        onClick = function()
            HelpMePlayDB["AutoPushSpells"] = autoPushSpellsCB:GetChecked()
        end,
    }
    setmetatable(autoPushSpellsCB, { __index = HelpMePlay.Button })
    autoPushSpellsCB = autoPushSpellsCB:CheckButton()
    autoPushSpellsCB:SetChecked(HelpMePlayDB["AutoPushSpells"])

    -- This check button will make the PvP and PvE frames use class
    -- colors.
    classColorFramesCB = {
        name = addonName .. "ClassColorFramesCB",
        parent = autoPushSpellsCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Class Color Frames",
        tooltipText = "Toggle to make the PvP and raid frames use class colors instead of health. De-toggle to keep health as the defining color.",
        onClick = function()
            HelpMePlayDB["ClassColorFrames"] = classColorFramesCB:GetChecked()
        end,
    }
    setmetatable(classColorFramesCB, { __index = HelpMePlay.Button })
    classColorFramesCB = classColorFramesCB:CheckButton()
    classColorFramesCB:SetChecked(HelpMePlayDB["ClassColorFrames"])

    -- This check button will make the loot window appear under the
    -- mouse.
    lootWindowUnderMouseCB = {
        name = addonName .. "LootWindowUnderMouseCB",
        parent = classColorFramesCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Loot Under Mouse",
        tooltipText = "Toggle to make the loot window appear under your mouse. De-toggle to make the loot window appear near the top-left corner.",
        onClick = function()
            HelpMePlayDB["LootUnderMouse"] = lootWindowUnderMouseCB:GetChecked()
        end,
    }
    setmetatable(lootWindowUnderMouseCB, { __index = HelpMePlay.Button })
    lootWindowUnderMouseCB = lootWindowUnderMouseCB:CheckButton()
    lootWindowUnderMouseCB:SetChecked(HelpMePlayDB["LootUnderMouse"])

    -- This check button grants the ability to toggle dialog.
    disableDialogCB = {
        name = addonName .. "DisableDialogCB",
        parent = lootWindowUnderMouseCB,
        anchor = "TOPLEFT",
        relativeAnchor = "BOTTOMLEFT",
        oX = 0,
        oY = -5,
        tooltipHeader = "Disable Dialog",
        tooltipText = "Toggle to silence dialog. De-toggle to enable dialog.",
        onClick = function()
            HelpMePlayDB["DisableDialog"] = disableDialogCB:GetChecked()
        end,
    }
    setmetatable(disableDialogCB, { __index = HelpMePlay.Button })
    disableDialogCB = disableDialogCB:CheckButton()
    disableDialogCB:SetChecked(HelpMePlayDB["DisableDialog"])

    -- This dropdown will allow players to define the Edit Mode
    -- layout they wish to use on all their characters.
    editModeDropDown = {
        name = addonName .. "EditModeDropDown",
        parent = _G[addonName .. "ActionBarButtonCB" .. 2],
        anchor = "LEFT",
        relativeAnchor = "RIGHT",
        oX = 200,
        oY = 0,
        width = 150,
        height = 38,
        title = "Edit Mode",
        tooltipHeader = "Edit Mode",
        tooltipText = "Select the default layout you would like all your new characters to use.",
        options = GetLayouts(),
    }
    setmetatable(editModeDropDown, { __index = HelpMePlay.DropDown })
    editModeDropDown = editModeDropDown:DropDown()
    LibDD:UIDropDownMenu_SetText(editModeDropDown, GetLayouts()[HelpMePlayDB["NCC_EditModeLayoutID"]].text)
end)