local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("MERCHANT_SHOW")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "MERCHANT_SHOW" then
		if HelpMePlayOptionsDB.Merchants == false or HelpMePlayOptionsDB.Merchants == nil then return end
		local guid = UnitGUID("target") or UnitGUID("mouseover")
		if guid then
			local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
			if npcId then
				for id, _ in pairs(addonTable.MERCHANTS) do
					if id == npcId then
						local numMerchantItems = GetMerchantNumItems()
						for i=1,numMerchantItems do
							local merchantItemLink = GetMerchantItemLink(i)
							if merchantItemLink then
								local _, itemID = strsplit(":", merchantItemLink); itemID = tonumber(itemID)
								for _, t in ipairs(addonTable.MERCHANTS[id]) do
									if itemID == t.itemID then
										if next(t["extendedCost"]) then
											-- Some items will have an extended cost,
											-- which needs to be logically accounted
											-- for.
											local currentQuantity = C_CurrencyInfo.GetCurrencyInfo(t["extendedCost"].currencyId).quantity
											if currentQuantity > t["extendedCost"].amount then
												-- If the player has enough, then
												-- proceed with the transaction.
												if t["extendedCost"].check then
													-- If 'check' is true, then
													-- we want to confirm if the
													-- player already has the item
													-- in their inventory.
													--
													-- Their bank is considered.
													--
													-- If not, then buy it.
													local count = GetItemCount(t.itemID, true)
													if count == 0 then
														BuyMerchantItem(i, t.quantity)
														break
													end
												else
													-- 'check' was false, so just
													-- proceed with the transaction.
													BuyMerchantItem(i, t.quantity)
													break
												end
											end
										else
											-- The item doesn't have a currency
											-- cost, so proceed with the transaction.
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