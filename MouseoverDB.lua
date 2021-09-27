local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local mouseoverDB = {
	-- Creatures
	[158345] = { -- Lady of the Falls
		["n"] = L.AchievementCriteriaInfoByID(14672, 49570), -- A Bit of This, A Bit of That: Faerie Pomander
		["buffId"] = 0,
	},
	[165704] = { -- Elder Gwenna
		["n"] = L.AchievementCriteriaInfoByID(14672, 49571), --  A Bit of This, A Bit of That: Slumberweb
		["buffId"] = 0,
	}, 
	[158519] = { -- Sorcha
		["n"] = L.AchievementCriteriaInfoByID(14672, 49572), --  A Bit of This, A Bit of That: Vorkai War Paint
		["buffId"] = 0,
	}, 
	[165382] = { -- Gormsmith Cavina
		["n"] = L.AchievementCriteriaInfoByID(14672, 49573), --  A Bit of This, A Bit of That: Gorm Whisperer
		["buffId"] = 0, 
	},
	[165705] = { -- Groonoomcrooek
		["n"] = L.AchievementCriteriaInfoByID(14672, 49574), --  A Bit of This, A Bit of That: Tirnenn Resilience
		["buffId"] = 0,
	},
	[165703] = { -- Elder Finnan 
		["n"] = L.AchievementCriteriaInfoByID(14672, 49575), --  A Bit of This, A Bit of That: Finnan's Luck
		["buffId"] = 0,
	},
	[170080] = { -- Exposed Boggart
		["n"] = L["Note: Exposed Boggart"],
		["buffId"] = 0,
	},
	[173377] = { -- Faryl
		["n"] = L.AchievementCriteriaInfoByCriteriaName("Faryl"), -- Pet Battles (Family Exorcist)
		["buffId"] = 0,
	},
	[173129] = { -- Thenia
		["n"] = L.AchievementCriteriaInfoByCriteriaName("Thenia"), -- Pet Battles (Family Exorcist)
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