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

local function GetChromieTimeExpansionName(id)
	local expansions = {
		[0] = L["Battle for Azeroth"],
		[5] = L["Cataclysm"],
		[6] = L["Burning Crusade"],
		[7] = L["Lich King"],
		[8] = L["Mists of Pandaria"],
		[9] = L["Draenor"],
		[10] = L["Legion"],
	}
	
	for expansionId, name in pairs(expansions) do
		if expansionId == id then
			return name
		end
	end
end

local function DropDownMenu_Initialize(menuName)
	local selectedValue = UIDropDownMenu_GetSelectedValue(menuName)
	local info = UIDropDownMenu_CreateInfo()
	
	if menuName:GetName() == "HMPChromieTimeDropDown" then
		-- Burning Crusade
		info.text = L["Burning Crusade"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 6
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Burning Crusade"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Burning Crusade"]
		info.tooltipText = L["Burning Crusade"]
		UIDropDownMenu_AddButton(info)
		
		-- Wrath of the Lich King
		info.text = L["Lich King"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 7
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Lich King"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Lich King"]
		info.tooltipText = L["Lich King"]
		UIDropDownMenu_AddButton(info)
		
		-- Cataclysm
		info.text = L["Cataclysm"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 5
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Cataclysm"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Cataclysm"]
		info.tooltipText = L["Cataclysm"]
		UIDropDownMenu_AddButton(info)
		
		-- Mists of Pandaria
		info.text = L["Mists of Pandaria"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 8
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Mists of Pandaria"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Mists of Pandaria"]
		info.tooltipText = L["Mists of Pandaria"]
		UIDropDownMenu_AddButton(info)
		
		-- Warlords of Draenor
		info.text = L["Draenor"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 9
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Draenor"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Draenor"]
		info.tooltipText = L["Draenor"]
		UIDropDownMenu_AddButton(info)
		
		-- Legion
		info.text = L["Legion"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 10
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Legion"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Legion"]
		info.tooltipText = L["Legion"]
		UIDropDownMenu_AddButton(info)
		
		-- Battle for Azeroth
		info.text = L["Battle for Azeroth"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 0
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Battle for Azeroth"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Battle for Azeroth"]
		info.tooltipText = L["Battle for Azeroth"]
		UIDropDownMenu_AddButton(info)
	elseif menuName:GetName() == "HMPTorghastPowersDropDown" then
		-- Automatic
		--
		-- Automatically selects the power for the player.
		info.text = L["Automatic"]
		info.func = function(self)
			HelpMePlayOptionsDB.TorghastPowers = L["Automatic"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Automatic"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Automatic"]
		info.tooltipText = L["Automatic"]
		UIDropDownMenu_AddButton(info)
		
		-- Automatic (No Epic)
		--
		-- Automatically selects the power for the player.
		-- Ignores epic powers.
		info.text = L["Automatic (No Epic)"]
		info.func = function(self)
			HelpMePlayOptionsDB.TorghastPowers = L["Automatic (No Epic)"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Automatic (No Epic)"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Automatic (No Epic)"]
		info.tooltipText = L["Automatic (No Epic)"]
		UIDropDownMenu_AddButton(info)
		
		-- Notifications
		--
		-- Notifies the player of the recommended power.
		info.text = L["Notifications"]
		info.func = function(self)
			HelpMePlayOptionsDB.TorghastPowers = L["Notifications"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Notifications"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Notifications"]
		info.tooltipText = L["Notifications"]
		UIDropDownMenu_AddButton(info)
		
		-- Disabled
		--
		-- Self explanatory.
		info.text = L["Disabled"]
		info.func = function(self)
			HelpMePlayOptionsDB.TorghastPowers = L["Disabled"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Disabled"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Disabled"]
		info.tooltipText = L["Disabled"]
		UIDropDownMenu_AddButton(info)
	elseif menuName:GetName() == "HMPCovenantsDropDown" then
		-- Kyrian
		--
		-- Automatically selects the Kyrian Covenant.
		info.text = L["Kyrian"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L["Kyrian"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Kyrian"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Kyrian"]
		info.tooltipText = L["Kyrian"]
		UIDropDownMenu_AddButton(info)
		
		-- Necrolord
		--
		-- Automatically selects the Necrolord Covenant.
		info.text = L["Necrolord"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L["Necrolord"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Necrolord"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Necrolord"]
		info.tooltipText = L["Necrolord"]
		UIDropDownMenu_AddButton(info)
		
		-- Night Fae
		--
		-- Automatically selects the Night Fae Covenant.
		info.text = L["Night Fae"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L["Night Fae"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Night Fae"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Night Fae"]
		info.tooltipText = L["Night Fae"]
		UIDropDownMenu_AddButton(info)
		
		-- Venthyr
		--
		-- Automatically selects the Venthyr Covenant.
		info.text = L["Venthyr"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L["Venthyr"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Venthyr"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Venthyr"]
		info.tooltipText = L["Venthyr"]
		UIDropDownMenu_AddButton(info)
		
		-- Disabled
		--
		-- Self explanatory.
		info.text = L["Disabled"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L["Disabled"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L["Disabled"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L["Disabled"]
		info.tooltipText = L["Disabled"]
		UIDropDownMenu_AddButton(info)
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
		if UnitAffectingCombat("player") == false then
			HMPOptionsFrame:Show()

			-- Make the options menu movable.
			HMPOptionsFrame:SetMovable(true)
			HMPOptionsFrame:EnableMouse(true)
			HMPOptionsFrame:RegisterForDrag("LeftButton")
			HMPOptionsFrame:SetScript("OnDragStart", HMPOptionsFrame.StartMoving)
			HMPOptionsFrame:SetScript("OnDragStop", HMPOptionsFrame.StopMovingOrSizing)

			-- SetText for FontStrings
			HMPCRText:SetText(L["CR Text"])
			HMPDisableAllText:SetText(L["Disable All"])
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
			HMPNotesText:SetText(L["Notes"])
			HMPTalentsText:SetText(L["Talents"])
			HMPCinematicsText:SetText(L["Cinematics"])
			HMPQueuesText:SetText(L["Queues"])
			HMPPartyPlayText:SetText(L["Party Play"])
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
			
			if HelpMePlayOptionsDB.Cinematics then
				HMPCinematicsCB:SetChecked(true)
			else
				HMPCinematicsCB:SetChecked(false)
			end
			
			if HelpMePlayOptionsDB.Queues then
				HMPQueuesCB:SetChecked(true)
			else
				HMPQueuesCB:SetChecked(false)
			end
			
			if HelpMePlayOptionsDB.PartyPlay then
				HMPPartyPlayCB:SetChecked(true)
			else
				HMPPartyPlayCB:SetChecked(false)
			end
			
			if HelpMePlayOptionsDB.MinimapIcon then
				HMPMinimapIconCB:SetChecked(true)
			else
				HMPMinimapIconCB:SetChecked(false)
			end
			
			if HelpMePlayOptionsDB.ChromieTimeExpansion then
				UIDropDownMenu_SetText(HMPChromieTimeDropDown, GetChromieTimeExpansionName(HelpMePlayOptionsDB.ChromieTimeExpansion))
			end
			
			if HelpMePlayOptionsDB.TorghastPowers then
				if HelpMePlayOptionsDB.TorghastPowers == L["Automatic"] or HelpMePlayOptionsDB.TorghastPowers == true then
					UIDropDownMenu_SetText(HMPTorghastPowersDropDown, L["Automatic"])
				elseif HelpMePlayOptionsDB.TorghastPowers == L["Automatic (No Epic)"] then
					UIDropDownMenu_SetText(HMPTorghastPowersDropDown, L["Automatic (No Epic)"])
				elseif HelpMePlayOptionsDB.TorghastPowers == L["Notifications"] then
					UIDropDownMenu_SetText(HMPTorghastPowersDropDown, L["Notifications"])
				elseif HelpMePlayOptionsDB.TorghastPowers == L["Disabled"] or HelpMePlayOptionsDB.TorghastPowers == false or HelpMePlayOptionsDB.TorghastPowers == nil then
					UIDropDownMenu_SetText(HMPTorghastPowersDropDown, L["Disabled"])
				end
			end
			
			if HelpMePlayOptionsDB.Covenant then
				if HelpMePlayOptionsDB.Covenant == L["Kyrian"] then
					UIDropDownMenu_SetText(HMPCovenantsDropDown, L["Kyrian"])
				elseif HelpMePlayOptionsDB.Covenant == L["Necrolord"] then
					UIDropDownMenu_SetText(HMPCovenantsDropDown, L["Necrolord"])
				elseif HelpMePlayOptionsDB.Covenant == L["Night Fae"] then
					UIDropDownMenu_SetText(HMPCovenantsDropDown, L["Night Fae"])
				elseif HelpMePlayOptionsDB.Covenant == L["Venthyr"] then
					UIDropDownMenu_SetText(HMPCovenantsDropDown, L["Venthyr"])
				else
					UIDropDownMenu_SetText(HMPCovenantsDropDown, L["Disabled"])
				end
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
					HelpMePlayOptionsDB["TempSettings"].Notes = HelpMePlayOptionsDB.Notes
					HelpMePlayOptionsDB["TempSettings"].Talents = HelpMePlayOptionsDB.Talents
					HelpMePlayOptionsDB["TempSettings"].Cinematics = HelpMePlayOptionsDB.Cinematics
					HelpMePlayOptionsDB["TempSettings"].Queues = HelpMePlayOptionsDB.Queues
					HelpMePlayOptionsDB["TempSettings"].PartyPlay = HelpMePlayOptionsDB.PartyPlay
					HelpMePlayOptionsDB["TempSettings"].MinimapIcon = HelpMePlayOptionsDB.MinimapIcon
					HelpMePlayOptionsDB["TempSettings"].ChromieTimeExpansion = HelpMePlayOptionsDB.ChromieTimeExpansion
					HelpMePlayOptionsDB["TempSettings"].TorghastPowers = HelpMePlayOptionsDB.TorghastPowers
					HelpMePlayOptionsDB["TempSettings"].Covenant = HelpMePlayOptionsDB.Covenant
					
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
					HelpMePlayOptionsDB.Notes = false
					HelpMePlayOptionsDB.Talents = false
					HelpMePlayOptionsDB.Cinematics = false
					HelpMePlayOptionsDB.Queues = false
					HelpMePlayOptionsDB.PartyPlay = false
					HelpMePlayOptionsDB.MinimapIcon = false
					HelpMePlayOptionsDB.ChromieTimeExpansion = 0
					HelpMePlayOptionsDB.TorghastPowers = L["Disabled"]
					HelpMePlayOptionsDB.Covenant = L["Disabled"]
					
					-- Uncheck the buttons.
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
					HMPNotesCB:SetChecked(false)
					HMPTalentsCB:SetChecked(false)
					HMPCinematicsCB:SetChecked(false)
					HMPQueuesCB:SetChecked(false)
					HMPPartyPlayCB:SetChecked(false)
					HMPMinimapIconCB:SetChecked(false)
					UIDropDownMenu_SetSelectedValue(HMPChromieTimeDropDown, L["Battle for Azeroth"])
					UIDropDownMenu_SetSelectedValue(HMPTorghastPowersDropDown, L["Disabled"])
					UIDropDownMenu_SetSelectedValue(HMPCovenantsDropDown, L["Disabled"])
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
					HelpMePlayOptionsDB.Notes = HelpMePlayOptionsDB["TempSettings"].Notes
					HelpMePlayOptionsDB.Talents = HelpMePlayOptionsDB["TempSettings"].Talents
					HelpMePlayOptionsDB.Cinematics = HelpMePlayOptionsDB["TempSettings"].Cinematics
					HelpMePlayOptionsDB.Queues = HelpMePlayOptionsDB["TempSettings"].Queues
					HelpMePlayOptionsDB.PartyPlay = HelpMePlayOptionsDB["TempSettings"].PartyPlay
					HelpMePlayOptionsDB.MinimapIcon = HelpMePlayOptionsDB["TempSettings"].MinimapIcon
					HelpMePlayOptionsDB.ChromieTimeExpansion = HelpMePlayOptionsDB["TempSettings"].ChromieTimeExpansion
					HelpMePlayOptionsDB.TorghastPowers = HelpMePlayOptionsDB["TempSettings"].TorghastPowers
					HelpMePlayOptionsDB.Covenant = HelpMePlayOptionsDB["TempSettings"].Covenant
					
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
					HMPNotesCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Notes)
					HMPTalentsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Talents)
					HMPCinematicsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Cinematics)
					HMPQueuesCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Queues)
					HMPPartyPlayCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].PartyPlay)
					HMPMinimapIconCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].MinimapIcon)
					UIDropDownMenu_SetSelectedValue(HMPChromieTimeDropDown, GetChromieTimeExpansionName(HelpMePlayOptionsDB.ChromieTimeExpansion))
					UIDropDownMenu_SetSelectedValue(HMPTorghastPowersDropDown, HelpMePlayOptionsDB.TorghastPowers)
					UIDropDownMenu_SetSelectedValue(HMPCovenantsDropDown, HelpMePlayOptionsDB.Covenant)
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
				ShowTooltip(self, L["Quests Check Button"])
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
			
			-- Cinematics Check Button
			HMPCinematicsCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L["Cinematics Check Button"])
			end)
			HMPCinematicsCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPCinematicsCB:SetScript("OnClick", function(self)
				if self:GetChecked() then
					HelpMePlayOptionsDB.Cinematics = true
				else
					HelpMePlayOptionsDB.Cinematics = false
				end
			end)
			
			-- Queues Check Button
			HMPQueuesCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L["Queues Check Button"])
			end)
			HMPQueuesCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPQueuesCB:SetScript("OnClick", function(self)
				if self:GetChecked() then
					HelpMePlayOptionsDB.Queues = true
				else
					HelpMePlayOptionsDB.Queues = false
				end
			end)
			
			-- Party Play Check Button
			HMPPartyPlayCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L["Party Play Check Button"])
			end)
			HMPPartyPlayCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPPartyPlayCB:SetScript("OnClick", function(self)
				if self:GetChecked() then
					HelpMePlayOptionsDB.PartyPlay = true
				else
					HelpMePlayOptionsDB.PartyPlay = false
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
			
			-- Chromie Time DropDown
			HMPChromieTimeDropDown:SetScript("OnEnter", function(self)
				ShowTooltip(self, L["Chromie Time DropDown"])
			end)
			HMPChromieTimeDropDown:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			UIDropDownMenu_Initialize(HMPChromieTimeDropDown, DropDownMenu_Initialize)
			
			-- Torghast Powers DropDown
			HMPTorghastPowersDropDown:SetScript("OnEnter", function(self)
				ShowTooltip(self, L["Torghast Powers DropDown"])
			end)
			HMPTorghastPowersDropDown:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			UIDropDownMenu_Initialize(HMPTorghastPowersDropDown, DropDownMenu_Initialize)
			
			-- Covenants DropDown
			HMPCovenantsDropDown:SetScript("OnEnter", function(self)
				ShowTooltip(self, L["Covenants DropDown"])
			end)
			HMPCovenantsDropDown:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			UIDropDownMenu_Initialize(HMPCovenantsDropDown, DropDownMenu_Initialize)
		end
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
				for i=1,C_QuestLog.GetNumQuestLogEntries() do
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
		for i=1,C_QuestLog.GetNumQuestLogEntries() do
			local info = C_QuestLog.GetInfo(i)
			if string.find(string.lower(info.title), string.lower(arguments)) then
				for j = 1, 25 do
					info = C_QuestLog.GetInfo(i+iter)
					if info then
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