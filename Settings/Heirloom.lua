local addonName, addon = ...
local LibDD = LibStub:GetLibrary("LibUIDropDownMenu-4.0")

-- This is the talent importer frame variable.
local frame

-- Basic Buttons
local commitButton
local resetButton

-- Frame Variables
local frameBaseHeight = 125
local frameExpandedHeight = 375
local frameBaseWidth = 725
local frameTitle = "Heirlooms"
local frameIcon = 1030912

local index = 1
local looms = {}

-- Hide the dropdowns if they already exist. They shouldn't be recreated
-- and stack on top of one another.
local function HideDropDowns()
    for j = 1, #addon.HeirloomDropDowns do
        if _G[addonName .. "HeirloomDropDown" .. j] then
            if _G[addonName .. "HeirloomDropDown" .. j]:IsVisible() then
                _G[addonName .. "HeirloomDropDown" .. j]:Hide()
                _G[addonName .. "HeirloomDropDown" .. j] = nil
            end
        end
    end
    return true
end

-- Get the armor type subclass ID to use for determing which
-- heirlooms to show in armor slots.
local function GetHeirloomArmorTypeIDByClassID(classID)
    return addon.HeirloomArmorTypeIDByClass[classID]
end

-- This is used for weapon heirlooms to determine if an heirloom
-- weapon should be displayed for a given class.
local function IsHeirloomValidForClassID(classID, itemSubClassID)
    if addon.HeirloomEquipLoc[classID] then
        for _, v in ipairs(addon.HeirloomEquipLoc[classID]) do
            if itemSubClassID == v then
                return true
            end
        end
    end
    return false
end

-- This is to prevent heirloom duplication in the dropdowns.
-- Without it, clicking between class icons or closing/opening
-- the frame repeatedly will dupe the dropdown lists.
local function WipeHeirloomTables()
    for key, _ in pairs(addon.Heirlooms) do
        addon.Heirlooms[key] = {}
    end
end

-- Automatically equip the heirlooms as they're created for
-- a complete automated experience.
local function EquipHeirloom(itemLink)
    -- In case the player enters combat after creating an heirloom
    -- but before this function is called, then trigger a timer.
    if UnitAffectingCombat("player") then C_Timer.After(1, function() EquipHeirloom(itemLink) end) end

    -- Get the provided item link's ID. This is necessary for comparison
    -- to items in the inventory. For some reason item link comparison is
    -- busted. :)
    local itemID = C_Item.GetItemInfoInstant(itemLink)

    for bagID = 0, 4 do
        local numSlots = C_Container.GetContainerNumSlots(bagID)
        if numSlots > 0 then
            for slotID = 1, numSlots do
                local containerItemID = C_Container.GetContainerItemID(bagID, slotID)
                if containerItemID then
                    if containerItemID == itemID then
                        C_Item.EquipItemByName(itemLink)
                    end
                end
            end
        end
    end
end

