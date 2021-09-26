local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local mouseoverDB = {
	-- Creatures
	[158345] = { -- Lady of the Falls
		["n"] = L.AchievementCriteriaInfo(14672, 1), -- Faerie Pomander
		["buffId"] = 0,
	},
	[165704] = { -- Elder Gwenna
		["n"] = L.AchievementCriteriaInfo(14672, 2), -- Slumberweb
		["buffId"] = 0,
	},
	[158519] = { -- Sorcha
		["n"] = L.AchievementCriteriaInfo(14672, 3), -- Vorkai War Paint
		["buffId"] = 0,
	},
	[165382] = { -- Gormsmith Cavina
		["n"] = L.AchievementCriteriaInfo(14672, 4), -- Gorm Whisperer
		["buffId"] = 0,
	},
	[165705] = { -- Groonoomcrooek
		["n"] = L.AchievementCriteriaInfo(14672, 5), -- Tirnenn Resilience
		["buffId"] = 0,
	},
	[165703] = { -- Elder Finnan
		["n"] = L.AchievementCriteriaInfo(14672, 6), -- Finnan's Luck
		["buffId"] = 0,
	},
	[170080] = { -- Exposed Boggart
		["n"] = L["Note: Exposed Boggart"],
		["buffId"] = 0,
	},
	-- Objects
	[L["Suspiciously Untouched Basket"]] = {
		["n"] = L["Note: Suspiciously Untouched Basket"],
		["buffId"] = 311058, -- Shimmerdusted
	},
	[L["Suspiciously Untouched Harp"]] = {
		["n"] = L["Note: Suspiciously Untouched Harp"],
		["buffId"] = 311107, -- Gossamer Laces
	},
	[L["Suspiciously Untouched Soulweb"]] = {
		["n"] = L["Note: Suspiciously Untouched Soulweb"],
		["buffId"] = 311103, -- Minty Fresh Breath
	}
}

addonTable.mouseoverDB = mouseoverDB