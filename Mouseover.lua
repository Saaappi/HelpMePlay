local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("UPDATE_MOUSEOVER_UNIT")

-- t	: Valid options are 'achievement' or 'note'.
-- n	: What is the tooltip supposed to say?
-- aId	: Achievement ID.
-- cId	: Achievement Criteria ID.
local creatureDb = {
	[158345] = { -- Lady of the Falls
		["t"] = "achievement",
		["aId"] = 14672, -- A Bit of This, A Bit of That: Faerie Pomander
	},
	[165704] = { -- Elder Gwenna
		["t"] = "achievement",
		["aId"] = 14672, --  A Bit of This, A Bit of That: Slumberweb
	}, 
	[158519] = { -- Sorcha
		["t"] = "achievement",
		["aId"] = 14672, --  A Bit of This, A Bit of That: Vorkai War Paint
	}, 
	[165382] = { -- Gormsmith Cavina
		["t"] = "achievement",
		["aId"] = 14672, --  A Bit of This, A Bit of That: Gorm Whisperer
	},
	[165705] = { -- Groonoomcrooek
		["t"] = "achievement",
		["aId"] = 14672, --  A Bit of This, A Bit of That: Tirnenn Resilience
	},
	[165703] = { -- Elder Finnan 
		["t"] = "achievement",
		["aId"] = 14672, --  A Bit of This, A Bit of That: Finnan's Luck
	},
	[170080] = { -- Exposed Boggart
		["t"] = "note",
		["n"] = L["Note: Exposed Boggart"],
	},
	[173377] = { -- Faryl
		["t"] = "achievement",
		["aId"] = 14879,
	},
	[173129] = { -- Thenia
		["t"] = "achievement",
		["aId"] = 14879,
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
				for nameOrId, data in pairs(creatureDb) do
					if nameOrId == npcId then
						for i = 1, GameTooltip:NumLines() do
							if string.find(_G[GameTooltip:GetName().."TextLeft"..i]:GetText(), addonName) then return end
						end
						if data.t == "achievement" then
							
						elseif data.t == "note" then
							GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. data.n)
							GameTooltip:Show()
						end
					end
				end
			end
		end
	end
end)