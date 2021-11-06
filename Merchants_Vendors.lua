local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("MERCHANT_SHOW")

local merchants = {
	[1247] = { -- Innkeeper Belm
		["itemID"] = 2894, 			-- Rhapsody Malt
		["quantity"] = 1,
		["extendedCost"] = {},
	},
	[100437] = { -- Lanna Skyspark
		["itemID"] = 132247, 		-- Bottle of Airspark
		["quantity"] = 1,
		["extendedCost"] = {},
	},
	[160601] = { -- Caretaker Mirene
		["itemID"] = 178891, 		-- Elysian Thread
		["quantity"] = 1,
		["extendedCost"] = {},
	},
	[166640] = { -- Au'larrynar
		["itemID"] = 177957, 		-- Necessary Enhancers
		["quantity"] = 1,
		["extendedCost"] = {},
	},
	[162804] = { -- Ve'nari
		["itemID"] = 180817, 		-- Cypher of Relocation
		["quantity"] = 1,
		["extendedCost"] = {
			["currencyId"] = 1767,	-- Stygia
			["amount"] = 60,
			["check"] = true,
		},
	},
}

e:SetScript("OnEvent", function(self, event, ...)
	if event == "MERCHANT_SHOW" then
		if HelpMePlayOptionsDB.Merchants == false then return end
		local guid = UnitGUID("target") or UnitGUID("mouseover")
		if guid then
			local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
			if npcId then
				for id, _ in pairs(merchants) do
					if id == npcId then
						local numMerchantItems = GetMerchantNumItems()
						for i = 1, numMerchantItems do
							local merchantItemLink = GetMerchantItemLink(i)
							if merchantItemLink then
								local _, itemID = strsplit(":", merchantItemLink); itemID = tonumber(itemID)
								if itemID == merchants[id].itemID then
									if merchants[id]["extendedCost"] ~= {} then
										-- Some items will have an extended cost,
										-- which needs to be logically accounted
										-- for.
										local currentQuantity = C_CurrencyInfo.GetCurrencyInfo(merchants[id]["extendedCost"].currencyId).quantity
										if currentQuantity > merchants[id]["extendedCost"].amount then
											-- If the player has enough, then
											-- proceed with the transaction.
											if merchants[id]["extendedCost"].check then
												-- If 'check' is true, then
												-- we want to confirm if the
												-- player already has the item
												-- in their inventory.
												--
												-- Their bank is considered.
												--
												-- If not, then buy it.
												local count = GetItemCount(merchants[id].itemID, true)
												if count == 0 then
													BuyMerchantItem(i, merchants[id].quantity)
													break
												end
											else
												-- 'check' was false, so just
												-- proceed with the transaction.
												BuyMerchantItem(i, merchants[id].quantity)
												break
											end
										end
									else
										-- The item doesn't have a currency
										-- cost, so proceed with the transaction.
										BuyMerchantItem(i, merchants[id].quantity)
										break
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)