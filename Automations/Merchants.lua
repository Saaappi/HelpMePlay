local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

--[[
	TODO:
		Extended costs may not always be a currency, and
		could instead be an item players hold in their
		bags. I've not yet run across this requirement, so
		the day may come when the addon needs to consider
		ITEM extended costs instead of strictly currencies.
		
	Description:
		If we want the addon to purchase a specific item from a merchant
		we accomplish that using the Merchants table.
		
		If the NPC is in the table, then we check if the current item in
		the merchant's list is the item we've documented. If so, we can
		tell the addon to purchase the item and for how much.
		
		Some items have what are known as "extended costs", which is a
		cost of anything but GOLD. For example, Stygia is an extended cost.
		If the item has a documented extended cost, which is defined in
		the addon's Merchants table, then check to see if the player has
		enough.
		
		We don't want to purchase anything if the player already has the
		item being considered in the transaction. For example, we don't
		want to purchase the Cypher of Relocation from Ve'nari if the
		player already owns one. This isn't the best example because the
		item is unique, but it gets the point across. This only occurs if
		the checkForTransactionItem boolean is true.
]]--
e:RegisterEvent("MERCHANT_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "MERCHANT_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PurchaseQuestItemsEnabled == false or HelpMePlayDB.PurchaseQuestItemsEnabled == nil then return false end
		local guid = UnitGUID("target") or UnitGUID("mouseover")
		if guid then
			local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
			if npcId then
				for id, _ in pairs(addonTable.MERCHANTS) do
					if id == npcId then
						local numMerchantItems = GetMerchantNumItems()
						for i = 1, numMerchantItems do
							local merchantItemLink = GetMerchantItemLink(i)
							if merchantItemLink then
								local _, itemID = strsplit(":", merchantItemLink); itemID = tonumber(itemID)
								for _, t in ipairs(addonTable.MERCHANTS[id]) do
									if itemID == t.itemID then
										if next(t["extendedCost"]) then
											local currentQuantity = C_CurrencyInfo.GetCurrencyInfo(t["extendedCost"].currencyId).quantity
											if currentQuantity > t["extendedCost"].amount then
												if t["extendedCost"].checkForTransactionItem then
													local count = GetItemCount(t.itemID, true)
													if count == 0 then
														BuyMerchantItem(i, t.quantity)
														break
													end
												else
													BuyMerchantItem(i, t.quantity)
													break
												end
											end
										else
											BuyMerchantItem(i, t.quantity)
											break
										end
									end
									break
								end
							end
						end
					end
				end
			end
		end
	end
end)