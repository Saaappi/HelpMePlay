local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local tooltip = CreateFrame("GameTooltip", "HelpMePlayScannerTooltip", UIParent, "GameTooltipTemplate")

e:RegisterEvent("CHAT_MSG_ADDON")
e:RegisterEvent("QUEST_ACCEPTED")
e:RegisterEvent("QUEST_TURNED_IN")
e:RegisterEvent("UI_INFO_MESSAGE")

C_ChatInfo.RegisterAddonMessagePrefix(addonName)

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

e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_ADDON" then
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
		if HelpMePlayOptionsDB.PartyPlay == false or HelpMePlayOptionsDB.PartyPlay == nil then return end
		if UnitInParty("player") then
			local questId = ...
			C_ChatInfo.SendAddonMessage(addonName, "[" .. L["Addon Short Name"] .. "]: " .. L["Quest Accepted Text"] .. " \"" .. Get_QuestTitleFromId[questId] .. "\" (" .. questId .. ")", "PARTY")
		end
	end
	if event == "QUEST_TURNED_IN" then
		if HelpMePlayOptionsDB.PartyPlay == false or HelpMePlayOptionsDB.PartyPlay == nil then return end
		if UnitInParty("player") then
			local questId = ...
			C_ChatInfo.SendAddonMessage(addonName, "[" .. L["Addon Short Name"] .. "]: " .. L["Quest Turned In Text"] .. " \"" .. Get_QuestTitleFromId[questId] .. "\" (" .. questId .. ")", "PARTY")
		end
	end
	if event == "UI_INFO_MESSAGE" then
		if HelpMePlayOptionsDB.PartyPlay == false or HelpMePlayOptionsDB.PartyPlay == nil then return end
		if UnitInParty("player") then
			local supportedMsgTypes = { 290, 292, 293, 294, 295 }
			local msgType, msg = ...
			for _, supportedMsgType in ipairs(supportedMsgTypes) do
				if supportedMsgType == msgType then
					C_ChatInfo.SendAddonMessage(addonName, "[" .. L["Addon Short Name"] .. "]: " .. msg)
				end
			end
		end
	end
end)