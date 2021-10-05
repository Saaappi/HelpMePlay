local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("UPDATE_MOUSEOVER_UNIT")

local Db = {
	-- Creatures
	[158345] = { -- Lady of the Falls
		["n"] = L.AchievementCriteriaInfoByCriteriaID(14672, 49570), -- A Bit of This, A Bit of That: Faerie Pomander
		["buffId"] = 0,
	},
	[165704] = { -- Elder Gwenna
		["n"] = L.AchievementCriteriaInfoByCriteriaID(14672, 49571), --  A Bit of This, A Bit of That: Slumberweb
		["buffId"] = 0,
	}, 
	[158519] = { -- Sorcha
		["n"] = L.AchievementCriteriaInfoByCriteriaID(14672, 49572), --  A Bit of This, A Bit of That: Vorkai War Paint
		["buffId"] = 0,
	}, 
	[165382] = { -- Gormsmith Cavina
		["n"] = L.AchievementCriteriaInfoByCriteriaID(14672, 49573), --  A Bit of This, A Bit of That: Gorm Whisperer
		["buffId"] = 0, 
	},
	[165705] = { -- Groonoomcrooek
		["n"] = L.AchievementCriteriaInfoByCriteriaID(14672, 49574), --  A Bit of This, A Bit of That: Tirnenn Resilience
		["buffId"] = 0,
	},
	[165703] = { -- Elder Finnan 
		["n"] = L.AchievementCriteriaInfoByCriteriaID(14672, 49575), --  A Bit of This, A Bit of That: Finnan's Luck
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
}

-- Add notes to the tooltip of select creatures
-- and items.
e:SetScript("OnEvent", function(self, event, ...)
	if event == "UPDATE_MOUSEOVER_UNIT" then
		if HelpMePlayOptionsDB.Notes == false then return end
		if UnitGUID("mouseover") then
			local guid = UnitGUID("mouseover")
			if guid then
				local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
				for nameOrId, data in pairs(Db) do
					if nameOrId == npcId then
						for i = 1, GameTooltip:NumLines() do
							if string.find(_G[GameTooltip:GetName().."TextLeft"..i]:GetText(), addonName) then return end
						end
						--GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. data.n)
						--GameTooltip:Show()
					end
				end
			end
		end
	end
end)