local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("MERCHANT_SHOW")

local merchants = {
	[100437] = { -- Lanna Skyspark
		["itemID"] = 132247, -- Bottle of Airspark
		["quantity"] = 1,
	},
	[160601] = { -- Caretaker Mirene
		["itemID"] = 178891, -- Elysian Thread
		["quantity"] = 1,
	},
	[166640] = { -- Au'larrynar
		["itemID"] = 177957, -- Necessary Enhancers
		["quantity"] = 1,
	},
}

e:SetScript("OnEvent", function(self, event, ...)
	if event == "MERCHANT_SHOW" then
		if HelpMePlayOptionsDB.Merchants == false then return end
		local _, _, _, _, _, npcID = strsplit("-", UnitGUID("target")); npcID = tonumber(npcID)
		for id, _ in pairs(merchants) do
			if id == npcID then
				local numMerchantItems = GetMerchantNumItems()
				for i = 1, numMerchantItems do
					local merchantItemLink = GetMerchantItemLink(i)
					if merchantItemLink then
						local _, itemID = strsplit(":", merchantItemLink); itemID = tonumber(itemID)
						if itemID == merchants[id].itemID then
							BuyMerchantItem(i, merchants[id].quantity)
							break
						end
					end
				end
			end
		end
	end
end)