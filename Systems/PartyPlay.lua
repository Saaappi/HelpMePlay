local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local tooltip = CreateFrame("GameTooltip", "HelpMePlayScannerTooltip", UIParent, "GameTooltipTemplate")

e:RegisterEvent("CHAT_MSG_ADDON")
e:RegisterEvent("QUEST_ACCEPTED")
e:RegisterEvent("QUEST_TURNED_IN")
e:RegisterEvent("UI_INFO_MESSAGE")
e:RegisterEvent("UNIT_QUEST_LOG_CHANGED")

local isRegistered = C_ChatInfo.RegisterAddonMessagePrefix(addonName)

local function Filter_ChatFrame(self, event, msg, author, ...)
	if HelpMePlayOptionsDB.PartyPlay == false or HelpMePlayOptionsDB.PartyPlay == nil then return false end
	-- I don't want the auto share feature to
	-- report the "%s is already on that quest"
	-- message to the chat frame.
	if msg:find(L["Already on that quest."]) then
		return true
	end
end

local Get_QuestTitleFromId = setmetatable({}, {__index = function(t, questId)
	tooltip:SetOwner(UIParent, "ANCHOR_NONE")
	tooltip:SetHyperlink("quest:" .. questId)
	local title = HelpMePlayScannerTooltipTextLeft1:GetText()
	tooltip:Hide()
	if title and title ~= RETRIEVING_DATA then
		t[questId] = title
		return title
	end
end})

-- Chat filter registrations.
ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", Filter_ChatFrame)

e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_ADDON" then
		-- Send the desired message to the
		-- specified chat channel.
		local addon, msg, channel, _, playerName = ...
		if addon == addonName then
			playerName = string.split("-", playerName)
			local unitName = UnitName("player")
			if unitName == playerName then
				SendChatMessage(msg, channel)
			end
		end
	end
	if event == "QUEST_ACCEPTED" then
		-- Add the quest to the table.
		--
		-- Report to party chat that a
		-- quest was accepted.
		--
		-- Share the quest with the player's
		-- party.
		if HelpMePlayOptionsDB.PartyPlay == false or HelpMePlayOptionsDB.PartyPlay == nil then return end
		if UnitInParty("player") then
			local questId = ...
			HelpMePlayCharacterQuestsDB[questId] = Get_QuestTitleFromId[questId]
			if isRegistered then
				C_ChatInfo.SendAddonMessage(addonName, "[" .. L["Addon Short Name"] .. "]: " .. L["Quest Accepted Text"] .. " \"" .. Get_QuestTitleFromId[questId] .. "\" (" .. questId .. ")", "PARTY")
				if C_QuestLog.IsPushableQuest(questId) then
					C_QuestLog.SetSelectedQuest(questId)
					QuestLogPushQuest()
				end
			end
		end
	end
	if event == "QUEST_TURNED_IN" then
		-- Remove the quest from the table.
		--
		-- Report to party chat the a quest
		-- was turned in.
		if HelpMePlayOptionsDB.PartyPlay == false or HelpMePlayOptionsDB.PartyPlay == nil then return end
		if UnitInParty("player") then
			local questId = ...
			HelpMePlayCharacterQuestsDB[questId] = nil
			if isRegistered then
				C_ChatInfo.SendAddonMessage(addonName, "[" .. L["Addon Short Name"] .. "]: " .. L["Quest Turned In Text"] .. " \"" .. Get_QuestTitleFromId[questId] .. "\" (" .. questId .. ")", "PARTY")
			end
		end
	end
	if event == "UI_INFO_MESSAGE" then
		-- Scrape the message from the UI to
		-- send to the channel.
		--
		-- This is used in cases like:
		-- 6/6 Bewitched Bear slain
		if HelpMePlayOptionsDB.PartyPlay == false or HelpMePlayOptionsDB.PartyPlay == nil then return end
		if UnitInParty("player") then
			local supportedMsgTypes = { 290, 292, 293, 294, 295 }
			local msgType, msg = ...
			for _, supportedMsgType in ipairs(supportedMsgTypes) do
				if supportedMsgType == msgType then
					if isRegistered then
						C_ChatInfo.SendAddonMessage(addonName, "[" .. L["Addon Short Name"] .. "]: " .. msg)
					end
				end
			end
		end
	end
	if event == "UNIT_QUEST_LOG_CHANGED" then
		-- Used explicitly to handle quests
		-- with progress bars.
		if HelpMePlayOptionsDB.PartyPlay == false or HelpMePlayOptionsDB.PartyPlay == nil then return end
		if UnitInParty("player") then
			local unit = ...
			if unit == "player" then
				local numObjectives, text, objectiveType
				for questId, questTitle in pairs(HelpMePlayCharacterQuestsDB) do
					numObjectives = C_QuestLog.GetNumQuestObjectives(questId)
					for index=1, numObjectives do
						text, objectiveType = GetQuestObjectiveInfo(questId, index, false)
						if objectiveType == "progressbar" then
							if isRegistered then
								C_ChatInfo.SendAddonMessage(addonName, "[" .. L["Addon Short Name"] .. "]: " .. text .. " (" .. questTitle .. ")", "PARTY")
							end
						else
							break
						end
					end
				end
			end
		end
	end
end)