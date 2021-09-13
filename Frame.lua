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

SLASH_HelpMePlay1 = L["Slash HMP"]
SlashCmdList["HelpMePlay"] = function(command, editbox)
	local _, _, command, arguments = string.find(command, "%s?(%w+)%s?(.*)") -- Using pattern matching the addon will be able to interpret subcommands.
	if not command or command == "" then
		if HMPOptionsFrame:IsVisible() then
			HMPOptionsFrame:Hide()
		else
			HMPOptionsFrame:Show()

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
			HMPToFText:SetText(L["Threads of Fate"])

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

			if HelpMePlayOptionsDB.ThreadsOfFate then
				HMPToFCB:SetChecked(true)
			else
				HMPToFCB:SetChecked(false)
			end

			-- Close Button
			HMPOptionsFrameCloseButton:SetScript("OnClick", function(self)
				self:GetParent():Hide()
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
		end
	elseif command == L["Abandon Command"] then
		local quests = C_QuestLog.GetQuestsOnMap(addonTable.maps[string.upper(arguments)])
		for _, v in ipairs(quests) do
			C_QuestLog.SetSelectedQuest(v.questID)
			C_QuestLog.SetAbandonQuest()
			C_QuestLog.AbandonQuest()
		end
	end
end