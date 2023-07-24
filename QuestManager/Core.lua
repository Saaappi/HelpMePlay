local addonName, addon = ...
local e = CreateFrame("Frame")
local itemLevels = {}
local sellPrices = {}
local bestItemIndex = 0

hooksecurefunc("QuestMapLogTitleButton_OnClick", function(self)
	if IsControlKeyDown() or IsAltKeyDown() then
		C_QuestLog.SetSelectedQuest(self.questID)
		C_QuestLog.SetAbandonQuest()
		C_QuestLog.AbandonQuest()
	end
end)

hooksecurefunc(QuestLogHeaderCodeMixin, "OnClick", function(self)
	if IsControlKeyDown() or IsAltKeyDown() then
		local info = C_QuestLog.GetInfo(self.questLogIndex)
		if info then
			local childQuestLogIndex = self.questLogIndex + 1
			for i=childQuestLogIndex, C_QuestLog.GetNumQuestLogEntries() do
				info = C_QuestLog.GetInfo(i)
				if info then
					if not info.isHeader and not info.isHidden then
						C_QuestLog.SetSelectedQuest(info.questID)
						C_QuestLog.SetAbandonQuest()
						C_QuestLog.AbandonQuest()
					else
						break
					end
				end
			end
		end
	end
end)

hooksecurefunc("QuestMapFrame_OpenToQuestDetails", function(self)
	local questId = self
	if IsControlKeyDown() or IsAltKeyDown() then
		C_QuestLog.SetSelectedQuest(questId)
		C_QuestLog.SetAbandonQuest()
		C_QuestLog.AbandonQuest()
		WorldMapFrameCloseButton:Click()
	end
end)

local function CompleteQuest()
	local numQuestChoices = GetNumQuestChoices()
	if (numQuestChoices > 1) then
		if (HelpMePlayDB.CompleteQuestsEnabled) then
			if HelpMePlayDB.QuestRewardID == 0 or HelpMePlayDB.QuestRewardID == false or HelpMePlayDB.QuestRewardID == nil then return false end
			
			if (HelpMePlayDB.QuestRewardID == 1) then
				itemLevels = {}
			end
			
			local itemID = 0
			local itemSellPrice = 0
			local totalSellPrice = 0
			local itemLink = ""
			if (UnitLevel("player") < addon.CONSTANTS["MAX_PLAYER_LEVEL"]) then
				for i=1,numQuestChoices do
					local _, _, quantity = GetQuestItemInfo("choice", i)
					itemLink = GetQuestItemLink("choice", i)
					if (itemLink) then
						_, itemID = string.split(":", itemLink); itemID = tonumber(itemID)
						
						if (addon.QUESTREWARDS[itemID]) then
							bestItemIndex = i
							break
						end

						if (HelpMePlayDB.QuestRewardID == 1) then
							local _, _, _, _, _, itemType = GetItemInfo(itemLink)
							if itemType == "Weapon" then return end
							
							local rewardItemLevel = GetDetailedItemLevelInfo(GetQuestItemLink("choice", i))
							local rewardItemType = C_Item.GetItemInventoryTypeByID(GetQuestItemLink("choice", i))
							if rewardItemType ~= 0 then
								local equippedItemType = 0
								if type(addon.CONSTANTS["SLOTS"][rewardItemType]) == "table" then
									for _, invSlotID in ipairs(addon.CONSTANTS["SLOTS"][rewardItemType]) do
										local item = ItemLocation:CreateFromEquipmentSlot(invSlotID)
										if item:IsValid() then
											equippedItemType = C_Item.GetItemInventoryType(ItemLocation:CreateFromEquipmentSlot(item.equipmentSlotIndex))
											if equippedItemType == rewardItemType then
												local equippedItemQuality = C_Item.GetItemQuality(item)
												if equippedItemQuality == 7 then
													local equippedItemID = C_Item.GetItemID(item)
													local _, _, _, _, _, _, _, effectiveHeirloomLevel = C_Heirloom.GetHeirloomInfo(equippedItemID)
													if (UnitLevel("player") > effectiveHeirloomLevel) then
														if (rewardItemLevel > C_Item.GetCurrentItemLevel(item)) then
															bestItemIndex = i
														end
													end
												else
													if (rewardItemLevel > C_Item.GetCurrentItemLevel(item)) then
														bestItemIndex = i
													end
												end
											end
										end
									end
								else
									local item = ItemLocation:CreateFromEquipmentSlot(addon.CONSTANTS["SLOTS"][rewardItemType])
									if item:IsValid() then
										if rewardItemType ~= 4 and rewardItemType ~= 19 then
											equippedItemType = C_Item.GetItemInventoryType(ItemLocation:CreateFromEquipmentSlot(item.equipmentSlotIndex))
											if equippedItemType == rewardItemType then
												local equippedItemQuality = C_Item.GetItemQuality(item)
												if equippedItemQuality == 7 then
													local equippedItemID = C_Item.GetItemID(item)
													local _, _, _, _, _, _, _, effectiveHeirloomLevel = C_Heirloom.GetHeirloomInfo(equippedItemID)
													if (UnitLevel("player") > effectiveHeirloomLevel) then
														if (rewardItemLevel > C_Item.GetCurrentItemLevel(item)) then
															bestItemIndex = i
														end
													end
												else
													if (rewardItemLevel > C_Item.GetCurrentItemLevel(item)) then
														bestItemIndex = i
													end
												end
											end
										end
									end
								end
							end
						elseif (HelpMePlayDB.QuestRewardID == 2) then
							local _, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(itemLink)
							if (sellPrice > 0) then
								itemSellPrice = (quantity * sellPrice)
								if (itemSellPrice > totalSellPrice) then
									bestItemIndex = i
									totalSellPrice = itemSellPrice
								end
							end
						end
					end
				end
				
				if (bestItemIndex == 0) then
					GetQuestReward(random(1, numQuestChoices))
				else
					GetQuestReward(bestItemIndex)
					if (HelpMePlayDB.QuestRewardID == 2) then
						if (HelpMePlayDB.JunkerEnabled) then
							if (not HelpMePlayDB.Junker.GlobalDB[itemID]) then
								HelpMePlayDB.Junker.GlobalDB[itemID] = true
							end
						end
					end
				end
			end
		end
	elseif numQuestChoices == 1 then
		if (HelpMePlayDB.CompleteQuestsEnabled) then
			GetQuestReward(1)
		end
	else
		if (HelpMePlayDB.CompleteQuestsEnabled) then
			QuestFrameCompleteQuestButton:Click()
		end
	end
