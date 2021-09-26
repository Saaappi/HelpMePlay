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

local function AchievementCriteriaInfoSingle(achievementId, criteriaIndex)
	local _, _, isComplete = GetAchievementCriteriaInfo(achievementId, criteriaIndex)
	if isComplete == false then
		return L["Red X Raid Target"] .. " " .. GetAchievementLink(achievementId)
	end
end

local function AchievementCriteriaInfoMultiple(criteriaName)
	local numCriteria = 0
	local criteriaString = ""
	local isComplete = false
	for i = 1, #achievements do
		numCriteria = GetAchievementNumCriteria(achievements[i])
		for j = 1, numCriteria do
			criteriaString, _, isComplete = GetAchievementCriteriaInfo(achievements[i], j)
			if criteriaString == criteriaName then
				if isComplete == false then
					returnString = returnString .. "\n" .. L["Red X Raid Target"] .. " " .. GetAchievementLink(achievements[i])
				end
			end
		end
	end
	return returnString
end

L.AchievementCriteriaInfoSingle = AchievementCriteriaInfoSingle
L.AchievementCriteriaInfoMultiple = AchievementCriteriaInfoMultiple