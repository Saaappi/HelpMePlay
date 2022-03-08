local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("UPDATE_MOUSEOVER_UNIT")

-- t	: Valid options are 'achievement' or 'note'.
-- n	: What is the tooltip supposed to say?
-- aId	: Achievement ID.
-- cId	: Achievement Criteria ID.
local creatureDb = {
	[170080] = { -- Exposed Boggart
		["t"] = "note",
		["n"] = L["Note: Exposed Boggart"],
	},
	[159915] = { -- Gatamatos
		["t"] = "note",
		["n"] = L["Note: CLICK ME!"],
	},
	[173806] = { -- Gatamatos
		["t"] = "note",
		["n"] = L["Note: CLICK ME!"],
	},
	[161726] = { -- Kael'thas Sunstrider (Sin #1)
		["t"] = "note",
		["n"] = L["Note: CLICK ME!"],
	},
	[161734] = { -- Kael'thas Sunstrider (Sin #2)
		["t"] = "note",
		["n"] = L["Note: CLICK ME!"],
	},
	[161737] = { -- Kael'thas Sunstrider (Sin #3)
		["t"] = "note",
		["n"] = L["Note: CLICK ME!"],
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
		if HelpMePlayOptionsDB.Notes == false or HelpMePlayOptionsDB.Notes == nil then return end
		if UnitGUID("mouseover") then
			local guid = UnitGUID("mouseover")
			if guid then
				local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
				for nameOrId, data in pairs(creatureDb) do
					if nameOrId == npcId then
						local tooltipString = ""
						for i=1,GameTooltip:NumLines() do
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