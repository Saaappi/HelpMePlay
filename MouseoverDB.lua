local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local mouseoverDB = {
	[L["Suspiciously Untouched Basket"]] = L["Note: Suspiciously Untouched Basket"],
	[L["Suspiciously Untouched Harp"]] = L["Note: Suspiciously Untouched Harp"],
	[L["Suspiciously Untouched Soulweb"]] = L["Note: Suspiciously Untouched Soulweb"],
}

addonTable.mouseoverDB = mouseoverDB