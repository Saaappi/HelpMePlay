local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local slots = { 1, 3, 4, 5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19 }
local HMPTransmogButton = _G.CreateFrame(
	"Button",
	"HMPTransmogButton",
	nil,
	"OptionsButtonTemplate"
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
	local itemLink
	local sourceId
	local canCollectSource
	local appearanceInfo = {}
	local sourceInfo = {}
	
	-- Open the player bags, then close them
	-- 1 second later and run the remaining code.
	if not UnitAffectingCombat("player") then
		OpenAllBags()
		C_Timer.After(addonTable.CONSTANTS["ONE_SECOND"], function()
			CloseAllBags()
			for i=0, NUM_BAG_SLOTS do -- We iterate through the inventory, bags 0 to 4.
				for j=1, GetContainerNumSlots(i) do -- We iterate through the bag slots for each bag.
					_, _, _, _, _, _, itemLink = GetContainerItemInfo(i, j)
					if itemLink then -- If we return a valid item link, then continue.
						_, sourceId = C_TransmogCollection.GetItemInfo(itemLink)
						if sourceId then -- If we return a valid source ID, then continue.
							sourceInfo = C_TransmogCollection.GetSourceInfo(sourceId)
							if sourceInfo.isCollected == false then
								_, canCollectSource = C_TransmogCollection.PlayerCanCollectSource(sourceId)
								if canCollectSource then -- The player can learn the source on the current character.
									if appearanceInfo then
										if appearanceInfo.sourceIsCollected == false then -- If the player hasn't already learned the source, then continue.
											EquipItemByName(itemLink)
											if StaticPopup1:IsVisible() then -- The "soulbind" popup is visible. Click the okay button.
												StaticPopup1Button1:Click("LeftButton")
											end
										end
									end
								else
									local _, _, itemQuality, _, _, _, _, _, _, _, _, _, _, bindType = GetItemInfo(itemLink)
									-- A bind type of 0 means there isn't a bind (common items, for example).
									-- A bind type of 2 means the item is bind on equip (BoE).
									--
									-- An item quality greater than or equal to 1 means any item
									-- of common (white) quality or higher should be considered.
									-- Common items are transmoggable starting in 10.0.
									if (bindType == 0 or bindType == 2) and itemQuality >= 1 then
										-- Since the player can't collect the appearance on the
										-- current character, let's gather some valuable information
										-- and inform the player so they know to send it to an
										-- alt.
										local _, _, _, _, _, _, itemSubType = GetItemInfo(itemLink)
										if itemSubType then
											addonTable.Print(L_GLOBALSTRINGS["Unlearnable Appearance"] .. ": " .. itemLink .. " (" .. itemSubType .. ")")
										else
											addonTable.Print(L_GLOBALSTRINGS["Unlearnable Appearance"] .. ": " .. itemLink)
										end
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

function HelpMePlay_GetEquippedItems()
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
	end)
-- No AddOn
else
	normalTexture:SetSize(24, 24)
	highlightTexture:SetSize(24, 24)
	HMPTransmogButton:SetSize(24, 24)
	hooksecurefunc("ContainerFrame_OnShow", function(self)
		HMPTransmogButton:SetPoint("TOPRIGHT", _G.ContainerFrame5, "TOPLEFT", -5, -10)
		HMPTransmogButton:Show()
	end)
	hooksecurefunc("ContainerFrame_OnHide", function(self)
		HMPTransmogButton:Hide()
	end)
end

HMPTransmogButton:HookScript("OnClick", function(self)
	HelpMePlay_GetEquippedItems()
end)

HMPTransmogButton:HookScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText(L_GLOBALSTRINGS["Transmog Button"])
	GameTooltip:Show()
end)

HMPTransmogButton:HookScript("OnLeave", function(self)
	if GameTooltip:GetOwner() == self then
		GameTooltip:Hide()
	end
end)