local addonName, addonTable = ...
local e = CreateFrame("Frame")
local itemLevels = {}
local sellPrices = {}
local bestItemIndex = 0

local function EquipItem(itemLink)
	if UnitLevel("player") < addonTable.CONSTANTS["MAX_PLAYER_LEVEL"] then
		if not UnitAffectingCombat("player") then
			if itemLink then
				local _, _, _, _, _, itemType, itemSubType = GetItemInfo(itemLink)
				if (itemType == "Weapon") or (itemType == "Armor" and itemSubType == "Miscellaneous") then return end

				local equipSlot = 0
				local _, rewardItemID = string.split(":", itemLink); rewardItemID = tonumber(rewardItemID)
				local rewardItemLevel = GetDetailedItemLevelInfo(itemLink)
				local rewardItemType = C_Item.GetItemInventoryTypeByID(itemLink)
				C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
					local equippedItem = 0
					local equippedItemQuality = 0
					if rewardItemType ~= 0 then
						if type(addonTable.CONSTANTS["SLOTS"][rewardItemType]) == "table" then
							for _, invSlotID in ipairs(addonTable.CONSTANTS["SLOTS"][rewardItemType]) do
								equippedItem = ItemLocation:CreateFromEquipmentSlot(invSlotID)
								if equippedItem:IsValid() then
									local equippedItemLevel = C_Item.GetCurrentItemLevel(equippedItem)
									equippedItemQuality = C_Item.GetItemQuality(equippedItem)
									if rewardItemLevel > equippedItemLevel then
										equipSlot = invSlotID
									end
								else
									equipSlot = invSlotID
								end
							end
						else
							equippedItem = ItemLocation:CreateFromEquipmentSlot(addonTable.CONSTANTS["SLOTS"][rewardItemType])
							if equippedItem:IsValid() then
								if rewardItemType ~= 4 and rewardItemType ~= 19 then
									local equippedItemLevel = C_Item.GetCurrentItemLevel(equippedItem)
									equippedItemQuality = C_Item.GetItemQuality(equippedItem)
									if rewardItemLevel > equippedItemLevel then
										equipSlot = addonTable.CONSTANTS["SLOTS"][rewardItemType]
									end
								end
							else
								equipSlot = addonTable.CONSTANTS["SLOTS"][rewardItemType]
							end
						end
						
						if equipSlot > 0 then
							-- If the item would replace an heirloom, and the player's level
							-- is lower than the heirloom's effective level, then don't equip it.
							if equippedItemQuality == 7 then
								local equippedItemID = C_Item.GetItemID(equippedItem)
								local _, _, _, _, _, _, _, effectiveHeirloomLevel = C_Heirloom.GetHeirloomInfo(equippedItemID)
								if UnitLevel("player") < effectiveHeirloomLevel then
									return
								end
							end
							C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
								for bagID = 0, 4 do
									for slotID = 1, C_Container.GetContainerNumSlots(bagID) do
										local containerItemInfo = C_Container.GetContainerItemInfo(bagID, slotID)
										if containerItemInfo then
											local containerItemLink = C_Item.GetItemLink(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
											if containerItemInfo.itemID == rewardItemID then
												local containerItemIcon = C_Item.GetItemIcon(ItemLocation:CreateFromBagAndSlot(bagID, slotID))
												print(string.format("%s: Equipping an item upgrade. |T%s:0|t %s", addonTable.CONSTANTS.COLORED_ADDON_NAME, containerItemIcon, containerItemLink))
												ClearCursor()
												C_Container.PickupContainerItem(bagID, slotID)
												EquipCursorItem(equipSlot)
												if HelpMePlayDB.JunkerEnabled then
													HelpMePlayJunkerGlobalDB[containerItemInfo.itemID] = true
												end
												break
											end
										end
									end
								end
							end)
						end
					end
				end)
			end
		else
			C_Timer.After(addonTable.CONSTANTS["ONE_SECOND"], function()
				EquipItem(itemLink)
			end)
		end
	end
