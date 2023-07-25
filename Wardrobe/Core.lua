local addonName, addon = ...
local slots = { 1, 3, 4, 5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19 }

local HMPTransmogButton = CreateFrame("Button", "HMPTransmogButton", nil, "UIPanelButtonTemplate")
local normalTexture = HMPTransmogButton:CreateTexture()
local highlightTexture = HMPTransmogButton:CreateTexture()

local function RequipOriginalItems(equippedItems)
	local currentlyEquippedItemLink = ""
	if ( not UnitAffectingCombat("player") ) then
		ToggleCharacter("PaperDollFrame"); CharacterFrameCloseButton:Click()
		C_Timer.After(addon.CONSTANTS["ONE_SECOND"], function()
			for _, item in ipairs(equippedItems) do
				currentlyEquippedItemLink = GetInventoryItemLink("player", item.id)
				if ( currentlyEquippedItemLink ~= item.link ) then
					EquipItemByName(item.link)
				end
			end
		end)
	end
end

local function LearnAllUnknownTransmog(equippedItems)
	if ( not UnitAffectingCombat("player") ) then
		for i = 0, NUM_BAG_SLOTS do
			for j = 1, C_Container.GetContainerNumSlots(i) do
				local itemLocation = ItemLocation:CreateFromBagAndSlot(i, j)
				if ( itemLocation:IsValid() ) then
					local itemLink = C_Item.GetItemLink(itemLocation)
					if ( itemLink ) then
						local sourceID = C_Item.GetBaseItemTransmogInfo(itemLocation).appearanceID
						if ( sourceID ) then
							local _, _, _, _, isCollected = C_TransmogCollection.GetAppearanceSourceInfo(sourceID)
							if ( isCollected == false ) then
								local _, canCollectSource = C_TransmogCollection.PlayerCanCollectSource(sourceID)
								if ( canCollectSource ) then
									EquipItemByName(itemLink)
									if ( StaticPopup1:IsVisible() ) then
										StaticPopup1Button1:Click("LeftButton")
									end
								end
							end
						end
					end
				end
			end
		end
		RequipOriginalItems(equippedItems)
	end
end

local function GetEquippedItems()
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	
	local equippedItems = {}
	local itemLink = ""
	
	if ( not UnitAffectingCombat("player") ) then
		ToggleCharacter("PaperDollFrame"); CharacterFrameCloseButton:Click()
		C_Timer.After(addon.CONSTANTS["ONE_SECOND"], function()
			for _, inventoryType in ipairs(slots) do
				if ( type(inventoryType) == "table" ) then
					for _, i in ipairs(inventoryType) do
						local item = ItemLocation:CreateFromEquipmentSlot(i)
						if ( item:IsValid() ) then
							itemLink = C_Item.GetItemLink(item)
							table.insert(equippedItems, { id = i, link = itemLink })
						end
					end
				else
					local item = ItemLocation:CreateFromEquipmentSlot(inventoryType)
					if ( item:IsValid() ) then
						itemLink = C_Item.GetItemLink(item)
						table.insert(equippedItems, { id = inventoryType, link = itemLink })
					end
				end
			end
			LearnAllUnknownTransmog(equippedItems)
		end)
	end
	
	return
end

normalTexture:SetTexture("Interface\\Warfront\\WarfrontAssetIcons")
normalTexture:SetTexCoord(0.516602, 0.579102, 0.00195312, 0.126953)
highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
HMPTransmogButton:SetNormalTexture(normalTexture)
HMPTransmogButton:SetHighlightTexture(highlightTexture, "ADD")

HMPTransmogButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")

if select(2, IsAddOnLoaded("AdiBags")) then -- AdiBags
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")
	HelpMePlay:SecureHook(AdiBags, "OpenAllBags", function(self)
		if ( HelpMePlayDB.TransmogButtonEnabled ) then
			HMPTransmogButton:SetPoint("TOPRIGHT", AdiBagsContainer1, "TOPLEFT", -5, -1)
			HMPTransmogButton:Show()
		end
	end)
	HelpMePlay:SecureHook(AdiBags, "CloseAllBags", function(self)
		if ( HelpMePlayDB.TransmogButtonEnabled ) then
			HMPTransmogButton:Hide()
		end
	end)
elseif ( select(2, IsAddOnLoaded("ArkInventory")) ) then -- ArkInventory
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	local ArkInventory = LibStub("AceAddon-3.0"):GetAddon("ArkInventory")
	HelpMePlay:SecureHook(ArkInventory, "Frame_Main_Show", function(self)
		if ( HelpMePlayDB.TransmogButtonEnabled ) then
			HMPTransmogButton:SetPoint("TOPRIGHT", ARKINV_Frame1, "TOPLEFT", -5, -1)
			HMPTransmogButton:Show()
		end
	end)
	HelpMePlay:SecureHook(ArkInventory, "Frame_Main_Hide", function(self)
		if ( HelpMePlayDB.TransmogButtonEnabled ) then
			HMPTransmogButton:Hide()
		end
	end)
