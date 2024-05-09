local addonName, addon = ...
local LibDD = LibStub:GetLibrary("LibUIDropDownMenu-4.0")

-- This is the talent importer frame variable.
local frame

-- This is the back button to reset the frame.
local backButton
local doneButton
local resetButton
local heirloomButton

-- This is the default height and width of the talent importer frame.
local frameBaseHeight = 125
local frameBaseWidth = 725

-- This is the expanded height and width of the talent importer frame.
local frameExpandedHeight = 375
--local frameExpandedWidth = 0 -- unused

-- These variables are some minor configuration for the frame.
local frameTitle = "Heirloom Selection"
local frameIcon = 1030912

local index = 1

-- Hide the edit boxes if they already exist so as not to cause a visual
-- bug when they're created again.
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

local function GetHeirloomArmorTypeIDByClassID(classID)
    return addon.HeirloomArmorTypeIDByClass[classID]
end

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

local function WipeHeirloomTables()
    for key, _ in pairs(addon.Heirlooms) do
        addon.Heirlooms[key] = {}
    end
end

local function EquipHeirloom(itemLink)
    -- The item reward we received should be equippable. If it's not,
    -- then don't bother iterating the player's inventory.
    if not C_Item.IsEquippableItem(itemLink) then return end

    -- In case the player enters combat after completing the quest
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
                                table.insert(HelpMePlayDB["Heirlooms"][button.classID], { itemID = option.itemID, itemLink = option.itemLink })
                                LibDD:UIDropDownMenu_SetText(dropDown, HelpMePlayDB["Heirlooms"][button.classID][i].itemLink)
                            end
                            LibDD:UIDropDownMenu_AddButton(info)
                        end
                    end)
                    if HelpMePlayDB["Heirlooms"][button.classID][1] then
                        LibDD:UIDropDownMenu_SetText(dropDown, HelpMePlayDB["Heirlooms"][button.classID][i].itemLink)
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
                        doneButton:Hide()
                        resetButton:Hide()
                        WipeHeirloomTables()
                    end)
                else
                    backButton:Show()
                end

                -- Create the done button. This done button will close the selection
                -- frame and show a button in the middle of the characters screen to
                -- create their heirlooms. This will only need to be done once per
                -- class.
                if not doneButton then
                    doneButton = {
                        name = addonName .. "HeirloomSelectionDoneButton",
                        parent = backButton,
                        anchor = "BOTTOM",
                        relativeAnchor = "TOP",
                        oX = 0,
                        oY = 10,
                        width = 80,
                        height = 25,
                        text = "Done",
                        tooltipHeader = "",
                        tooltipText = "",
                        onClick = nil,
                    }
                    setmetatable(doneButton, { __index = HelpMePlay.Button })
                    doneButton = doneButton:BaseButton()
                    doneButton:SetScript("OnClick", function(self)
                        HideDropDowns()
                        frame:Hide()
                        doneButton:Hide()
                        backButton:Hide()
                        resetButton:Hide()
                        WipeHeirloomTables()

                        heirloomButton = {
                            name = addonName .. "HeirloomSecureButton",
                            texture = C_Item.GetItemIconByID(HelpMePlayDB["Heirlooms"][addon.playerClassID][1].itemID),
                            parent = UIParent,
                            anchor = "CENTER",
                            relativeAnchor = "CENTER",
                            oX = 100,
                            oY = 0,
                            width = 48,
                            height = 48,
                            attribute = "item",
                            attributeValue = HelpMePlayDB["Heirlooms"][addon.playerClassID][1].itemID,
                            postClick = function(self, button, isDown) if not isDown then CreateHeirloom(addon.playerClassID) end end,
                        }
                        setmetatable(heirloomButton, { __index = HelpMePlay.Button })
                        heirloomButton = heirloomButton:SecureButton()
                        heirloomButton:SetScript("OnEnter", function()
                            GameTooltip:SetOwner(heirloomButton, "ANCHOR_CURSOR_RIGHT")
                            GameTooltip:SetHyperlink("item:" .. HelpMePlayDB["Heirlooms"][addon.playerClassID][1].itemID)
                        end)
                        heirloomButton:SetScript("OnLeave", function()
                            GameTooltip:Hide()
                        end)
                    end)
                else
                    doneButton:Show()
                end

                -- Create the reset button. The reset button allows the player
                -- to wipe the saved settings for heirlooms on a given class.
                if not resetButton then
                    resetButton = {
                        name = addonName .. "HeirloomSelectionResetButton",
                        parent = frame,
                        anchor = "TOPRIGHT",
                        relativeAnchor = "TOPRIGHT",
                        oX = -10,
                        oY = -30,
                        width = 80,
                        height = 25,
                        text = "Reset",
                        tooltipHeader = "",
                        tooltipText = "",
                        onClick = nil,
                    }
                    setmetatable(resetButton, { __index = HelpMePlay.Button })
                    resetButton = resetButton:BaseButton()
                    resetButton:SetScript("OnClick", function(self)
                        HideDropDowns()
                        frame:Hide()
                        resetButton:Hide()
                        backButton:Hide()
                        doneButton:Hide()
                        HelpMePlayDB["Heirlooms"][addon.playerClassID] = {}
                    end)
                else
                    resetButton:Show()
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