local function CreateHeirloom(classID)
    -- Create the heirloom at the index.
    C_Heirloom.CreateHeirloom(HelpMePlayDB["Heirlooms"][classID][index].itemID)

    C_Timer.After(1, function()
        EquipHeirloom(HelpMePlayDB["Heirlooms"][classID][index].itemLink)
        -- Increment the index. Hide the button if the condition
        -- is met.
        index = index + 1
        if index == (#HelpMePlayDB["Heirlooms"][classID] + 1) then
            heirloomButton:Hide()
            return
        end

        heirloomButton:SetAttribute("type", "item")
        heirloomButton:SetAttribute("item", HelpMePlayDB["Heirlooms"][classID][index].itemID)
        heirloomButton.texture:SetTexture(C_Item.GetItemIconByID(HelpMePlayDB["Heirlooms"][classID][index].itemID))
        GameTooltip:SetHyperlink("item:" .. HelpMePlayDB["Heirlooms"][classID][index].itemID)
    end)
end

-- This is the function to build the talent importer frame.
-- This is called when the Talent Importer button is clicked
-- from the settings.
addon.OpenHeirloomSelector = function()
    -- If the frame is visible, then hide it instead of trying
    -- to create it a second time.
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
            name = addonName .. "HeirloomFrame",
            parent = UIParent,
            width = frameBaseWidth,
            height = frameBaseHeight,
        }
        setmetatable(frame, { __index = HelpMePlay.Frame })
        frame = frame:PortraitFrame()
    else
        frame:SetHeight(frameBaseHeight)
    end

    -- By default, for some reason, clicking the close button
    -- doesn't actually do anything. Therefore, a function
    -- must be called to clear the dropdowns and hide the parent
    -- frame.
    frame.CloseButton:SetScript("OnClick", function(self)
        HideDropDowns()
        self:GetParent():Hide()
    end)

    -- Set the frame's title, icon, and position.
    frame:SetTitle(frameTitle)
    frame:SetPortraitToAsset(frameIcon)
    frame:SetPoint("CENTER", frame:GetParent(), "CENTER", 0, 0)

    -- Create the class icon buttons if they don't exist.
    if not _G[addon.classButtons[1].name] then
        for buttonIndex, button in ipairs(addon.classButtons) do
            local classButton = {
                name = button.name,
                parent = frame,
                ID = button.id,
                classID = button.classID,
                atlas = button.atlas
            }
            setmetatable(classButton, { __index = HelpMePlay.Button })
            classButton = classButton:ActionButton()

            classButton:SetScript("OnClick", function()
                -- Resize the frame to accommodate the edit boxes.
                classButton:GetParent():SetHeight(frameExpandedHeight)

                if next(HelpMePlayDB["Heirlooms"][classButton.classID]) then
                    if commitButton then
                        commitButton:SetEnabled(false)
                    end
                end

                -- Delete the dropdowns if they already exist to prevent them
                -- from overlapping when they're recreated.
                HideDropDowns()

                -- Wipe the heirloom tables (in memory) to prevent heirlooms
                -- from compounding the dropdown menus.
                WipeHeirloomTables()

                -- Get the player's armor type by their class ID.
                local armorTypeID = GetHeirloomArmorTypeIDByClassID(button.classID)

                -- Get the item IDs of all the heirlooms in the game.
                local heirlooms = C_Heirloom.GetHeirloomItemIDs()
                for _, heirloomItemID in ipairs(heirlooms) do
                    -- If the player has the heirloom in question, then continue.
                    if C_Heirloom.PlayerHasHeirloom(heirloomItemID) then
                        local itemClassID, itemSubClassID = select(6, C_Item.GetItemInfoInstant(heirloomItemID))
                        local inventoryType = addon.InventoryType[C_Item.GetItemInventoryTypeByID(heirloomItemID)]
                        if itemClassID == 2 then -- Weapon
                            local isHeirloomValid = IsHeirloomValidForClassID(button.classID, itemSubClassID)
                            if isHeirloomValid then
                                local heirloomMaxLevel = select(10, C_Heirloom.GetHeirloomInfo(heirloomItemID))
                                if heirloomMaxLevel > addon.playerLevel then
                                    local itemLink = C_Heirloom.GetHeirloomLink(heirloomItemID)
                                    if type(inventoryType) == "table" then
                                        for i = 1, 2 do
                                            table.insert(addon.Heirlooms[inventoryType[i]], { itemLink = itemLink, itemID = heirloomItemID })
                                        end
                                    else
                                        table.insert(addon.Heirlooms[inventoryType], { itemLink = itemLink, itemID = heirloomItemID })
                                    end
                                end
                            end
                        elseif itemClassID == 4 and C_Item.GetItemInventoryTypeByID(heirloomItemID) == 2 then -- Neck
                            local heirloomMaxLevel = select(10, C_Heirloom.GetHeirloomInfo(heirloomItemID))
                            if heirloomMaxLevel > addon.playerLevel then
                                local itemLink = C_Heirloom.GetHeirloomLink(heirloomItemID)
                                table.insert(addon.Heirlooms[inventoryType], { itemLink = itemLink, itemID = heirloomItemID })
                            end
                        elseif itemClassID == 4 and C_Item.GetItemInventoryTypeByID(heirloomItemID) == 11 or C_Item.GetItemInventoryTypeByID(heirloomItemID) == 12 then -- Rings/Trinkets
                            local heirloomMaxLevel = select(10, C_Heirloom.GetHeirloomInfo(heirloomItemID))
                            if heirloomMaxLevel > addon.playerLevel then
                                local itemLink = C_Heirloom.GetHeirloomLink(heirloomItemID)
                                for i = 1, 2 do
                                    table.insert(addon.Heirlooms[inventoryType[i]], { itemLink = itemLink, itemID = heirloomItemID })
                                end
                            end
                        elseif itemClassID == 4 and inventoryType == 15 then -- Back
                            local heirloomMaxLevel = select(10, C_Heirloom.GetHeirloomInfo(heirloomItemID))
                            if heirloomMaxLevel > addon.playerLevel then
                                local itemLink = C_Heirloom.GetHeirloomLink(heirloomItemID)
                                table.insert(addon.Heirlooms[inventoryType], { itemLink = itemLink, itemID = heirloomItemID })
                            end
                        elseif itemClassID == 4 and C_Item.GetItemInventoryTypeByID(heirloomItemID) == 14 then -- Shields
                            local isHeirloomValid = IsHeirloomValidForClassID(button.classID, 21)
                            if isHeirloomValid then
                                local heirloomMaxLevel = select(10, C_Heirloom.GetHeirloomInfo(heirloomItemID))
                                if heirloomMaxLevel > addon.playerLevel then
                                    local itemLink = C_Heirloom.GetHeirloomLink(heirloomItemID)
                                    table.insert(addon.Heirlooms[inventoryType], { itemLink = itemLink, itemID = heirloomItemID })
                                end
                            end
                        elseif itemClassID == 4 then
                            local isHeirloomValid = (itemSubClassID == armorTypeID)
                            if isHeirloomValid then
                                local heirloomMaxLevel = select(10, C_Heirloom.GetHeirloomInfo(heirloomItemID))
                                if heirloomMaxLevel > addon.playerLevel then
                                    local itemLink = C_Heirloom.GetHeirloomLink(heirloomItemID)
                                    table.insert(addon.Heirlooms[inventoryType], { itemLink = itemLink, itemID = heirloomItemID })
                                end
                            end
                        end
                    end
                end

                for i, slot in ipairs(addon.HeirloomDropDowns) do
                    -- Create the dropdown menus.
                    local dropDown = LibDD:Create_UIDropDownMenu(addonName .. "HeirloomDropDown" .. i, frame)
                    UIDropDownMenu_SetWidth(dropDown, 125)

                    dropDown.title = dropDown:CreateFontString(nil, "OVERLAY", "GameTooltipText")
                    dropDown.title:SetPoint("BOTTOMLEFT", dropDown["title"]:GetParent(), "TOPLEFT", 15, 5)
                    dropDown.title:SetText(slot.name)

                    LibDD:UIDropDownMenu_Initialize(dropDown, function(self, level)
                        local info = LibDD:UIDropDownMenu_CreateInfo()
                        for key, option in ipairs(addon.Heirlooms[slot.id]) do
                            info.text = option.itemLink
                            info.checked = false
                            info.menuList = key
                            info.disabled = false
                            info.func = function()
                                table.insert(looms, { itemID = option.itemID, itemLink = option.itemLink })
                                LibDD:UIDropDownMenu_SetText(dropDown, looms[i].itemLink)
                            end
                            LibDD:UIDropDownMenu_AddButton(info)
                        end
                    end)
                    if HelpMePlayDB["Heirlooms"][classButton.classID][i] then
                        LibDD:UIDropDownMenu_SetText(dropDown, HelpMePlayDB["Heirlooms"][classButton.classID][i].itemLink)
                    end

                    if i == 1 then
                        dropDown:SetPoint("TOPLEFT", addon.classButtons[1].name, "BOTTOMLEFT", 0, -40)
                    elseif i == 5 then
                        dropDown:SetPoint("LEFT", addonName .. "HeirloomDropDown" .. (1), "RIGHT", 50, 0)
                    elseif i == 9 then
                        dropDown:SetPoint("LEFT", addonName .. "HeirloomDropDown" .. (5), "RIGHT", 50, 0)
                    else
                        dropDown:SetPoint("TOPLEFT", addonName .. "HeirloomDropDown" .. (i - 1), "BOTTOMLEFT", 0, -30)
                    end
                end

                -- Create the done button. This done button will close the selection
                -- frame and show a button in the middle of the characters screen to
                -- create their heirlooms. This will only need to be done once per
                -- class.
                if not commitButton then
                    commitButton = {
                        name = addonName .. "HeirloomCommitButton",
                        parent = _G[addon.classButtons[13].name],
                        anchor = "TOPRIGHT",
                        relativeAnchor = "BOTTOMRIGHT",
                        oX = 0,
                        oY = -20,
                        width = 80,
                        height = 25,
                        text = "Commit",
                        tooltipHeader = "Commit",
                        tooltipText = "Commit your heirloom selections for this class.",
                        onClick = nil,
                    }
                    setmetatable(commitButton, { __index = HelpMePlay.Button })
                    commitButton = commitButton:BaseButton()
                    commitButton:SetScript("OnClick", function(self)
                        HideDropDowns()
                        frame:Hide()
                        commitButton:Hide()
                        resetButton:Hide()
                        WipeHeirloomTables()
                        table.insert(HelpMePlayDB["Heirlooms"][addon.playerClassID], looms)
                    end)
                else
                    commitButton:Show()
                end

                -- Create the reset button. The reset button allows the player
                -- to wipe the saved settings for heirlooms on a given class.
                if not resetButton then
                    resetButton = {
                        name = addonName .. "HeirloomResetButton",
                        parent = commitButton,
                        anchor = "TOP",
                        relativeAnchor = "BOTTOM",
                        oX = 0,
                        oY = -5,
                        width = 80,
                        height = 25,
                        text = "Reset",
                        tooltipHeader = "Reset",
                        tooltipText = "Reset your heirloom selections for this class.",
                        onClick = nil,
                    }
                    setmetatable(resetButton, { __index = HelpMePlay.Button })
                    resetButton = resetButton:BaseButton()
                    resetButton:SetScript("OnClick", function(self)
                        HideDropDowns()
                        frame:Hide()
                        resetButton:Hide()
                        commitButton:Hide()
                        HelpMePlayDB["Heirlooms"][addon.playerClassID] = {}
                        if not commitButton:IsEnabled() then
                            commitButton:SetEnabled(true)
                        end
                    end)
                else
                    resetButton:Show()
                end
            end)
            classButton:SetScript("OnEnter", function(self)
                GameTooltip:SetOwner(self, "ANCHOR_CURSOR_RIGHT")
                GameTooltip:SetText(button.className, button.classColor.r, button.classColor.g, button.classColor.b)
                GameTooltip:Show()
            end)
            classButton:SetScript("OnLeave", function()
                GameTooltip:Hide()
            end)

            -- Set the class button positions.
            if buttonIndex == 1 then
                classButton:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -60)
            else
                classButton:SetPoint("LEFT", addon.classButtons[buttonIndex - 1].name, "RIGHT", 10, 0)
            end
        end
    end
    frame:Show()
end