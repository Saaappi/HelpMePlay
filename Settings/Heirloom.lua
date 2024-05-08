local addonName, addon = ...
local LibDD = LibStub:GetLibrary("LibUIDropDownMenu-4.0")

-- This is the talent importer frame variable.
local frame

-- This is the back button to reset the frame.
local backButton

-- This is the default height and width of the talent importer frame.
local frameBaseHeight = 125
local frameBaseWidth = 725

-- This is the expanded height and width of the talent importer frame.
local frameExpandedHeight = 375
--local frameExpandedWidth = 0 -- unused

-- These variables are some minor configuration for the frame.
local frameTitle = "Heirloom Selection"
local frameIcon = 1030912

-- TODO: Replace with variables for dropdowns.
-- This is the default height and width of the edit boxes.
--local editBoxHeight = 20
--local editBoxWidth = 375

-- Hide the edit boxes if they already exist so as not to cause a visual
-- bug when they're created again.
local function HideDropDowns()
    for j = 1, 2 do
        if _G[addonName .. "HeirloomDropDown" .. j] then
            if _G[addonName .. "HeirloomDropDown" .. j]:IsVisible() then
                _G[addonName .. "HeirloomDropDown" .. j]:Hide()
                _G[addonName .. "HeirloomDropDown" .. j] = nil
            end
        end
    end
    return true
end

-- Function to update the text for an edit box.
local function UpdateText(editBox, text, importDate, importPatch)
    if text then
        editBox:SetText(text)
    end
    editBox.importDateText:SetText(format("%s |cffFFD100(%s)|r", importDate, importPatch))

    return true
end

