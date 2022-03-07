local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local itemRewardItemLevels = {}
local sellPrices = {}
local addons = {
	-- If any of these addons are loaded,
	-- then don't add the quest icon to
	-- the nameplates.
	"KuiNameplates",
	"NeatPlates",
	"TidyPlates",
	"PhantomPlates",
	"QuestPlates",
}

local function Max(tbl)
	local highestItemIndex = 0
	local highestItemLevelOrSellPrice = 0
	for itemIndex, itemLevelOrSellPrice in ipairs(tbl) do
		if itemLevelOrSellPrice > highestItemLevelOrSellPrice then
			highestItemIndex = itemIndex
			highestItemLevelOrSellPrice = itemLevelOrSellPrice
		elseif itemLevelOrSellPrice == highestItemLevelOrSellPrice then
			highestItemIndex = random(1, #tbl)
			tbl = {}
		end
	end
	return highestItemIndex
end

local function CompareItems(index, itemRewardItemLevels, sellPrices, itemLink, slotName, quantity)
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
			-- This happens if the player hasn't opened
			-- their character pane in the current session.
			if equippedItemLevel == nil then
				print(L["Colored Addon Name"] .. ": " .. L["Equipped Item Level is Nil"])
				return
			elseif rewardItemLevel > equippedItemLevel then
				-- Don't add slots with equipped heirlooms
				-- for consideration.
				if itemQuality ~= 7 then
					itemRewardItemLevels[index] = rewardItemLevel
				end
			end
		end
	end
end

function HMP_CompleteQuest()
	local numQuestChoices = GetNumQuestChoices()
	-- There is more than 1 reward choice
	-- for the player to choose from.
	if numQuestChoices > 1 then
		if HelpMePlayOptionsDB.QuestRewards then
			local playerLevel = UnitLevel("player")
			-- We want to stop selecting quest rewards
			-- at max level.
			if playerLevel < 60 then
				itemRewardItemLevels = {}
				sellPrices = {}
				-- Check the item slot for the quest reward,
				-- then let's compare it to what the player
				-- has equipped. While leveling, item level
				-- is king.
				for i=1,numQuestChoices do
					local _, _, quantity = GetQuestItemInfo("choice", i)
					local itemLink = GetQuestItemLink("choice", i)
					if itemLink then
						local _, _, itemQuality, _, _, _, _, _, equipLoc = GetItemInfo(itemLink)
						local _, slotName = strsplit("_", equipLoc)
						-- These don't convert to a valid slotId,
						-- so we have to change it to something else.
						if slotName == "2HWEAPON" or slotName == "WEAPONMAINHAND" or slotName == "WEAPONOFFHAND" or slotName == "RANGEDRIGHT" then
							-- This logic won't apply to every class, but
							-- some classes (eg. Warrior, Rogue, Shaman)
							-- may have multiple weapons equipped.
							for i = 0, 1 do
								if i == 0 then
									slotName = "MAINHAND"
								elseif i == 1 then
									slotName = "SECONDARYHAND"
								end
								CompareItems(i, itemRewardItemLevels, sellPrices, itemLink, slotName.."SLOT", quantity)
							end
						elseif slotName ~= nil then
							CompareItems(i, itemRewardItemLevels, sellPrices, itemLink, slotName.."SLOT", quantity)
						else
							-- Populate the sellPrices table with the sell price
							-- of the item.
							local sellPrice = select(11, GetItemInfo(itemLink))
							sellPrices[i] = (quantity*sellPrice)
						end
					end
				end
				
				-- Check the item level table first. If the
				-- item level is higher, then we want to
				-- take that reward.
				--
				-- Check the sell prices table next. Same
				-- concept; if the sell price is higher,
				-- then take that reward.
				if Max(itemRewardItemLevels) ~= 0 then
					GetQuestReward(Max(itemRewardItemLevels))
				elseif Max(sellPrices) ~= 0 then
					GetQuestReward(Max(sellPrices))
				end
			end
		end
	elseif numQuestChoices == 1 then
		GetQuestReward(1)
	else
		QuestFrameCompleteQuestButton:Click()
	end
end

local function Complete_ActiveQuests(gossipInfo)
	for i, gossip in ipairs(gossipInfo) do
		if gossip.isComplete then
			C_GossipInfo.SelectActiveQuest(i)
			HMP_CompleteQuest()
		end
	end
end

local function Get_AvailableQuests(gossipInfo)
	for i, quest in ipairs(gossipInfo) do
		C_GossipInfo.SelectAvailableQuest(i)
	end
end

e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("NAME_PLATE_UNIT_ADDED")
e:RegisterEvent("QUEST_ACCEPTED")
e:RegisterEvent("QUEST_COMPLETE")
e:RegisterEvent("QUEST_DETAIL")
e:RegisterEvent("QUEST_GREETING")
e:RegisterEvent("QUEST_LOG_UPDATE")
e:RegisterEvent("QUEST_PROGRESS")
e:RegisterEvent("QUEST_REMOVED")
e:RegisterEvent("QUEST_TURNED_IN")
e:RegisterEvent("UPDATE_MOUSEOVER_UNIT")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_SHOW" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		local activeQuests = C_GossipInfo.GetActiveQuests()
		local availableQuests = C_GossipInfo.GetAvailableQuests()
		if activeQuests then
			Complete_ActiveQuests(activeQuests)
		end
		if availableQuests then
			Get_AvailableQuests(availableQuests)
		end
	end
	if event == "NAME_PLATE_UNIT_ADDED" then
		local names = {}
		local unit = ...
		if not UnitIsPlayer(unit) and not UnitIsFriend(unit, "player") then
			local unitName = UnitName(unit)
			if unitName then
				local firstName, secondName, lastName = string.split(" ", unitName); table.insert(names, firstName); table.insert(names, secondName); table.insert(names, lastName)
				for _, objectiveData in pairs(HelpMePlayQuestObjectivesDB) do
					for _, tblText in ipairs(objectiveData) do
						for _, name in ipairs(names) do
							if string.match(tblText, name) then
								for k,v in ipairs(HelpMePlayCreaturesDB) do
									if HelpMePlayCreaturesDB[k] == unitName then return end
								end
								table.insert(HelpMePlayCreaturesDB, unitName)
								return
							end
						end
					end
				end
			end
		end
	end
	if event == "QUEST_ACCEPTED" then
		local questId = ...
		if not HelpMePlayQuestObjectivesDB[questId] then
			-- Create an entry in the table for the quest.
			HelpMePlayQuestObjectivesDB[questId] = {}
		end
		local logIndex = C_QuestLog.GetLogIndexForQuestID(questId)
		local questInfo = C_QuestLog.GetInfo(logIndex)
		local numQuestObjectives = GetNumQuestLeaderBoards(logIndex)
		if numQuestObjectives > 0 then
			for i=1,numQuestObjectives do
				local text, objectiveType, finished, numFulfilled, numRequired = GetQuestObjectiveInfo(questId, i, false)
				if text and (objectiveType == "monster" or objectiveType == "item") then
					if string.len(text) <= 8 or string.len(text) == nil then
						print(L["Colored Addon Name"] .. ": " .. L["Quest Objective Data is Incomplete"] .. " [" .. questInfo.title .. " - " .. questId .. "] " .. L["Please Report"])
						return
					end
					table.insert(HelpMePlayQuestObjectivesDB[questId], text)
				end
			end
		end
	end
	if event == "QUEST_COMPLETE" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		HMP_CompleteQuest()
	end
	if event == "QUEST_DETAIL" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		if QuestGetAutoAccept() then
			CloseQuest()
		else
			AcceptQuest()
		end
	end
	if event == "QUEST_GREETING" then
		-- Handles quests that are in a
		-- gossip menu. Handle quests that
		-- are completed first, then pick
		-- up new quests.
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
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
	if event == "QUEST_LOG_UPDATE" then
		for i=1, C_QuestLog.GetNumQuestLogEntries() do
			local questInfo = C_QuestLog.GetInfo(i)
			if not questInfo.isHeader then
				for j=1, GetNumQuestLeaderBoards(i) or 0 do
					local text, objectiveType, finished, numFulfilled, numRequired = GetQuestObjectiveInfo(questInfo.questID, j, false)
					if text and (objectiveType == "monster" or objectiveType == "item") then
						if numFulfilled == numRequired then
							if HelpMePlayQuestObjectivesDB[questInfo.questID] then
								for k,v in ipairs(HelpMePlayQuestObjectivesDB[questInfo.questID]) do
									HelpMePlayQuestObjectivesDB[questInfo.questID][k] = nil
								end
							end
						end
					end
				end
			end
		end
	end
	if event == "QUEST_PROGRESS" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		if IsQuestCompletable() then
			CompleteQuest()
		end
	end
	if event == "QUEST_REMOVED" then
		local questId = ...
		HelpMePlayQuestObjectivesDB[questId] = nil
	end
	if event == "QUEST_TURNED_IN" then
		local questId = ...
		HelpMePlayQuestObjectivesDB[questId] = nil
		HelpMePlayCreaturesDB = {}
	end
	if event == "UPDATE_MOUSEOVER_UNIT" then
		local names = {}
		if not UnitIsPlayer("mouseover") and not UnitIsFriend("mouseover", "player") then
			for i=1,GameTooltip:NumLines() do
				local tooltip = _G["GameTooltipTextLeft"..i]
				if tooltip then
					local tooltipText = tooltip:GetText()
					if tooltipText then
						local str = string.split(" ", tooltipText); table.insert(names, str)
						for _, objectiveData in pairs(HelpMePlayQuestObjectivesDB) do
							for _, tblText in ipairs(objectiveData) do
								for _, name in ipairs(names) do
									if string.match(tblText, name) then
										for k,v in ipairs(HelpMePlayCreaturesDB) do
											if HelpMePlayCreaturesDB[k] == UnitName("mouseover") then return end
										end
										table.insert(HelpMePlayCreaturesDB, unitName)
										return
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)

hooksecurefunc("CompactUnitFrame_UpdateName", function(frame)
	for k,v in ipairs(addons) do
		if IsAddOnLoaded(v) then return end
	end
	if frame.unit:find("nameplate") then
		local npcName = GetUnitName(frame.unit)
		for _, objectiveData in pairs(HelpMePlayQuestObjectivesDB) do
			for _, text in ipairs(objectiveData) do
				if string.find(text, npcName) then
					frame.name:SetText("|TInterface\\MINIMAP\\TRACKING\\QuestBlob:0|t " .. npcName)
					return
				else
					frame.name:SetText(npcName)
				end
			end
		end
		for _, creatureName in ipairs(HelpMePlayCreaturesDB) do
			if string.find(creatureName, npcName) then
				frame.name:SetText("|TInterface\\MINIMAP\\TRACKING\\QuestBlob:0|t " .. npcName)
				return
			else
				frame.name:SetText(npcName)
			end
		end
	end
end)