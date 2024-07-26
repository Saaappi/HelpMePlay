local addonName, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")
local transmogrificationButton
local buttonClicked = false

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
			buttonClicked = false
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
					C_Timer.After(HelpMePlay.Constants["TIMER_DELAY"], function()
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
											local text = StaticPopup1Text:GetText()
											if text == CONVERT_TO_BIND_TO_ACCOUNT_CONFIRM then
												StaticPopup1Button2:Click("LeftButton")
												ClearCursor()
											else
												StaticPopup1Button1:Click("LeftButton")
											end
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
		buttonClicked = true
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

HelpMePlay.CreateWardrobeButton = function()
	if not transmogrificationButton then
		transmogrificationButton = HelpMePlay.CreateWidget("ActionButton", {
			name = format("%sWardrobeButton", addonName),
			parent = CharacterFrame
		})

		transmogrificationButton:ClearAllPoints()
		transmogrificationButton:SetPoint("TOPLEFT", CharacterFrame, "TOPRIGHT", 10, 0)

		transmogrificationButton.icon:SetTexture(237016)

		transmogrificationButton:SetScript("OnClick", Main)
		transmogrificationButton:SetScript("OnEnter", function(self)
			HelpMePlay.Tooltip_OnEnter(self, "Wardrobe", "Click to learn all unknown and appropriate appearances in your inventory.")
		end)
		transmogrificationButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
	else
		if HelpMePlayDB["ShowWardrobeButton"] then
			transmogrificationButton:Show()
		else
			if transmogrificationButton then
				transmogrificationButton:Hide()
			end
		end
    end
end

local function OnEvent(_, event, ...)
	if event == "CONVERT_TO_BIND_TO_ACCOUNT_CONFIRM" or event == "EQUIP_BIND_CONFIRM" then
		if not buttonClicked and HelpMePlayDB["ShowWardrobeButton"] then
			StaticPopup1Button1:Click()
		end
	end
end

eventHandler:RegisterEvent("CONVERT_TO_BIND_TO_ACCOUNT_CONFIRM")
eventHandler:RegisterEvent("EQUIP_BIND_CONFIRM")
eventHandler:SetScript("OnEvent", OnEvent)

EventRegistry:RegisterCallback("CharacterFrame.Show", function()
	if HelpMePlayDB["ShowWardrobeButton"] then
		HelpMePlay.CreateWardrobeButton()
	end
end)