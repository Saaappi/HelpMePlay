local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
addonTable.HMPJunkerMerchantButton = _G.CreateFrame(
	"Button",
	"HMPJunkerMerchantButton",
	_G.MerchantFrame,
	"UIPanelButtonTemplate"
)
local normalTexture = e:CreateTexture()
local pushedTexture = e:CreateTexture()
local highlightTexture = e:CreateTexture()

function HelpMePlay:ImportToJunker(itemId, instruction)
	itemId = tonumber(itemId)
	if instruction == "ADD" then
		if HelpMePlayJunkerDB[itemId] then
			HelpMePlayJunkerDB[itemId] = nil
		else
			HelpMePlayJunkerDB[itemId] = true
		end
	else
		if HelpMePlayJunkerBlacklistDB[itemId] then
			HelpMePlayJunkerBlacklistDB[itemId] = nil
		else
			HelpMePlayJunkerBlacklistDB[itemId] = true
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
	for bagId = 0, 4 do
		for slotId = 0, GetContainerNumSlots(bagId) do
			local itemId = GetContainerItemID(bagId, slotId)
			if itemId then
				local itemLink = GetContainerItemLink(bagId, slotId)
				-- Certain items won't have an id.
				-- Let's avoid those.
				--
				-- We need to ensure the item isn't on
				-- the blacklist.
				if not HelpMePlayJunkerGlobalBlacklistDB[itemId] and not HelpMePlayJunkerBlacklistDB[itemId] then
					local _, _, _, itemQuality = GetContainerItemInfo(bagId, slotId)
					local _, itemType = GetItemInfoInstant(itemId)
					local _, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(itemId)
					if sellPrice then
						if sellPrice > 0 then
							if HelpMePlayJunkerGlobalDB[itemId] or HelpMePlayJunkerDB[itemId] then
								UseContainerItem(bagId, slotId)
								soldItemCount = soldItemCount + 1
							end
							
							if itemQuality <= HelpMePlayDB.RarityId then
								UseContainerItem(bagId, slotId)
								soldItemCount = soldItemCount + 1
							end
							
							if HelpMePlayDB[itemType] then
								UseContainerItem(bagId, slotId)
								soldItemCount = soldItemCount + 1
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
									if (itemLevel+30) <= avgItemLevel then
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
				if HelpMePlayDB.JunkerSafeModeEnabled then
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
			
			if HelpMePlayDB.JunkerAutoSellEnabled then
				if HelpMePlayDB.JunkerSafeModeEnabled then
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

GameTooltip:HookScript("OnTooltipSetItem", function(self)
	local _, itemLink = self:GetItem()
	if itemLink then
		local _, itemId = string.split(":", itemLink); itemId = tonumber(itemId)
		if HelpMePlayJunkerGlobalDB[itemId] then
			self:AddLine(" ")
			self:AddDoubleLine(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ":", L_GLOBALSTRINGS["Junker.Tooltip.Text.SellGlobal"])
		elseif HelpMePlayJunkerGlobalBlacklistDB[itemId] then
			self:AddLine(" ")
			self:AddDoubleLine(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ":", L_GLOBALSTRINGS["Junker.Tooltip.Text.BlacklistedGlobal"])
		elseif HelpMePlayJunkerDB[itemId] then
			self:AddLine(" ")
			self:AddDoubleLine(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ":", L_GLOBALSTRINGS["Junker.Tooltip.Text.Sell"])
		elseif HelpMePlayJunkerBlacklistDB[itemId] then
			self:AddLine(" ")
			self:AddDoubleLine(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ":", L_GLOBALSTRINGS["Junker.Tooltip.Text.Blacklisted"])
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