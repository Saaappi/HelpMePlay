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
		["cId"] = 49570,
	},
	[165704] = { -- Elder Gwenna
		["t"] = "achievement",
		["aId"] = 14672, --  A Bit of This, A Bit of That: Slumberweb
		["cId"] = 49571,
	}, 
	[158519] = { -- Sorcha
		["t"] = "achievement",
		["aId"] = 14672, --  A Bit of This, A Bit of That: Vorkai War Paint
		["cId"] = 49572,
	}, 
	[165382] = { -- Gormsmith Cavina
		["t"] = "achievement",
		["aId"] = 14672, --  A Bit of This, A Bit of That: Gorm Whisperer
		["cId"] = 49573,
	},
	[165705] = { -- Groonoomcrooek
		["t"] = "achievement",
		["aId"] = 14672, --  A Bit of This, A Bit of That: Tirnenn Resilience
		["cId"] = 49574,
	},
	[165703] = { -- Elder Finnan 
		["t"] = "achievement",
		["aId"] = 14672, --  A Bit of This, A Bit of That: Finnan's Luck
		["cId"] = 49575,
	},
	[170080] = { -- Exposed Boggart
		["t"] = "note",
		["n"] = L["Note: Exposed Boggart"],
	},
	[173377] = { -- Faryl
		["t"] = "parent_achievement",
		["aId"] = 14879,
		["cId"] = L["Faryl"],
	},
	[173129] = { -- Thenia
		["t"] = "parent_achievement",
		["aId"] = 14879,
		["cId"] = L["Thenia"],
	},
	[173315] = { -- Sylla
		["t"] = "parent_achievement",
		["aId"] = 14879,
		["cId"] = L["Sylla"],
	},
	[173324] = { -- Eyegor
		["t"] = "parent_achievement",
		["aId"] = 14879,
		["cId"] = L["Eyegor"],
	},
	[173331] = { -- Addius the Tormenter
		["t"] = "parent_achievement",
		["aId"] = 14879,
		["cId"] = L["Addius the Tormenter"],
	},
	[173263] = { -- Rotgut
		["t"] = "parent_achievement",
		["aId"] = 14879,
		["cId"] = L["Rotgut"],
	},
	[173267] = { -- Dundley Stickyfingers
		["t"] = "parent_achievement",
		["aId"] = 14879,
		["cId"] = L["Dundley Stickyfingers"],
	},
	[173257] = { -- Caregiver Maximillian
		["t"] = "parent_achievement",
		["aId"] = 14879,
		["cId"] = L["Caregiver Maximillian"],
	},
	[173130] = { -- Zolla
		["t"] = "parent_achievement",
		["aId"] = 14879,
		["cId"] = L["Zolla"],
	},
	[173131] = { -- Stratios
		["t"] = "parent_achievement",
		["aId"] = 14879,
		["cId"] = L["Stratios"],
	},
	[173372] = { -- Glitterdust
		["t"] = "parent_achievement",
		["aId"] = 14879,
		["cId"] = L["Glitterdust"],
	},
	[159915] = { -- Gatamatos
		["t"] = "note",
		["n"] = L["Note: Gatamatos"],
	},
	[173806] = { -- Gatamatos
		["t"] = "note",
		["n"] = L["Note: Gatamatos"],
	},
	[164675] = { -- Lever (Torghast Chest)
		["t"] = "note",
		["n"] = L["Note: Torghast Lever"],
	},
}

-- Add notes to the tooltip of select creatures
-- and items.
e:SetScript("OnEvent", function(self, event, ...)
	if event == "UPDATE_MOUSEOVER_UNIT" then
		if HelpMePlayOptionsDB.Notes == false HelpMePlayOptionsDB.Notes == nil then return end
		if UnitGUID("mouseover") then
			local guid = UnitGUID("mouseover")
			if guid then
				local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
				for nameOrId, data in pairs(creatureDb) do
					if nameOrId == npcId then
						local tooltipString = ""
						for i = 1, GameTooltip:NumLines() do
							if string.find(_G[GameTooltip:GetName().."TextLeft"..i]:GetText(), addonName) then return end
						end
						if data.t == "parent_achievement" then
							for pAchievementId, _ in pairs(HelpMePlayAchievementDB) do
								if pAchievementId == data.aId then
									if HelpMePlayAchievementDB[pAchievementId].isComplete then return end
									for cAchievementId, cAchievementData in pairs(HelpMePlayAchievementDB[pAchievementId]) do
										if type(HelpMePlayAchievementDB[pAchievementId][cAchievementId]) == "table" then
											for criteriaId, criteriaData in pairs(HelpMePlayAchievementDB[pAchievementId][cAchievementId]) do
												if criteriaData.name == data.cId then
													if criteriaData.isComplete == false then
														tooltipString = tooltipString .. "\n" .. L["Red X Raid Target"] .. cAchievementData.link
													end
												end
											end
										end
									end
								end
							end
							GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. tooltipString)
							GameTooltip:Show()
						elseif data.t == "achievement" then
							for pAchievementId, _ in pairs (HelpMePlayAchievementDB) do
								if HelpMePlayAchievementDB[pAchievementId].isComplete then return end
								if pAchievementId == data.aId then
									if HelpMePlayAchievementDB[pAchievementId][data.cId].isComplete == false then
										tooltipString = tooltipString .. "\n" .. L["Red X Raid Target"] .. pAchievementId.link
									end
									GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. tooltipString)
									GameTooltip:Show()
								end
							end
							GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. tooltipString)
							GameTooltip:Show()
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