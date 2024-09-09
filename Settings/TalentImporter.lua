local addonName, HelpMePlay = ...
local LHMP = LibStub("LibHelpMePlay")

-- This is the talent importer frame variable.
local frame

-- This is the back button to reset the frame.
local backButton

-- This is the default height and width of the talent importer frame.
local frameBaseHeight = 300
local frameBaseWidth = 230.000015259

-- This is the expanded height and width of the talent importer frame.
local frameExpandedHeight = 275
local frameExpandedWidth = 315

-- These variables are some minor configuration for the frame.
local frameTitle = "Talent Importer"
local frameIcon = 132222

-- This is the default height and width of the edit boxes.
local editBoxHeight = 20
local editBoxWidth = 250

-- This variable is the specialization icon texture size.
local specIconTextureSize = 32
local borderTextureSize = 37

local function HideClassButtons()
    for i = 1, 13 do
        if _G[HelpMePlay.classButtons[i].name] then
            if _G[HelpMePlay.classButtons[i].name]:IsVisible() then
                _G[HelpMePlay.classButtons[i].name]:Hide()
            else
                _G[HelpMePlay.classButtons[i].name]:Show()
            end
        end
    end
    return true
end

-- Hide the edit boxes if they already exist so as not to cause a visual
-- bug when they're created again.
local function HideEditBoxes()
    for j = 1, 4 do
        if _G[addonName .. "SpecEditBox" .. j] then
            if _G[addonName .. "SpecEditBox" .. j]:IsVisible() then
                _G[addonName .. "SpecEditBox" .. j]:Hide()
                _G[addonName .. "SpecEditBox" .. j] = nil
            end
        end
    end
    return true
end

-- Function to update the text for an edit box.
local function UpdateText(editBox, text)
    if text then
        editBox:SetText(text)
    end

    return true
end

