local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local shiftKeyDelay = 0.5
local itemLevels = {}
local sellPrices = {}
local questRewards = {}

-- Allows players to abandon a singular quest.
hooksecurefunc("QuestMapLogTitleButton_OnClick", function(self)
	if IsControlKeyDown() or IsAltKeyDown() then
		C_QuestLog.SetSelectedQuest(self.questID)
		C_QuestLog.SetAbandonQuest()
		C_QuestLog.AbandonQuest()
	end
end)

-- Allows players to abandon quests using the
-- zone or area header.
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

-- Allows players to abandon quests from the
-- objective tracker.
hooksecurefunc("QuestMapFrame_OpenToQuestDetails", function(self)
	local questId = self
	if IsControlKeyDown() or IsAltKeyDown() then
		C_QuestLog.SetSelectedQuest(questId)
		C_QuestLog.SetAbandonQuest()
		C_QuestLog.AbandonQuest()
		WorldMapFrameCloseButton:Click()
	end
end)

local function Max(tbl)
	local highestItemIndex = 0
	local highestItemLevelOrSellPrice = 0
	for itemIndex, itemLevelOrSellPrice in ipairs(tbl) do
		if itemLevelOrSellPrice > highestItemLevelOrSellPrice then
			highestItemIndex = itemIndex
			highestItemLevelOrSellPrice = itemLevelOrSellPrice
		elseif itemLevelOrSellPrice == highestItemLevelOrSellPrice then
			highestItemIndex = random(1, GetNumQuestChoices())
			tbl = {}
		end
	end
	return highestItemIndex
end

local function CompareItems(index, itemLevels, sellPrices, itemLink, slotName, quantity)
	local sellPrice, itemQuality, equipLoc, slotId, inventoryItemLink, itemId, equippedItemLevel, rewardItemLevel
	-- Populate the sellPrices table with the sell price
	-- of the item.
	sellPrice = select(11, GetItemInfo(itemLink))
	sellPrices[index] = (quantity*sellPrice)
	
	if slotName ~= "NOTHING" then
		slotId = GetInventorySlotInfo(slotName)
		inventoryItemLink = GetInventoryItemLink("player", slotId)
		
		-- An error is thrown if a slot is empty.
		if inventoryItemLink then
			equippedItemLevel = GetDetailedItemLevelInfo(inventoryItemLink)
			rewardItemLevel = GetDetailedItemLevelInfo(itemLink)
			
			-- We won't be able to fetch the item level of
			-- the equipped item if the player hasn't opened
			-- their character pane once in the current session.
			if equippedItemLevel == nil then
				if HelpMePlayOptionsDB.Logging then
					print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Equipped Item Level is Nil"])
				end
				return
			elseif rewardItemLevel > equippedItemLevel then
				-- Ignore slots with heirlooms equipped.
				if itemQuality ~= 7 then
					itemLevels[index] = rewardItemLevel
				end
			end
		end
	end
end

