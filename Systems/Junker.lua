local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("MERCHANT_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if HelpMePlayOptionsDB.Junker.Enabled == false or HelpMePlayOptionsDB.Junker.Enabled == nil then return false end
	if event == "MERCHANT_SHOW" then
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
		local freeSlots = 0
		local itemId = 0
		local itemQuality = nil
		local itemType = ""
		for bagId = 0, 4 do
			freeSlots = GetContainerNumFreeSlots(bagId)
			for slotId = 0, (GetContainerNumSlots(bagId) - freeSlots) do
				itemId = GetContainerItemID(bagId, slotId)
				if itemId then
					-- Certain items won't have an id.
					-- Let's avoid those.
					_, _, _, itemQuality = GetContainerItemInfo(bagId, slotId)
					_, itemType = GetItemInfoInstant(itemId)
					if HelpMePlayJunkerDB[itemId] then
						UseContainerItem(bagId, slotId)
					end
					
					if itemQuality == 0 then
						UseContainerItem(bagId, slotId)
					end
					
					if HelpMePlayOptionsDB["Junker"][itemType] then
						UseContainerItem(bagId, slotId)
					end
				end
			end
		end
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