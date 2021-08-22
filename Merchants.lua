local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("MERCHANT_SHOW")

local merchants = {
	[100437] = { -- Lanna Skyspark
		["itemID"] = 132247,
		["quantity"] = 1,
	},
	[160601] = { -- Caretaker Mirene
		["itemID"] = 178891,
		["quantity"] = 1,
	},
	[166640] = { -- Au'larrynar
		["itemID"] = 177957,
		["quantity"] = 1,
	},
}

e:SetScript("OnEvent", function(self, event, ...)
	if event == "MERCHANT_SHOW" then
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