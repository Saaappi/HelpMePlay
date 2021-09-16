local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local mouseoverDB = {
	-- Objects
	[L["Suspiciously Untouched Basket"]] = {
		["note"] = L["Note: Suspiciously Untouched Basket"],
		["buffId"] = 311058, -- Shimmerdusted
	},
	[L["Suspiciously Untouched Harp"]] = {
		["note"] = L["Note: Suspiciously Untouched Harp"],
		["buffId"] = 311107, -- Gossamer Laces
	},
	[L["Suspiciously Untouched Soulweb"]] = {
		["note"] = L["Note: Suspiciously Untouched Soulweb"],
		["buffId"] = 311103, -- Minty Fresh Breath
	}
}

addonTable.mouseoverDB = mouseoverDB