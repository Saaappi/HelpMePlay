local addonName, addon = ...
local events = CreateFrame("Frame")

local slots = { 1, 3, 4, 5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19 }
local width = 24
local height = 24

addon.HMPTransmogButton = CreateFrame("Button", "HMPTransmogButton", nil, "UIPanelButtonTemplate")

local function InitButton()
    addon.HMPTransmogButton = CreateFrame("Button", "HMPTransmogButton", nil, "UIPanelButtonTemplate")
    tinsert(UISpecialFrames, "HMPTransmogButton")

    addon.HMPTransmogButton:SetSize(width, height)
    addon.HMPTransmogButton:RegisterForClicks("LeftButtonUp")

    addon.HMPTransmogButton.texture = addon.HMPTransmogButton:CreateTexture()
    addon.HMPTransmogButton.texture:SetTexture(132860)
    addon.HMPTransmogButton.texture:SetAllPoints(addon.HMPTransmogButton)

    addon.HMPTransmogButton.highlightTexture = addon.HMPTransmogButton:CreateTexture()
    addon.HMPTransmogButton.highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
    addon.HMPTransmogButton.highlightTexture:SetSize(width, (height - 1))
    addon.HMPTransmogButton:SetHighlightTexture(addon.HMPTransmogButton.highlightTexture, "ADD")

    addon.HMPTransmogButton.pushedTexture = addon.HMPTransmogButton:CreateTexture()
    addon.HMPTransmogButton.pushedTexture:SetTexture("Interface\\Buttons\\UI-Quickslot-Depress")
    addon.HMPTransmogButton.pushedTexture:SetSize(width, height)
    addon.HMPTransmogButton:SetPushedTexture(addon.HMPTransmogButton.pushedTexture)
end

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

if select(2, IsAddOnLoaded("AdiBags")) then -- AdiBags
	local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")
	HelpMePlay:SecureHook(AdiBags, "OpenAllBags", function(self)
		if ( HelpMePlayDB.TransmogButtonEnabled ) then
		    InitButton()
			addon.HMPTransmogButton:SetPoint("TOPRIGHT", AdiBagsContainer1, "TOPLEFT", -5, -1)
			addon.HMPTransmogButton:Show()
		end
	end)
	HelpMePlay:SecureHook(AdiBags, "CloseAllBags", function(self)
		if ( HelpMePlayDB.TransmogButtonEnabled ) then
			addon.HMPTransmogButton:Hide()
		end
	end)
elseif ( select(2, IsAddOnLoaded("ArkInventory")) ) then -- ArkInventory
	local ArkInventory = LibStub("AceAddon-3.0"):GetAddon("ArkInventory")
	HelpMePlay:SecureHook(ArkInventory, "Frame_Main_Show", function(self)
		if ( HelpMePlayDB.TransmogButtonEnabled ) then
		    InitButton()
			addon.HMPTransmogButton:SetPoint("TOPRIGHT", ARKINV_Frame1, "TOPLEFT", -5, -1)
			addon.HMPTransmogButton:Show()
		end
	end)
	HelpMePlay:SecureHook(ArkInventory, "Frame_Main_Hide", function(self)
		if ( HelpMePlayDB.TransmogButtonEnabled ) then
			addon.HMPTransmogButton:Hide()
		end
	end)
elseif ( select(2, IsAddOnLoaded("Bagnon")) ) then -- Bagnon
	HelpMePlay:SecureHook(Bagnon.InventoryFrame, "OnShow", function(self)
		if ( HelpMePlayDB.TransmogButtonEnabled ) then
		    InitButton()
			addon.HMPTransmogButton:SetPoint("TOPRIGHT", BagnonInventoryFrame1, "TOPLEFT", -5, -1)
			addon.HMPTransmogButton:Show()
		end
	end)
	HelpMePlay:SecureHook(Bagnon.InventoryFrame, "OnHide", function(self)
		if ( HelpMePlayDB.TransmogButtonEnabled ) then
			addon.HMPTransmogButton:SetPoint("TOPRIGHT", BagnonInventoryFrame1, "TOPLEFT", -5, -1)
			addon.HMPTransmogButton:Hide()
		end
	end)
