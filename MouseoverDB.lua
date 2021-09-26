local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local mouseoverDB = {
	-- Creatures
	[158345] = { -- Lady of the Falls
		["n"] = L.AchievementCriteriaInfoSingle(14672, 1), -- A Bit of This, A Bit of That: Faerie Pomander
		["buffId"] = 0,
	},
	[165704] = { -- Elder Gwenna
		["n"] = L.AchievementCriteriaInfoSingle(14672, 2), --  A Bit of This, A Bit of That: Slumberweb
		["buffId"] = 0,
	}, 
	[158519] = { -- Sorcha
		["n"] = L.AchievementCriteriaInfoSingle(14672, 3), --  A Bit of This, A Bit of That: Vorkai War Paint
		["buffId"] = 0,
	}, 
	[165382] = { -- Gormsmith Cavina
		["n"] = L.AchievementCriteriaInfoSingle(14672, 4), --  A Bit of This, A Bit of That: Gorm Whisperer
		["buffId"] = 0, 
	},
	[165705] = { -- Groonoomcrooek
		["n"] = L.AchievementCriteriaInfoSingle(14672, 5), --  A Bit of This, A Bit of That: Tirnenn Resilience
		["buffId"] = 0,
	},
	[165703] = { -- Elder Finnan 
		["n"] = L.AchievementCriteriaInfoSingle(14672, 6), --  A Bit of This, A Bit of That: Finnan's Luck
		["buffId"] = 0,
	},
	[170080] = { -- Exposed Boggart
		["n"] = L["Note: Exposed Boggart"],
		["buffId"] = 0,
	},
	[173377] = { -- Faryl
		["n"] = L.AchievementCriteriaInfoMultiple("Faryl"), -- Pet Battles (Family Exorcist)
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