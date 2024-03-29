local addonName, addon = ...
local events = CreateFrame("Frame")

addon.HMPJunkerMerchantButton = CreateFrame("Button", "HMPJunkerMerchantButton", MerchantFrame, "UIPanelButtonTemplate")
local normalTexture = addon.HMPJunkerMerchantButton:CreateTexture()
local pushedTexture = addon.HMPJunkerMerchantButton:CreateTexture()
local highlightTexture = addon.HMPJunkerMerchantButton:CreateTexture()

function HelpMePlay:ImportToJunker(itemID, instruction)
	itemID = tonumber(itemID)
	if ( instruction == "ADD" ) then
		if ( HelpMePlayCharacterDB.Junker.DB[itemID] ) then
			HelpMePlayCharacterDB.Junker.DB[itemID] = nil
		else
			HelpMePlayCharacterDB.Junker.DB[itemID] = true
		end
	else
		if ( HelpMePlayCharacterDB.Junker.BlacklistDB[itemID] ) then
			HelpMePlayCharacterDB.Junker.BlacklistDB[itemID] = nil
		else
			HelpMePlayCharacterDB.Junker.BlacklistDB[itemID] = true
		end
	end
	return
end

function HelpMePlay:ShowJunkerButton()
	-- Texture work. Let's recreate the bag sorting button.
	normalTexture:SetTexture("Interface\\ContainerFrame\\Bags")
	normalTexture:SetSize(28, 26)
	normalTexture:SetTexCoord(0.181640625, 0.302734375, 0.1796875, 0.421875)
	
	pushedTexture:SetTexture("Interface\\ContainerFrame\\Bags")
	pushedTexture:SetSize(28, 26)
	pushedTexture:SetTexCoord(0.001953125, 0.123046875, 0.66796875, 0.91015625)
	
	highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
	highlightTexture:SetSize(24, 23)
	
	HMPJunkerMerchantButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	
	HMPJunkerMerchantButton:SetNormalTexture(normalTexture)
	HMPJunkerMerchantButton:SetPushedTexture(pushedTexture)
	HMPJunkerMerchantButton:SetHighlightTexture(highlightTexture, "ADD")
	
	-- Let's get the button on the MerchantFrame.
	HMPJunkerMerchantButton:SetSize(28, 26)
	HMPJunkerMerchantButton:SetPoint("TOPLEFT", 64, -28)
	
	HMPJunkerMerchantButton:Show()
end

function HelpMePlay:HideJunkerButton()
	HMPJunkerMerchantButton:Hide()
end

local function HelpMePlaySellItems()
	-- Don't iterate over the whole bag.
	-- Only iterate until we've reached
	-- the number of used slots for the
	-- given bag.
	--
	-- By default, Junker should only
	-- auto sell grays and items the
	-- player puts on their list.
	--
	-- Our first check will be if the item
	-- is on our sell list.
	--
	-- Our second check will be if the item
	-- is poor quality.
	--
	-- Our third (and final) check will be
	-- if the item type matches one of the
	-- enabled filters.
	local soldItemCount = 0
	local _, avgItemLevel = GetAverageItemLevel()
	for bagId = 0, 5 do
		for slotId = 0, C_Container.GetContainerNumSlots(bagId) do
			local itemId = C_Container.GetContainerItemID(bagId, slotId)
			if itemId then
				local itemLink = C_Container.GetContainerItemLink(bagId, slotId)
				-- Certain items won't have an id.
				-- Let's avoid those.
				--
				-- We need to ensure the item isn't on
				-- the blacklist.
				if not HelpMePlayDB.Junker.GlobalBlacklistDB[itemId] and not HelpMePlayCharacterDB.Junker.BlacklistDB[itemId] then
					local _, _, itemQuality = GetItemInfo(itemLink)
					local _, itemType = GetItemInfoInstant(itemId)
					local _, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(itemId)
					if sellPrice then
						if sellPrice > 0 then
							local shouldItemBeSold = false
							
							if HelpMePlayJunkerGlobalDB[itemId] or HelpMePlayCharacterDB.Junker.DB[itemId] then
								shouldItemBeSold = true
							end
							
							if itemQuality <= HelpMePlayDB.RarityID then
								if HelpMePlayDB.RarityID == 5 then
									if itemQuality == 0 then
										shouldItemBeSold = true
									end
								else
									shouldItemBeSold = true
								end
							end
							
							if HelpMePlayDB[itemType] then
								shouldItemBeSold = true
							end
							
							if HelpMePlayDB.JunkerSoulboundModeEnabled then
								if avgItemLevel and (itemType == "Armor" or itemType == "Weapon") then
									--[[
										Description:
											If we know the player's approximate item
											level, then let's use that to determine
											if the item is legacy, and therefore
											can just be sold.
											
											This should only apply to SOULBOUND items.
									]]--
									local itemLevel = GetDetailedItemLevelInfo(itemLink)
									if (itemLevel + HelpMePlayDB.SoulboundModeMinItemLevel) <= avgItemLevel then
										if C_Item.IsBound(ItemLocation:CreateFromBagAndSlot(bagId, slotId)) then
											shouldItemBeSold = true
										end
									end
								end
							end
							
							if C_Item.IsDressableItemByID(itemLink) and HelpMePlayDB.RarityID == 5 then
								shouldItemBeSold = false
							end
							
							if shouldItemBeSold then
								C_Container.UseContainerItem(bagId, slotId)
								soldItemCount = soldItemCount + 1
							end
						end
					end
				end
				
				-- Check how many items were sold. Players
				-- can only buy back from 12 items. If
				-- 13+ are sold, then we start losing
				-- from the list starting with the first
				-- item we sold. This is "Safe Mode".
				--
				-- This should be controllable by the player.
				if HelpMePlayDB.JunkerSafeModeEnabled then
					if soldItemCount == 12 then return end
				end
			end
		end
	end