elseif ( select(2, IsAddOnLoaded("Bagnon")) ) then -- Bagnon
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	HelpMePlay:SecureHook(Bagnon.InventoryFrame, "OnShow", function(self)
		if ( HelpMePlayDB.TransmogButtonEnabled ) then
			HMPTransmogButton:SetPoint("TOPRIGHT", BagnonInventoryFrame1, "TOPLEFT", -5, -1)
			HMPTransmogButton:Show()
		end
	end)
	HelpMePlay:SecureHook(Bagnon.InventoryFrame, "OnHide", function(self)
		if ( HelpMePlayDB.TransmogButtonEnabled ) then
			HMPTransmogButton:SetPoint("TOPRIGHT", BagnonInventoryFrame1, "TOPLEFT", -5, -1)
			HMPTransmogButton:Hide()
		end
	end)
elseif ( select(2, IsAddOnLoaded("ElvUI")) ) then -- ElvUI
	tinsert(UISpecialFrames, "HMPTransmogButton")
	
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	HelpMePlay:SecureHook("ToggleAllBags", function()
		if ( HelpMePlayDB.TransmogButtonEnabled ) then
			-- Players can have ElvUI enabled but disable
			-- the addon's inventory functionality. This
			-- means ElvUI is enabled but they use the stock
			-- inventory frame (see no addon section below).
			--
			-- We need to account for this by checking their
			-- ElvUI saved variable data.
			local playerName, realmName = UnitName("player"), GetRealmName()
			local profileName = playerName .. " - " .. realmName
			local elvPrivateDB = ElvPrivateDB["profiles"][profileName]
			
			local areBagsEnabled = true
			if ( elvPrivateDB ) then
				for k, v in pairs(elvPrivateDB) do
					if ( k == "bags" ) then
						areBagsEnabled = false
						break
					end
				end
				if ( areBagsEnabled ) then
					C_Timer.After(0.1, function()
						HMPTransmogButton:SetPoint("TOPRIGHT", ElvUI_ContainerFrame, "TOPLEFT", -5, -1)
						if ( ElvUI_ContainerFrame:IsVisible() ) then
							HMPTransmogButton:Show()
						else
							HMPTransmogButton:Hide()
						end
					end)
				else
					C_Timer.After(0.1, function()
						if ( ContainerFrameCombinedBags:IsVisible() ) then
							HMPTransmogButton:SetPoint("TOPRIGHT", ContainerFrameCombinedBags, "TOPLEFT", -10, -10)
							HMPTransmogButton:Show()
						elseif ( ContainerFrame5:IsVisible() ) then
							HMPTransmogButton:SetPoint("TOPRIGHT", ContainerFrame5, "TOPLEFT", -10, -10)
							HMPTransmogButton:Show()
						elseif ( ContainerFrame1:IsVisible() ) then
							HMPTransmogButton:SetPoint("TOPRIGHT", ContainerFrame1, "TOPLEFT", -10, -10)
							HMPTransmogButton:Show()
						else
							HMPTransmogButton:SetPoint("TOPRIGHT", ContainerFrame5, "TOPLEFT", -5, -10)
							HMPTransmogButton:Hide()
						end
					end)
				end
			end
		end
	end)
else -- Base UI
	EventRegistry:RegisterCallback("ContainerFrame.OpenAllBags", function()
	    normalTexture:SetSize(24, 24)
        highlightTexture:SetSize(24, 24)
        HMPTransmogButton:SetSize(24, 24)
        if ( HelpMePlayDB.TransmogButtonEnabled ) then
            if ( ContainerFrameCombinedBags:IsVisible() ) then
                HMPTransmogButton:SetPoint("RIGHT", ContainerFrameCombinedBags.PortraitContainer, "BOTTOM", -20, -15)
                HMPTransmogButton:Show()
            else
                HMPTransmogButton:SetPoint("TOPRIGHT", ContainerFrame5, "TOPLEFT", -5, -10)
                HMPTransmogButton:Show()
            end
        end
	end)
end

HMPTransmogButton:HookScript("OnClick", function(self)
	GetEquippedItems()
end)

HMPTransmogButton:HookScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText("|cffFFFFFFLearn All Transmog|r\n" ..
	"Click this button to learn all USABLE and UNKNOWN transmog in your inventory. (Added by HelpMePlay)", 1, 1, 1, true)
	GameTooltip:Show()
end)

HMPTransmogButton:HookScript("OnLeave", function(self)
	if ( GameTooltip:GetOwner() == self ) then
		GameTooltip:Hide()
	end
end)