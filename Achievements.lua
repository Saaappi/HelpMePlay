local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local function AchievementCriteriaInfo(achievementId, criteriaIndex)
	local _, _, isComplete = GetAchievementCriteriaInfo(achievementId, criteriaIndex)
	if isComplete == false then
		return L["Red X Raid Target"] .. " " .. GetAchievementLink(achievementId)
	end
end

L.AchievementCriteriaInfo = AchievementCriteriaInfo