elseif ( select(2, IsAddOnLoaded("ElvUI")) ) then -- ElvUI
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
						addon.HMPTransmogButton:SetPoint("TOPRIGHT", ElvUI_ContainerFrame, "TOPLEFT", -5, -1)
						if ( ElvUI_ContainerFrame:IsVisible() ) then
							addon.HMPTransmogButton:Show()
						else
							addon.HMPTransmogButton:Hide()
						end
					end)
				else
					C_Timer.After(0.1, function()
					    InitButton()
						if ( ContainerFrameCombinedBags:IsVisible() ) then
							addon.HMPTransmogButton:SetPoint("TOPRIGHT", ContainerFrameCombinedBags, "TOPLEFT", -10, -10)
							addon.HMPTransmogButton:Show()
						elseif ( ContainerFrame5:IsVisible() ) then
							addon.HMPTransmogButton:SetPoint("TOPRIGHT", ContainerFrame5, "TOPLEFT", -10, -10)
							addon.HMPTransmogButton:Show()
						elseif ( ContainerFrame1:IsVisible() ) then
							addon.HMPTransmogButton:SetPoint("TOPRIGHT", ContainerFrame1, "TOPLEFT", -10, -10)
							addon.HMPTransmogButton:Show()
						else
							addon.HMPTransmogButton:SetPoint("TOPRIGHT", ContainerFrame5, "TOPLEFT", -5, -10)
							addon.HMPTransmogButton:Hide()
						end
					end)
				end
			end
		end
	end)
else -- Base UI
	EventRegistry:RegisterCallback("ContainerFrame.OpenAllBags", function()
        if ( HelpMePlayDB.TransmogButtonEnabled ) then
            InitButton()
            if ( addon.combinedBags ) then
                addon.HMPTransmogButton:SetPoint("BOTTOMLEFT", ContainerFrameCombinedBags, "TOPLEFT", 0, 10)
            else
                addon.HMPTransmogButton:SetPoint("TOPRIGHT", ContainerFrame5.CloseButton, "TOPLEFT", -115, 0)
            end
            addon.HMPTransmogButton:Show()
        end
	end)
	EventRegistry:RegisterCallback("ContainerFrame.CloseAllBags", function()
	    if ( HelpMePlayDB.TransmogButtonEnabled ) then
	        if ( addon.HMPTransmogButton ) then
                addon.HMPTransmogButton:Hide()
                addon.HMPTransmogButton = nil
            end
        end
	end)
end

addon.HMPTransmogButton:HookScript("OnClick", function(self)
	GetEquippedItems()
end)

addon.HMPTransmogButton:HookScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP")
	GameTooltip:SetText("|cffFF7C0A" .. addonName .. "|r\n\n" ..
	"Click this button to learn all usable and unknown transmog in your inventory.", 1, 1, 1, 1, true)
	GameTooltip:Show()
end)

addon.HMPTransmogButton:HookScript("OnLeave", function(self)
	if ( GameTooltip:GetOwner() == self ) then
		GameTooltip:Hide()
	end
end)

events:RegisterEvent("PLAYER_LOGIN")
events:RegisterEvent("USE_COMBINED_BAGS_CHANGED")
events:SetScript("OnEvent", function(self, event, ...)
    if ( event == "PLAYER_LOGIN" ) then
        local useCombinedBags = C_CVar.GetCVar("combinedBags")
        if ( useCombinedBags == "1" ) then
            addon.combinedBags = true
        else
            addon.combinedBags = false
        end
        events:UnregisterEvent("PLAYER_LOGIN")
    end
    if ( event == "USE_COMBINED_BAGS_CHANGED" ) then
        addon.combinedBags = ...
    end
end)