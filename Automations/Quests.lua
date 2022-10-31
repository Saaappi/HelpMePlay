local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local itemLevels = {}
local sellPrices = {}
local questRewards = {}
local inventorySlots = {
	["INVTYPE_HEAD"] 		= 1,
	["INVTYPE_NECK"] 		= 2,
	["INVTYPE_SHOULDER"] 	= 3,
	["INVTYPE_CLOAK"] 		= 15,
	["INVTYPE_ROBE"] 		= 5,
	["INVTYPE_BODY"] 		= 4,
	["INVTYPE_TABARD"] 		= 19,
	["INVTYPE_WRIST"] 		= 9,
	["INVTYPE_2HWEAPON"] 	= 17,
	["INVTYPE_HAND"] 		= 10,
	["INVTYPE_WAIST"] 		= 6,
	["INVTYPE_LEGS"] 		= 7,
	["INVTYPE_FEET"] 		= 8,
	["INVTYPE_FINGER1"] 	= 11,
	["INVTYPE_FINGER2"] 	= 12,
	["INVTYPE_TRINKET1"] 	= 13,
	["INVTYPE_TRINKET2"] 	= 14,
}

--[[
	Description:
		Allows the player to use the CONTROL and ALT
		keys to abandon a single quest from within
		the quest log.
]]--
hooksecurefunc("QuestMapLogTitleButton_OnClick", function(self)
	if IsControlKeyDown() or IsAltKeyDown() then
		C_QuestLog.SetSelectedQuest(self.questID)
		C_QuestLog.SetAbandonQuest()
		C_QuestLog.AbandonQuest()
	end
end)

--[[
	Description:
		Allows the player to use the CONTROL and ALT
		keys to abandon all quests from a zone or
		area.
]]--
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

--[[
	Description:
		Allows the player to use the CONTROL and ALT
		keys to abandon quests from the objective
		tracker on the right side of the screen.
]]--
hooksecurefunc("QuestMapFrame_OpenToQuestDetails", function(self)
	local questId = self
	if IsControlKeyDown() or IsAltKeyDown() then
		C_QuestLog.SetSelectedQuest(questId)
		C_QuestLog.SetAbandonQuest()
		C_QuestLog.AbandonQuest()
		WorldMapFrameCloseButton:Click()
	end
end)

--[[
	TODO:
		Item Level automation will select the last item level
		upgrade, regardless if it's not the largest upgrade.
		
		This needs to account for multiple rewards that are
		item level upgrades, and always take the largest
		upgrade.
	
	Item Level:
		If the quest reward is a higher item level and the player's
		equipped item isn't an heirloom, then set the best item index.
		
		If equippedItemItemLevel is nil, that means there isn't
		an item equipped in the slot. Therefore, it's automatically
		the best item.
		
	Sell Price:
		If the quest reward has the highest sell price, then choose that
		reward and automatically add it to the global Junker sell table.
]]--
local function CompleteQuest()
	local numQuestChoices = GetNumQuestChoices()
	if numQuestChoices > 1 then
		if HelpMePlayDB.CompleteQuestsEnabled then
			if HelpMePlayDB.QuestRewardId == 0 or HelpMePlayDB.QuestRewardId == false or HelpMePlayDB.QuestRewardId == nil then return false end
			
			if HelpMePlayDB.QuestRewardId == 1 then
				itemLevels = {}
			elseif HelpMePlayDB.QuestRewardId == 2 then
				sellPrices = {}
			end
			
			local bestItemIndex = 0
			local itemId = 0
			if UnitLevel("player") < addonTable.CONSTANTS["MAX_PLAYER_LEVEL"] then
				for i=1, numQuestChoices do
					local _, _, quantity = GetQuestItemInfo("choice", i)
					local questRewardItemLink = GetQuestItemLink("choice", i)
					if questRewardItemLink then
						_, itemId = string.split(":", questRewardItemLink); itemId = tonumber(itemId)
						
						-- Before we continue, let's make sure we aren't supposed to take
						-- a specific reward from the current quest. For example, we always
						-- want to take the Champion's Purse from Argent Tournament dailies.
						if addonTable.QUESTREWARDS[itemId] then
							bestItemIndex = i
							break
						end
						
						local questRewardItemLevel = GetDetailedItemLevelInfo(questRewardItemLink)
						local _, _, quality, _, _, _, _, _, equipLoc, _, sellPrice = GetItemInfo(questRewardItemLink)
						if HelpMePlayDB.QuestRewardId == 1 then
							if equipLoc == "INVTYPE_FINGER" then
								for invSlotId = 11, 12 do
									local equippedItemItemLevel = C_Item.GetCurrentItemLevel(ItemLocation:CreateFromEquipmentSlot(invSlotId))
									if (questRewardItemLevel > equippedItemItemLevel) and C_Item.GetItemQuality(ItemLocation:CreateFromEquipmentSlot(invSlotId)) ~= 7 then
										bestItemIndex = i
									end
								end
							elseif equipLoc == "INVTYPE_TRINKET" then
								for invSlotId = 13, 14 do
									local equippedItemItemLevel = C_Item.GetCurrentItemLevel(ItemLocation:CreateFromEquipmentSlot(invSlotId))
									if (questRewardItemLevel > equippedItemItemLevel) and C_Item.GetItemQuality(ItemLocation:CreateFromEquipmentSlot(invSlotId)) ~= 7 then
										bestItemIndex = i
									end
								end
							elseif equipLoc == "INVTYPE_WEAPON" then
								for j = 16, 17 do
									local equippedItemItemLevel = C_Item.GetCurrentItemLevel(ItemLocation:CreateFromEquipmentSlot(invSlotId))
									if (questRewardItemLevel > equippedItemItemLevel) and C_Item.GetItemQuality(ItemLocation:CreateFromEquipmentSlot(invSlotId)) ~= 7 then
										bestItemIndex = i
									end
								end
							elseif equipLoc == "INVTYPE_2HWEAPON" and UnitClass("player") == 1 and GetSpecializationInfo(2) == 72 then
								-- This is to account for fury warriors since they can dual wield 2H weapons.
								for j = 16, 17 do
									local equippedItemItemLevel = C_Item.GetCurrentItemLevel(ItemLocation:CreateFromEquipmentSlot(invSlotId))
									if (questRewardItemLevel > equippedItemItemLevel) and C_Item.GetItemQuality(ItemLocation:CreateFromEquipmentSlot(invSlotId)) ~= 7 then
										bestItemIndex = i
									end
								end
							elseif equipLoc == "" then
								-- These are normally artifact relics.
								--
								-- Quests with artifact relics for a reward
								-- are usually all artifact relics.
								if sellPrice > 0 then
									local totalSellPrice = 0
									local phSellPrice = quantity*sellPrice
									if phSellPrice > totalSellPrice then
										bestItemIndex = i
									end
								end
							else
								local equippedItemItemLevel = C_Item.GetCurrentItemLevel(ItemLocation:CreateFromEquipmentSlot(inventorySlots[equipLoc]))
								if (questRewardItemLevel > equippedItemItemLevel) and C_Item.GetItemQuality(ItemLocation:CreateFromEquipmentSlot(inventorySlots[equipLoc])) ~= 7 then
									bestItemIndex = i
								end
							end
						elseif HelpMePlayDB.QuestRewardId == 2 then
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
					if HelpMePlayDB.QuestRewardId == 2 then
						HelpMePlayJunkerGlobalDB[itemId] = true
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

