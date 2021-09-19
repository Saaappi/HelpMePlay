local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local mouseoverDB = {
	-- Creatures
	[170080] = { -- Exposed Boggart
		["note"] = L["Note: Exposed Boggart"],
		["buffId"] = 0,
	},
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