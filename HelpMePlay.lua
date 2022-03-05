local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local delay = 0.1
local longerDelay = 4

local itemRewardItemLevels = {}
local sellPrices = {}

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
				for i = 1, numQuestChoices do
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

e:RegisterEvent("ADDON_LOADED")
e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("PLAYER_LEVEL_CHANGED")
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
			if HelpMePlayOptionsDB.TorghastPowers == nil or HelpMePlayOptionsDB.TorghastPowers == false then
				HelpMePlayOptionsDB.TorghastPowers = L["Disabled"]
			end
			if HelpMePlayOptionsDB.Covenant == nil or HelpMePlayOptionsDB.Covenant == false then
				HelpMePlayOptionsDB.Covenant = L["Disabled"]
			end
			if HelpMePlayPlayerDialogDB == nil then
				HelpMePlayPlayerDialogDB = {}
			end
			if HelpMePlayAchievementDB == nil then
				HelpMePlayAchievementDB = {}
			end
			if HelpMePlaySavesDB == nil then
				HelpMePlaySavesDB = {}
			end
			if HelpMePlayCharacterQuestsDB == nil then
				HelpMePlayCharacterQuestsDB = {}
			end
			if HelpMePlayOptionsDB.MinimapIcon then
				HelpMePlayShowMinimapIcon(false)
			end
		elseif addonLoaded == "Blizzard_AchievementUI" then
			L.GetTrackedAchievementCriteriaCompletion()
		end
	end
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
	if event == "PLAYER_LEVEL_CHANGED" then
		local _, newLevel = ...
		if newLevel == 20 then
			print(L["Colored Addon Name"] .. ": " .. L["War Mode Reminder"])
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
	if event == "QUEST_PROGRESS" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		if IsQuestCompletable() then
			CompleteQuest()
		end
	end
end)