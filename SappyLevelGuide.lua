--[[
	The purpose of the addon is to make MY questing route faster.
]]--

--[[ TODO
	- Figure out the event that fires when the flight path map is opened.
	- Figure out how to take a flight path programmatically.
	- Figure out the event that fires when a flight path is taken.
		- Mark 'shouldTakeFlightPath' as false here.
	
	- Figure out the event(s) that fire when a quest is auto accepted.
	- Figure out how to automatically acknowledge and auto accepted quest so the notification clears from the quest objective tracker.
]]--

--[[
	These variables are provided to the addon by Blizzard.
		addonName	: This is self explanatory, but it's the name of the addon.
		t			: This is an empty table. This is how the addon can communicate between files or local functions, sort of like traditional classes.
]]--
local addonName, t = ...;

-- Variables
local e = CreateFrame("Frame");
local map = 0;
local shouldTakeFlightPath = false;
local title = "";

-- Functions
local function Max(tbl)
	local highestItemIndex = 0;
	local highestSellPrice = 0;
	for itemIndex, itemSellPrice in ipairs(tbl) do
		if (itemSellPrice > highestSellPrice) then
			highestItemIndex = itemIndex;
			highestSellPrice = itemSellPrice;
		end
	end
	return highestItemIndex;
end

local function GetQuestItemLink_Callback(index)
	local link = GetQuestItemLink("choice", index)
	if (link) then
		return link;
	else
		GetQuestItemLink_Callback(index);
	end
end

e:RegisterEvent("ADDON_LOADED");
e:RegisterEvent("CINEMATIC_START");
e:RegisterEvent("GOSSIP_SHOW");
e:RegisterEvent("QUEST_ACCEPTED");
e:RegisterEvent("QUEST_COMPLETE");
e:RegisterEvent("QUEST_DATA_LOAD_RESULT");
e:RegisterEvent("QUEST_DETAIL");
e:RegisterEvent("QUEST_PROGRESS");
e:RegisterEvent("ZONE_CHANGED_NEW_AREA");
e:SetScript("OnEvent", function(self, event, addon)
	if (event == "ADDON_LOADED" and addon == addonName) then
		map = C_Map.GetBestMapForUnit("player");
	end
	if (event == "CINEMATIC_START") then
		local canBeCancelled = CanCancelScene();
		if (canBeCancelled and t.quests[map][title]["cancelCinematic"]) then
			StopCinematic();
		end
	end
	if (event == "GOSSIP_SHOW") then
		local availableQuests = C_GossipInfo.GetAvailableQuests();
		local activeQuests = C_GossipInfo.GetActiveQuests();
		if (availableQuests ~= nil or availableQuests ~= {}) then
			for index, availableQuestsData in ipairs(availableQuests) do
				if (t.quests[map][availableQuestsData["title"]]) then
					C_GossipInfo.SelectAvailableQuest(index);
				end
			end
		end
		if (activeQuests ~= nil or activeQuests ~= {}) then
			for index, activeQuestsData in ipairs(activeQuests) do
				if (activeQuestsData["isComplete"]) then
					C_GossipInfo.SelectActiveQuest(index);
				end
			end
		end
	end
	if (event == "QUEST_ACCEPTED") then
		if (t.quests[map][title]["flightPath"]) then -- The quest has a flight path that should be taken.
			shouldTakeFlightPath = true;
		end
	end
	if (event == "QUEST_COMPLETE") then
		local numQuestChoices = GetNumQuestChoices();
		if (numQuestChoices > 0) then
			local sellPrices = {};
			for i = 1, numQuestChoices, 1 do
				local _, _, quantity = GetQuestItemInfo("choice", i);
				local link = GetQuestItemLink("choice", i);
				if (link == nil) then
					link = GetQuestItemLink_Callback(i);
				end
				local _, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(link);
				sellPrices[i] = (quantity*sellPrice);
			end
			GetQuestReward(Max(sellPrices));
		else
			QuestFrameCompleteQuestButton:Click();
		end
	end
	if (event == "QUEST_DATA_LOAD_RESULT" or event == "QUEST_DETAIL") then
		local numAutoQuestPopUps = GetNumAutoQuestPopUps();
		if (numAutoQuestPopUps > 1) then -- A quest was pushed (for accept or completion) to the player by area trigger or by looting an item.
			for index = 1, numAutoQuestPopUps, 1 do
				local id, pushType = GetAutoQuestPopUp(index);
				if (pushType == "OFFER") then
					title = C_QuestLog.GetTitleForQuestID(id);
					AcknowledgeAutoAcceptQuest(); -- Stops the server from attempting to push the quest.
				else
					-- Complete the quest here.
				end
			end
		end
		
		if (QuestFrame) then
			title = QuestInfoTitleHeader:GetText();
			
			if (t.quests[map][title]) then -- This is a quest in the Quests table, so it should be accepted.
				AcceptQuest();
			end
		end
	end
	if (event == "QUEST_PROGRESS") then
		QuestFrameCompleteButton:Click();
	end
	if (event == "ZONE_CHANGED_NEW_AREA") then
		map = C_Map.GetBestMapForUnit("player");
	end
end);