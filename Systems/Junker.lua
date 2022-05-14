local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

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
	local freeSlots = 0
	local itemId = 0
	local sellPrice = 0
	local itemQuality = nil
	local itemType = ""
	for bagId = 0, 4 do
		freeSlots = GetContainerNumFreeSlots(bagId)
		for slotId = 0, (GetContainerNumSlots(bagId) - freeSlots) do
			itemId = GetContainerItemID(bagId, slotId)
			if itemId then
				-- Certain items won't have an id.
				-- Let's avoid those.
				--
				-- We need to ensure the item isn't on
				-- the blacklist.
				if HelpMePlayJunkerBlacklistDB[itemId] == nil then
					_, _, _, itemQuality = GetContainerItemInfo(bagId, slotId)
					_, itemType = GetItemInfoInstant(itemId)
					_, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(itemId)
					if sellPrice and sellPrice > 0 then
						if HelpMePlayJunkerDB[itemId] then
							UseContainerItem(bagId, slotId)
							soldItemCount = soldItemCount + 1
						end
						
						if itemQuality <= HelpMePlayOptionsDB.Junker.Rarity then
							UseContainerItem(bagId, slotId)
							soldItemCount = soldItemCount + 1
						end
						
						if HelpMePlayOptionsDB["Junker"][itemType] then
							UseContainerItem(bagId, slotId)
							soldItemCount = soldItemCount + 1
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
	if HelpMePlayOptionsDB.Junker.Enabled == false or HelpMePlayOptionsDB.Junker.Enabled == nil then return false end
	if event == "MERCHANT_SHOW" then
		HelpMePlaySellItems()
	end
end)

GameTooltip:HookScript("OnTooltipSetItem", function(self, ...)
	local _, itemLink = self:GetItem()
	if itemLink then
		local _, itemId = string.split(":", itemLink); itemId = tonumber(itemId)
		if HelpMePlayJunkerDB[itemId] then
			self:AddLine(" ")
			self:AddDoubleLine(L_GLOBALSTRINGS["Colored Addon Name"] .. " |cff00FFFF(" .. L_GLOBALSTRINGS["Tab: Junker"] .. ")|r:", L_GLOBALSTRINGS["Junker: Sell Item Text"])
		elseif HelpMePlayJunkerBlacklistDB[itemId] then
			self:AddLine(" ")
			self:AddDoubleLine(L_GLOBALSTRINGS["Colored Addon Name"] .. " |cff00FFFF(" .. L_GLOBALSTRINGS["Tab: Junker"] .. ")|r:", L_GLOBALSTRINGS["Junker: Blacklisted Item Text"])
		end
	end
end)