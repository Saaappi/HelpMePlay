local addonName, addonTable = ...
local e = CreateFrame("Frame")

e:RegisterEvent("MERCHANT_SHOW")

local merchants = {
	[100437] = { -- Lanna Skyspark
		["index"] = 1,
		["name"] = "Bottle of Airspark",
		["quantity"] = 1,
	},
	[160601] = { -- Caretaker Mirene
		["index"] = 6,
		["name"] = "Elysian Thread",
		["quantity"] = 1,
	},
	[166640] = { -- Au'larrynar
		["index"] = 1,
		["name"] = "Necessary Enhancers",
		["quantity"] = 1,
	},
}

e:SetScript("OnEvent", function(self, event, ...)
	if event == "MERCHANT_SHOW" then
		local _, _, _, _, _, creatureID = strsplit("-", UnitGUID("target")); creatureID = tonumber(creatureID)
		for id, _ in pairs(merchants) do
			if id == creatureID then
				if GetMerchantItemInfo(id.index) == id.name then
					BuyMerchantItem(id.index, id.quantity)
					break
				end
			end
		end
	end
end)