local addonName, addon = ...
local events = CreateFrame("Frame")
local tooltip = CreateFrame("GameTooltip", "HelpMePlayScannerTooltip", UIParent, "GameTooltipTemplate")

local addonPrefix = "HMP"
local isRegistered = C_ChatInfo.RegisterAddonMessagePrefix(addonPrefix)

if ( not isRegistered ) then
    print(addonName .. " not registered to the server to send chat messages!")
end

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

events:RegisterEvent("CHAT_MSG_ADDON")
events:RegisterEvent("GROUP_JOINED")
events:RegisterEvent("QUEST_ACCEPTED")
events:RegisterEvent("QUEST_REMOVED")
events:RegisterEvent("QUEST_TURNED_IN")
events:RegisterEvent("UI_INFO_MESSAGE")
events:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
events:SetScript("OnEvent", function(self, event, ...)
	if ( event == "CHAT_MSG_ADDON" ) then
		local prefix, msg, channel, _, playerName = ...
		if ( prefix == addonPrefix ) then
			playerName = string.split("-", playerName)
			local unitName = UnitName("player")
			if ( unitName == playerName ) then
			    SendChatMessage(msg, channel)
			end
		end
	end
	if ( event == "GROUP_JOINED" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PartyPlayEnabled == false or HelpMePlayDB.PartyPlayEnabled == nil then return false end

		print(addon.CONSTANTS.COLORED_ADDON_NAME .. ": " .. "[|cffFF7900WARNING|r] You've joined a group with Party Play enabled.")
	end
	if ( event == "QUEST_ACCEPTED" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PartyPlayEnabled == false or HelpMePlayDB.PartyPlayEnabled == nil then return false end
		
		local questID = ...
		HelpMePlayCharacterDB.Quests[questID] = { title = C_QuestLog.GetTitleForQuestID(questID), progressPercent = 0 }

		if ( UnitInParty("player") ) then
			if ( isRegistered ) then
				if ( HelpMePlayDB.PartyPlayAnnounceEnabled ) then
				    C_ChatInfo.SendAddonMessage(addonPrefix, "[" .. addonPrefix .. "]: Accepted: " .. C_QuestLog.GetTitleForQuestID(questID) .. "!", "PARTY")
				end
				if ( HelpMePlayDB.PartyPlayAutoShareEnabled ) then
				    -- TODO: Figure out if sharing quests is working or busted.
					if ( C_QuestLog.IsPushableQuest(questID) ) then
						C_QuestLog.SetSelectedQuest(questID)
						QuestLogPushQuest()
					end
				end
			end
		end
	end
	if ( event == "QUEST_REMOVED" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PartyPlayEnabled == false or HelpMePlayDB.PartyPlayEnabled == nil then return false end
		
		local questID = ...
        if ( HelpMePlayCharacterDB.Quests[questID] ~= nil ) then
            if ( UnitInParty("player") ) then
                if ( HelpMePlayDB.PartyPlayAnnounceEnabled ) then
                    C_ChatInfo.SendAddonMessage(addonPrefix, "[" .. addonPrefix .. "]: Removed: " .. C_QuestLog.GetTitleForQuestID(questID) .. "!", "PARTY")
                end
            end
            HelpMePlayCharacterDB.Quests[questID] = nil
        end
	end
	if ( event == "QUEST_TURNED_IN" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PartyPlayEnabled == false or HelpMePlayDB.PartyPlayEnabled == nil then return false end
		
		local questID = ...
		HelpMePlayCharacterDB.Quests[questID] = nil
		if ( UnitInParty("player") ) then
			if ( isRegistered ) then
				if ( HelpMePlayDB.PartyPlayAnnounceEnabled ) then
                    C_ChatInfo.SendAddonMessage(addonPrefix, "[" .. addonPrefix .. "]: Turned in: " .. C_QuestLog.GetTitleForQuestID(questID) .. "!", "PARTY")
				end
			end
		end
	end
	if ( event == "UI_INFO_MESSAGE" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PartyPlayEnabled == false or HelpMePlayDB.PartyPlayEnabled == nil then return false end
		
		if ( UnitInParty("player") ) then
			local supportedMsgTypes = { 304, 305, 306 }
			local msgType, msg = ...
			for _, supportedMsgType in ipairs(supportedMsgTypes) do
				if ( supportedMsgType == msgType ) then
					if ( isRegistered ) then
						if ( HelpMePlayDB.PartyPlayAnnounceEnabled ) then
                        	C_ChatInfo.SendAddonMessage(addonPrefix, "[" .. addonPrefix .. "]: " .. msg, "PARTY")
						end
					end
				end
			end
		end
	end
	if ( event == "UNIT_QUEST_LOG_CHANGED" ) then
		-- Used explicitly to handle quests
		-- with progress bars.
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.PartyPlayEnabled == false or HelpMePlayDB.PartyPlayEnabled == nil then return false end

		if ( UnitInParty("player") ) then
			local unit = ...
			if ( unit == "player" ) then
				local numObjectives, text, objectiveType
				for questID, questData in pairs(HelpMePlayCharacterDB.Quests) do
					if ( C_QuestLog.IsOnQuest(questID) ) then
						numObjectives = C_QuestLog.GetNumQuestObjectives(questID)
						for index = 1, numObjectives do
							text, objectiveType = GetQuestObjectiveInfo(questID, index, false)
							if ( objectiveType == "progressbar" ) then
								local progressPercent = GetQuestProgressBarPercent(questID)
								if ( progressPercent ~= questData.progressPercent ) then
									if ( isRegistered ) then
										if ( HelpMePlayDB.PartyPlayAnnounceEnabled ) then
										    C_ChatInfo.SendAddonMessage(addonPrefix, "[" .. addonPrefix .. "]: " .. text .. " (" .. questData.title .. ")", "PARTY")
										end
									end
									questData.progressPercent = progressPercent
								end
							else
								break
							end
						end
					else
						HelpMePlayCharacterDB.Quests[questID] = nil
					end
				end
			end
		end
	end
end)