-- TODO: Check the QuestRewardsDB table first!
function HMP_CompleteQuest()
	local numQuestChoices = GetNumQuestChoices()
	if numQuestChoices > 1 then
		if HelpMePlayOptionsDB.Quests then
			if HelpMePlayOptionsDB.QuestRewards == L_GLOBALSTRINGS["Disabled"] then return end
			
			if HelpMePlayOptionsDB.QuestRewards == L_GLOBALSTRINGS["Item Level"] then
				itemLevels = {}
			elseif HelpMePlayOptionsDB.QuestRewards == L_GLOBALSTRINGS["Sell Price"] then
				sellPrices = {}
			end
			
			ToggleCharacter("PaperDollFrame")
			C_Timer.After(1, function()
				CharacterFrameCloseButton:Click()
				
				local bestItemIndex = 0
				local equipLoc = ""
				local equippedItemItemLink = ""
				local equippedItemItemLevel = 0
				local itemId = 0
				local questRewardItemLink = ""
				local questRewardItemLevel = 0
				local quantity = 0
				local quality = 0
				local sellPrice = 0
				local playerLevel = UnitLevel("player")
				
				--[[
					Item Level:
						If the quest reward is a higher item level and the player's
						equipped item isn't an heirloom, then set the best item index.
						
					Sell Price:
						If the quest reward has the highest sell price, then choose that
						reward and automatically add it to the global Junker sell list.
				]]--
				if playerLevel < addonTable.CONSTANTS["MAX_PLAYER_LEVEL"] then
					for i = 1, numQuestChoices do
						_, _, quantity = GetQuestItemInfo("choice", i)
						questRewardItemLink = GetQuestItemLink("choice", i)
						itemId = string.split(":", questRewardItemLink); itemId = tonumber(itemId)
						
						-- Before we continue, let's make sure we aren't supposed to take
						-- a specific reward from the current quest. For example, we always
						-- want to take the Champion's Purse from Argent Tournament dailies.
						if addonTable.QUESTREWARDS[itemId] then
							bestItemIndex = i
							break
						end
						
						questRewardItemLevel = GetDetailedItemLevelInfo(itemLink)
						_, _, quality, _, _, _, _, _, equipLoc, _, sellPrice = GetItemInfo(itemLink)
						if HelpMePlayOptionsDB.QuestRewards == L_GLOBALSTRINGS["Item Level"] then
							if equipLoc == "INVTYPE_FINGER" then
								for j = 11, 12 do
									equippedItemItemLink = GetInventoryItemLink("player", j)
									if equippedItemItemLink then
										equippedItemItemLevel = GetDetailedItemLevelInfo(equippedItemItemLink)
										if (questRewardItemLevel > equippedItemItemLevel) and quality ~= 7 then
											bestItemIndex = i
										end
									end
								end
							elseif equipLoc == "INVTYPE_TRINKET" then
								for j = 13, 14 do
									equippedItemItemLink = GetInventoryItemLink("player", j)
									if equippedItemItemLink then
										equippedItemItemLevel = GetDetailedItemLevelInfo(equippedItemItemLink)
										if (questRewardItemLevel > equippedItemItemLevel) and quality ~= 7 then
											bestItemIndex = i
										end
									end
								end
							elseif equipLoc == "INVTYPE_WEAPON" then
								for j = 16, 17 do
									equippedItemItemLink = GetInventoryItemLink("player", j)
									if equippedItemItemLink then
										equippedItemItemLevel = GetDetailedItemLevelInfo(equippedItemItemLink)
										if (questRewardItemLevel > equippedItemItemLevel) and quality ~= 7 then
											bestItemIndex = i
										end
									end
								end
							elseif equipLoc == "INVTYPE_2HWEAPON" and UnitClass("player") == 1 and GetSpecializationInfo(2) == 72 then
								-- This is to account for fury warriors since they can dual wield 2H weapons.
								for j = 16, 17 do
									equippedItemItemLink = GetInventoryItemLink("player", j)
									if equippedItemItemLink then
										equippedItemItemLevel = GetDetailedItemLevelInfo(equippedItemItemLink)
										if (questRewardItemLevel > equippedItemItemLevel) and quality ~= 7 then
											bestItemIndex = i
										end
									end
								end
							else
								equippedItemItemLink = GetInventoryItemLink("player", addonTable.CONSTANTS[equipLoc])
								if equippedItemItemLink then
									equippedItemItemLevel = GetDetailedItemLevelInfo(equippedItemItemLink)
									if (questRewardItemLevel > equippedItemItemLevel) and quality ~= 7 then
										bestItemIndex = i
									end
								end
							end
						elseif HelpMePlayOptionsDB.QuestRewards == L_GLOBALSTRINGS["Sell Price"] then
							local totalSellPrice = 0
							local phSellPrice = quantity*sellPrice
							if phSellPrice > totalSellPrice then
								bestItemIndex = i
							end
						end
					end
					
					if bestItemIndex == 0 then
						-- All quest rewards were of the same item level or sell price.
						-- Pick a random reward.
						GetQuestReward(random(1, numQuestChoices))
					else
						GetQuestReward(bestItemIndex)
					end
			end)
		end
	elseif numQuestChoices == 1 then
		GetQuestReward(1)
	else
		QuestFrameCompleteQuestButton:Click()
	end
end

local function Complete_ActiveQuests(gossipInfo)
	-- If the shift key is being held down,
	-- then keep calling the function until
	-- the player let's go.
	if IsShiftKeyDown() then
		C_Timer.After(shiftKeyDelay, function()
			Complete_ActiveQuests(gossipInfo)
		end)
	else
		for i, gossip in ipairs(gossipInfo) do
			if gossip.isComplete then
				C_GossipInfo.SelectActiveQuest(i)
				HMP_CompleteQuest()
			end
		end
	end
end

local function Get_AvailableQuests(gossipInfo)
	-- If the shift key is being held down,
	-- then keep calling the function until
	-- the player let's go.
	if IsShiftKeyDown() then
		C_Timer.After(shiftKeyDelay, function()
			Get_AvailableQuests(gossipInfo)
		end)
	else
		for i, quest in ipairs(gossipInfo) do
			C_GossipInfo.SelectAvailableQuest(i)
		end
	end
