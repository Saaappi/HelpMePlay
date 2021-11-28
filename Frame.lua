local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local icon = ""

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

function HelpMePlayShowMinimapIcon(show)
	if show then
		if icon ~= "" then
			icon:Show(addonName)
		else
			icon = LibStub("LibDBIcon-1.0")
			-- Create a Lib DB first to hold all the
			-- information for the minimap icon.
			local iconLDB = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject(addonName, {
				type = "launcher",
				icon = "Interface\\Icons\\achievement_reputation_08",
				OnTooltipShow = function(tooltip)
					tooltip:SetText(L["Colored Addon Name"] .. " |cffFFFFFFv" .. GetAddOnMetadata(addonName, "Version") .. "|r")
					tooltip:AddLine(L["Minimap Icon Subtext"])
					tooltip:Show()
				end,
				OnClick = function() HelpMePlayLoadSettings() end,
			})
			
			-- Register the minimap button with the
			-- LDB.
			icon:Register(addonName, iconLDB, HelpMePlayOptionsDB)
			icon:Show(addonName)
		end
	else
		icon:Hide(addonName)
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
		HMPTrainersV2Text:SetText(L["Trainers"])
		HMPSpeechText:SetText(L["Speech"])
		HMPWarModeText:SetText(L["War Mode"])
		HMPQuestsText:SetText(L["Accept/Complete Quests"])
		HMPToFText:SetText(L["Threads of Fate"])
		HMPQuestRewardsText:SetText(L["Quest Rewards"])
		HMPChromieTimeText:SetText(L["Chromie Time"])
		HMPChromieTimeEditBox:SetText(HelpMePlayOptionsDB.ChromieTimeExpansion)
		HMPTorghastPowersText:SetText(L["Torghast Powers"])
		HMPNotesText:SetText(L["Notes"])
		HMPTalentsText:SetText(L["Talents"])
		HMPMinimapIconText:SetText(L["Minimap Icon"])

		-- Check settings first
		if HelpMePlayOptionsDB.DisableAll then
			HMPDisableAllCB:SetChecked(true)
		else
			HMPDisableAllCB:SetChecked(false)
		end
		
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

		if HelpMePlayOptionsDB.Trainers then
			HMPTrainersV2CB:SetChecked(true)
		else
			HMPTrainersV2CB:SetChecked(false)
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
		
		if HelpMePlayOptionsDB.Talents then
			HMPTalentsCB:SetChecked(true)
		else
			HMPTalentsCB:SetChecked(false)
		end
		
		if HelpMePlayOptionsDB.MinimapIcon then
			HMPMinimapIconCB:SetChecked(true)
		else
			HMPMinimapIconCB:SetChecked(false)
		end
		
		-- Disable All Check Button
		HMPDisableAllCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Disable All Check Button"])
		end)
		HMPDisableAllCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPDisableAllCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.DisableAll = true
				-- Create an empty table to store the current
				-- state of the settings. We'll use the current
				-- states to return the settings back to their
				-- original state when the button is unchecked.
				HelpMePlayOptionsDB["TempSettings"] = {}
				HelpMePlayOptionsDB["TempSettings"].AdventureMaps = HelpMePlayOptionsDB.AdventureMaps
				HelpMePlayOptionsDB["TempSettings"].Dialog = HelpMePlayOptionsDB.Dialog
				HelpMePlayOptionsDB["TempSettings"].Emotes = HelpMePlayOptionsDB.Emotes
				HelpMePlayOptionsDB["TempSettings"].GarrisonTables = HelpMePlayOptionsDB.GarrisonTables
				HelpMePlayOptionsDB["TempSettings"].Mail = HelpMePlayOptionsDB.Mail
				HelpMePlayOptionsDB["TempSettings"].Merchants = HelpMePlayOptionsDB.Merchants
				HelpMePlayOptionsDB["TempSettings"].Trainers = HelpMePlayOptionsDB.Trainers
				HelpMePlayOptionsDB["TempSettings"].Speech = HelpMePlayOptionsDB.Speech
				HelpMePlayOptionsDB["TempSettings"].WarMode = HelpMePlayOptionsDB.WarMode
				HelpMePlayOptionsDB["TempSettings"].Quests = HelpMePlayOptionsDB.Quests
				HelpMePlayOptionsDB["TempSettings"].QuestRewards = HelpMePlayOptionsDB.QuestRewards
				HelpMePlayOptionsDB["TempSettings"].ThreadsOfFate = HelpMePlayOptionsDB.ThreadsOfFate
				HelpMePlayOptionsDB["TempSettings"].ChromieTimeExpansion = HelpMePlayOptionsDB.ChromieTimeExpansion
				HelpMePlayOptionsDB["TempSettings"].TorghastPowers = HelpMePlayOptionsDB.TorghastPowers
				HelpMePlayOptionsDB["TempSettings"].Notes = HelpMePlayOptionsDB.Notes
				HelpMePlayOptionsDB["TempSettings"].Talents = HelpMePlayOptionsDB.Talents
				HelpMePlayOptionsDB["TempSettings"].MinimapIcon = HelpMePlayOptionsDB.MinimapIcon
				
				-- Flag the settings as false.
				HelpMePlayOptionsDB.AdventureMaps = false
				HelpMePlayOptionsDB.Dialog = false
				HelpMePlayOptionsDB.Emotes = false
				HelpMePlayOptionsDB.GarrisonTables = false
				HelpMePlayOptionsDB.Mail = false
				HelpMePlayOptionsDB.Merchants = false
				HelpMePlayOptionsDB.Trainers = false
				HelpMePlayOptionsDB.Speech = false
				HelpMePlayOptionsDB.WarMode = false
				HelpMePlayOptionsDB.Quests = false
				HelpMePlayOptionsDB.QuestRewards = false
				HelpMePlayOptionsDB.ThreadsOfFate = false
				HelpMePlayOptionsDB.ChromieTimeExpansion = 0
				HelpMePlayOptionsDB.TorghastPowers = false
				HelpMePlayOptionsDB.Notes = false
				HelpMePlayOptionsDB.Talents = false
				HelpMePlayOptionsDB.MinimapIcon = false
				
				-- Uncheck the buttons.
				-- Set Chromie Time's editbox to 0.
				HMPAdvMapsCB:SetChecked(false)
				HMPDialogCB:SetChecked(false)
				HMPEmotesCB:SetChecked(false)
				HMPGarrTblCB:SetChecked(false)
				HMPMailCB:SetChecked(false)
				HMPMerchantsCB:SetChecked(false)
				HMPTrainersV2CB:SetChecked(false)
				HMPSpeechCB:SetChecked(false)
				HMPWarModeCB:SetChecked(false)
				HMPQuestsCB:SetChecked(false)
				HMPQuestRewardsCB:SetChecked(false)
				HMPToFCB:SetChecked(false)
				HMPChromieTimeEditBox:SetText(HelpMePlayOptionsDB.ChromieTimeExpansion)
				HMPTorghastPowersCB:SetChecked(false)
				HMPNotesCB:SetChecked(false)
				HMPTalentsCB:SetChecked(false)
				HMPMinimapIconCB:SetChecked(false)
			else
				-- Return the settings to their original
				-- states.
				--
				-- Recheck the buttons that were previously
				-- checked.
				HelpMePlayOptionsDB.DisableAll = false
				HelpMePlayOptionsDB.AdventureMaps = HelpMePlayOptionsDB["TempSettings"].AdventureMaps
				HelpMePlayOptionsDB.Dialog = HelpMePlayOptionsDB["TempSettings"].Dialog
				HelpMePlayOptionsDB.Emotes = HelpMePlayOptionsDB["TempSettings"].Emotes
				HelpMePlayOptionsDB.GarrisonTables = HelpMePlayOptionsDB["TempSettings"].GarrisonTables
				HelpMePlayOptionsDB.Mail = HelpMePlayOptionsDB["TempSettings"].Mail
				HelpMePlayOptionsDB.Merchants = HelpMePlayOptionsDB["TempSettings"].Merchants
				HelpMePlayOptionsDB.Trainers = HelpMePlayOptionsDB["TempSettings"].Trainers
				HelpMePlayOptionsDB.Speech = HelpMePlayOptionsDB["TempSettings"].Speech
				HelpMePlayOptionsDB.WarMode = HelpMePlayOptionsDB["TempSettings"].WarMode
				HelpMePlayOptionsDB.Quests = HelpMePlayOptionsDB["TempSettings"].Quests
				HelpMePlayOptionsDB.QuestRewards = HelpMePlayOptionsDB["TempSettings"].QuestRewards
				HelpMePlayOptionsDB.ThreadsOfFate = HelpMePlayOptionsDB["TempSettings"].ThreadsOfFate
				HelpMePlayOptionsDB.ChromieTimeExpansion = HelpMePlayOptionsDB["TempSettings"].ChromieTimeExpansion
				HelpMePlayOptionsDB.TorghastPowers = HelpMePlayOptionsDB["TempSettings"].TorghastPowers
				HelpMePlayOptionsDB.Notes = HelpMePlayOptionsDB["TempSettings"].Notes
				HelpMePlayOptionsDB.Talents = HelpMePlayOptionsDB["TempSettings"].Talents
				HelpMePlayOptionsDB.MinimapIcon = HelpMePlayOptionsDB["TempSettings"].MinimapIcon
				HMPChromieTimeEditBox:SetText(HelpMePlayOptionsDB["TempSettings"].ChromieTimeExpansion)
				
				HMPAdvMapsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].AdventureMaps)
				HMPDialogCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Dialog)
				HMPEmotesCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Emotes)
				HMPGarrTblCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].GarrisonTables)
				HMPMailCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Mail)
				HMPMerchantsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Merchants)
				HMPTrainersV2CB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Trainers)
				HMPSpeechCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Speech)
				HMPWarModeCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].WarMode)
				HMPQuestsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Quests)
				HMPQuestRewardsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].QuestRewards)
				HMPToFCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].ThreadsOfFate)
				HMPChromieTimeEditBox:SetText(HelpMePlayOptionsDB.ChromieTimeExpansion)
				HMPTorghastPowersCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].TorghastPowers)
				HMPNotesCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Notes)
				HMPTalentsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Talents)
				HMPMinimapIconCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].MinimapIcon)
			end
		end)

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

		-- Trainers Check Button
		HMPTrainersV2CB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Trainers Check Button"])
		end)
		HMPTrainersV2CB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPTrainersV2CB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.Trainers = true
			else
				HelpMePlayOptionsDB.Trainers = false
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
			HMPChromieTimeEditBox:SetText(HelpMePlayOptionsDB.ChromieTimeExpansion)
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
		
		-- Talents Check Button
		HMPTalentsCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Talents Check Button"])
		end)
		HMPTalentsCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPTalentsCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.Talents = true
			else
				HelpMePlayOptionsDB.Talents = false
			end
		end)
		
		-- Minimap Icon Check Button
		HMPMinimapIconCB:SetScript("OnEnter", function(self)
			ShowTooltip(self, L["Minimap Icon Check Button"])
		end)
		HMPMinimapIconCB:SetScript("OnLeave", function(self)
			HideTooltip(self)
		end)
		HMPMinimapIconCB:SetScript("OnClick", function(self)
			if self:GetChecked() then
				HelpMePlayOptionsDB.MinimapIcon = true
				HelpMePlayShowMinimapIcon(true)
			else
				HelpMePlayOptionsDB.MinimapIcon = false
				HelpMePlayShowMinimapIcon(false)
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
		-- HelpMePlayPlayerDialogDB table. But before we
		-- add it, let's see if it already exists. If so,
		-- remove it from the table instead.
		for id, gossip in ipairs(HelpMePlayPlayerDialogDB) do
			if string.find(string.lower(gossip), string.lower(arguments)) then
				table.remove(HelpMePlayPlayerDialogDB, id)
				return
			end
		end
		table.insert(HelpMePlayPlayerDialogDB, arguments)
	elseif command == L["Quest Command"] or command == L["Q"] and arguments ~= "" then
		-- A shorthand way to check if a given quest has
		-- been completed by the current player.
		--
		-- The argument must be a number, else silently
		-- fail out.
		if tonumber(arguments) then
			print("|cff00FFFF"..addonName.."|r: " .. tostring(C_QuestLog.IsQuestFlaggedCompleted(arguments)))
		end
	end
end