end

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
						-- We hit the next zone or area header,
						-- so let's break from the loop.
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
	if numQuestChoices > 1 then
		if HelpMePlayDB.CompleteQuestsEnabled then
			if HelpMePlayDB.QuestRewardID == 0 or HelpMePlayDB.QuestRewardID == false or HelpMePlayDB.QuestRewardID == nil then return false end
			
			if HelpMePlayDB.QuestRewardID == 1 then
				itemLevels = {}
			elseif HelpMePlayDB.QuestRewardID == 2 then
				sellPrices = {}
			end
			
			local itemID = 0
			if UnitLevel("player") < addonTable.CONSTANTS["MAX_PLAYER_LEVEL"] then
				for i=1, numQuestChoices do
					local _, _, quantity = GetQuestItemInfo("choice", i)
					local questRewardItemLink = GetQuestItemLink("choice", i)
					if questRewardItemLink then
						_, itemID = string.split(":", questRewardItemLink); itemID = tonumber(itemID)
						-- Before we continue, let's make sure we aren't supposed to take
						-- a specific reward from the current quest. For example, we always
						-- want to take the Champion's Purse from Argent Tournament dailies.
						if addonTable.QUESTREWARDS[itemID] then
							bestItemIndex = i
							break
						end

						if HelpMePlayDB.QuestRewardID == 1 then
							-- First check to see if the reward is a weapon. If it's a weapon,
							-- we want to leave the choice to the player.
							local _, _, _, _, _, itemType = GetItemInfo(questRewardItemLink)
							if itemType == "Weapon" then return end
							
							local rewardItemLevel = GetDetailedItemLevelInfo(GetQuestItemLink("choice", i))
							local rewardItemType = C_Item.GetItemInventoryTypeByID(GetQuestItemLink("choice", i))
							if rewardItemType ~= 0 then
								local equippedItemType = 0
								if type(addonTable.CONSTANTS["SLOTS"][rewardItemType]) == "table" then
									for _, invSlotID in ipairs(addonTable.CONSTANTS["SLOTS"][rewardItemType]) do
										local item = ItemLocation:CreateFromEquipmentSlot(invSlotID)
										if item:IsValid() then
											equippedItemType = C_Item.GetItemInventoryType(ItemLocation:CreateFromEquipmentSlot(item.equipmentSlotIndex))
											if equippedItemType == rewardItemType then
												local equippedItemQuality = C_Item.GetItemQuality(item)
												if equippedItemQuality == 7 then
													local equippedItemID = C_Item.GetItemID(item)
													local _, _, _, _, _, _, _, effectiveHeirloomLevel = C_Heirloom.GetHeirloomInfo(equippedItemID)
													if UnitLevel("player") >= effectiveHeirloomLevel then
														if rewardItemLevel > C_Item.GetCurrentItemLevel(item) then
															bestItemIndex = i
														end
													end
												else
													if rewardItemLevel > C_Item.GetCurrentItemLevel(item) then
														bestItemIndex = i
													end
												end
											end
										end
									end
								else
									local item = ItemLocation:CreateFromEquipmentSlot(addonTable.CONSTANTS["SLOTS"][rewardItemType])
									if item:IsValid() then
										if rewardItemType ~= 4 and rewardItemType ~= 19 then
											equippedItemType = C_Item.GetItemInventoryType(ItemLocation:CreateFromEquipmentSlot(item.equipmentSlotIndex))
											if equippedItemType == rewardItemType then
												local equippedItemQuality = C_Item.GetItemQuality(item)
												if equippedItemQuality == 7 then
													local equippedItemID = C_Item.GetItemID(item)
													local _, _, _, _, _, _, _, effectiveHeirloomLevel = C_Heirloom.GetHeirloomInfo(equippedItemID)
													if UnitLevel("player") >= effectiveHeirloomLevel then
														if rewardItemLevel > C_Item.GetCurrentItemLevel(item) then
															bestItemIndex = i
														end
													end
												else
													if rewardItemLevel > C_Item.GetCurrentItemLevel(item) then
														bestItemIndex = i
													end
												end
											end
										end
									end
								end
							end
						elseif HelpMePlayDB.QuestRewardID == 2 then
							local _, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(questRewardItemLink)
							if sellPrice > 0 then
								local totalSellPrice = 0
								local phSellPrice = quantity*sellPrice
								if phSellPrice > totalSellPrice then
									bestItemIndex = i
								end
							end
						end
					end
				end
				
				if bestItemIndex == 0 then
					-- All quest rewards were of the same item level or sell price.
					-- Pick a random reward.
					GetQuestReward(random(1, numQuestChoices))
				else
					-- Get the quest reward at the specified best index. If the quest
					-- reward automation is told to pick the reward by sell price, then
					-- automatically add the item to the GLOBAL Junker table.
					GetQuestReward(bestItemIndex)
					if HelpMePlayDB.QuestRewardID == 2 then
						if HelpMePlayDB.JunkerEnabled then
							HelpMePlayJunkerGlobalDB[itemID] = true
						end
					end
				end
			end
		end
	elseif numQuestChoices == 1 then
		GetQuestReward(1)
	else
		QuestFrameCompleteQuestButton:Click()
	end
