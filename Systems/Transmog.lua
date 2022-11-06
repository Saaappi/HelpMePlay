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
	local currentlyEquippedItemLink
	
	-- Open the character frame, then close it
	-- 1 second later and run the remaining code.
	if not UnitAffectingCombat("player") then
		ToggleCharacter("PaperDollFrame")
		C_Timer.After(addonTable.CONSTANTS["ONE_SECOND"], function()
			CharacterFrameCloseButton:Click()
			-- We need to rescan the equipped items
			-- so we can run comparisons to the original items.
			for _, item in ipairs(equippedItems) do
				currentlyEquippedItemLink = GetInventoryItemLink("player", item.id)
				if currentlyEquippedItemLink ~= item.link then -- The original item isn't equipped.
					EquipItemByName(item.link)
				end
			end
		end)
	end
end

local function LearnAllUnknownTransmog(equippedItems)
	-- Open the player bags, then close them
	-- 1 second later and run the remaining code.
	if not UnitAffectingCombat("player") then
		C_Timer.After(addonTable.CONSTANTS["ONE_SECOND"], function()
			for i=0, NUM_BAG_SLOTS do -- We iterate through the inventory, bags 0 to 4.
				for j=1, GetContainerNumSlots(i) do -- We iterate through the bag slots for each bag.
					local _, _, _, _, _, _, itemLink = GetContainerItemInfo(i, j)
					if itemLink then -- If we return a valid item link, then continue.
						local _, sourceId = C_TransmogCollection.GetItemInfo(itemLink)
						if sourceId then -- If we return a valid source ID, then continue.
							local sourceInfo = C_TransmogCollection.GetSourceInfo(sourceId)
							if sourceInfo.isCollected == false then
								local _, canCollectSource = C_TransmogCollection.PlayerCanCollectSource(sourceId)
								if canCollectSource then -- The player can learn the source on the current character.
									EquipItemByName(itemLink)
									if StaticPopup1:IsVisible() then -- The "soulbind" popup is visible. Click the okay button.
										StaticPopup1Button1:Click("LeftButton")
									end
								end
							end
						end
					end
				end
			end
			RequipOriginalItems(equippedItems)
		end)
	end
end

local function GetEquippedItems()
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	
	local equippedItems = {}
	local itemLink
	
	-- Open the character frame, then close it
	-- 1 second later and run the remaining code.
	if not UnitAffectingCombat("player") then
		ToggleCharacter("PaperDollFrame")
		C_Timer.After(addonTable.CONSTANTS["ONE_SECOND"], function()
			CharacterFrameCloseButton:Click()
			-- Get the players currently equipped items
			-- in transmog-capable slots and store them
			-- in a separate table.
			--
			-- We'll use this separate table to re-equip
			-- items once we're done.
			for _, v in ipairs(slots) do
				itemLink = GetInventoryItemLink("player", v)
				if itemLink then
					table.insert(equippedItems, { id = v, link = itemLink})
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
	hooksecurefunc(AdiBags, "OpenAllBags", function(self)
		HMPTransmogButton:SetPoint("TOPRIGHT", AdiBagsContainer1, "TOPLEFT", -5, -1)
		HMPTransmogButton:Show()
	end)
	hooksecurefunc(AdiBags, "CloseAllBags", function(self)
		HMPTransmogButton:Hide()
	end)
-- ArkInventory
elseif select(2, IsAddOnLoaded("ArkInventory")) then
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	local ArkInventory = LibStub("AceAddon-3.0"):GetAddon("ArkInventory")
	hooksecurefunc(ArkInventory, "Frame_Main_Show", function(self)
		HMPTransmogButton:SetPoint("TOPRIGHT", ARKINV_Frame1, "TOPLEFT", -5, -1)
		HMPTransmogButton:Show()
	end)
	hooksecurefunc(ArkInventory, "Frame_Main_Hide", function(self)
		HMPTransmogButton:Hide()
	end)
-- Bagnon
elseif select(2, IsAddOnLoaded("Bagnon")) then
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	hooksecurefunc(Bagnon.InventoryFrame, "OnShow", function(self)
		HMPTransmogButton:SetPoint("TOPRIGHT", BagnonInventoryFrame1, "TOPLEFT", -5, -1)
		HMPTransmogButton:Show()
	end)
	hooksecurefunc(Bagnon.InventoryFrame, "OnHide", function(self)
		HMPTransmogButton:SetPoint("TOPRIGHT", BagnonInventoryFrame1, "TOPLEFT", -5, -1)
		HMPTransmogButton:Hide()
	end)
-- ElvUI
elseif select(2, IsAddOnLoaded("ElvUI")) then
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	HelpMePlay:SecureHook("ToggleAllBags", function()
		C_Timer.After(0.1, function()
			HMPTransmogButton:SetPoint("TOPRIGHT", ElvUI_ContainerFrame, "TOPLEFT", -5, -1)
			if ElvUI_ContainerFrame:IsVisible() then
				HMPTransmogButton:Show()
			else
				HMPTransmogButton:Hide()
			end
		end)
	end)
-- No AddOn
else
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	hooksecurefunc("ContainerFrame_OnShow", function(self)
		if ContainerFrameCombinedBags:IsVisible() then
			HMPTransmogButton:SetPoint("TOPRIGHT", _G.ContainerFrameCombinedBags, "TOPLEFT", -10, -10)
			HMPTransmogButton:Show()
		else
			HMPTransmogButton:SetPoint("TOPRIGHT", _G.ContainerFrame5, "TOPLEFT", -5, -10)
			HMPTransmogButton:Show()
		end
	end)
	hooksecurefunc("ContainerFrame_OnHide", function(self)
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