local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local achievements = {
	14879, -- Family Exorcist
}
local returnString = ""

e:RegisterEvent("CRITERIA_EARNED")

local function GetTrackedAchievementCriteriaCompletion()
	local numCriteria, criteriaString, isComplete, assetId, criteriaId
	for index, achievementId in ipairs(achievements) do
		numCriteria = GetAchievementNumCriteria(achievementId)
		for i = 1, numCriteria do
			_, _, _, _, _, _, _, assetId = GetAchievementCriteriaInfo(achievementId, i)
			for j = 1, GetAchievementNumCriteria(assetId) do
				if HelpMePlayAchievementDB[achievementId] == nil then
					HelpMePlayAchievementDB[achievementId] = {}
				end
				criteriaString, _, isComplete, _, _, _, _, _, _, criteriaId = GetAchievementCriteriaInfo(assetId, j)
				if HelpMePlayAchievementDB[achievementId][assetId] == nil then
					HelpMePlayAchievementDB[achievementId][assetId] = {}
					HelpMePlayAchievementDB[achievementId][assetId].link = GetAchievementLink(assetId)
				end
				if HelpMePlayAchievementDB[achievementId][assetId][criteriaId] == nil then
					HelpMePlayAchievementDB[achievementId][assetId][criteriaId] = {}
				end
				HelpMePlayAchievementDB[achievementId][assetId][criteriaId].name = criteriaString
				HelpMePlayAchievementDB[achievementId][assetId][criteriaId].isComplete = isComplete
			end
		end
	end
end

e:SetScript("OnEvent", function(self, event, ...)
	if event == "CRITERIA_EARNED" then
		local achievementId, description = ...
		for pAchievementId, cAchievementId in pairs(HelpMePlayAchievementDB) do
			if cAchievementId == achievementId then
				for criteriaId, criteriaData in pairs(cAchievementId) do
					if criteriaData.name == description then
						criteriaData.isComplete = true
					end
				end
			end
		end
	end
end)

L.GetTrackedAchievementCriteriaCompletion = GetTrackedAchievementCriteriaCompletion