-- This is the function to build the talent importer frame.
-- This is called when the Talent Importer button is clicked
-- from the settings.
HelpMePlay.OpenTalentImporter = function()
    if InCombatLockdown() then
        HelpMePlay.Print(HelpMePlay.ErrorMessages["IN_COMBAT_LOCKDOWN"])
        return
    end

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
        frame = HelpMePlay.CreateFrame("Portrait", {
            name = string.format("%sTalentImporterFrame", addonName),
            movable = true,
            saveName = "TalentImporterFrame",
            parent = UIParent,
            width = frameBaseWidth,
            height = frameBaseHeight,
        })
    else
        frame:SetHeight(frameBaseHeight)
    end

    -- By default, selecting the close button doesn't hide the children.
    -- This may or may not be intended, so for right now I loop, hide the
    -- editboxes, then set them to nil. Afterward, I hide the frame; the
    -- last bit is probably redundant.
    _G[frame:GetName() .. "CloseButton"]:SetScript("OnClick", function()
        HideEditBoxes()
        if backButton then
            backButton:Hide()
        end
        frame:Hide()
    end)

    -- Set the frame's title and portrait
    frame:SetTitle(frameTitle)
    frame:SetPortraitToAsset(frameIcon)

    -- Set the frame's position.
    if HelpMePlayDB.Positions["TalentImporterFrame"] then
        local pos = HelpMePlayDB.Positions["TalentImporterFrame"]
		frame:SetPoint(pos.anchor, pos.parent, pos.relativeAnchor, pos.xOff, pos.yOff)
    else
        frame:SetPoint("CENTER", frame:GetParent(), "CENTER", 0, 75)
    end

    -- Create the class icon buttons if they don't exist.
    if not _G[HelpMePlay.classButtons[1].name] then
        for index, btn in ipairs(HelpMePlay.classButtons) do
            local button = HelpMePlay.CreateWidget("ActionButton", {
                name = btn.name,
                parent = frame
            })

            button.ID = btn.id
            button.classID = btn.classID
            button.icon:SetAtlas(btn.atlas)

            button:SetScript("OnClick", function()
                -- Resize the frame to accommodate the edit boxes.
                button:GetParent():SetWidth(frameExpandedWidth)
                button:GetParent():SetHeight(frameExpandedHeight)

                -- Hide the class buttons.
                HideClassButtons()

                -- Delete the editboxes if they already exist to prevent them
                -- from overlapping when they're recreated.
                HideEditBoxes()

                for i = 1, #HelpMePlay.specEditBoxes[button.ID] do
                    -- Create the edit box. Don't auto focus them, set their size,
                    -- and select their default font.
                    local editBox = CreateFrame("EditBox", addonName .. "SpecEditBox" .. i, frame, "InputBoxTemplate")
                    editBox:SetAutoFocus(false)
                    editBox:SetSize(editBoxWidth, editBoxHeight)
                    editBox:SetFontObject("ChatFontNormal")

                    -- Create the specialization icon texture to indicate which spec
                    -- the corresponding edit box (the one to its right) is for.
                    local texture = editBox:CreateTexture(nil, "BACKGROUND")
                    texture:SetPoint("BOTTOMRIGHT", _G[addonName .. "SpecEditBox" .. i], "BOTTOMLEFT", -10, 0)
                    texture:SetSize(specIconTextureSize, specIconTextureSize)
                    SetPortraitToTexture(texture, select(4, GetSpecializationInfoByID(HelpMePlay.specEditBoxes[button.ID][i].id)))

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
                    local classTalents = HelpMePlayDB["ClassTalents"][button.classID][HelpMePlay.specEditBoxes[button.ID][i].id]

                    if classTalents then
                        UpdateText(editBox, classTalents.importString)
                    else
                        UpdateText(editBox, string.format("|cffFF0000%s %s.|r", "Please import a loadout for", HelpMePlay.specEditBoxes[button.ID][i].name))
                    end

                    -- Set the new talent build when the player presses the enter key.
                    editBox:SetScript("OnEnterPressed", function(self)
                        -- Clear the focus so the player doesn't get stuck in the edit box.
                        self:ClearFocus()

                        -- If classTalents is nil here, then the table for that spec hasn't been
                        -- created yet. Create it as an empty table.
                        if not classTalents then
                            HelpMePlayDB.ClassTalents[button.classID][HelpMePlay.specEditBoxes[button.ID][i].id] = {}
                            classTalents = HelpMePlayDB.ClassTalents[button.classID][HelpMePlay.specEditBoxes[button.ID][i].id]
                        end

                        -- If the text is empty, then we didn't find a talent import string for
                        -- the spec. Instead, put some text in there to indicate as much.
                        --
                        -- Initialize the importString and importDate variables so they're not nil.
                        if self:GetText() == "" then
                            HelpMePlayDB.ClassTalents[button.classID][HelpMePlay.specEditBoxes[button.ID][i].id].importString = self:GetText()
                            HelpMePlayDB.ClassTalents[button.classID][HelpMePlay.specEditBoxes[button.ID][i].id].importDate = self:GetText()
                            HelpMePlayDB.ClassTalents[button.classID][HelpMePlay.specEditBoxes[button.ID][i].id].importPatch = self:GetText()
                        else
                            HelpMePlayDB.ClassTalents[button.classID][HelpMePlay.specEditBoxes[button.ID][i].id].importString = self:GetText()
                            HelpMePlayDB.ClassTalents[button.classID][HelpMePlay.specEditBoxes[button.ID][i].id].importDate = date("%m/%d/%Y")
                            HelpMePlayDB.ClassTalents[button.classID][HelpMePlay.specEditBoxes[button.ID][i].id].importPatch = (GetBuildInfo())
                            classTalents = HelpMePlayDB.ClassTalents[button.classID][HelpMePlay.specEditBoxes[button.ID][i].id]
                        end
                    end)

                    -- Set the edit box positions.
                    if i == 1 then
                        editBox:SetPoint("TOPLEFT", editBox:GetParent(), "TOPLEFT", 50, -80)
                    else
                        editBox:SetPoint("TOPLEFT", addonName .. "SpecEditBox" .. (i - 1), "BOTTOMLEFT", 0, -20)
                    end

                    editBox:SetScript("OnEnter", function(self)
                        local specName = select(2, GetSpecializationInfoByID(HelpMePlay.specEditBoxes[button.ID][i].id))
                        HelpMePlay.Tooltip_OnEnter(self, specName, string.format("%s |cffFFD100(%s)|r", classTalents.importDate, classTalents.importPatch))
                    end)
                    editBox:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)

                    -- Create the back button. This back button just resets the frame,
                    -- so not entirely necessary but I think it's nice. :)
                    if not backButton then
                        backButton = HelpMePlay.CreateWidget("BasicButton", {
                            name = string.format("%sTalentImporterBackButton", addonName),
                            parent = frame,
                            width = 80,
                            height = 25,
                            text = "Back",
                        })

                        backButton:ClearAllPoints()
                        backButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -10, 10)

                        backButton:SetScript("OnClick", function(self)
                            frame:SetWidth(frameBaseWidth)
                            frame:SetHeight(frameBaseHeight)
                            HideEditBoxes()
                            HideClassButtons()
                            backButton:Hide()
                        end)
                    else
                        backButton:Show()
                    end
                end
            end)
            button:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
                GameTooltip:SetText(btn.className, btn.classColor.r, btn.classColor.g, btn.classColor.b)
                GameTooltip:Show()
            end)
            button:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)

            -- Set the class button positions.
            if index == 1 then
                button:SetPoint("TOPLEFT", button:GetParent(), "TOPLEFT", 10, -60)
            elseif index == 5 then
                button:SetPoint("TOP", HelpMePlay.classButtons[1].name, "BOTTOM", 0, -10)
            elseif index == 9 then
                button:SetPoint("TOP", HelpMePlay.classButtons[5].name, "BOTTOM", 0, -10)
            elseif index == 13 then
                button:SetPoint("CENTER", button:GetParent(), "CENTER", 0, -95.000003814697)
            else
                button:SetPoint("LEFT", HelpMePlay.classButtons[index-1].name, "RIGHT", 10, 0)
            end
        end
    end
    frame:Show()
end