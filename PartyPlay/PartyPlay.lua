local _, HelpMePlay = ...
local eventHandler = CreateFrame("Frame")

local addonPrefix = "HMP"
local isRegistered = C_ChatInfo.RegisterAddonMessagePrefix(addonPrefix)

if not isRegistered then
    if HelpMePlayDB["UsePartyPlay"] then
        HelpMePlay.Print("The addon was unable to register with the server. Please reload.")
    end
end

eventHandler:RegisterEvent("CHAT_MSG_ADDON")
eventHandler:RegisterEvent("GROUP_JOINED")
eventHandler:RegisterEvent("QUEST_ACCEPTED")
eventHandler:RegisterEvent("UI_INFO_MESSAGE")
eventHandler:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_ADDON" then
		local prefix, msg, channel, _, playerName = ...
		if prefix == addonPrefix then
			playerName = string.split("-", playerName)
			local unitName = UnitName("player")
			if unitName == playerName then
			    SendChatMessage(msg, channel)
			end
		end
	end
	if event == "GROUP_JOINED" then
        if HelpMePlayDB["UsePartyPlay"] then
            HelpMePlay.Print("[|cffFF7900WARNING|r] You've joined a group with Party Play enabled.")
        end
	end
	if event == "QUEST_ACCEPTED" then
        if HelpMePlayDB["UsePartyPlay"] then
            local questID = ...
            if questID then
                if UnitInParty("player") and isRegistered then
                    if C_QuestLog.IsPushableQuest(questID) then
                        C_QuestLog.SetSelectedQuest(questID)
                        QuestLogPushQuest()
                    end
                end
            end
        end
	end
end)