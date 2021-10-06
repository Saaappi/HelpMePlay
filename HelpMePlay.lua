local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local delay = 0.1
local longerDelay = 4

local function Max(tbl)
	local highestItemIndex = 0
	local highestSellPrice = 0
	for itemIndex, itemSellPrice in ipairs(tbl) do
		if itemSellPrice > highestSellPrice then
			highestItemIndex = itemIndex
			highestSellPrice = itemSellPrice
		end
	end
	return highestItemIndex
end

local function GetQuestItemLink_Callback(index)
	local link = GetQuestItemLink("choice", index)
	if link then
		return link
	else
		GetQuestItemLink_Callback(index)
	end
end

local function CompleteQuest()
	local numQuestChoices = GetNumQuestChoices()
	if numQuestChoices > 0 then
		local sellPrices = {}
		for i = 1, numQuestChoices, 1 do
			local _, _, quantity = GetQuestItemInfo("choice", i)
			local link = GetQuestItemLink("choice", i)
			if link == nil then
				link = GetQuestItemLink_Callback(i)
			end
			local _, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(link)
			sellPrices[i] = (quantity*sellPrice)
		end
		if HelpMePlayOptionsDB.QuestRewards then
			GetQuestReward(Max(sellPrices))
		end
	else
		C_Timer.After(0, function()
			C_Timer.After(delay, function()
				QuestFrameCompleteQuestButton:Click()
			end)
		end)
	end
end

local function GetOrCompleteQuests()
	-- The priority of quest management should be NEW, COMPLETE, and IGNORE all else.
	local numAvailableQuests = C_GossipInfo.GetNumAvailableQuests()
	local numActiveQuests = C_GossipInfo.GetNumActiveQuests()
	if numAvailableQuests > 0 then
		-- The targeted NPC has quests that the player doesn't currently have.
		local availableQuests = C_GossipInfo.GetAvailableQuests()
		for i = 1, numAvailableQuests do
			C_Timer.After(0, function()
				C_Timer.After(delay, function()
					C_GossipInfo.SelectAvailableQuest(i)
				end)
			end)
		end
	end
	
	if numActiveQuests > 0 then
		local activeQuests = C_GossipInfo.GetActiveQuests()
		for i = 1, numActiveQuests do
			C_Timer.After(0, function()
				C_Timer.After(delay, function()
					if activeQuests[i].isComplete then
						-- The quest is complete, so complete it.
						C_GossipInfo.SelectActiveQuest(i)
						CompleteQuest()
					end
				end)
			end)
		end
	end
end

local function GetGreetingQuests()
	local numAvailableQuests = GetNumAvailableQuests()
	local numActiveQuests = GetNumActiveQuests()
	if numAvailableQuests > 0 then
		for i = 1, numAvailableQuests do
			SelectAvailableQuest(i)
		end
	end
	
	if numActiveQuests > 0 then
		for i = 1, numActiveQuests do
			local _, isComplete = GetActiveTitle(i)
			if isComplete then
				-- The quest is complete, so select it.
				SelectActiveQuest(i)
			end
		end
	end
end

e:RegisterEvent("ADDON_LOADED")
e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("QUEST_COMPLETE")
e:RegisterEvent("QUEST_DETAIL")
e:RegisterEvent("QUEST_GREETING")
e:RegisterEvent("QUEST_PROGRESS")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "ADDON_LOADED" then
		local addonLoaded = ...
		if addonLoaded == addonName then
			if HelpMePlayOptionsDB == nil then
				HelpMePlayOptionsDB = {}
			end
			if HelpMePlayOptionsDB.ChromieTimeExpansion == nil then
				HelpMePlayOptionsDB.ChromieTimeExpansion = 0
			end
			if HelpMePlayPlayerDialogDB == nil then
				HelpMePlayPlayerDialogDB = {}
			end
			if HelpMePlayAchievementDB == nil then
				HelpMePlayAchievementDB = {}
			end
		elseif addonLoaded == "Blizzard_AchievementUI" then
			L.GetTrackedAchievementCriteriaCompletion()
		end
	end
	if event == "GOSSIP_SHOW" then
		if HelpMePlayOptionsDB.Quests == false then return end
		C_Timer.After(0, function()
			C_Timer.After(delay, function()
				GetOrCompleteQuests()
			end)
		end)
	end
	if event == "QUEST_COMPLETE" then
		if HelpMePlayOptionsDB.Quests == false then return end
		C_Timer.After(0, function()
			C_Timer.After(delay, function()
				CompleteQuest()
			end)
		end)
		C_Timer.After(0, function()
			C_Timer.After(longerDelay, function()
				-- If the quest complete button is still visible after the delay,
				-- then the frame is likely frozen at this state, so hide it.
				if QuestFrameCompleteQuestButton:IsVisible() then
					QuestFrame:Hide()
				end
			end)
		end)
	end
	if event == "QUEST_DETAIL" then
		if HelpMePlayOptionsDB.Quests == false then return end
		C_Timer.After(0, function()
			C_Timer.After(delay, function()
				QuestFrameAcceptButton:Click()
			end)
		end)
	end
	if event == "QUEST_GREETING" then
		if HelpMePlayOptionsDB.Quests == false then return end
		C_Timer.After(0, function()
			C_Timer.After(delay, function()
				GetGreetingQuests()
			end)
		end)
	end
	if event == "QUEST_PROGRESS" then
		if HelpMePlayOptionsDB.Quests == false then return end
		C_Timer.After(0, function()
			C_Timer.After(delay, function()
				QuestFrameCompleteButton:Click()
			end)
		end)
	end
end)