end

events:RegisterEvent("MERCHANT_SHOW")
events:SetScript("OnEvent", function(self, event, ...)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end

	if ( event == "MERCHANT_SHOW" ) then
		if ( HelpMePlayDB.JunkerEnabled == false or HelpMePlayDB.JunkerEnabled == nil ) then
			HelpMePlay:HideJunkerButton()
		else
			HelpMePlay:ShowJunkerButton()
			
			if ( HelpMePlayDB.JunkerAutoSellEnabled ) then
				if ( HelpMePlayDB.JunkerSafeModeEnabled ) then
					HelpMePlaySellItems()
				else
					for i = 1, 12 do
						HelpMePlaySellItems()
					end
				end
			end
		end
	end
end)

local function OnTooltipSetItem(tooltip, data)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	
	local itemLink = select(2, TooltipUtil.GetDisplayedItem(tooltip))
	if ( itemLink ) then
		local _, itemID = string.split(":", itemLink); itemID = tonumber(itemID)
		if ( HelpMePlayDB.Junker.GlobalDB[itemID] ) then
			tooltip:AddLine(" ")
			tooltip:AddDoubleLine(addon.CONSTANTS.COLORED_ADDON_NAME .. ":", "|cffFFFFFFSELL (GLOBAL)|r")
		elseif ( HelpMePlayDB.Junker.GlobalBlacklistDB[itemID] ) then
			tooltip:AddLine(" ")
			tooltip:AddDoubleLine(addon.CONSTANTS.COLORED_ADDON_NAME .. ":", "|cffFFFFFFBLACKLISTED (GLOBAL)|r")
		elseif ( HelpMePlayCharacterDB.Junker.DB[itemID] ) then
			tooltip:AddLine(" ")
			tooltip:AddDoubleLine(addon.CONSTANTS.COLORED_ADDON_NAME .. ":", "|cffFFFFFFSELL|r")
		elseif ( HelpMePlayCharacterDB.Junker.BlacklistDB[itemID] ) then
			tooltip:AddLine(" ")
			tooltip:AddDoubleLine(addon.CONSTANTS.COLORED_ADDON_NAME .. ":", "|cffFFFFFFBLACKLISTED|r")
		end
	end
end

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, OnTooltipSetItem)

HMPJunkerMerchantButton:HookScript("OnClick", function(self)
	HelpMePlaySellItems()
end)

HMPJunkerMerchantButton:HookScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText("This button can be used to trigger the selling process. (Added by HelpMePlay)", 1, 1, 1, true)
	GameTooltip:Show()
end)

HMPJunkerMerchantButton:HookScript("OnLeave", function(self)
	if GameTooltip:GetOwner() == self then
		GameTooltip:Hide()
	end
end)