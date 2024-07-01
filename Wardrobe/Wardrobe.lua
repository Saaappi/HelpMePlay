local addonName, addon = ...
local transmogrificationButton

local transmogrificationSlotIDs = { 1, 3, 4, 5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19 }

local function EquipOriginalItems(equippedItems)
	if not InCombatLockdown() then
		C_Timer.After(1, function()
			for _, item in ipairs(equippedItems) do
				local itemLocation = ItemLocation:CreateFromEquipmentSlot(item.id)
				if itemLocation:IsValid() then
					local equippedItemLink = C_Item.GetItemLink(itemLocation)
					if equippedItemLink and (equippedItemLink ~= item.itemLink) then
						C_Item.EquipItemByName(item.itemLink)
					end
				else
					C_Item.EquipItemByName(item.itemLink)
				end
			end
		end)
	end
end

local function LearnTransmog(equippedItems)
	if not InCombatLockdown() then
		for bagID = 0, NUM_BAG_SLOTS do
			for slotID = C_Container.GetContainerNumSlots(bagID), 1, -1 do
				local itemLocation = ItemLocation:CreateFromBagAndSlot(bagID, slotID)
				if itemLocation:IsValid() then
					C_Item.RequestLoadItemData(itemLocation)
					C_Timer.After(addon.Constants["TIMER_DELAY"], function()
						local itemLink = C_Item.GetItemLink(itemLocation)
						if itemLink then
							local sourceID = C_Item.GetBaseItemTransmogInfo(itemLocation).appearanceID
							if sourceID then
								local isCollected = select(5, C_TransmogCollection.GetAppearanceSourceInfo(sourceID))
								if not isCollected then
									local canCollectSource = select(2, C_TransmogCollection.PlayerCanCollectSource(sourceID))
									if canCollectSource then
										C_Item.EquipItemByName(itemLink)
										if StaticPopup1:IsVisible() then
											StaticPopup1Button1:Click("LeftButton")
										end
									end
								end
							end
						end
					end)
				end
			end
		end
		EquipOriginalItems(equippedItems)
	end
end

local function Main()
    if not InCombatLockdown() then
        local equippedItems = {}
        for _, slotID in ipairs(transmogrificationSlotIDs) do
            if type(slotID) == "table" then
                for _, id in ipairs(slotID) do
                    local item = ItemLocation:CreateFromEquipmentSlot(id)
                    if item:IsValid() then
                        local itemLink = C_Item.GetItemLink(item)
                        table.insert(equippedItems, { id = id, itemLink = itemLink })
                    end
                end
            else
                local item = ItemLocation:CreateFromEquipmentSlot(slotID)
                if item:IsValid() then
                    local itemLink = C_Item.GetItemLink(item)
                    table.insert(equippedItems, { id = slotID, itemLink = itemLink })
                end
            end
        end
        LearnTransmog(equippedItems)
    end
end

EventRegistry:RegisterCallback("CharacterFrame.Show", function()
    if not transmogrificationButton then
        PaperDollSidebarTab3:SetPoint("BOTTOMRIGHT", -35, 0)
        transmogrificationButton = CreateFrame("Button", addonName .. "PaperDollSidebarTab4", PaperDollSidebarTabs, "UIPanelButtonTemplate")
        transmogrificationButton:SetAlpha(0)
        transmogrificationButton:SetWidth(33)
        transmogrificationButton:SetHeight(35)
        transmogrificationButton:SetPoint("TOPLEFT", PaperDollSidebarTab3, "TOPRIGHT", 4, 0)

        local texture = CharacterFrame:CreateTexture(nil, "BACKGROUND")
        texture:SetPoint("BOTTOMLEFT", PaperDollSidebarTab3, "BOTTOMRIGHT", 4, 0)
        texture:SetSize(32, 34)
        texture:SetTexture(1723993)

        local border = CharacterFrame:CreateTexture(nil, "BORDER")
        border:SetPoint("CENTER", texture, "CENTER", 0, 0)
        border:SetSize(33, 35)
        border:SetAtlas("UI-Frame-IconBorder", false)

        transmogrificationButton:SetScript("OnEnter", function(self) addon.Tooltip_OnEnter(self, "Wardrobe", "Click to learn all unknown and appropriate appearances in your inventory.") end)
        transmogrificationButton:SetScript("OnLeave", addon.Tooltip_OnLeave)
        transmogrificationButton:SetScript("OnClick", function() Main() end)
    end
end)