end

local function CompleteActiveQuests(gossipInfo)
	if HelpMePlayDB.CompleteQuestsEnabled == false or HelpMePlayDB.CompleteQuestsEnabled == nil then return end
	
	if IsShiftKeyDown() then
		C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
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
		C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
			GetAvailableQuests(gossipInfo)
		end)
	else
		for i, questData in ipairs(gossipInfo) do
			if not HelpMePlayIgnoredQuestsDB[questData.questID] and not addonTable.IGNORED_QUESTS[questData.questID] then
				C_GossipInfo.SelectAvailableQuest(questData.questID)
			end
		end
	end
end

local function QUEST_GREETING()
	if IsShiftKeyDown() then
		C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
			QUEST_GREETING()
		end)
	else
		for i = 1, GetNumActiveQuests() do
			local questId = GetActiveQuestID(i)
			if HelpMePlayIgnoredQuestsDB[questId] then return end
			if addonTable.IGNORED_QUESTS[questId] then return end
			
			local _, isComplete = GetActiveTitle(i)
			if isComplete then
				SelectActiveQuest(i)
			end
		end
		for i = 1, GetNumAvailableQuests() do
			local _, _, _, _, questId = GetAvailableQuestInfo(i)
			if HelpMePlayIgnoredQuestsDB[questId] then return end
			if addonTable.IGNORED_QUESTS[questId] then return end
			
			SelectAvailableQuest(i)
		end
	end
end

local function QUEST_DETAIL(isAutoAccept)
	if IsShiftKeyDown() then
		C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
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
		if type == 3 then -- Gossip
			local unitGUID = UnitGUID("target")
			if unitGUID then
				local _, _, _, _, _, npcID = string.split("-", unitGUID); npcID = tonumber(npcID)
				if HelpMePlayIgnoredCreaturesDB[npcID] then return end
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
		
		if UnitLevel("player") == addonTable.CONSTANTS["MAX_PLAYER_LEVEL"] then
			C_QuestLog.AddQuestWatch(questID)
		end

		if select(2, IsAddOnLoaded("Immersion")) then
			C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
				ImmersionFrame.TalkBox.MainFrame.CloseButton:Click()
			end)
		end
		
		-- It's not always possible to prevent a quest
		-- from being auto accepted. If that's the case,
		-- simply remove it from the player's log if it's
		-- on the ignore list.
		for i = 1, C_QuestLog.GetNumQuestLogEntries() do
			local id = C_QuestLog.GetQuestIDForLogIndex(i)
			if id == questID and (HelpMePlayIgnoredQuestsDB[questID] or addonTable.IGNORED_QUESTS[questID]) then
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
				if HelpMePlayIgnoredCreaturesDB[npcID] then return end
				if addonTable.IGNORED_QUESTS[GetQuestID()] then QuestFrameDeclineButton:Click() end
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
			if HelpMePlayIgnoredCreaturesDB[npcID] then return end
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
			if addonTable.IGNORED_QUESTREWARDS[itemID] then return end
			C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
				EquipItem(itemLink)
			end)
		end
	end
	if event == "QUEST_PROGRESS" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.CompleteQuestsEnabled == false or HelpMePlayDB.CompleteQuestsEnabled == nil then return false end
		
		local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
		if unitGUID then
			local _, _, _, _, _, npcID = strsplit("-", unitGUID); npcID = tonumber(npcID)
			if HelpMePlayIgnoredCreaturesDB[npcID] then return end
		end
		
		if IsQuestCompletable() then
			QuestFrameCompleteButton:Click()
			CompleteQuest()
		end
	end
end)