local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local function ShowTooltip(self, text)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip:SetText(text)
	GameTooltip:Show()
end

local function HideTooltip(self)
	if GameTooltip:GetOwner() == self then
		GameTooltip:Hide()
	end
end

function HelpMePlayLoadSettings()
	if HMPOptionsFrame:IsVisible() then
		HMPOptionsFrame:Hide()
	else
		HMPOptionsFrame:Show()

		-- Make the options menu movable.
		HMPOptionsFrame:SetMovable(true)
		HMPOptionsFrame:EnableMouse(true)
		HMPOptionsFrame:RegisterForDrag("LeftButton")
		HMPOptionsFrame:SetScript("OnDragStart", HMPOptionsFrame.StartMoving)
		HMPOptionsFrame:SetScript("OnDragStop", HMPOptionsFrame.StopMovingOrSizing)

		-- SetText for FontStrings
		HMPCRText:SetText(L["CR Text"])
		HMPVersionText:SetText(GetAddOnMetadata(addonName, "Version"))
		HMPAdvMapsText:SetText(L["Adventure Maps"])
		HMPDialogText:SetText(L["Dialog"])
		HMPEmotesText:SetText(L["Emotes"])
		HMPGarrisonTblText:SetText(L["Garrison Tables"])
		HMPMailText:SetText(L["Mail"])
		HMPMerchantsText:SetText(L["Merchants"])
		HMPMountTrainingText:SetText(L["Mount Training"])
		HMPSpeechText:SetText(L["Speech"])
		HMPWarModeText:SetText(L["War Mode"])
		HMPQuestsText:SetText(L["Accept/Complete Quests"])
		HMPToFText:SetText(L["Threads of Fate"])
		HMPQuestRewardsText:SetText(L["Quest Rewards"])
		HMPChromieTimeText:SetText(L["Chromie Time"])
		HMPChromieTimeEditBox:SetText(HelpMePlayOptionsDB.ChromieTimeExpansion)
		HMPTorghastPowersText:SetText(L["Torghast Powers"])
		HMPNotesText:SetText(L["Notes"])

		-- Check settings first
		if HelpMePlayOptionsDB.AdventureMaps then
			HMPAdvMapsCB:SetChecked(true)
		else
			HMPAdvMapsCB:SetChecked(false)
		end

		if HelpMePlayOptionsDB.Dialog then
			HMPDialogCB:SetChecked(true)
		else
			HMPDialogCB:SetChecked(false)
		end

		if HelpMePlayOptionsDB.Emotes then
			HMPEmotesCB:SetChecked(true)
		else
			HMPEmotesCB:SetChecked(false)
		end

		if HelpMePlayOptionsDB.GarrisonTables then
			HMPGarrTblCB:SetChecked(true)
		else
			HMPGarrTblCB:SetChecked(false)
		end

		if HelpMePlayOptionsDB.Mail then
			HMPMailCB:SetChecked(true)
		else
			HMPMailCB:SetChecked(false)
		end

		if HelpMePlayOptionsDB.Merchants then
			HMPMerchantsCB:SetChecked(true)
		else
			HMPMerchantsCB:SetChecked(false)
		end

		if HelpMePlayOptionsDB.MountTraining then
			HMPMountTrainingCB:SetChecked(true)
		else
			HMPMountTrainingCB:SetChecked(false)
		end

		if HelpMePlayOptionsDB.Speech then
			HMPSpeechCB:SetChecked(true)
		else
			HMPSpeechCB:SetChecked(false)
		end

		if HelpMePlayOptionsDB.WarMode then
			HMPWarModeCB:SetChecked(true)
		else
			HMPWarModeCB:SetChecked(false)
		end

		if HelpMePlayOptionsDB.Quests then
			HMPQuestsCB:SetChecked(true)
		else
			HMPQuestsCB:SetChecked(false)
		end

		if HelpMePlayOptionsDB.QuestRewards then
			HMPQuestRewardsCB:SetChecked(true)
		else
			HMPQuestRewardsCB:SetChecked(false)
		end

		if HelpMePlayOptionsDB.ThreadsOfFate then
			HMPToFCB:SetChecked(true)
		else
			HMPToFCB:SetChecked(false)
		end
		
		if HelpMePlayOptionsDB.TorghastPowers then
			HMPTorghastPowersCB:SetChecked(true)
		else
			HMPTorghastPowersCB:SetChecked(false)
		end
		
		if HelpMePlayOptionsDB.Notes then
			HMPNotesCB:SetChecked(true)
		else
			HMPNotesCB:SetChecked(false)
		end

		-- Adventure Maps Check Button
		HMPAdvMapsCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Adventure Maps Check Button"])
		end)
		HMPAdvMapsCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPAdvMapsCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.AdventureMaps = true
			else
				HelpMePlayOptionsDB.AdventureMaps = false
			end
		end)

		-- Dialog Check Button
		HMPDialogCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Dialog Check Button"])
		end)
		HMPDialogCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPDialogCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.Dialog = true
			else
				HelpMePlayOptionsDB.Dialog = false
			end
		end)

		-- Emotes Check Button
		HMPEmotesCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Emotes Check Button"])
		end)
		HMPEmotesCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPEmotesCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.Emotes = true
			else
				HelpMePlayOptionsDB.Emotes = false
			end
		end)

		-- Garrison Tables Check Button
		HMPGarrTblCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Garrison Tables Check Button"])
		end)
		HMPGarrTblCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPGarrTblCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.GarrisonTables = true
			else
				HelpMePlayOptionsDB.GarrisonTables = false
			end
		end)

		-- Mail Check Button
		HMPMailCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Mail Check Button"])
		end)
		HMPMailCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPMailCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.Mail = true
			else
				HelpMePlayOptionsDB.Mail = false
			end
		end)

		-- Merchants Check Button
		HMPMerchantsCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Merchants Check Button"])
		end)
		HMPMerchantsCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPMerchantsCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.Merchants = true
			else
				HelpMePlayOptionsDB.Merchants = false
			end
		end)

		-- Mount Training Check Button
		HMPMountTrainingCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Mount Training Check Button"])
		end)
		HMPMountTrainingCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPMountTrainingCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.MountTraining = true
			else
				HelpMePlayOptionsDB.MountTraining = false
			end
		end)

		-- Speech Check Button
		HMPSpeechCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Speech Check Button"])
		end)
		HMPSpeechCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPSpeechCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.Speech = true
			else
				HelpMePlayOptionsDB.Speech = false
			end
		end)

		-- War Mode Check Button
		HMPWarModeCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["War Mode Check Button"])
		end)
		HMPWarModeCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPWarModeCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.WarMode = true
			else
				HelpMePlayOptionsDB.WarMode = false
			end
		end)

		-- Quests Check Button
		HMPQuestsCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Accept/Complete Quests Check Button"])
		end)
		HMPQuestsCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPQuestsCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.Quests = true
			else
				HelpMePlayOptionsDB.Quests = false
			end
		end)

		-- Quest Rewards Check Button
		HMPQuestRewardsCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Quest Rewards Check Button"])
		end)
		HMPQuestRewardsCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPQuestRewardsCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.QuestRewards = true
			else
				HelpMePlayOptionsDB.QuestRewards = false
			end
		end)

		-- Threads of Fate Check Button
		HMPToFCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Threads of Fate Check Button"])
		end)
		HMPToFCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPToFCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.ThreadsOfFate = true
			else
				HelpMePlayOptionsDB.ThreadsOfFate = false
			end
		end)

		-- Chromie Time EditBox
		HMPChromieTimeEditBox:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Current Expansion"] .. ": |cffFFFFFF" .. HelpMePlayOptionsDB.ChromieTimeExpansion .. "|r\n\n" .. L["Chromie Time EditBox"])
		end)
		HMPChromieTimeEditBox:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPChromieTimeEditBox:SetScript("OnEnterPressed", function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = tonumber(HMPChromieTimeEditBox:GetText())
			HMPChromieTimeEditBox:SetText("")
		end)
		
		-- Torghast Powers Check Button
		HMPTorghastPowersCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Torghast Powers Check Button"])
		end)
		HMPTorghastPowersCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPTorghastPowersCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.TorghastPowers = true
			else
				HelpMePlayOptionsDB.TorghastPowers = false
			end
		end)
		
		-- Notes Check Button
		HMPNotesCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Notes Check Button"])
		end)
		HMPNotesCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPNotesCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.Notes = true
			else
				HelpMePlayOptionsDB.Notes = false
			end
		end)
	end
