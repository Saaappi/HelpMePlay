local addonName, addon = ...

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
local frameTitle = "Talent Importer"
local frameIcon = 132222

-- This is the default height and width of the edit boxes.
local editBoxHeight = 20
local editBoxWidth = 375

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

-- This is the function to build the talent importer frame.
-- This is called when the Talent Importer button is clicked
-- from the settings.
addon.OpenTalentImporter = function()
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
            name = addonName .. "TalentImporterFrame",
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
        HideEditBoxes()
        --frame:Hide()
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

                -- Delete the editboxes if they already exist to prevent them
                -- from overlapping when they're recreated.
                HideEditBoxes()

                for i = 1, #addon.specEditBoxes[button.ID] do
                    -- Create the edit box. Don't auto focus them, set their size,
                    -- and select their default font.
                    local editBox = CreateFrame("EditBox", addonName .. "SpecEditBox" .. i, frame, "InputBoxTemplate")
                    editBox:SetAutoFocus(false)
                    editBox:SetSize(editBoxWidth, editBoxHeight)
                    editBox:SetFontObject("ChatFontNormal")

                    --[[ I plan to do away with the title on the bars. I want to use spec icons next to the
                        bars instead. :)
                    editBox["title"] = editBox:CreateFontString(nil, "OVERLAY", "GameTooltipText")
                    editBox["title"]:SetPoint("BOTTOMLEFT", editBox["title"]:GetParent(), "TOPLEFT", 0, 5)
                    local classTalents = HelpMePlayDB["ClassTalents"][button.classID][specEditBoxes[button.id][i].id]
                    if classTalents and (classTalents.importString ~= nil and classTalents.importString ~= "") then
                        editBox["title"]:SetText(specEditBoxes[button.id][i].name .. " - " .. classTalents.importDate)
                    else
                        editBox["title"]:SetText(specEditBoxes[button.id][i].name .. " - |cffFF0000No previous import available|r")
                    end
                    ]]

                    -- If the player already imported a string in the past, go ahead
                    -- and display that in the editbox.
                    local classTalents = HelpMePlayDB["ClassTalents"][button.classID][addon.specEditBoxes[button.ID][i].id]
                    if classTalents then
                        editBox:SetText(classTalents.importString)
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
                            HelpMePlayDB.ClassTalents[button.classID][addon.specEditBoxes[button.id][i].id].importString = self:GetText()
                            HelpMePlayDB.ClassTalents[button.classID][addon.specEditBoxes[button.id][i].id].importDate = self:GetText()
                            self:SetText("|cffFF0000No previous import available|r")
                        else
                            HelpMePlayDB.ClassTalents[button.classID][addon.specEditBoxes[button.id][i].id].importString = self:GetText()
                            HelpMePlayDB.ClassTalents[button.classID][addon.specEditBoxes[button.id][i].id].importDate = "|cffFFD100" .. date("%m/%d/%Y") .. " (" .. (GetBuildInfo()) .. ")|r"
                        end
                    end)

                    if i == 1 then
                        editBox:SetPoint("TOPLEFT", addon.classButtons[8].name, "BOTTOMLEFT", 0, -40)
                    else
                        editBox:SetPoint("TOPLEFT", addonName .. "SpecEditBox" .. (i - 1), "BOTTOMLEFT", 0, -25)
                    end

                    -- Create the back button.
                    if not backButton then
                        backButton = {
                            name = addonName .. "TalentImporterBackButton",
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
                        backButton:SetScript("OnClick", function(self, button)
                            frame:SetHeight(frameBaseHeight)
                            HideEditBoxes()
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