end

local function QUEST_GREETING()
	-- If the shift key is being held down,
	-- then keep calling the function until
	-- the player let's go.
	if IsShiftKeyDown() then
		C_Timer.After(shiftKeyDelay, function()
			QUEST_GREETING()
		end)
	else
		for i=1, GetNumActiveQuests() do
			local _, isComplete = GetActiveTitle(i)
			if isComplete then
				SelectActiveQuest(i)
			end
		end
		for i=1, GetNumAvailableQuests() do
			SelectAvailableQuest(i)
		end
	end
end

local function QUEST_DETAIL(isAutoAccept)
	-- If the shift key is being held down,
	-- then keep calling the function until
	-- the player let's go.
	if IsShiftKeyDown() then
		C_Timer.After(shiftKeyDelay, function()
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

e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("QUEST_ACCEPTED")
e:RegisterEvent("QUEST_AUTOCOMPLETE")
e:RegisterEvent("QUEST_COMPLETE")
e:RegisterEvent("QUEST_DETAIL")
e:RegisterEvent("QUEST_GREETING")
e:RegisterEvent("QUEST_PROGRESS")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_SHOW" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		-- Check to see if the current target is
		-- an ignored quest giver.
		local guid = UnitGUID("target")
		if guid then
			local _, _, _, _, _, npcId = string.split("-", guid); npcId = tonumber(npcId)
			if HelpMePlayIgnoredCreaturesDB[npcId] then return end
		end
		
		local activeQuests = C_GossipInfo.GetActiveQuests()
		local availableQuests = C_GossipInfo.GetAvailableQuests()
		if activeQuests then
			Complete_ActiveQuests(activeQuests)
		end
		if availableQuests then
			Get_AvailableQuests(availableQuests)
		end
	end
	if event == "QUEST_ACCEPTED" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		local questId = ...
		C_QuestLog.AddQuestWatch(questId, 0)
		if select(2, IsAddOnLoaded("TomTom")) and HelpMePlayOptionsDB.Waypoints then
			for quest, questData in pairs(addonTable.WAYPOINTS) do
				if quest == questId then
					for _, coords in ipairs(questData) do
						local opts = {
							title = coords[4],
							persistent = nil,
							minimap = true,
							world = true,
							from = addonName,
							minimap_icon = coords[5],
							worldmap_icon = coords[5],
							minimap_displayID = coords[6],
							worldmap_displayID = coords[6],
						}
						TomTom:AddWaypoint(coords[1], coords[2] / 100, coords[3] / 100, opts);
						TomTom:SetClosestWaypoint()
					end
					break
				end
			end
		end
		
		-- If there is a quest offer, let's
		-- handle the popup automatically.
		C_Timer.After(0.1, function()
			AutoQuestPopupTracker_RemovePopUp(questId)
		end)
		
		-- The addon doesn't play well with
		-- custom frames (e.g. Immersion),
		-- so let's try to handle that on
		-- our own.
		if select(2, IsAddOnLoaded("Immersion")) then
			C_Timer.After(0.1, function()
				ImmersionFrame.TalkBox.MainFrame.CloseButton:Click()
			end)
		end
	end
	if event == "QUEST_AUTOCOMPLETE" then
		local questId = ...
		ShowQuestComplete(questId)
	end
	if event == "QUEST_COMPLETE" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		HMP_CompleteQuest()
	end
	if event == "QUEST_DETAIL" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		if QuestGetAutoAccept() then
			QUEST_DETAIL(true)
		else
			-- Check to see if the current target is
			-- an ignored quest giver.
			local guid = UnitGUID("target")
			if guid then
				local _, _, _, _, _, npcId = string.split("-", guid); npcId = tonumber(npcId)
				if HelpMePlayIgnoredCreaturesDB[npcId] then return end
			end
			QUEST_DETAIL(false)
		end
	end
	if event == "QUEST_GREETING" then
		-- Handles quests that are in a
		-- gossip menu. Handle quests that
		-- are completed first, then pick
		-- up new quests.
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		
		-- Check to see if the current target is
		-- an ignored quest giver.
		local guid = UnitGUID("target")
		if guid then
			local _, _, _, _, _, npcId = string.split("-", guid); npcId = tonumber(npcId)
			if HelpMePlayIgnoredCreaturesDB[npcId] then return end
		end
		
		QUEST_GREETING()
	end
	if event == "QUEST_PROGRESS" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		if IsQuestCompletable() then
			CompleteQuest()
		end
	end
end)