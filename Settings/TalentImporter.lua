local addonName, addon = ...
local talentImporterFrame
local talentImporterFrameHeight = 200

addon.OpenTalentImporter = function()
    if talentImporterFrame then
        if talentImporterFrame:IsVisible() then
            talentImporterFrame:Hide()
            return
        end
    end

    if not talentImporterFrame then
        talentImporterFrame = {
            name = addonName .. "TalentImporterFrame",
            parent = UIParent,
            width = 400,
            height = talentImporterFrameHeight
        }
        setmetatable(talentImporterFrame, { __index = HelpMePlay.Frame })
        talentImporterFrame = talentImporterFrame:PortraitFrame()
    else
        talentImporterFrame:SetHeight(200)
    end

    _G[talentImporterFrame:GetName() .. "CloseButton"]:SetScript("OnClick", function()
        for j = 1, 4 do
            if _G[addonName .. "SpecEditBox" .. j] then
                if _G[addonName .. "SpecEditBox" .. j]:IsVisible() then
                    _G[addonName .. "SpecEditBox" .. j]:Hide()
                    _G[addonName .. "SpecEditBox" .. j] = nil
                end
            end
        end
        talentImporterFrame:Hide()
    end)

    talentImporterFrame:SetTitle("Talent Importer")
    talentImporterFrame:SetPortraitToAsset(132222)
    talentImporterFrame:SetPoint("CENTER", talentImporterFrame:GetParent(), "CENTER", 0, 0)

    local classButtons = {
        {
            ["id"] = 1,
            ["name"] = addonName .. "DeathKnightButton",
            ["atlas"] = "classicon-deathknight",
            ["classID"] = 6,
            ["className"] = "Death Knight",
            ["classColor"] = C_ClassColor.GetClassColor("DEATHKNIGHT"),
        },
        {
            ["id"] = 2,
            ["name"] = addonName .. "DemonHunterButton",
            ["atlas"] = "classicon-demonhunter",
            ["classID"] = 12,
            ["className"] = "Demon Hunter",
            ["classColor"] = C_ClassColor.GetClassColor("DEMONHUNTER"),
        },
        {
            ["id"] = 3,
            ["name"] = addonName .. "DruidButton",
            ["atlas"] = "classicon-druid",
            ["classID"] = 11,
            ["className"] = "Druid",
            ["classColor"] = C_ClassColor.GetClassColor("DRUID"),
        },
        {
            ["id"] = 4,
            ["name"] = addonName .. "EvokerButton",
            ["atlas"] = "classicon-evoker",
            ["classID"] = 13,
            ["className"] = "Evoker",
            ["classColor"] = C_ClassColor.GetClassColor("EVOKER"),
        },
        {
            ["id"] = 5,
            ["name"] = addonName .. "HunterButton",
            ["atlas"] = "classicon-hunter",
            ["classID"] = 3,
            ["className"] = "Hunter",
            ["classColor"] = C_ClassColor.GetClassColor("HUNTER"),
        },
        {
            ["id"] = 6,
            ["name"] = addonName .. "MageButton",
            ["atlas"] = "classicon-mage",
            ["classID"] = 8,
            ["className"] = "Mage",
            ["classColor"] = C_ClassColor.GetClassColor("MAGE"),
        },
        {
            ["id"] = 7,
            ["name"] = addonName .. "MonkButton",
            ["atlas"] = "classicon-monk",
            ["classID"] = 10,
            ["className"] = "Monk",
            ["classColor"] = C_ClassColor.GetClassColor("MONK"),
        },
        {
            ["id"] = 8,
            ["name"] = addonName .. "PaladinButton",
            ["atlas"] = "classicon-paladin",
            ["classID"] = 2,
            ["className"] = "Paladin",
            ["classColor"] = C_ClassColor.GetClassColor("PALADIN"),
        },
        {
            ["id"] = 9,
            ["name"] = addonName .. "PriestButton",
            ["atlas"] = "classicon-priest",
            ["classID"] = 5,
            ["className"] = "Priest",
            ["classColor"] = C_ClassColor.GetClassColor("PRIEST"),
        },
        {
            ["id"] = 10,
            ["name"] = addonName .. "RogueButton",
            ["atlas"] = "classicon-rogue",
            ["classID"] = 4,
            ["className"] = "Rogue",
            ["classColor"] = C_ClassColor.GetClassColor("ROGUE"),
        },
        {
            ["id"] = 11,
            ["name"] = addonName .. "ShamanButton",
            ["atlas"] = "classicon-shaman",
            ["classID"] = 7,
            ["className"] = "Shaman",
            ["classColor"] = C_ClassColor.GetClassColor("SHAMAN"),
        },
        {
            ["id"] = 12,
            ["name"] = addonName .. "WarlockButton",
            ["atlas"] = "classicon-warlock",
            ["classID"] = 9,
            ["className"] = "Warlock",
            ["classColor"] = C_ClassColor.GetClassColor("WARLOCK"),
        },
        {
            ["id"] = 13,
            ["name"] = addonName .. "WarriorButton",
            ["atlas"] = "classicon-warrior",
            ["classID"] = 1,
            ["className"] = "Warrior",
            ["classColor"] = C_ClassColor.GetClassColor("WARRIOR"),
        },
    }

    local specEditBoxes = {
        { -- Death Knight
            {
                ["id"] = 250,
                ["name"] = "Blood",
            },
            {
                ["id"] = 251,
                ["name"] = "Frost",
            },
            {
                ["id"] = 252,
                ["name"] = "Unholy",
            }
        },
        { -- Demon Hunter
            {
                ["id"] = 577,
                ["name"] = "Havoc",
            },
            {
                ["id"] = 581,
                ["name"] = "Vengeance",
            }
        },
        { -- Druid
            {
                ["id"] = 102,
                ["name"] = "Balance",
            },
            {
                ["id"] = 103,
                ["name"] = "Feral",
            },
            {
                ["id"] = 104,
                ["name"] = "Guardian",
            },
            {
                ["id"] = 105,
                ["name"] = "Restoration",
            },
        },
        { -- Evoker
            {
                ["id"] = 1473,
                ["name"] = "Augmentation",
            },
            {
                ["id"] = 1467,
                ["name"] = "Devastation",
            },
            {
                ["id"] = 1468,
                ["name"] = "Preservation",
            },
        },
        { -- Hunter
            {
                ["id"] = 253,
                ["name"] = "Beast Mastery",
            },
            {
                ["id"] = 254,
                ["name"] = "Marksmanship",
            },
            {
                ["id"] = 255,
                ["name"] = "Survival",
            },
        },
        { -- Mage
            {
                ["id"] = 62,
                ["name"] = "Arcane",
            },
            {
                ["id"] = 63,
                ["name"] = "Fire",
            },
            {
                ["id"] = 64,
                ["name"] = "Frost",
            },
        },
        { -- Monk
            {
                ["id"] = 268,
                ["name"] = "Brewmaster",
            },
            {
                ["id"] = 270,
                ["name"] = "Mistweaver",
            },
            {
                ["id"] = 269,
                ["name"] = "Windwalker",
            },
        },
        { -- Paladin
            {
                ["id"] = 65,
                ["name"] = "Holy",
            },
            {
                ["id"] = 66,
                ["name"] = "Protection",
            },
            {
                ["id"] = 70,
                ["name"] = "Retribution",
            },
        },
        { -- Priest
            {
                ["id"] = 256,
                ["name"] = "Discipline",
            },
            {
                ["id"] = 257,
                ["name"] = "Holy",
            },
            {
                ["id"] = 258,
                ["name"] = "Shadow",
            },
        },
        { -- Rogue
            {
                ["id"] = 259,
                ["name"] = "Assassination",
            },
            {
                ["id"] = 260,
                ["name"] = "Outlaw",
            },
            {
                ["id"] = 261,
                ["name"] = "Subtlety",
            },
        },
        { -- Shaman
            {
                ["id"] = 262,
                ["name"] = "Elemental",
            },
            {
                ["id"] = 263,
                ["name"] = "Enhancement",
            },
            {
                ["id"] = 264,
                ["name"] = "Restoration",
            },
        },
        { -- Warlock
            {
                ["id"] = 265,
                ["name"] = "Affliction",
            },
            {
                ["id"] = 266,
                ["name"] = "Demonology",
            },
            {
                ["id"] = 267,
                ["name"] = "Destruction",
            },
        },
        { -- Warrior
            {
                ["id"] = 71,
                ["name"] = "Arms",
            },
            {
                ["id"] = 72,
                ["name"] = "Fury",
            },
            {
                ["id"] = 73,
                ["name"] = "Protection",
            },
        },
    }

    if not _G[classButtons[1].name] then
        for index, btn in ipairs(classButtons) do
            local button = CreateFrame("Button", btn.name, talentImporterFrame, "ActionButtonTemplate")
            button["id"] = btn.id
            button["classID"] = btn.classID
            button:RegisterForClicks("LeftButtonUp")
            ---@diagnostic disable-next-line: undefined-field
            button.icon:SetAtlas(btn.atlas)

            button:SetScript("OnClick", function()
                talentImporterFrameHeight = 375
                button:GetParent():SetHeight(talentImporterFrameHeight)

                -- If the editboxes already exist, then delete them.
                for j = 1, 4 do
                    if _G[addonName .. "SpecEditBox" .. j] then
                        if _G[addonName .. "SpecEditBox" .. j]:IsVisible() then
                            _G[addonName .. "SpecEditBox" .. j]:Hide()
                            _G[addonName .. "SpecEditBox" .. j] = nil
                        end
                    end
                end

                for i = 1, #specEditBoxes[button.id] do
                    local editBox = CreateFrame("EditBox", addonName .. "SpecEditBox" .. i, talentImporterFrame, "InputBoxTemplate")
                    editBox:SetAutoFocus(false)
                    editBox:SetSize(375, 20)
                    editBox:SetFontObject("ChatFontNormal")

                    editBox["title"] = editBox:CreateFontString(nil, "OVERLAY", "GameTooltipText")
                    editBox["title"]:SetPoint("BOTTOMLEFT", editBox["title"]:GetParent(), "TOPLEFT", 0, 5)
                    local classTalents = HelpMePlayDB["ClassTalents"][button.classID][specEditBoxes[button.id][i].id]
                    if classTalents and (classTalents.importString ~= nil and classTalents.importString ~= "") then
                        editBox["title"]:SetText(specEditBoxes[button.id][i].name .. " - " .. classTalents.importDate)
                    else
                        editBox["title"]:SetText(specEditBoxes[button.id][i].name .. " - |cffFF0000No previous import available|r")
                    end

                    -- If the player already imported a string in the past, go ahead
                    -- and display that in the editbox.
                    if classTalents then
                        editBox:SetText(classTalents.importString)
                    end

                    editBox:SetScript("OnEnterPressed", function(self)
                        self:ClearFocus()
                        if not classTalents then
                            HelpMePlayDB.ClassTalents[button.classID][specEditBoxes[button.id][i].id] = {}
                            classTalents = HelpMePlayDB.ClassTalents[button.classID][specEditBoxes[button.id][i].id]
                        end

                        if self:GetText() == "" then
                            HelpMePlayDB.ClassTalents[button.classID][specEditBoxes[button.id][i].id].importString = self:GetText()
                            HelpMePlayDB.ClassTalents[button.classID][specEditBoxes[button.id][i].id].importDate = self:GetText()
                            editBox["title"]:SetText(specEditBoxes[button.id][i].name .. " - |cffFF0000No previous import available|r")
                        else
                            HelpMePlayDB.ClassTalents[button.classID][specEditBoxes[button.id][i].id].importString = self:GetText()
                            HelpMePlayDB.ClassTalents[button.classID][specEditBoxes[button.id][i].id].importDate = "|cffFFD100" .. date("%m/%d/%Y") .. " (" .. (GetBuildInfo()) .. ")|r"
                            self["title"]:SetText(specEditBoxes[button.id][i].name .. " - " .. classTalents.importDate)
                        end
                    end)

                    if i == 1 then
                        editBox:SetPoint("TOPLEFT", classButtons[8].name, "BOTTOMLEFT", 0, -40)
                    else
                        editBox:SetPoint("TOPLEFT", addonName .. "SpecEditBox" .. (i-1), "BOTTOMLEFT", 0, -25)
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

            if index == 1 then
                button:SetPoint("TOPLEFT", button:GetParent(), "TOPLEFT", 10, -60)
            elseif index < 8 then
                button:SetPoint("LEFT", classButtons[index-1].name, "RIGHT", 11, 0)
            else
                button:SetPoint("TOP", classButtons[index-7].name, "BOTTOM", 0, -20)
            end
        end
    end

    talentImporterFrame:Show()
end