end

local function CompleteActiveQuests(gossipInfo)
	if HelpMePlayDB.CompleteQuestsEnabled == false or HelpMePlayDB.CompleteQuestsEnabled == nil then return end
	
	if IsShiftKeyDown() then
		C_Timer.After(addon.CONSTANTS["HALF_SECOND"], function()
			CompleteActiveQuests(gossipInfo)
		end)
	else
		for i, questData in ipairs(gossipInfo) do
			if questData.isComplete then
				C_GossipInfo.SelectActiveQuest(questData.questID)
				CompleteQuest()
			end
		end
	end
end

local function GetAvailableQuests(gossipInfo)
	if HelpMePlayDB.AcceptQuestsEnabled == false or HelpMePlayDB.AcceptQuestsEnabled == nil then return end
	
	if IsShiftKeyDown() then
		C_Timer.After(addon.CONSTANTS["HALF_SECOND"], function()
			GetAvailableQuests(gossipInfo)
		end)
	else
		for i, questData in ipairs(gossipInfo) do
			if not HelpMePlayDB.IgnoredQuests[questData.questID] and not addon.IGNORED_QUESTS[questData.questID] then
				C_GossipInfo.SelectAvailableQuest(questData.questID)
			end
		end
	end
end

local function QUEST_GREETING()
	if IsShiftKeyDown() then
		C_Timer.After(addon.CONSTANTS["HALF_SECOND"], function()
			QUEST_GREETING()
		end)
	else
		for i = 1, GetNumActiveQuests() do
			local questId = GetActiveQuestID(i)
			if HelpMePlayDB.IgnoredQuests[questId] then return end
			if addon.IGNORED_QUESTS[questId] then return end
			
			local _, isComplete = GetActiveTitle(i)
			if isComplete then
				SelectActiveQuest(i)
			end
		end
		for i = 1, GetNumAvailableQuests() do
			local _, _, _, _, questId = GetAvailableQuestInfo(i)
			if HelpMePlayDB.IgnoredQuests[questId] then return end
			if addon.IGNORED_QUESTS[questId] then return end
			
			SelectAvailableQuest(i)
		end
	end
end

local function QUEST_DETAIL(isAutoAccept)
	if IsShiftKeyDown() then
		C_Timer.After(addon.CONSTANTS["HALF_SECOND"], function()
			QUEST_DETAIL()
		end)
	else
		if isAutoAccept then
			CloseQuest()
		else
			AcceptQuest()
		end
	end
end

e:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
e:RegisterEvent("QUEST_ACCEPTED")
e:RegisterEvent("QUEST_AUTOCOMPLETE")
e:RegisterEvent("QUEST_COMPLETE")
e:RegisterEvent("QUEST_DETAIL")
e:RegisterEvent("QUEST_GREETING")
e:RegisterEvent("QUEST_LOOT_RECEIVED")
e:RegisterEvent("QUEST_PROGRESS")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.AcceptQuestsEnabled == false or HelpMePlayDB.AcceptQuestsEnabled == nil then return end
		if HelpMePlayDB.CompleteQuestsEnabled == false or HelpMePlayDB.CompleteQuestsEnabled == nil then return false end
		
		local type = ...
		if type == 3 then
			local unitGUID = UnitGUID("target")
			if unitGUID then
				local _, _, _, _, _, npcID = string.split("-", unitGUID); npcID = tonumber(npcID)
				if HelpMePlayDB.IgnoredCreatures[npcID] then return end
			end
			
			local activeQuests = C_GossipInfo.GetActiveQuests()
			local availableQuests = C_GossipInfo.GetAvailableQuests()
			if activeQuests then
				CompleteActiveQuests(activeQuests)
			end
			if availableQuests then
				GetAvailableQuests(availableQuests)
			end
		end
	end
	
	if event == "QUEST_ACCEPTED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.AcceptQuestsEnabled == false or HelpMePlayDB.AcceptQuestsEnabled == nil then return end
		
		local questID = ...
		
		if UnitLevel("player") == addon.CONSTANTS["MAX_PLAYER_LEVEL"] then
			C_QuestLog.AddQuestWatch(questID)
		end

		if select(2, IsAddOnLoaded("Immersion")) then
			C_Timer.After(addon.CONSTANTS["HALF_SECOND"], function()
				ImmersionFrame.TalkBox.MainFrame.CloseButton:Click()
			end)
		end
		
		for i = 1, C_QuestLog.GetNumQuestLogEntries() do
			local id = C_QuestLog.GetQuestIDForLogIndex(i)
			if id == questID and (HelpMePlayDB.IgnoredQuests[questID] or addon.IGNORED_QUESTS[questID]) then
				C_QuestLog.SetSelectedQuest(id)
				C_QuestLog.SetAbandonQuest()
				C_QuestLog.AbandonQuest()
			end
		end
	end
	if event == "QUEST_AUTOCOMPLETE" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.CompleteQuestsEnabled == false or HelpMePlayDB.CompleteQuestsEnabled == nil then return false end
		local questID = ...
		ShowQuestComplete(questID)
	end
	if event == "QUEST_COMPLETE" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.CompleteQuestsEnabled == false or HelpMePlayDB.CompleteQuestsEnabled == nil then return false end
		CompleteQuest()
	end
	if event == "QUEST_DETAIL" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.AcceptQuestsEnabled == false or HelpMePlayDB.AcceptQuestsEnabled == nil then return false end
		if QuestGetAutoAccept() then
			QUEST_DETAIL(true)
		else
			local GUID = UnitGUID("target")
			if GUID then
				local _, _, _, _, _, npcID = string.split("-", GUID); npcID = tonumber(npcID)
				if HelpMePlayDB.IgnoredCreatures[npcID] then return end
				if addon.IGNORED_QUESTS[GetQuestID()] then QuestFrameDeclineButton:Click() end
			end
			QUEST_DETAIL(false)
		end
	end
	if event == "QUEST_GREETING" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.AcceptQuestsEnabled == false or HelpMePlayDB.AcceptQuestsEnabled == nil then return false end
		if HelpMePlayDB.CompleteQuestsEnabled == false or HelpMePlayDB.CompleteQuestsEnabled == nil then return false end
		local GUID = UnitGUID("target")
		if GUID then
			local _, _, _, _, _, npcID = string.split("-", GUID); npcID = tonumber(npcID)
			if HelpMePlayDB.IgnoredCreatures[npcID] then return end
		end
		QUEST_GREETING()
	end
	if event == "QUEST_LOOT_RECEIVED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return end
		if HelpMePlayDB.AutoEquipQuestRewardsEnabled == false or HelpMePlayDB.AutoEquipQuestRewardsEnabled == nil then return end
		if HelpMePlayDB.QuestRewardID ~= 1 then return end
	
		local _, itemLink = ...
		if itemLink then
			local _, itemID = string.split(":", itemLink); itemID = tonumber(itemID)
			if addon.IGNORED_QUESTREWARDS[itemID] then return end
			C_Timer.After(0.5, function()
				addon.EquipItem(itemLink)
			end)
		end
	end
	if event == "QUEST_PROGRESS" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.CompleteQuestsEnabled == false or HelpMePlayDB.CompleteQuestsEnabled == nil then return false end
		
		local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
		if unitGUID then
			local _, _, _, _, _, npcID = strsplit("-", unitGUID); npcID = tonumber(npcID)
			if HelpMePlayDB.IgnoredCreatures[npcID] then return end
		end
		
		if IsQuestCompletable() then
			QuestFrameCompleteButton:Click()
			CompleteQuest()
		end
	end
end)