end

SLASH_HelpMePlay1 = L["Slash HMP"]
SlashCmdList["HelpMePlay"] = function(command, editbox)
	local _, _, command, arguments = string.find(command, "%s?(%w+)%s?(.*)") -- Using pattern matching the addon will be able to interpret subcommands.
	if not command or command == "" then
		if HMPOptionsFrame:IsVisible() then
			HMPOptionsFrame:Hide()
		else
			HelpMePlayLoadSettings()
		end
	elseif command == L["Abandon Command"] and arguments == "" then
		-- Abandon all quests, but offer a static popup to confirm the player's choice.
		StaticPopupDialogs["HELPMEPLAY_ABANDON_ALL_QUESTS"] = 
		{
			text = L["Do you really want to abandon all quests?"],
			button1 = L["Yes"],
			button2 = L["No"],
			OnAccept = function()
				for i = 1, C_QuestLog.GetNumQuestLogEntries() do
					local info = C_QuestLog.GetInfo(i)
					local questId = info.questID

					if not info.isHeader and not info.isHidden then
						C_QuestLog.SetSelectedQuest(questId)
						C_QuestLog.SetAbandonQuest()
						C_QuestLog.AbandonQuest()
					end
				end
			end,
			timeout = 0,
			whileDead = true,
			hideOnEscape = true,
			preferredIndex = 3,
		}
		StaticPopup_Show ("HELPMEPLAY_ABANDON_ALL_QUESTS")
	elseif command == L["Abandon Command"] and arguments ~= "" then
		-- Abandon the quests by header name.
		local iter = 1
		for i = 1, C_QuestLog.GetNumQuestLogEntries() do
			local info = C_QuestLog.GetInfo(i)
			if string.find(string.lower(info.title), string.lower(arguments)) then
				for j = 1, 25 do
					info = C_QuestLog.GetInfo(i+iter)
					local questId = info.questID
					if not info.isHeader and not info.isHidden then
						C_QuestLog.SetSelectedQuest(questId)
						C_QuestLog.SetAbandonQuest()
						C_QuestLog.AbandonQuest()
						iter = iter+1
					end
				end
			end
		end
	elseif command == L["Dialog Command"] and arguments ~= "" then
		-- Add the custom (player submitted) dialog to the
		-- HelpMePlayPlayerDialogDB table.
		-- But before we add it, let's see if it already exists.
		-- If so, remove it from the table instead.
		for id, gossip in ipairs(HelpMePlayPlayerDialogDB) do
			if string.find(string.lower(gossip), string.lower(arguments)) then
				table.remove(HelpMePlayPlayerDialogDB, id)
				return
			end
		end
		table.insert(HelpMePlayPlayerDialogDB, arguments)
	end
end