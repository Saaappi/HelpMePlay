local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local achievements = {
	14672, -- A Bit of This, A Bit of That
	14879, -- Family Exorcist
}
local returnString = ""

e:RegisterEvent("ACHIEVEMENT_EARNED")
e:RegisterEvent("CRITERIA_EARNED")

local function GetTrackedAchievementCriteriaCompletion()
	local numCriteria, criteriaString, isComplete, assetId, criteriaId
	for index, achievementId in ipairs(achievements) do
		if HelpMePlayAchievementDB[achievementId] == nil then
			HelpMePlayAchievementDB[achievementId] = {}
		end
		_, _, _, isComplete = GetAchievementInfo(achievementId)
		if isComplete then
			HelpMePlayAchievementDB[achievementId].isComplete = true
		else
			HelpMePlayAchievementDB[achievementId].isComplete = false
		end
		numCriteria = GetAchievementNumCriteria(achievementId)
		for i = 1, numCriteria do
			_, _, isComplete, _, _, _, _, assetId = GetAchievementCriteriaInfo(achievementId, i)
			if assetId ~= 0 then
				for j = 1, GetAchievementNumCriteria(assetId) do
					if HelpMePlayAchievementDB[achievementId] == nil then
						HelpMePlayAchievementDB[achievementId] = {}
					end
					if HelpMePlayAchievementDB[achievementId][assetId] == nil then
						HelpMePlayAchievementDB[achievementId][assetId] = {}
						HelpMePlayAchievementDB[achievementId][assetId].link = GetAchievementLink(assetId)
					end
					
					criteriaString, _, isComplete, _, _, _, _, _, _, criteriaId = GetAchievementCriteriaInfo(assetId, j)
					if HelpMePlayAchievementDB[achievementId][assetId][criteriaId] == nil then
						HelpMePlayAchievementDB[achievementId][assetId][criteriaId] = {}
					end
					HelpMePlayAchievementDB[achievementId][assetId][criteriaId].name = criteriaString
					HelpMePlayAchievementDB[achievementId][assetId][criteriaId].isComplete = isComplete
				end
			else
				HelpMePlayAchievementDB[achievementId].link = GetAchievementLink(achievementId)
				criteriaString, _, isComplete, _, _, _, _, _, _, criteriaId = GetAchievementCriteriaInfo(achievementId, i)
				if HelpMePlayAchievementDB[achievementId][criteriaId] == nil then
					HelpMePlayAchievementDB[achievementId][criteriaId] = {}
				end
				HelpMePlayAchievementDB[achievementId][criteriaId].name = criteriaString
				HelpMePlayAchievementDB[achievementId][criteriaId].isComplete = isComplete
			end
		end
	end
end

e:SetScript("OnEvent", function(self, event, ...)
	if event == "ACHIEVEMENT_EARNED" then
		local achievementId = ...
		for pAchievementId, cAchievementId in pairs(HelpMePlayAchievementDB) do
			if pAchievementId == achievementId then
				HelpMePlayAchievementDB[pAchievementId].isComplete = true
			end
		end
	end
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