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
			tbl = {}
			highestItemIndex = 0
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
					else
						CompareItems(i, itemRewardItemLevels, sellPrices, itemLink, slotName.."SLOT", quantity)
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
						HMP_CompleteQuest()
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
			if HelpMePlayOptionsDB.MinimapIcon then
				HelpMePlayShowMinimapIcon(false)
			end
		elseif addonLoaded == "Blizzard_AchievementUI" then
			L.GetTrackedAchievementCriteriaCompletion()
		end
	end
	if event == "GOSSIP_SHOW" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		C_Timer.After(delay, function()
			GetOrCompleteQuests()
		end)
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
		-- Disabled: 1/15/2022
		--[[C_Timer.After(longerDelay, function()
			-- If the quest complete button is still visible
			-- after the delay, then the frame is likely frozen
			-- at this state, so hide it.
			if QuestFrameCompleteQuestButton:IsVisible() then
				QuestFrame:Hide()
			end
		end)]]
	end
	if event == "QUEST_DETAIL" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		C_Timer.After(delay, function()
			QuestFrameAcceptButton:Click()
		end)
	end
	if event == "QUEST_GREETING" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		C_Timer.After(delay, function()
			GetGreetingQuests()
		end)
	end
	if event == "QUEST_PROGRESS" then
		if HelpMePlayOptionsDB.Quests == false or HelpMePlayOptionsDB.Quests == nil then return end
		C_Timer.After(delay, function()
			QuestFrameCompleteButton:Click()
		end)
	end
end)