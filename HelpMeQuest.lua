
local addonName, t = ...;

-- Variables
local e = CreateFrame("Frame")
local delay = 0.1

-- Functions
local function Max(tbl)
	local highestItemIndex = 0
	local highestSellPrice = 0
	for itemIndex, itemSellPrice in ipairs(tbl) do
		if itemSellPrice > highestSellPrice then
			highestItemIndex = itemIndex
			highestSellPrice = itemSellPrice
		end
	end
	return highestItemIndex
end

local function GetQuestItemLink_Callback(index)
	local link = GetQuestItemLink("choice", index)
	if link then
		return link
	else
		GetQuestItemLink_Callback(index)
	end
end

local function CompleteQuest()
	local numQuestChoices = GetNumQuestChoices()
	if (numQuestChoices > 0) then
		local sellPrices = {}
		for i = 1, numQuestChoices, 1 do
			local _, _, quantity = GetQuestItemInfo("choice", i)
			local link = GetQuestItemLink("choice", i)
			if (link == nil) then
				link = GetQuestItemLink_Callback(i)
			end
			local _, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(link)
			sellPrices[i] = (quantity*sellPrice)
		end
		GetQuestReward(Max(sellPrices))
	else
		QuestFrameCompleteQuestButton:Click()
	end
end

local function GetOrCompleteQuests()
	-- The priority of quest management should be NEW, COMPLETE, and IGNORE all else.
	if IsModifierKeyDown() then return end -- The player is holding SHIFT, ALT, or CTRL, so don't process this function.
	local numAvailableQuests = C_GossipInfo.GetNumAvailableQuests()
	local numActiveQuests = C_GossipInfo.GetNumActiveQuests()
	if numAvailableQuests > 0 then
		-- The targeted NPC has quests that the player doesn't currently have.
		local availableQuests = C_GossipInfo.GetAvailableQuests()
		for i = 1, numAvailableQuests do
			repeat
				C_Timer.After(0, function()
					C_Timer.After(delay, function()
						C_GossipInfo.SelectAvailableQuest(availableQuests[i])
					end)
				end)
			until true
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
						CompleteQuest()
					end
				end)
			end)
		end
	end
end

local function GetGreetingQuests()
	local numAvailableQuests = GetNumAvailableQuests()
	if (numAvailableQuests > 0) then
		for i = 1, numAvailableQuests, 1 do
			SelectAvailableQuest(i)
		end
	else
		local numActiveQuests = GetNumActiveQuests()
		for i = 1, numActiveQuests, 1 do
			SelectActiveQuest(i)
		end
	end
end

SLASH_HelpMeQuest1 = "/hmq"
SlashCmdList["HelpMeQuest"] = function(command, editbox)
	local _, _, command, arguments = string.find(command, "%s?(%w+)%s?(.*)") -- Using pattern matching the addon will be able to interpret subcommands.
	if not command or command == "" then
		print(addonName .. "\n" ..
		"abandon - Abandons all quests in the zone specified by the player (e.g. /hmq abandon Silverpine Forest).")
	elseif command == "abandon" then
		local quests = C_QuestLog.GetQuestsOnMap(t.maps[arguments])
		for _, v in ipairs(quests) do
			C_QuestLog.SetSelectedQuest(v.questID)
			C_QuestLog.SetAbandonQuest()
			C_QuestLog.AbandonQuest()
		end
	end
end

e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("QUEST_COMPLETE")
e:RegisterEvent("QUEST_DATA_LOAD_RESULT")
e:RegisterEvent("QUEST_DETAIL")
e:RegisterEvent("QUEST_GREETING")
e:RegisterEvent("QUEST_PROGRESS")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_SHOW" then
		GetOrCompleteQuests()
	end
	if event == "QUEST_COMPLETE" then
		C_Timer.After(0, function()
			C_Timer.After(delay, function()
				CompleteQuest()
			end)
		end)
	end
	if event == "QUEST_DETAIL" then
		AcceptQuest()
	end
	if event == "QUEST_GREETING" then
		GetGreetingQuests()
	end
	if event == "QUEST_PROGRESS" then
		QuestFrameCompleteButton:Click()
	end
end)