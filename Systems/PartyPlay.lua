local addonName, addon = ...
local e = CreateFrame("Frame")
local tooltip = CreateFrame("GameTooltip", "HelpMePlayScannerTooltip", UIParent, "GameTooltipTemplate")
local isRegistered = C_ChatInfo.RegisterAddonMessagePrefix(addonName)

local function Filter_ChatFrame(self, event, msg, author, ...)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.PartyPlayEnabled == false or HelpMePlayDB.PartyPlayEnabled == nil then return false end
	if msg:find("already on that quest.") then
		return true
	end
end

local GetQuestTitleFromID = setmetatable({}, {__index = function(t, questId)
	tooltip:SetOwner(UIParent, "ANCHOR_NONE")
	tooltip:SetHyperlink("quest:" .. questId)
	local title = HelpMePlayScannerTooltipTextLeft1:GetText()
	tooltip:Hide()
	if title and title ~= RETRIEVING_DATA then
		t[questId] = title
		return title
	end
end})

ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM", Filter_ChatFrame)

e:RegisterEvent("CHAT_MSG_ADDON")
e:RegisterEvent("GROUP_JOINED")
e:RegisterEvent("QUEST_ACCEPTED")
e:RegisterEvent("QUEST_REMOVED")
e:RegisterEvent("QUEST_TURNED_IN")
e:RegisterEvent("UI_INFO_MESSAGE")
e:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_ADDON" then
		-- Send the desired message to the
		-- specified chat channel.
		local addon, msg, channel, _, playerName = ...
		if addon == name then
			playerName = string.split("-", playerName)
			local unitName = UnitName("player")
			if unitName == playerName then
				SendChatMessage(msg, channel)
			end
		end
	end
	if event == "GROUP_JOINED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PartyPlayEnabled == false or HelpMePlayDB.PartyPlayEnabled == nil then return false end
		print(addon.CONSTANTS.COLORED_ADDON_NAME .. ": " .. "[|cffFF7900WARNING|r] You've joined a group with Party Play enabled.")
	end
	if event == "QUEST_ACCEPTED" then
		-- Add the quest to the table.
		--
		-- Report to party chat that a
		-- quest was accepted.
		--
		-- Share the quest with the player's
		-- party.
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PartyPlayEnabled == false or HelpMePlayDB.PartyPlayEnabled == nil then return false end
		
		local questID = ...
		HelpMePlayCharacterQuestsDB[questID] = { title = GetQuestTitleFromID[questID], progressPercent = 0 }
		
		if UnitInParty("player") then
			if isRegistered then
				if HelpMePlayDB.PartyPlayAnnounceEnabled then
					C_ChatInfo.SendAddonMessage(name, "[HMP]: Accepted \"" .. GetQuestTitleFromID[questID] .. "\"", "PARTY")
				end
				if HelpMePlayDB.PartyPlayAutoShareEnabled then
					if C_QuestLog.IsPushableQuest(questID) then
						C_QuestLog.SetSelectedQuest(questID)
						QuestLogPushQuest()
					end
				end
			end
		end
	end
	if event == "QUEST_REMOVED" then
		-- This event fires when quests are
		-- turned in, but also when they're
		-- abandoned.
		--
		-- We'll get around this by checking
		-- if the quest is still in the
		-- player's quest table. If so, then
		-- the player didn't turn it in, so
		-- report the message to chat.
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PartyPlayEnabled == false or HelpMePlayDB.PartyPlayEnabled == nil then return false end
		
		local questID = ...
		C_Timer.After(addon.CONSTANTS["ONE_SECOND"], function()
			if HelpMePlayCharacterQuestsDB[questID] then
				if HelpMePlayDB.PartyPlayAnnounceEnabled then
					-- The player abandoned the quest or
					-- left the area (eg. world quests).
					C_ChatInfo.SendAddonMessage(name, "[HMP]: Removed \"" .. GetQuestTitleFromID[questID] .. "\"", "PARTY")
				end
				HelpMePlayCharacterQuestsDB[questID] = nil
			end
		end)
	end
	if event == "QUEST_TURNED_IN" then
		-- Remove the quest from the table.
		--
		-- Report to party chat the a quest
		-- was turned in.
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PartyPlayEnabled == false or HelpMePlayDB.PartyPlayEnabled == nil then return false end
		
		local questID = ...
		HelpMePlayCharacterQuestsDB[questID] = nil
		if UnitInParty("player") then
			if isRegistered then
				if HelpMePlayDB.PartyPlayAnnounceEnabled then
					C_ChatInfo.SendAddonMessage(name, "[HMP]: Turned in \"" .. GetQuestTitleFromID[questID] .. "\"", "PARTY")
				end
			end
		end
	end
	if event == "UI_INFO_MESSAGE" then
		-- Scrape the message from the UI to
		-- send to the channel.
		--
		-- This is used in cases like:
		-- 6/6 Bewitched Bear slain
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PartyPlayEnabled == false or HelpMePlayDB.PartyPlayEnabled == nil then return false end
		
		if UnitInParty("player") then
			local supportedMsgTypes = { 290, 292, 293, 294, 295 }
			local msgType, msg = ...
			for _, supportedMsgType in ipairs(supportedMsgTypes) do
				if supportedMsgType == msgType then
					if isRegistered then
						if HelpMePlayDB.PartyPlayAnnounceEnabled then
							C_ChatInfo.SendAddonMessage(name, "[HMP]: " .. msg)
						end
					end
				end
			end
		end
	end
	if event == "UNIT_QUEST_LOG_CHANGED" then
		-- Used explicitly to handle quests
		-- with progress bars.
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PartyPlayEnabled == false or HelpMePlayDB.PartyPlayEnabled == nil then return false end
		if UnitInParty("player") then
			local unit = ...
			if unit == "player" then
				local numObjectives, text, objectiveType
				for questID, questData in pairs(HelpMePlayCharacterQuestsDB) do
					if C_QuestLog.IsOnQuest(questID) then
						numObjectives = C_QuestLog.GetNumQuestObjectives(questID)
						for index=1, numObjectives do
							text, objectiveType = GetQuestObjectiveInfo(questID, index, false)
							if objectiveType == "progressbar" then
								local progressPercent = GetQuestProgressBarPercent(questID)
								if progressPercent ~= questData.progressPercent then
									if isRegistered then
										if HelpMePlayDB.PartyPlayAnnounceEnabled then
											C_ChatInfo.SendAddonMessage(name, "[HMP]: " .. text .. " (" .. questData.title .. ")", "PARTY")
										end
									end
									questData.progressPercent = progressPercent
								end
							else
								break
							end
						end
					else
						HelpMePlayCharacterQuestsDB[questID] = nil
					end
				end
			end
		end
	end
end)