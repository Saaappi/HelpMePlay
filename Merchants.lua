local addonName, t = ...
local e = CreateFrame("Frame")

e:RegisterEvent("MERCHANT_SHOW")

local merchants = {
	[100437] = { -- Lanna Skyspark
		[1] = {
			["name"] = "Bottle of Airspark",
			["quantity"] = 1,
		},
	},
	[160601] = { -- Caretaker Mirene
		[6] = {
			["name"] = "Elysian Thread",
			["quantity"] = 1,
		},
	},
	[166640] = { -- Au'larrynar
		[1] = {
			["name"] = "Necessary Enhancers",
			["quantity"] = 1,
		},
	},
}

e:SetScript("OnEvent", function(self, event, ...)
	if (event == "MERCHANT_SHOW") then
		local _, _, _, _, _, creatureID = strsplit("-", UnitGUID("target")); creatureID = tonumber(creatureID)
		for id, indices in pairs(merchants) do
			if (id == creatureID) then
				for itemIndex, itemData in pairs(indices) do
					if ((GetMerchantItemInfo(itemIndex)) == itemData.name) then
						BuyMerchantItem(itemIndex, itemData.quantity)
						break
					end
				end
			end
		end
	end
end)