-- This is the function to build the talent importer frame.
-- This is called when the Talent Importer button is clicked
-- from the settings.
addon.OpenHeirloomSelector = function()
    -- If the frame is already visible, then hide it.
    if frame then
        if frame:IsVisible() then
            frame:Hide()
            return
        end
    end

    -- If the frame hasn't been created yet (it's just an empty table),
    -- then let's create it!
    --
    -- If the frame already exists, then it's being reopened, so reset
    -- its height back to the base value.
    if not frame then
        frame = {
            name = addonName .. "HeirloomSelectionFrame",
            parent = UIParent,
            width = frameBaseWidth,
            height = frameBaseHeight,
        }
        setmetatable(frame, { __index = HelpMePlay.Frame })
        frame = frame:PortraitFrame()
    else
        frame:SetHeight(frameBaseHeight)
    end

    -- TODO: Is there a better way to hide these editboxes so they're
    -- not recreated on every creation? Is the frame:Hide() redundant?
    --
    -- By default, selecting the close button doesn't hide the children.
    -- This may or may not be intended, so for right now I loop, hide the
    -- editboxes, then set them to nil. Afterward, I hide the frame; the
    -- last bit is probably redundant.
    _G[frame:GetName() .. "CloseButton"]:SetScript("OnClick", function()
        HideDropDowns()
        backButton:Hide()
        frame:Hide()
    end)

    -- Set the frame's title, icon, and position.
    frame:SetTitle(frameTitle)
    frame:SetPortraitToAsset(frameIcon)
    frame:SetPoint("CENTER", frame:GetParent(), "CENTER", 0, 0)

    -- Create the class icon buttons if they don't exist.
    if not _G[addon.classButtons[1].name] then
        for index, btn in ipairs(addon.classButtons) do
            local button = {
                name = btn.name,
                parent = frame,
                ID = btn.id,
                classID = btn.classID,
                atlas = btn.atlas
            }
            setmetatable(button, { __index = HelpMePlay.Button })
            button = button:ActionButton()

            button:SetScript("OnClick", function()
                -- Resize the frame to accommodate the edit boxes.
                button:GetParent():SetHeight(frameExpandedHeight)

                -- Delete the dropdowns if they already exist to prevent them
                -- from overlapping when they're recreated.
                HideDropDowns()

                for i = 1, 1 do
                    -- Create the dropdown menus.
                    local dropDown = LibDD:Create_UIDropDownMenu(addonName .. "HeirloomDropDown" .. i, frame)
                    UIDropDownMenu_SetWidth(dropDown, 125)

                    dropDown.title = dropDown:CreateFontString(nil, "OVERLAY", "GameTooltipText")
                    dropDown.title:SetPoint("BOTTOMLEFT", dropDown["title"]:GetParent(), "TOPLEFT", 15, 5)
                    if i == 1 then
                        dropDown.title:SetText("Head")
                    else
                        dropDown.title:SetText("Shoulder")
                    end

                    --[[LibDD:UIDropDownMenu_Initialize(dropDown, function(self, level)
                        local info = LibDD:UIDropDownMenu_CreateInfo()
                        for key, option in ipairs(myDropDown.options) do
                            info.text = option.text
                            info.checked = false
                            info.menuList = key
                            info.disabled = option.disabled
                            info.tooltipTitle = option.tooltipTitle
                            info.tooltipText = option.tooltipText
                            info.tooltipOnButton = 1
                            info.func = option.func
                            LibDD:UIDropDownMenu_AddButton(info)
                        end
                    end)]]

                    if i == 1 then
                        dropDown:SetPoint("TOPLEFT", addon.classButtons[1].name, "BOTTOMLEFT", 0, -40)
                    else
                        dropDown:SetPoint("TOPLEFT", addon.classButtons[1].name, "BOTTOMLEFT", 0, -100)
                    end
                    -- Create the edit box. Don't auto focus them, set their size,
                    -- and select their default font.
                    --[[local editBox = CreateFrame("EditBox", addonName .. "SpecEditBox" .. i, frame, "InputBoxTemplate")
                    editBox:SetAutoFocus(false)
                    editBox:SetSize(editBoxWidth, editBoxHeight)
                    editBox:SetFontObject("ChatFontNormal")

                    -- Create the specialization icon texture to indicate which spec
                    -- the corresponding edit box (the one to its right) is for.
                    local texture = editBox:CreateTexture(nil, "BACKGROUND")
                    texture:SetPoint("BOTTOMRIGHT", _G[addonName .. "SpecEditBox" .. i], "BOTTOMLEFT", -10, 0)
                    texture:SetSize(specIconTextureSize, specIconTextureSize)
                    SetPortraitToTexture(texture, select(4, GetSpecializationInfoByID(addon.specEditBoxes[button.ID][i].id)))

                    -- Create the border texture to overlay the specialization icon
                    -- texture above.
                    local border = editBox:CreateTexture(nil, "BORDER")
                    border:SetPoint("CENTER", texture, "CENTER", 0, 0)
                    border:SetSize(borderTextureSize, borderTextureSize)
                    border:SetAtlas("Artifacts-PerkRing-Final", false)

                    -- Create a font string to use on the right-hand side of the edit
                    -- box for the importDate value.
                    editBox.importDateText = editBox:CreateFontString(nil, "OVERLAY", "GameTooltipText")
                    editBox.importDateText:SetPoint("TOPLEFT", editBox, "TOPRIGHT", 5, 0)
                    editBox.importDateText:SetPoint("BOTTOMLEFT", editBox, "BOTTOMRIGHT", 5, 0)

                    -- If the player already imported a string in the past, go ahead
                    -- and display that in the editbox.
                    local classTalents = HelpMePlayDB["ClassTalents"][button.classID][addon.specEditBoxes[button.ID][i].id]

                    if classTalents then
                        -- TODO: Remove this at some point.
                        -- I'm splitting the importDate field into two separate fields.
                        -- This field will be nil until the user enters a new loadout.
                        -- As such, set the importPatch field to the current patch.
                        if not classTalents.importPatch then
                            classTalents.importPatch = (GetBuildInfo())
                        end

                        -- TODO: Remove this at some point.
                        -- Let's trim the importDate field to remove the patch information.
                        if string.match(classTalents.importDate, "(.-) %(.-%)") then
                            classTalents.importDate = string.match(classTalents.importDate, "(.-) %(.-%)")
                        end
                        UpdateText(editBox, classTalents.importString, classTalents.importDate, classTalents.importPatch)
                    else
                        UpdateText(editBox, format("|cffFF0000%s %s.|r", "Please import a loadout for", addon.specEditBoxes[button.ID][i].name), "", "")
                    end

                    -- Set the new talent build when the player presses the enter key.
                    editBox:SetScript("OnEnterPressed", function(self)
                        -- Clear the focus so the player doesn't get stuck in the edit box.
                        self:ClearFocus()

                        -- If classTalents is nil here, then the table for that spec hasn't been
                        -- created yet. Create it as an empty table.
                        if not classTalents then
                            HelpMePlayDB.ClassTalents[button.classID][addon.specEditBoxes[button.ID][i].id] = {}
                            classTalents = HelpMePlayDB.ClassTalents[button.classID][addon.specEditBoxes[button.ID][i].id]
                        end

                        -- If the text is empty, then we didn't find a talent import string for
                        -- the spec. Instead, put some text in there to indicate as much.
                        --
                        -- Initialize the importString and importDate variables so they're not nil.
                        if self:GetText() == "" then
                            HelpMePlayDB.ClassTalents[button.classID][addon.specEditBoxes[button.ID][i].id].importString = self:GetText()
                            HelpMePlayDB.ClassTalents[button.classID][addon.specEditBoxes[button.ID][i].id].importDate = self:GetText()
                            HelpMePlayDB.ClassTalents[button.classID][addon.specEditBoxes[button.ID][i].id].importPatch = self:GetText()
                        else
                            HelpMePlayDB.ClassTalents[button.classID][addon.specEditBoxes[button.ID][i].id].importString = self:GetText()
                            HelpMePlayDB.ClassTalents[button.classID][addon.specEditBoxes[button.ID][i].id].importDate = date("%m/%d/%Y")
                            HelpMePlayDB.ClassTalents[button.classID][addon.specEditBoxes[button.ID][i].id].importPatch = (GetBuildInfo())
                            classTalents = HelpMePlayDB.ClassTalents[button.classID][addon.specEditBoxes[button.ID][i].id]
                            UpdateText(editBox, nil, classTalents.importDate, classTalents.importPatch)
                        end
                    end)

                    -- Set the edit box positions.
                    if i == 1 then
                        editBox:SetPoint("TOPLEFT", addon.classButtons[2].name, "BOTTOMLEFT", 0, -40)
                        editBox:SetPoint("TOPRIGHT", addon.classButtons[8].name, "BOTTOMRIGHT", 0, -40)
                    else
                        editBox:SetPoint("TOPLEFT", addonName .. "SpecEditBox" .. (i - 1), "BOTTOMLEFT", 0, -20)
                    end]]
                end

                -- Create the back button. This back button just resets the frame,
                -- so not entirely necessary but I think it's nice. :)
                if not backButton then
                    backButton = {
                        name = addonName .. "HeirloomSelectionBackButton",
                        parent = frame,
                        anchor = "BOTTOMRIGHT",
                        relativeAnchor = "BOTTOMRIGHT",
                        oX = -10,
                        oY = 10,
                        width = 80,
                        height = 25,
                        text = "Back",
                        tooltipHeader = "",
                        tooltipText = "",
                        onClick = nil,
                    }
                    setmetatable(backButton, { __index = HelpMePlay.Button })
                    backButton = backButton:BaseButton()
                    backButton:SetScript("OnClick", function(self)
                        frame:SetHeight(frameBaseHeight)
                        HideDropDowns()
                        backButton:Hide()
                    end)
                else
                    backButton:Show()
                end
            end)
            button:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
                GameTooltip:SetText(btn.className, btn.classColor.r, btn.classColor.g, btn.classColor.b)
                GameTooltip:Show()
            end)
            button:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)

            -- Set the class button positions.
            if index == 1 then
                button:SetPoint("TOPLEFT", button:GetParent(), "TOPLEFT", 10, -60)
            else
                button:SetPoint("LEFT", addon.classButtons[index-1].name, "RIGHT", 10, 0)
            end
        end
    end
    frame:Show()
end