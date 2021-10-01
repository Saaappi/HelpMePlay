local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local achievements = {
	14868, -- Aquatic Apparitions
	14869, -- Beast Busters
	14870, -- Creepy Critters
	14871, -- Deathly Dragonkin
	14872, -- Eerie Elementals
	14873, -- Flickering Fliers
	14874, -- Haunted Humanoids
	14875, -- Mummified Magics
	14876, -- Macabre Mechanicals
	14877, -- Unholy Undead
}
local returnString = ""

local function AchievementCriteriaInfoByCriteriaID(achievementId, criteriaId)
	local _, achievementName = GetAchievementInfo(achievementId)
	if achievementName then
		local criteriaName, _, isComplete = GetAchievementCriteriaInfoByID(achievementId, criteriaId)
		if criteriaName then
			if isComplete == false then
				if GetAchievementLink(achievementId) then
					return L["Red X Raid Target"] .. " " .. GetAchievementLink(achievementId)
				else
					return L["Red X Raid Target"] .. " " .. achievementName
				end
			end
		end
	end
end

-- TODO
-- This is getting called when the addon
-- loads and not when the Mouseover logic
-- calls it. The addon is broken before
-- it gets a chance to work the way it's
-- supposed to...
local function AchievementCriteriaInfoByCriteriaName(desiredCriteriaName)
	for i = 1, #achievements do
		local _, achievementName = GetAchievementInfo(achievements[i])
		local numCriteria = GetAchievementNumCriteria(achievements[i])
		if achievementName then
			for j = 1, numCriteria do
				local criteriaName, _, isComplete = GetAchievementCriteriaInfo(achievements[i], j)
				if criteriaName == desiredCriteriaName then
					if isComplete == false then
						--[[if GetAchievementLink(achievements[i]) then
							returnString = returnString .. "\n" .. L["Red X Raid Target"] .. " " .. GetAchievementLink(achievements[i])
						else
							returnString = returnString .. "\n" .. L["Red X Raid Target"] .. " " .. achievementName
						end]]
						returnString = returnString .. "\n" .. L["Red X Raid Target"] .. " " .. GetAchievementLink(achievements[i])
					end
				end
			end
		end
	end
	return returnString
end

L.AchievementCriteriaInfoByCriteriaID = AchievementCriteriaInfoByCriteriaID
L.AchievementCriteriaInfoByCriteriaName = AchievementCriteriaInfoByCriteriaName