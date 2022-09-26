local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
addonTable.HMPJunkerMerchantButton = _G.CreateFrame(
	"Button",
	"HMPJunkerMerchantButton",
	_G.MerchantFrame,
	"OptionsButtonTemplate"
)
local normalTexture = e:CreateTexture()
local pushedTexture = e:CreateTexture()
local highlightTexture = e:CreateTexture()

function HelpMePlay:ShowJunkerButton()
	-- Texture work. Let's recreate the bag sorting button.
	normalTexture:SetTexture("Interface\\ContainerFrame\\Bags")
	normalTexture:SetSize(28, 26)
	normalTexture:SetTexCoord(0.3125, 0.421875, 0.5390625, 0.640625)
	
	pushedTexture:SetTexture("Interface\\ContainerFrame\\Bags")
	pushedTexture:SetSize(28, 26)
	pushedTexture:SetTexCoord(0.1640625, 0.2734375, 0.8359375, 0.9375)
	
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

function HelpMePlaySellItems()
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
	local itemId = 0
	local sellPrice = 0
	local itemQuality = 0
	local itemLink = ""
	local itemType = ""
	local itemLevel = 0
	local _, avgItemLevel = GetAverageItemLevel()
	for bagId = 0, 4 do
		for slotId = 0, GetContainerNumSlots(bagId) do
			itemId = GetContainerItemID(bagId, slotId)
			if itemId then
				itemLink = GetContainerItemLink(bagId, slotId)
				-- Certain items won't have an id.
				-- Let's avoid those.
				--
				-- We need to ensure the item isn't on
				-- the blacklist.
				if HelpMePlayJunkerGlobalBlacklistDB[itemId] == nil or HelpMePlayJunkerBlacklistDB[itemId] == nil then
					_, _, _, itemQuality = GetContainerItemInfo(bagId, slotId)
					_, itemType = GetItemInfoInstant(itemId)
					_, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(itemId)
					if sellPrice then
						if sellPrice > 0 then
							if HelpMePlayJunkerGlobalDB[itemId] or HelpMePlayJunkerDB[itemId] then
								UseContainerItem(bagId, slotId)
								soldItemCount = soldItemCount + 1
							end
							
							if itemQuality <= HelpMePlayOptionsDB["Junker"]["Rarity"] then
								UseContainerItem(bagId, slotId)
								soldItemCount = soldItemCount + 1
							end
							
							if HelpMePlayOptionsDB["Junker"][itemType] then
								UseContainerItem(bagId, slotId)
								soldItemCount = soldItemCount + 1
							end
							
							if HelpMePlayOptionsDB["Junker"]["isSoulboundEnabled"] then
								if avgItemLevel and (itemType == "Armor" or itemType == "Weapon") then
									--[[
										Description:
											If we know the player's approximate item
											level, then let's use that to determine
											if the item is legacy, and therefore
											can just be sold.
											
											This should only apply to SOULBOUND items.
									]]--
									itemLevel = GetDetailedItemLevelInfo(itemLink)
									if (itemLevel+25) < avgItemLevel then
										if C_Item.IsBound(ItemLocation:CreateFromBagAndSlot(bagId, slotId)) then
											UseContainerItem(bagId, slotId)
											soldItemCount = soldItemCount + 1
										end
									end
								end
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
				if HelpMePlayOptionsDB["Junker"]["isSafeModeEnabled"] then
					if soldItemCount == 12 then return end
				end
			end
		end
	end
end

e:RegisterEvent("MERCHANT_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if event == "MERCHANT_SHOW" then
		if HelpMePlayDB.JunkerEnabled == false or HelpMePlayDB.JunkerEnabled == nil then
			HelpMePlay:HideJunkerButton()
		else
			HelpMePlay:ShowJunkerButton()
		end
	end
end)

GameTooltip:HookScript("OnTooltipSetItem", function(self)
	local _, itemLink = self:GetItem()
	if itemLink then
		local _, itemId = string.split(":", itemLink); itemId = tonumber(itemId)
		if HelpMePlayJunkerGlobalDB[itemId] then
			self:AddLine(" ")
			self:AddDoubleLine(L_GLOBALSTRINGS["Colored Addon Name"] .. " |cff00FFFF(" .. L_GLOBALSTRINGS["Tab: Junker"] .. ")|r:", L_GLOBALSTRINGS["Junker: Sell Item Text Global"])
		elseif HelpMePlayJunkerGlobalBlacklistDB[itemId] then
			self:AddLine(" ")
			self:AddDoubleLine(L_GLOBALSTRINGS["Colored Addon Name"] .. " |cff00FFFF(" .. L_GLOBALSTRINGS["Tab: Junker"] .. ")|r:", L_GLOBALSTRINGS["Junker: Blacklisted Item Text Global"])
		elseif HelpMePlayJunkerDB[itemId] then
			self:AddLine(" ")
			self:AddDoubleLine(L_GLOBALSTRINGS["Colored Addon Name"] .. " |cff00FFFF(" .. L_GLOBALSTRINGS["Tab: Junker"] .. ")|r:", L_GLOBALSTRINGS["Junker: Sell Item Text"])
		elseif HelpMePlayJunkerBlacklistDB[itemId] then
			self:AddLine(" ")
			self:AddDoubleLine(L_GLOBALSTRINGS["Colored Addon Name"] .. " |cff00FFFF(" .. L_GLOBALSTRINGS["Tab: Junker"] .. ")|r:", L_GLOBALSTRINGS["Junker: Blacklisted Item Text"])
		end
	end
end)

HMPJunkerMerchantButton:HookScript("OnClick", function(self)
	HelpMePlaySellItems()
end)

HMPJunkerMerchantButton:HookScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText(L_GLOBALSTRINGS["Junker.UI.Text.ButtonDesc"])
	GameTooltip:Show()
end)

HMPJunkerMerchantButton:HookScript("OnLeave", function(self)
	if GameTooltip:GetOwner() == self then
		GameTooltip:Hide()
	end
end)