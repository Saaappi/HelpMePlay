--[[
	The purpose of the addon is to make MY questing route faster.
]]--

--[[ TODO
	- Make a table of quest names to their respective IDs.
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
			if (t.quests[availableQuestsData["title"]]) then
				C_GossipInfo.SelectAvailableQuest(index);
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
e:RegisterEvent("GOSSIP_SHOW");
e:RegisterEvent("QUEST_ACCEPTED");
e:RegisterEvent("QUEST_COMPLETE");
e:RegisterEvent("QUEST_DATA_LOAD_RESULT");
e:RegisterEvent("QUEST_DETAIL");
e:RegisterEvent("QUEST_GREETING");
e:RegisterEvent("QUEST_PROGRESS");
e:RegisterEvent("TAXIMAP_OPENED");
e:RegisterEvent("ZONE_CHANGED_NEW_AREA");
e:SetScript("OnEvent", function(self, event, ...)
	if (event == "ADDON_LOADED") then
		local name = ...;
		if (name == addonName) then
			C_Timer.After(0, function()
				C_Timer.After(3, function()
					map = C_Map.GetBestMapForUnit("player");
				end);
			end);
		end
	end
	if (event == "GOSSIP_SHOW") then
		GetAvailableQuests();
		GetActiveQuests();
	end
	--[[if (event == "QUEST_ACCEPTED") then
		local id = ...;
	end]]
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
				end
			end
		end
		
		if (QuestFrame:IsVisible()) then
			title = QuestInfoTitleHeader:GetText();
			if (t.quests[title]) then
				AcceptQuest();
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
		if (UnitLevel("player") < 50) then
			if (FlightMapFrame:IsVisible()) then
				for questIndex = 1, GetNumQuestLogEntries(), 1 do
					local questLogQuestTitle = GetQuestLogTitle(questIndex);
					for questTitle, fp in pairs(t.flightPaths) do
						if (questLogQuestTitle == questTitle) then
							for taxiNodeID = 1, NumTaxiNodes(), 1 do
								if (TaxiNodeName(taxiNodeID) == fp) then
									TakeTaxiNode(taxiNodeID);
								end
							end
						end
					end
				end
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

--[[CinematicFrame:HookScript("OnShow", function(self, ...)
	if (t.quests[map][title]["cancelCinematic"]) then
		CinematicFrame_CancelCinematic();
	end
end);]]