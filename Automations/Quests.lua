local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local itemRewardItemLevels = {}
local sellPrices = {}
local questRewards = {}

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
				print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Equipped Item Level is Nil"])
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
						local _, itemId = string.split(":", itemLink); itemId = tonumber(itemId)
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
							-- of the item if it's not 0.
							local sellPrice = select(11, GetItemInfo(itemLink))
							if sellPrice ~= 0 then
								sellPrices[i] = (quantity*sellPrice)
							else
								questRewards[i] = itemId
							end
						end
					end
				end
				
				if next(itemRewardItemLevels) or next(sellPrices) then
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
				else
					for i=1,#questRewards do
						for itemId, _ in pairs(addonTable.QUESTREWARDS) do
							if itemId == questRewards[i] then
								GetQuestReward(i)
							end
						end
					end
				end
			else
				-- The player is max level, so let's check the
				-- quest rewards table for the quest and see if
				-- we're supposed to take a reward.
				local itemLink, itemId
				for i=1,numQuestChoices do
					itemLink = GetQuestItemLink("choice", i)
					if itemLink then
						itemId = string.split(":", itemLink); itemId = tonumber(itemId)
						for rewardId, _ in pairs(addonTable.QUESTREWARDS) do
							if rewardId == itemId then
								GetQuestReward(i)
							end
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

local function Get_IgnoredQuestGiver(npcId)
	if addonTable.IGNORED_QUESTGIVERS[npcId] then
		return true
	end
end

e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("QUEST_ACCEPTED")
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
			if Get_IgnoredQuestGiver(npcId) then return end
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
		local questId = ...
		if select(2, IsAddOnLoaded("TomTom")) then
			for quest,questData in pairs(addonTable.WAYPOINTS) do
				if quest == questId then
					for _,coords in ipairs(questData) do
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
					end
					TomTom:SetClosestWaypoint()
					break
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
			-- Check to see if the current target is
			-- an ignored quest giver.
			local guid = UnitGUID("target")
			if guid then
				local _, _, _, _, _, npcId = string.split("-", guid); npcId = tonumber(npcId)
				if Get_IgnoredQuestGiver(npcId) then return end
			end
			
			AcceptQuest()
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
			if Get_IgnoredQuestGiver(npcId) then return end
		end
		
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
	if event == "QUEST_PROGRESS" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		if IsQuestCompletable() then
			CompleteQuest()
		end
	end
end)