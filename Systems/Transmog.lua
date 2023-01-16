local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local slots = { 1, 3, 4, 5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19 }
local HMPTransmogButton = _G.CreateFrame(
	"Button",
	"HMPTransmogButton",
	nil,
	"UIPanelButtonTemplate"
)
local normalTexture = e:CreateTexture()
local highlightTexture = e:CreateTexture()

local function RequipOriginalItems(equippedItems)
	local currentlyEquippedItemLink = ""
	if not UnitAffectingCombat("player") then
		ToggleCharacter("PaperDollFrame"); CharacterFrameCloseButton:Click()
		C_Timer.After(addonTable.CONSTANTS["ONE_SECOND"], function()
			-- We need to rescan the equipped items
			-- so we can run comparisons to the original items.
			for _, item in ipairs(equippedItems) do
				currentlyEquippedItemLink = GetInventoryItemLink("player", item.id)
				if currentlyEquippedItemLink ~= item.link then
					EquipItemByName(item.link)
				end
			end
		end)
	end
end

local function LearnAllUnknownTransmog(equippedItems)
	if not UnitAffectingCombat("player") then
		for i=0, NUM_BAG_SLOTS do -- We iterate through the inventory, bags 0 to 4.
			for j=1, C_Container.GetContainerNumSlots(i) do -- We iterate through the bag slots for each bag.
				local itemLocation = ItemLocation:CreateFromBagAndSlot(i, j)
				if itemLocation:IsValid() then
					-- There's an item in the bag and slot.
					local itemLink = C_Item.GetItemLink(itemLocation)
					if itemLink then
						local sourceID = C_Item.GetBaseItemTransmogInfo(itemLocation).appearanceID
						if sourceID then
							-- The item has an appearance.
							local _, _, _, _, isCollected = C_TransmogCollection.GetAppearanceSourceInfo(sourceID)
							if isCollected == false then
								-- The item isn't collected.
								local _, canCollectSource = C_TransmogCollection.PlayerCanCollectSource(sourceID)
								if canCollectSource then
									-- The player can collect the appearance.
									EquipItemByName(itemLink)
									if StaticPopup1:IsVisible() then
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
	
	if not UnitAffectingCombat("player") then
		ToggleCharacter("PaperDollFrame"); CharacterFrameCloseButton:Click()
		C_Timer.After(addonTable.CONSTANTS["ONE_SECOND"], function()
			-- Get the players currently equipped items
			-- in transmog-capable slots and store them
			-- in a separate table.
			--
			-- We'll use this separate table to re-equip
			-- items once we're done.
			for _, inventoryType in ipairs(slots) do
				if type(inventoryType) == "table" then
					for _, i in ipairs(inventoryType) do
						local item = ItemLocation:CreateFromEquipmentSlot(i)
						if item:IsValid() then
							itemLink = C_Item.GetItemLink(item)
							table.insert(equippedItems, { id = i, link = itemLink })
						end
					end
				else
					local item = ItemLocation:CreateFromEquipmentSlot(inventoryType)
					if item:IsValid() then
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

-- Texture work. Let's recreate the bag sorting button.
normalTexture:SetTexture("Interface\\Warfront\\WarfrontAssetIcons")
normalTexture:SetTexCoord(0.516602, 0.579102, 0.00195312, 0.126953)
highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
HMPTransmogButton:SetNormalTexture(normalTexture)
HMPTransmogButton:SetHighlightTexture(highlightTexture, "ADD")

HMPTransmogButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")

-- AdiBags
if select(2, IsAddOnLoaded("AdiBags")) then
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	local AdiBags = LibStub("AceAddon-3.0"):GetAddon("AdiBags")
	HelpMePlay:SecureHook(AdiBags, "OpenAllBags", function(self)
		if HelpMePlayDB.TransmogButtonEnabled then
			HMPTransmogButton:SetPoint("TOPRIGHT", AdiBagsContainer1, "TOPLEFT", -5, -1)
			HMPTransmogButton:Show()
		end
	end)
	HelpMePlay:SecureHook(AdiBags, "CloseAllBags", function(self)
		if HelpMePlayDB.TransmogButtonEnabled then
			HMPTransmogButton:Hide()
		end
	end)
-- ArkInventory
elseif select(2, IsAddOnLoaded("ArkInventory")) then
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	local ArkInventory = LibStub("AceAddon-3.0"):GetAddon("ArkInventory")
	HelpMePlay:SecureHook(ArkInventory, "Frame_Main_Show", function(self)
		if HelpMePlayDB.TransmogButtonEnabled then
			HMPTransmogButton:SetPoint("TOPRIGHT", ARKINV_Frame1, "TOPLEFT", -5, -1)
			HMPTransmogButton:Show()
		end
	end)
	HelpMePlay:SecureHook(ArkInventory, "Frame_Main_Hide", function(self)
		if HelpMePlayDB.TransmogButtonEnabled then
			HMPTransmogButton:Hide()
		end
	end)
-- Bagnon
elseif select(2, IsAddOnLoaded("Bagnon")) then
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	HelpMePlay:SecureHook(Bagnon.InventoryFrame, "OnShow", function(self)
		if HelpMePlayDB.TransmogButtonEnabled then
			HMPTransmogButton:SetPoint("TOPRIGHT", BagnonInventoryFrame1, "TOPLEFT", -5, -1)
			HMPTransmogButton:Show()
		end
	end)
	HelpMePlay:SecureHook(Bagnon.InventoryFrame, "OnHide", function(self)
		if HelpMePlayDB.TransmogButtonEnabled then
			HMPTransmogButton:SetPoint("TOPRIGHT", BagnonInventoryFrame1, "TOPLEFT", -5, -1)
			HMPTransmogButton:Hide()
		end
	end)
-- ElvUI
elseif select(2, IsAddOnLoaded("ElvUI")) then
	-- This will allow us to hide the Transmog button
	-- when the ESC key is used to hide the inventory.
	tinsert(UISpecialFrames, "HMPTransmogButton")
	
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	HelpMePlay:SecureHook("ToggleAllBags", function()
		if HelpMePlayDB.TransmogButtonEnabled then
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
			if elvPrivateDB then
				for k, v in pairs(elvPrivateDB) do
					if k == "bags" then
						areBagsEnabled = false
						break
					end
				end
				if areBagsEnabled then
					C_Timer.After(0.1, function()
						HMPTransmogButton:SetPoint("TOPRIGHT", ElvUI_ContainerFrame, "TOPLEFT", -5, -1)
						if ElvUI_ContainerFrame:IsVisible() then
							HMPTransmogButton:Show()
						else
							HMPTransmogButton:Hide()
						end
					end)
				else
					C_Timer.After(0.1, function()
						if ContainerFrameCombinedBags:IsVisible() then
							HMPTransmogButton:SetPoint("TOPRIGHT", _G.ContainerFrameCombinedBags, "TOPLEFT", -10, -10)
							HMPTransmogButton:Show()
						elseif ContainerFrame5:IsVisible() then
							HMPTransmogButton:SetPoint("TOPRIGHT", _G.ContainerFrame5, "TOPLEFT", -10, -10)
							HMPTransmogButton:Show()
						elseif ContainerFrame1:IsVisible() then
							HMPTransmogButton:SetPoint("TOPRIGHT", _G.ContainerFrame1, "TOPLEFT", -10, -10)
							HMPTransmogButton:Show()
						else
							HMPTransmogButton:SetPoint("TOPRIGHT", _G.ContainerFrame5, "TOPLEFT", -5, -10)
							HMPTransmogButton:Hide()
						end
					end)
				end
			end
		end
	end)
-- No AddOn
else
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	HelpMePlay:SecureHook("ContainerFrame_OnShow", function(self)
		if HelpMePlayDB.TransmogButtonEnabled then
			if ContainerFrameCombinedBags:IsVisible() then
				HMPTransmogButton:SetPoint("TOPRIGHT", _G.ContainerFrameCombinedBags, "TOPLEFT", -10, -10)
				HMPTransmogButton:Show()
			else
				HMPTransmogButton:SetPoint("TOPRIGHT", _G.ContainerFrame5, "TOPLEFT", -5, -10)
				HMPTransmogButton:Show()
			end
		end
	end)
	HelpMePlay:SecureHook("ContainerFrame_OnHide", function(self)
		HMPTransmogButton:Hide()
	end)
end

HMPTransmogButton:HookScript("OnClick", function(self)
	GetEquippedItems()
end)

HMPTransmogButton:HookScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText(L_GLOBALSTRINGS["UI.Button.Inventory.Desc"])
	GameTooltip:Show()
end)

HMPTransmogButton:HookScript("OnLeave", function(self)
	if GameTooltip:GetOwner() == self then
		GameTooltip:Hide()
	end
end)