--[[
	Description:
		QUEST_GREETING fires whenever a quest giver has
		more than 1 quest to process.
		
		If the SHIFT key is being held down, then recursively
		call the function based on the delay until the key
		is no longer held.
]]--
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

--[[
	Description:
		QUEST_DETAIL fires whenever a quest's details
		are being shown to the player.
		
		If the SHIFT key is being held down, then recursively
		call the function based on the delay until the key
		is no longer held.
		
		If the quest is an auto accept quest, then
		close the quest frame since the quest is
		auto accepted. If not, accept the quest and
		Blizzard will close the frame for us.
]]--
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

--[[
	Description:
		Some NPCs are ignored. We don't want to run any
		code if the NPC is ignored.
		
		QUEST_ACCEPTED
			Sometimes an accepted quest isn't automatically
			added to the objective tracker. Let's make sure
			it is by explicitly calling the AddQuestWatch
			function and passing the quest ID.
			
			If TomTom is installed, Waypoints is enabled,
			and the quest is listed in the Waypoints table, 
			then add waypoints to the world and mini map.
			
			Quest popups are those frames that appear in the
			objective tracker. We see these when we loot an
			item that starts a quest. Since these are auto
			accepted, let's handle the popup too!
			
			Immersion's quest window gets stuck after accepting 
			a quest. Let's wait a MINUTE amount of time, then 
			hide the window.
			
		QUEST_AUTOCOMPLETE
			Autocomplete quests are those that can be completed
			while out in the open world (don't need a quest ender
			NPC).
			
			Get the quest ID from the payload, then call the
			ShowQuestComplete function. This functions shows the
			completion window for an autocomplete quest.
		
		QUEST_COMPLETE
			This fires when a player continues to the Complete
			window of the quest window. This is the window
			that has the "Complete Quest" button.
			
		QUEST_DETAIL
			This fires whenever a quest's details
			are being shown to the player.
			
			If the quest is an auto accept quest, then
			let the QUEST_DETAIL function know so we can
			close the frame after the quest is completed.
			If not, then complete the quest and let Blizzard
			close the window.
			
		QUEST_GREETING
			Greetings are lists of multiple quests a giver
			has for the player. These can be active, available,
			or both.
			
			Active quests are handled before available quests.
			
		QUEST_PROGRESS
			This fires when a quest immediately opens to the
			completion window, skipping the QUEST_COMPLETE
			event.
			
			These quests rarely, if ever, offer rewards apart
			from money and experience.
			
			Check if the quest is completable, then complete
			the quest.
]]--
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
			local guid = UnitGUID("target")
			if guid then
				local _, _, _, _, _, npcId = string.split("-", guid); npcId = tonumber(npcId)
				if HelpMePlayIgnoredCreaturesDB[npcId] then return end
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
		
		local questId = ...
		if select(2, IsAddOnLoaded("TomTom")) and HelpMePlayDB.WaypointsEnabled then
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
						TomTom:AddWaypoint(coords[1], coords[2] / 100, coords[3] / 100, opts)
						TomTom:SetClosestWaypoint()
					end
					break
				end
			end
		end
		
		C_QuestLog.AddQuestWatch(questId)
		
		C_Timer.After(0.5, function()
			AutoQuestPopupTracker_RemovePopUp(questId)
		end)

		if select(2, IsAddOnLoaded("Immersion")) then
			C_Timer.After(addonTable.CONSTANTS["ONE_TENTH_SECOND"], function()
				ImmersionFrame.TalkBox.MainFrame.CloseButton:Click()
			end)
		end
		
		-- It's not always possible to prevent a quest
		-- from being auto accepted. If that's the case,
		-- simply remove it from the player's log if it's
		-- on the ignore list.
		for i = 1, C_QuestLog.GetNumQuestLogEntries() do
			local id = C_QuestLog.GetQuestIDForLogIndex(i)
			if id == questId and (HelpMePlayIgnoredQuestsDB[questId] or addonTable.IGNORED_QUESTS[questId]) then
				C_QuestLog.SetSelectedQuest(id)
				C_QuestLog.SetAbandonQuest()
				C_QuestLog.AbandonQuest()
			end
		end
	end
	if event == "QUEST_AUTOCOMPLETE" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.CompleteQuestsEnabled == false or HelpMePlayDB.CompleteQuestsEnabled == nil then return false end
		local questId = ...
		ShowQuestComplete(questId)
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
				local _, _, _, _, _, npcId = string.split("-", GUID); npcId = tonumber(npcId)
				if HelpMePlayIgnoredCreaturesDB[npcId] then return end
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
			local _, _, _, _, _, npcId = string.split("-", GUID); npcId = tonumber(npcId)
			if HelpMePlayIgnoredCreaturesDB[npcId] then return end
		end
		QUEST_GREETING()
	end
	if event == "QUEST_LOOT_RECEIVED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return end
		if HelpMePlayDB.AutoEquipQuestRewardsEnabled == false or HelpMePlayDB.AutoEquipQuestRewardsEnabled == nil then return end
		if HelpMePlayDB.QuestRewardId ~= 1 then return end
	
		local _, questItemLink = ...
		C_Timer.After(0.5, function()
			if UnitLevel("player") < 60 then
				if not UnitAffectingCombat("player") then
					if questItemLink then
						local questItemItemLevel = GetDetailedItemLevelInfo(questItemLink)
						local _, _, _, equipLoc = GetItemInfoInstant(questItemLink)
						local _, questItemId = string.split(":", questItemLink); questItemId = tonumber(questItemId)
						for bagId = 0, 4 do
							for slotId = 1, GetContainerNumSlots(bagId) do
								local containerItemInfo = GetContainerItemInfo(bagId, slotId)
								if containerItemInfo then
									local containerItemId = C_Item.GetItemID(ItemLocation:CreateFromBagAndSlot(bagId, slotId))
									local containerItemIcon = C_Item.GetItemIcon(ItemLocation:CreateFromBagAndSlot(bagId, slotId))
									local containerItemLink = C_Item.GetItemLink(ItemLocation:CreateFromBagAndSlot(bagId, slotId))
									if containerItemId == questItemId then
										local inventorySlot = inventorySlots[equipLoc]
										local containerItemItemLevel = C_Item.GetCurrentItemLevel(ItemLocation:CreateFromBagAndSlot(bagId, slotId))
										if containerItemItemLevel > C_Item.GetCurrentItemLevel(ItemLocation:CreateFromEquipmentSlot(inventorySlot)) then
											print(string.format("%s: %s |T%s:0|t%s!", L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"], L_GLOBALSTRINGS["Text.Output.EquipItemUpgrade"], containerItemIcon, containerItemLink))
											ClearCursor()
											PickupContainerItem(bagId, slotId)
											EquipCursorItem(inventorySlots[equipLoc])
										end
									end
								end
							end
						end
					end
				end
			end
		end)
	end
	if event == "QUEST_PROGRESS" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.CompleteQuestsEnabled == false or HelpMePlayDB.CompleteQuestsEnabled == nil then return false end
		if IsQuestCompletable() then
			QuestFrameCompleteButton:Click()
			CompleteQuest()
		end
	end
end)