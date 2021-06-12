--[[
	The purpose of the addon is to make MY questing route faster.
]]--

--[[ TODO
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
local function GetActiveQuests()
	local activeQuests = C_GossipInfo.GetActiveQuests();
	if (next(activeQuests)) then
		for index, activeQuestsData in ipairs(activeQuests) do
			if (activeQuestsData["isComplete"]) then
				C_GossipInfo.SelectActiveQuest(index);
			end
		end
	end
end

local function GetAvailableQuests()
	local availableQuests = C_GossipInfo.GetAvailableQuests();
	if (next(availableQuests)) then
		for index, availableQuestsData in ipairs(availableQuests) do
			if (t.quests[map]) then
				if (t.quests[map][availableQuestsData["title"]]) then
					C_GossipInfo.SelectAvailableQuest(index);
				end
			end
		end
	end
end

local function GetGreetingQuests()
	local numAvailableQuests = GetNumAvailableQuests();
	if (numAvailableQuests > 0) then
		for index = 1, numAvailableQuests, 1 do
			SelectAvailableQuest(index);
		end
	else
		local numActiveQuests = GetNumActiveQuests();
		for i = 1, numActiveQuests, 1 do
			SelectActiveQuest(i);
		end
	end
end

local function GetQuestItemLink_Callback(index)
	local link = GetQuestItemLink("choice", index)
	if (link) then
		return link;
	else
		GetQuestItemLink_Callback(index);
	end
end

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

e:RegisterEvent("ADDON_LOADED");
e:RegisterEvent("CINEMATIC_START");
e:RegisterEvent("GOSSIP_SHOW");
e:RegisterEvent("QUEST_ACCEPTED");
e:RegisterEvent("QUEST_COMPLETE");
e:RegisterEvent("QUEST_DATA_LOAD_RESULT");
e:RegisterEvent("QUEST_DETAIL");
e:RegisterEvent("QUEST_GREETING");
e:RegisterEvent("QUEST_PROGRESS");
e:RegisterEvent("TAXIMAP_OPENED");
e:RegisterEvent("ZONE_CHANGED_NEW_AREA");
e:SetScript("OnEvent", function(self, event, addon)
	if (event == "ADDON_LOADED" and addon == addonName) then
		C_Timer.After(0, function()
			C_Timer.After(3, function()
				map = C_Map.GetBestMapForUnit("player");
			end);
		end);
	end
	if (event == "CINEMATIC_START") then
		local canBeCancelled = CanCancelScene();
		if (canBeCancelled and t.quests[map][title]["cancelCinematic"]) then
			StopCinematic();
		end
	end
	if (event == "GOSSIP_SHOW") then
		GetAvailableQuests();
		GetActiveQuests();
	end
	if (event == "QUEST_ACCEPTED") then
		if (t.quests[map]) then
			if (t.quests[map][title]["flightPath"]) then -- The quest has a flight path that should be taken.
				shouldTakeFlightPath = true;
			end
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
	if (event == "QUEST_DETAIL") then
		local numAutoQuestPopUps = GetNumAutoQuestPopUps();
		if (numAutoQuestPopUps > 0) then -- A quest was pushed (for accept or completion) to the player by area trigger or by looting an item.
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
		
		if (QuestFrame:IsVisible()) then
			title = QuestInfoTitleHeader:GetText();
			if (t.quests[map]) then -- Map is in the database.
				if (t.quests[map][title]) then -- Quest is in the database.
					AcceptQuest();
				end
			end
		end
	end
	if (event == "QUEST_GREETING") then
		GetGreetingQuests();
	end
	if (event == "QUEST_PROGRESS") then
		QuestFrameCompleteButton:Click();
	end
	if (event == "TAXIMAP_OPENED") then
		if (FlightMapFrame:IsVisible()) then
			if (shouldTakeFlightPath) then
				TakeTaxiNode(t.quests[map]["title"]["flightPath"]);
				shouldTakeFlightPath = false;
			end
		end
	end
	if (event == "ZONE_CHANGED_NEW_AREA") then
		C_Timer.After(0, function()
			C_Timer.After(3, function()
				map = C_Map.GetBestMapForUnit("player");
			end);
		end);
	end
end);