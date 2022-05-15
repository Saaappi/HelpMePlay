local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local numTabs = 4
local icon = ""

local function ImportToJunker(itemId)
	if HelpMePlayJunkerDB[itemId] then
		HelpMePlayJunkerDB = nil
	else
		HelpMePlayJunkerBlacklistDB[itemId] = nil
		HelpMePlayJunkerDB[itemId] = true
	end
end

function HMPTab_OnClick(self)
	local tabId = self
	PanelTemplates_SetTab(HMPOptionsFrame, tabId)
	if tabId == 1 then
		-- Show the widgets hidden from the Systems
		-- tab.
		HMPDialogCB:Show()
		HMPDialogText:Show()
		HMPEmotesCB:Show()
		HMPEmotesText:Show()
		HMPGarrTblCB:Show()
		HMPGarrisonTblText:Show()
		HMPMerchantsCB:Show()
		HMPMerchantsText:Show()
		HMPTrainersV2CB:Show()
		HMPTrainersV2Text:Show()
		HMPSpeechCB:Show()
		HMPSpeechText:Show()
		HMPQuestsCB:Show()
		HMPQuestsText:Show()
		HMPToFCB:Show()
		HMPToFText:Show()
		HMPCinematicsCB:Show()
		HMPCinematicsText:Show()
		HMPQueuesCB:Show()
		HMPQueuesText:Show()
		HMPVehiclesCB:Show()
		HMPVehiclesText:Show()
		HMPChromieTimeDropDown:Show()
		HMPCovenantsDropDown:Show()
		HMPBFAZoneSelDropDown:Show()
		HMPSLZoneSelDropDown:Show()
		
		-- Hide the widgets from the other tabs.
		HMPWarModeCB:Hide()
		HMPWarModeText:Hide()
		HMPNotesCB:Hide()
		HMPNotesText:Hide()
		HMPTalentsCB:Hide()
		HMPTalentsText:Hide()
		HMPWaypointsCB:Hide()
		HMPWaypointsText:Hide()
		HMPWeightsCB:Hide()
		HMPWeightsText:Hide()
		HMPPartyPlayCB:Hide()
		HMPPartyPlayText:Hide()
		HMPPartyPlayAnnounceCB:Hide()
		HMPPartyPlayAutoShareCB:Hide()
		HMPMinimapIconCB:Hide()
		HMPMinimapIconText:Hide()
		HMPLoggingCB:Hide()
		HMPLoggingText:Hide()
		HMPTorghastPowersDropDown:Hide()
		HMPEnableJunkerText:Hide()
		HMPEnableJunkerCB:Hide()
		HMPItemTypeArmorText:Hide()
		HMPJunkerItemTypeArmorCB:Hide()
		HMPItemTypeConsumableText:Hide()
		HMPJunkerItemTypeConsumableCB:Hide()
		HMPItemTypeRecipeText:Hide()
		HMPJunkerItemTypeRecipeCB:Hide()
		HMPJunkerItemTypeGemText:Hide()
		HMPJunkerItemTypeGemCB:Hide()
		HMPJunkerItemTypeTradeskillText:Hide()
		HMPJunkerItemTypeTradeskillCB:Hide()
		HMPJunkerItemTypeWeaponText:Hide()
		HMPJunkerItemTypeWeaponCB:Hide()
		HMPJunkerSafeModeText:Hide()
		HMPJunkerSafeModeCB:Hide()
		HMPJunkerRarityDropDown:Hide()
		HMPJunkerImportButton:Hide()
	elseif tabId == 2 then
		-- Show the widgets hidden from the Automations
		-- tab.
		HMPWarModeCB:Show()
		HMPWarModeText:Show()
		HMPNotesCB:Show()
		HMPNotesText:Show()
		HMPTalentsCB:Show()
		HMPTalentsText:Show()
		HMPWaypointsCB:Show()
		HMPWaypointsText:Show()
		HMPWeightsCB:Show()
		HMPWeightsText:Show()
		HMPPartyPlayCB:Show()
		HMPPartyPlayText:Show()
		-- These two buttons should only be shown if
		-- Party Play is enabled.
		if HelpMePlayOptionsDB.PartyPlay then
			HMPPartyPlayAnnounceCB:Show()
			HMPPartyPlayAutoShareCB:Show()
		else
			HMPPartyPlayAnnounceCB:Hide()
			HMPPartyPlayAutoShareCB:Hide()
		end
		HMPTorghastPowersDropDown:Show()
		
		-- Hide the widgets from the other tabs.
		HMPDialogCB:Hide()
		HMPDialogText:Hide()
		HMPEmotesCB:Hide()
		HMPEmotesText:Hide()
		HMPGarrTblCB:Hide()
		HMPGarrisonTblText:Hide()
		HMPMerchantsCB:Hide()
		HMPMerchantsText:Hide()
		HMPTrainersV2CB:Hide()
		HMPTrainersV2Text:Hide()
		HMPSpeechCB:Hide()
		HMPSpeechText:Hide()
		HMPQuestsCB:Hide()
		HMPQuestsText:Hide()
		HMPToFCB:Hide()
		HMPToFText:Hide()
		HMPCinematicsCB:Hide()
		HMPCinematicsText:Hide()
		HMPQueuesCB:Hide()
		HMPQueuesText:Hide()
		HMPVehiclesCB:Hide()
		HMPVehiclesText:Hide()
		HMPMinimapIconCB:Hide()
		HMPMinimapIconText:Hide()
		HMPLoggingCB:Hide()
		HMPLoggingText:Hide()
		HMPChromieTimeDropDown:Hide()
		HMPCovenantsDropDown:Hide()
		HMPBFAZoneSelDropDown:Hide()
		HMPSLZoneSelDropDown:Hide()
		HMPEnableJunkerText:Hide()
		HMPEnableJunkerCB:Hide()
		HMPItemTypeArmorText:Hide()
		HMPJunkerItemTypeArmorCB:Hide()
		HMPItemTypeConsumableText:Hide()
		HMPJunkerItemTypeConsumableCB:Hide()
		HMPItemTypeRecipeText:Hide()
		HMPJunkerItemTypeRecipeCB:Hide()
		HMPJunkerItemTypeGemText:Hide()
		HMPJunkerItemTypeGemCB:Hide()
		HMPJunkerItemTypeTradeskillText:Hide()
		HMPJunkerItemTypeTradeskillCB:Hide()
		HMPJunkerItemTypeWeaponText:Hide()
		HMPJunkerItemTypeWeaponCB:Hide()
		HMPJunkerSafeModeText:Hide()
		HMPJunkerSafeModeCB:Hide()
		HMPJunkerRarityDropDown:Hide()
		HMPJunkerImportButton:Hide()
	elseif tabId == 3 then
		-- Show the widgets hidden from the other tabs.
		HMPMinimapIconCB:Show()
		HMPMinimapIconText:Show()
		HMPLoggingCB:Show()
		HMPLoggingText:Show()
		
		-- Hide the widgets from the other tabs.
		HMPDialogCB:Hide()
		HMPDialogText:Hide()
		HMPEmotesCB:Hide()
		HMPEmotesText:Hide()
		HMPGarrTblCB:Hide()
		HMPGarrisonTblText:Hide()
		HMPMerchantsCB:Hide()
		HMPMerchantsText:Hide()
		HMPTrainersV2CB:Hide()
		HMPTrainersV2Text:Hide()
		HMPSpeechCB:Hide()
		HMPSpeechText:Hide()
		HMPQuestsCB:Hide()
		HMPQuestsText:Hide()
		HMPToFCB:Hide()
		HMPToFText:Hide()
		HMPCinematicsCB:Hide()
		HMPCinematicsText:Hide()
		HMPQueuesCB:Hide()
		HMPQueuesText:Hide()
		HMPVehiclesCB:Hide()
		HMPVehiclesText:Hide()
		HMPWarModeCB:Hide()
		HMPWarModeText:Hide()
		HMPNotesCB:Hide()
		HMPNotesText:Hide()
		HMPTalentsCB:Hide()
		HMPTalentsText:Hide()
		HMPWaypointsCB:Hide()
		HMPWaypointsText:Hide()
		HMPWeightsCB:Hide()
		HMPWeightsText:Hide()
		HMPPartyPlayCB:Hide()
		HMPPartyPlayText:Hide()
		HMPPartyPlayAnnounceCB:Hide()
		HMPPartyPlayAutoShareCB:Hide()
		HMPChromieTimeDropDown:Hide()
		HMPCovenantsDropDown:Hide()
		HMPTorghastPowersDropDown:Hide()
		HMPBFAZoneSelDropDown:Hide()
		HMPSLZoneSelDropDown:Hide()
		HMPEnableJunkerText:Hide()
		HMPEnableJunkerCB:Hide()
		HMPItemTypeArmorText:Hide()
		HMPJunkerItemTypeArmorCB:Hide()
		HMPItemTypeConsumableText:Hide()
		HMPJunkerItemTypeConsumableCB:Hide()
		HMPItemTypeRecipeText:Hide()
		HMPJunkerItemTypeRecipeCB:Hide()
		HMPJunkerItemTypeGemText:Hide()
		HMPJunkerItemTypeGemCB:Hide()
		HMPJunkerItemTypeTradeskillText:Hide()
		HMPJunkerItemTypeTradeskillCB:Hide()
		HMPJunkerItemTypeWeaponText:Hide()
		HMPJunkerItemTypeWeaponCB:Hide()
		HMPJunkerSafeModeText:Hide()
		HMPJunkerSafeModeCB:Hide()
		HMPJunkerRarityDropDown:Hide()
		HMPJunkerImportButton:Hide()
	else
		-- Show the widgets hidden from the other tabs.
		HMPEnableJunkerText:Show()
		HMPEnableJunkerCB:Show()
		HMPItemTypeArmorText:Show()
		HMPJunkerItemTypeArmorCB:Show()
		HMPItemTypeConsumableText:Show()
		HMPJunkerItemTypeConsumableCB:Show()
		HMPItemTypeRecipeText:Show()
		HMPJunkerItemTypeRecipeCB:Show()
		HMPJunkerItemTypeGemText:Show()
		HMPJunkerItemTypeGemCB:Show()
		HMPJunkerItemTypeTradeskillText:Show()
		HMPJunkerItemTypeTradeskillCB:Show()
		HMPJunkerItemTypeWeaponText:Show()
		HMPJunkerItemTypeWeaponCB:Show()
		HMPJunkerSafeModeText:Show()
		HMPJunkerSafeModeCB:Show()
		HMPJunkerRarityDropDown:Show()
		HMPJunkerImportButton:Show()
		
		-- Hide the widgets from the other tabs.
		HMPDialogCB:Hide()
		HMPDialogText:Hide()
		HMPEmotesCB:Hide()
		HMPEmotesText:Hide()
		HMPGarrTblCB:Hide()
		HMPGarrisonTblText:Hide()
		HMPMerchantsCB:Hide()
		HMPMerchantsText:Hide()
		HMPTrainersV2CB:Hide()
		HMPTrainersV2Text:Hide()
		HMPSpeechCB:Hide()
		HMPSpeechText:Hide()
		HMPQuestsCB:Hide()
		HMPQuestsText:Hide()
		HMPToFCB:Hide()
		HMPToFText:Hide()
		HMPCinematicsCB:Hide()
		HMPCinematicsText:Hide()
		HMPQueuesCB:Hide()
		HMPQueuesText:Hide()
		HMPVehiclesCB:Hide()
		HMPVehiclesText:Hide()
		HMPWarModeCB:Hide()
		HMPWarModeText:Hide()
		HMPNotesCB:Hide()
		HMPNotesText:Hide()
		HMPTalentsCB:Hide()
		HMPTalentsText:Hide()
		HMPWaypointsCB:Hide()
		HMPWaypointsText:Hide()
		HMPWeightsCB:Hide()
		HMPWeightsText:Hide()
		HMPPartyPlayCB:Hide()
		HMPPartyPlayText:Hide()
		HMPPartyPlayAnnounceCB:Hide()
		HMPPartyPlayAutoShareCB:Hide()
		HMPChromieTimeDropDown:Hide()
		HMPCovenantsDropDown:Hide()
		HMPTorghastPowersDropDown:Hide()
		HMPBFAZoneSelDropDown:Hide()
		HMPSLZoneSelDropDown:Hide()
		HMPMinimapIconCB:Hide()
		HMPMinimapIconText:Hide()
		HMPLoggingCB:Hide()
		HMPLoggingText:Hide()
	end
end

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
		[0] = L_GLOBALSTRINGS["Battle for Azeroth"],
		[5] = L_GLOBALSTRINGS["Cataclysm"],
		[6] = L_GLOBALSTRINGS["Burning Crusade"],
		[7] = L_GLOBALSTRINGS["Lich King"],
		[8] = L_GLOBALSTRINGS["Mists of Pandaria"],
		[9] = L_GLOBALSTRINGS["Draenor"],
		[10] = L_GLOBALSTRINGS["Legion"],
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
		info.text = L_GLOBALSTRINGS["Burning Crusade"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 6
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Burning Crusade"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Burning Crusade"]
		info.tooltipText = L_GLOBALSTRINGS["Burning Crusade"]
		UIDropDownMenu_AddButton(info)
		
		-- Wrath of the Lich King
		info.text = L_GLOBALSTRINGS["Lich King"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 7
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Lich King"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Lich King"]
		info.tooltipText = L_GLOBALSTRINGS["Lich King"]
		UIDropDownMenu_AddButton(info)
		
		-- Cataclysm
		info.text = L_GLOBALSTRINGS["Cataclysm"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 5
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Cataclysm"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Cataclysm"]
		info.tooltipText = L_GLOBALSTRINGS["Cataclysm"]
		UIDropDownMenu_AddButton(info)
		
		-- Mists of Pandaria
		info.text = L_GLOBALSTRINGS["Mists of Pandaria"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 8
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Mists of Pandaria"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Mists of Pandaria"]
		info.tooltipText = L_GLOBALSTRINGS["Mists of Pandaria"]
		UIDropDownMenu_AddButton(info)
		
		-- Warlords of Draenor
		info.text = L_GLOBALSTRINGS["Draenor"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 9
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Draenor"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Draenor"]
		info.tooltipText = L_GLOBALSTRINGS["Draenor"]
		UIDropDownMenu_AddButton(info)
		
		-- Legion
		info.text = L_GLOBALSTRINGS["Legion"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 10
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Legion"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Legion"]
		info.tooltipText = L_GLOBALSTRINGS["Legion"]
		UIDropDownMenu_AddButton(info)
		
		-- Battle for Azeroth
		info.text = L_GLOBALSTRINGS["Battle for Azeroth"]
		info.func = function(self)
			HelpMePlayOptionsDB.ChromieTimeExpansion = 0
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Battle for Azeroth"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Battle for Azeroth"]
		info.tooltipText = L_GLOBALSTRINGS["Battle for Azeroth"]
		UIDropDownMenu_AddButton(info)
	elseif menuName:GetName() == "HMPTorghastPowersDropDown" then
		-- Automatic
		-- Automatically selects the power for the player.
		info.text = L_GLOBALSTRINGS["Automatic"]
		info.func = function(self)
			HelpMePlayOptionsDB.TorghastPowers = L_GLOBALSTRINGS["Automatic"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Automatic"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Automatic"]
		info.tooltipText = L_GLOBALSTRINGS["Automatic"]
		UIDropDownMenu_AddButton(info)
		
		-- Automatic (No Epic)
		-- Automatically selects the power for the player.
		-- Ignores epic powers.
		info.text = L_GLOBALSTRINGS["Automatic (No Epic)"]
		info.func = function(self)
			HelpMePlayOptionsDB.TorghastPowers = L_GLOBALSTRINGS["Automatic (No Epic)"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Automatic (No Epic)"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Automatic (No Epic)"]
		info.tooltipText = L_GLOBALSTRINGS["Automatic (No Epic)"]
		UIDropDownMenu_AddButton(info)
		
		-- Notifications
		-- Notifies the player of the recommended power.
		info.text = L_GLOBALSTRINGS["Notifications"]
		info.func = function(self)
			HelpMePlayOptionsDB.TorghastPowers = L_GLOBALSTRINGS["Notifications"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Notifications"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Notifications"]
		info.tooltipText = L_GLOBALSTRINGS["Notifications"]
		UIDropDownMenu_AddButton(info)
		
		-- Disabled
		info.text = L_GLOBALSTRINGS["Disabled"]
		info.func = function(self)
			HelpMePlayOptionsDB.TorghastPowers = L_GLOBALSTRINGS["Disabled"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Disabled"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Disabled"]
		info.tooltipText = L_GLOBALSTRINGS["Disabled"]
		UIDropDownMenu_AddButton(info)
	elseif menuName:GetName() == "HMPCovenantsDropDown" then
		-- Kyrian
		info.text = addonTable.COVENANT_ICONS["Kyrian"] .. " " .. L_GLOBALSTRINGS["Kyrian"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L_GLOBALSTRINGS["Kyrian"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = addonTable.COVENANT_ICONS["Kyrian"] .. " " .. L_GLOBALSTRINGS["Kyrian"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = addonTable.COVENANT_ICONS["Kyrian"] .. " " .. L_GLOBALSTRINGS["Kyrian"]
		info.tooltipText = addonTable.COVENANT_ICONS["Kyrian"] .. " " .. L_GLOBALSTRINGS["Kyrian"]
		UIDropDownMenu_AddButton(info)
		
		-- Necrolord
		info.text = addonTable.COVENANT_ICONS["Necrolord"] .. " " .. L_GLOBALSTRINGS["Necrolord"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L_GLOBALSTRINGS["Necrolord"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = addonTable.COVENANT_ICONS["Necrolord"] .. " " .. L_GLOBALSTRINGS["Necrolord"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = addonTable.COVENANT_ICONS["Necrolord"] .. " " .. L_GLOBALSTRINGS["Necrolord"]
		info.tooltipText = addonTable.COVENANT_ICONS["Necrolord"] .. " " .. L_GLOBALSTRINGS["Necrolord"]
		UIDropDownMenu_AddButton(info)
		
		-- Night Fae
		info.text = addonTable.COVENANT_ICONS["Night Fae"] .. " " .. L_GLOBALSTRINGS["Night Fae"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L_GLOBALSTRINGS["Night Fae"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = addonTable.COVENANT_ICONS["Night Fae"] .. " " .. L_GLOBALSTRINGS["Night Fae"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = addonTable.COVENANT_ICONS["Night Fae"] .. " " .. L_GLOBALSTRINGS["Night Fae"]
		info.tooltipText = addonTable.COVENANT_ICONS["Night Fae"] .. " " .. L_GLOBALSTRINGS["Night Fae"]
		UIDropDownMenu_AddButton(info)
		
		-- Venthyr
		info.text = addonTable.COVENANT_ICONS["Venthyr"] .. " " .. L_GLOBALSTRINGS["Venthyr"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L_GLOBALSTRINGS["Venthyr"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = addonTable.COVENANT_ICONS["Venthyr"] .. " " .. L_GLOBALSTRINGS["Venthyr"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = addonTable.COVENANT_ICONS["Venthyr"] .. " " .. L_GLOBALSTRINGS["Venthyr"]
		info.tooltipText = addonTable.COVENANT_ICONS["Venthyr"] .. " " .. L_GLOBALSTRINGS["Venthyr"]
		UIDropDownMenu_AddButton(info)
		
		-- Disabled
		info.text = L_GLOBALSTRINGS["Disabled"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L_GLOBALSTRINGS["Disabled"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Disabled"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Disabled"]
		info.tooltipText = L_GLOBALSTRINGS["Disabled"]
		UIDropDownMenu_AddButton(info)
	elseif menuName:GetName() == "HMPBFAZoneSelDropDown" then
		local faction = UnitFactionGroup("player")
		if faction == "Alliance" then
			-- Drustvar
			info.text = addonTable.ZONE_ICONS["Drustvar"] .. " " .. L_GLOBALSTRINGS["Drustvar"]
			info.func = function(self)
				HelpMePlayOptionsDB.BFAZoneSelection = L_GLOBALSTRINGS["Drustvar"]
				UIDropDownMenu_SetSelectedValue(menuName, self.value)
			end
			info.value = addonTable.ZONE_ICONS["Drustvar"] .. " " .. L_GLOBALSTRINGS["Drustvar"]
			if info.value == selectedValue then
				info.checked = true
			else
				info.checked = false
			end
			info.tooltipTitle = addonTable.ZONE_ICONS["Drustvar"] .. " " .. L_GLOBALSTRINGS["Drustvar"]
			info.tooltipText = addonTable.ZONE_ICONS["Drustvar"] .. " " .. L_GLOBALSTRINGS["Drustvar"]
			UIDropDownMenu_AddButton(info)
			
			-- Stormsong Valley
			info.text = addonTable.ZONE_ICONS["Stormsong Valley"] .. " " .. L_GLOBALSTRINGS["Stormsong Valley"]
			info.func = function(self)
				HelpMePlayOptionsDB.BFAZoneSelection = L_GLOBALSTRINGS["Stormsong Valley"]
				UIDropDownMenu_SetSelectedValue(menuName, self.value)
			end
			info.value = addonTable.ZONE_ICONS["Stormsong Valley"] .. " " .. L_GLOBALSTRINGS["Stormsong Valley"]
			if info.value == selectedValue then
				info.checked = true
			else
				info.checked = false
			end
			info.tooltipTitle = addonTable.ZONE_ICONS["Stormsong Valley"] .. " " .. L_GLOBALSTRINGS["Stormsong Valley"]
			info.tooltipText = addonTable.ZONE_ICONS["Stormsong Valley"] .. " " .. L_GLOBALSTRINGS["Stormsong Valley"]
			UIDropDownMenu_AddButton(info)
			
			-- Tiragarde Sound
			info.text = addonTable.ZONE_ICONS["Tiragarde Sound"] .. " " .. L_GLOBALSTRINGS["Tiragarde Sound"]
			info.func = function(self)
				HelpMePlayOptionsDB.BFAZoneSelection = L_GLOBALSTRINGS["Tiragarde Sound"]
				UIDropDownMenu_SetSelectedValue(menuName, self.value)
			end
			info.value = addonTable.ZONE_ICONS["Tiragarde Sound"] .. " " .. L_GLOBALSTRINGS["Tiragarde Sound"]
			if info.value == selectedValue then
				info.checked = true
			else
				info.checked = false
			end
			info.tooltipTitle = addonTable.ZONE_ICONS["Tiragarde Sound"] .. " " .. L_GLOBALSTRINGS["Tiragarde Sound"]
			info.tooltipText = addonTable.ZONE_ICONS["Tiragarde Sound"] .. " " .. L_GLOBALSTRINGS["Tiragarde Sound"]
			UIDropDownMenu_AddButton(info)
		else
			-- Nazmir
			info.text = addonTable.ZONE_ICONS["Nazmir"] .. " " .. L_GLOBALSTRINGS["Nazmir"]
			info.func = function(self)
				HelpMePlayOptionsDB.BFAZoneSelection = L_GLOBALSTRINGS["Nazmir"]
				UIDropDownMenu_SetSelectedValue(menuName, self.value)
			end
			info.value = addonTable.ZONE_ICONS["Nazmir"] .. " " .. L_GLOBALSTRINGS["Nazmir"]
			if info.value == selectedValue then
				info.checked = true
			else
				info.checked = false
			end
			info.tooltipTitle = addonTable.ZONE_ICONS["Nazmir"] .. " " .. L_GLOBALSTRINGS["Nazmir"]
			info.tooltipText = addonTable.ZONE_ICONS["Nazmir"] .. " " .. L_GLOBALSTRINGS["Nazmir"]
			UIDropDownMenu_AddButton(info)
			
			-- Vol'dun
			info.text = addonTable.ZONE_ICONS["Vol'dun"] .. " " .. L_GLOBALSTRINGS["Vol'dun"]
			info.func = function(self)
				HelpMePlayOptionsDB.BFAZoneSelection = L_GLOBALSTRINGS["Vol'dun"]
				UIDropDownMenu_SetSelectedValue(menuName, self.value)
			end
			info.value = addonTable.ZONE_ICONS["Vol'dun"] .. " " .. L_GLOBALSTRINGS["Vol'dun"]
			if info.value == selectedValue then
				info.checked = true
			else
				info.checked = false
			end
			info.tooltipTitle = addonTable.ZONE_ICONS["Vol'dun"] .. " " .. L_GLOBALSTRINGS["Vol'dun"]
			info.tooltipText = addonTable.ZONE_ICONS["Vol'dun"] .. " " .. L_GLOBALSTRINGS["Vol'dun"]
			UIDropDownMenu_AddButton(info)
			
			-- Zuldazar
			info.text = addonTable.ZONE_ICONS["Zuldazar"] .. " " .. L_GLOBALSTRINGS["Zuldazar"]
			info.func = function(self)
				HelpMePlayOptionsDB.BFAZoneSelection = L_GLOBALSTRINGS["Zuldazar"]
				UIDropDownMenu_SetSelectedValue(menuName, self.value)
			end
			info.value = addonTable.ZONE_ICONS["Zuldazar"] .. " " .. L_GLOBALSTRINGS["Zuldazar"]
			if info.value == selectedValue then
				info.checked = true
			else
				info.checked = false
			end
			info.tooltipTitle = addonTable.ZONE_ICONS["Zuldazar"] .. " " .. L_GLOBALSTRINGS["Zuldazar"]
			info.tooltipText = addonTable.ZONE_ICONS["Zuldazar"] .. " " .. L_GLOBALSTRINGS["Zuldazar"]
			UIDropDownMenu_AddButton(info)
		end
		
		-- Random
		info.text = L_GLOBALSTRINGS["Random"]
		info.func = function(self)
			HelpMePlayOptionsDB.BFAZoneSelection = L_GLOBALSTRINGS["Random"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Random"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Random"]
		info.tooltipText = L_GLOBALSTRINGS["Random"]
		UIDropDownMenu_AddButton(info)
		
		-- Disabled
		info.text = L_GLOBALSTRINGS["Disabled"]
		info.func = function(self)
			HelpMePlayOptionsDB.BFAZoneSelection = L_GLOBALSTRINGS["Disabled"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Disabled"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Disabled"]
		info.tooltipText = L_GLOBALSTRINGS["Disabled"]
		UIDropDownMenu_AddButton(info)
	elseif menuName:GetName() == "HMPSLZoneSelDropDown" then
		-- Ardenweald
		info.text = addonTable.ZONE_ICONS["Ardenweald"] .. " " .. L_GLOBALSTRINGS["Ardenweald"]
		info.func = function(self)
			HelpMePlayOptionsDB.SLZoneSelection = L_GLOBALSTRINGS["Ardenweald"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = addonTable.ZONE_ICONS["Ardenweald"] .. " " .. L_GLOBALSTRINGS["Ardenweald"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = addonTable.ZONE_ICONS["Ardenweald"] .. " " .. L_GLOBALSTRINGS["Ardenweald"]
		info.tooltipText = addonTable.ZONE_ICONS["Ardenweald"] .. " " .. L_GLOBALSTRINGS["Ardenweald"]
		UIDropDownMenu_AddButton(info)
		
		-- Bastion
		info.text = addonTable.ZONE_ICONS["Bastion"] .. " " .. L_GLOBALSTRINGS["Bastion"]
		info.func = function(self)
			HelpMePlayOptionsDB.SLZoneSelection = L_GLOBALSTRINGS["Bastion"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = addonTable.ZONE_ICONS["Bastion"] .. " " .. L_GLOBALSTRINGS["Bastion"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = addonTable.ZONE_ICONS["Bastion"] .. " " .. L_GLOBALSTRINGS["Bastion"]
		info.tooltipText = addonTable.ZONE_ICONS["Bastion"] .. " " .. L_GLOBALSTRINGS["Bastion"]
		UIDropDownMenu_AddButton(info)
		
		-- Maldraxxus
		info.text = addonTable.ZONE_ICONS["Maldraxxus"] .. " " .. L_GLOBALSTRINGS["Maldraxxus"]
		info.func = function(self)
			HelpMePlayOptionsDB.SLZoneSelection = L_GLOBALSTRINGS["Maldraxxus"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = addonTable.ZONE_ICONS["Maldraxxus"] .. " " .. L_GLOBALSTRINGS["Maldraxxus"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = addonTable.ZONE_ICONS["Maldraxxus"] .. " " .. L_GLOBALSTRINGS["Maldraxxus"]
		info.tooltipText = addonTable.ZONE_ICONS["Maldraxxus"] .. " " .. L_GLOBALSTRINGS["Maldraxxus"]
		UIDropDownMenu_AddButton(info)
		
		-- Revendreth
		info.text = addonTable.ZONE_ICONS["Revendreth"] .. " " .. L_GLOBALSTRINGS["Revendreth"]
		info.func = function(self)
			HelpMePlayOptionsDB.SLZoneSelection = L_GLOBALSTRINGS["Revendreth"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = addonTable.ZONE_ICONS["Revendreth"] .. " " .. L_GLOBALSTRINGS["Revendreth"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = addonTable.ZONE_ICONS["Revendreth"] .. " " .. L_GLOBALSTRINGS["Revendreth"]
		info.tooltipText = addonTable.ZONE_ICONS["Revendreth"] .. " " .. L_GLOBALSTRINGS["Revendreth"]
		UIDropDownMenu_AddButton(info)
		
		-- Torghast
		info.text = addonTable.ZONE_ICONS["Torghast"] .. " " .. L_GLOBALSTRINGS["Torghast"]
		info.func = function(self)
			HelpMePlayOptionsDB.SLZoneSelection = L_GLOBALSTRINGS["Torghast"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = addonTable.ZONE_ICONS["Torghast"] .. " " .. L_GLOBALSTRINGS["Torghast"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = addonTable.ZONE_ICONS["Torghast"] .. " " .. L_GLOBALSTRINGS["Torghast"]
		info.tooltipText = addonTable.ZONE_ICONS["Torghast"] .. " " .. L_GLOBALSTRINGS["Torghast"]
		UIDropDownMenu_AddButton(info)
		
		-- Random
		info.text = L_GLOBALSTRINGS["Random"]
		info.func = function(self)
			HelpMePlayOptionsDB.SLZoneSelection = L_GLOBALSTRINGS["Random"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Random"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Random"]
		info.tooltipText = L_GLOBALSTRINGS["Random"]
		UIDropDownMenu_AddButton(info)
		
		-- Disabled
		info.text = L_GLOBALSTRINGS["Disabled"]
		info.func = function(self)
			HelpMePlayOptionsDB.SLZoneSelection = L_GLOBALSTRINGS["Disabled"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Disabled"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Disabled"]
		info.tooltipText = L_GLOBALSTRINGS["Disabled"]
		UIDropDownMenu_AddButton(info)
	elseif menuName:GetName() == "HMPJunkerRarityDropDown" then
		-- Epic
		info.text = L_GLOBALSTRINGS["Rarity: Epic"]
		info.func = function(self)
			HelpMePlayOptionsDB.Junker.Rarity = 4
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Rarity: Epic"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Rarity: Epic"]
		info.tooltipText = L_GLOBALSTRINGS["Rarity: Epic"]
		UIDropDownMenu_AddButton(info)
	
		-- Rare
		info.text = L_GLOBALSTRINGS["Rarity: Rare"]
		info.func = function(self)
			HelpMePlayOptionsDB.Junker.Rarity = 3
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Rarity: Rare"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Rarity: Rare"]
		info.tooltipText = L_GLOBALSTRINGS["Rarity: Rare"]
		UIDropDownMenu_AddButton(info)
	
		-- Uncommon
		info.text = L_GLOBALSTRINGS["Rarity: Uncommon"]
		info.func = function(self)
			HelpMePlayOptionsDB.Junker.Rarity = 2
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Rarity: Uncommon"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Rarity: Uncommon"]
		info.tooltipText = L_GLOBALSTRINGS["Rarity: Uncommon"]
		UIDropDownMenu_AddButton(info)
	
		-- Common
		info.text = L_GLOBALSTRINGS["Rarity: Common"]
		info.func = function(self)
			HelpMePlayOptionsDB.Junker.Rarity = 1
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Rarity: Common"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Rarity: Common"]
		info.tooltipText = L_GLOBALSTRINGS["Rarity: Common"]
		UIDropDownMenu_AddButton(info)
		
		-- Poor
		info.text = L_GLOBALSTRINGS["Rarity: Poor"]
		info.func = function(self)
			HelpMePlayOptionsDB.Junker.Rarity = 0
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Rarity: Poor"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Rarity: Poor"]
		info.tooltipText = L_GLOBALSTRINGS["Rarity: Poor"]
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
					tooltip:SetText(L_GLOBALSTRINGS["Colored Addon Name"] .. " |cffFFFFFFv" .. GetAddOnMetadata(addonName, "Version") .. "|r")
					tooltip:AddLine(L_GLOBALSTRINGS["Minimap Icon Subtext"])
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
		PlaySound(SOUNDKIT.IG_SPELLBOOK_CLOSE)
	else
		if UnitAffectingCombat("player") == false then
			HMPOptionsFrame:Show()
			
			PlaySound(SOUNDKIT.IG_SPELLBOOK_OPEN)
			
			-- Tell Blizzard how many tabs they can expect
			-- to receive from the addon.
			--
			-- Also tell them which tab is the default (1).
			HMPOptionsFrame.numTabs = numTabs
			HMPTab_OnClick(1)

			-- Make the options menu movable.
			HMPOptionsFrame:SetMovable(true)
			HMPOptionsFrame:EnableMouse(true)
			HMPOptionsFrame:RegisterForDrag("LeftButton")
			HMPOptionsFrame:SetScript("OnDragStart", HMPOptionsFrame.StartMoving)
			HMPOptionsFrame:SetScript("OnDragStop", HMPOptionsFrame.StopMovingOrSizing)

			-- SetText for FontStrings
			HMPCRText:SetText(L_GLOBALSTRINGS["Copyright Text"])
			HMPDisableAllText:SetText(L_GLOBALSTRINGS["Disable All"])
			HMPVersionText:SetText(GetAddOnMetadata(addonName, "Version"))
			HMPDialogText:SetText(L_GLOBALSTRINGS["Dialog"])
			HMPEmotesText:SetText(L_GLOBALSTRINGS["Emotes"])
			HMPGarrisonTblText:SetText(L_GLOBALSTRINGS["Garrison Tables"])
			HMPMerchantsText:SetText(L_GLOBALSTRINGS["Merchants"])
			HMPTrainersV2Text:SetText(L_GLOBALSTRINGS["Trainers"])
			HMPSpeechText:SetText(L_GLOBALSTRINGS["Speech"])
			HMPWarModeText:SetText(L_GLOBALSTRINGS["War Mode"])
			HMPQuestsText:SetText(L_GLOBALSTRINGS["Quests"])
			HMPToFText:SetText(L_GLOBALSTRINGS["Threads of Fate"])
			HMPNotesText:SetText(L_GLOBALSTRINGS["Notes"])
			HMPTalentsText:SetText(L_GLOBALSTRINGS["Talents"])
			HMPCinematicsText:SetText(L_GLOBALSTRINGS["Cinematics"])
			HMPQueuesText:SetText(L_GLOBALSTRINGS["Queues"])
			HMPVehiclesText:SetText(L_GLOBALSTRINGS["Vehicles"])
			HMPWaypointsText:SetText(L_GLOBALSTRINGS["Waypoints"])
			HMPWeightsText:SetText(L_GLOBALSTRINGS["Weights"])
			HMPPartyPlayText:SetText(L_GLOBALSTRINGS["Party Play"])
			HMPMinimapIconText:SetText(L_GLOBALSTRINGS["Minimap Icon"])
			HMPLoggingText:SetText(L_GLOBALSTRINGS["Logging"])
			HMPEnableJunkerText:SetText(L_GLOBALSTRINGS["Enable"])
			HMPItemTypeArmorText:SetText(L_GLOBALSTRINGS["Armor"])
			HMPItemTypeConsumableText:SetText(L_GLOBALSTRINGS["Consumable"])
			HMPItemTypeRecipeText:SetText(L_GLOBALSTRINGS["Recipe"])
			HMPJunkerItemTypeGemText:SetText(L_GLOBALSTRINGS["Gem"])
			HMPJunkerItemTypeTradeskillText:SetText(L_GLOBALSTRINGS["Tradeskill"])
			HMPJunkerItemTypeWeaponText:SetText(L_GLOBALSTRINGS["Weapon"])
			HMPJunkerSafeModeText:SetText(L_GLOBALSTRINGS["Safe Mode"])
			HMPJunkerImportButton:SetText(L_GLOBALSTRINGS["Import"])
			HMPOptionsFrameTab1:SetText(L_GLOBALSTRINGS["Tab: Automations"])
			HMPOptionsFrameTab2:SetText(L_GLOBALSTRINGS["Tab: Systems"])
			HMPOptionsFrameTab3:SetText(L_GLOBALSTRINGS["Tab: General"])
			HMPOptionsFrameTab4:SetText(L_GLOBALSTRINGS["Tab: Junker"])

			-- Check settings first
			HMPDisableAllCB:SetChecked(HelpMePlayOptionsDB.DisableAll)
			HMPDialogCB:SetChecked(HelpMePlayOptionsDB.Dialog)
			HMPEmotesCB:SetChecked(HelpMePlayOptionsDB.Emotes)
			HMPGarrTblCB:SetChecked(HelpMePlayOptionsDB.GarrisonTables)
			HMPMerchantsCB:SetChecked(HelpMePlayOptionsDB.Merchants)
			HMPTrainersV2CB:SetChecked(HelpMePlayOptionsDB.Trainers)
			HMPSpeechCB:SetChecked(HelpMePlayOptionsDB.Speech)
			HMPWarModeCB:SetChecked(HelpMePlayOptionsDB.WarMode)
			HMPQuestsCB:SetChecked(HelpMePlayOptionsDB.Quests)
			HMPToFCB:SetChecked(HelpMePlayOptionsDB.ThreadsOfFate)
			HMPNotesCB:SetChecked(HelpMePlayOptionsDB.Notes)
			HMPTalentsCB:SetChecked(HelpMePlayOptionsDB.Talents)
			HMPCinematicsCB:SetChecked(HelpMePlayOptionsDB.Cinematics)
			HMPQueuesCB:SetChecked(HelpMePlayOptionsDB.Queues)
			HMPVehiclesCB:SetChecked(HelpMePlayOptionsDB.Vehicles)
			HMPWaypointsCB:SetChecked(HelpMePlayOptionsDB.Waypoints)
			HMPWeightsCB:SetChecked(HelpMePlayOptionsDB.Weights)
			HMPPartyPlayCB:SetChecked(HelpMePlayOptionsDB.PartyPlay)
			HMPPartyPlayAnnounceCB:SetChecked(HelpMePlayOptionsDB.PartyPlayAnnounce)
			HMPPartyPlayAutoShareCB:SetChecked(HelpMePlayOptionsDB.PartyPlayAutoShare)
			HMPMinimapIconCB:SetChecked(HelpMePlayOptionsDB.MinimapIcon)
			HMPLoggingCB:SetChecked(HelpMePlayOptionsDB.Logging)
			HMPEnableJunkerCB:SetChecked(HelpMePlayOptionsDB.Junker.Enabled)
			HMPJunkerItemTypeArmorCB:SetChecked(HelpMePlayOptionsDB.Junker.Armor)
			HMPJunkerItemTypeConsumableCB:SetChecked(HelpMePlayOptionsDB.Junker.Consumable)
			HMPJunkerItemTypeRecipeCB:SetChecked(HelpMePlayOptionsDB.Junker.Recipe)
			HMPJunkerItemTypeGemCB:SetChecked(HelpMePlayOptionsDB.Junker.Gem)
			HMPJunkerItemTypeTradeskillCB:SetChecked(HelpMePlayOptionsDB.Junker.Tradeskill)
			HMPJunkerItemTypeWeaponCB:SetChecked(HelpMePlayOptionsDB.Junker.Weapon)
			HMPJunkerSafeModeCB:SetChecked(HelpMePlayOptionsDB.Junker.isSafeModeEnabled)
			
			if HelpMePlayOptionsDB.ChromieTimeExpansion then
				UIDropDownMenu_SetText(HMPChromieTimeDropDown, GetChromieTimeExpansionName(HelpMePlayOptionsDB.ChromieTimeExpansion))
			end
			
			if HelpMePlayOptionsDB.TorghastPowers then
				if HelpMePlayOptionsDB.TorghastPowers == L_GLOBALSTRINGS["Automatic"] or HelpMePlayOptionsDB.TorghastPowers == true then
					UIDropDownMenu_SetText(HMPTorghastPowersDropDown, L_GLOBALSTRINGS["Automatic"])
				elseif HelpMePlayOptionsDB.TorghastPowers == L_GLOBALSTRINGS["Automatic (No Epic)"] then
					UIDropDownMenu_SetText(HMPTorghastPowersDropDown, L_GLOBALSTRINGS["Automatic (No Epic)"])
				elseif HelpMePlayOptionsDB.TorghastPowers == L_GLOBALSTRINGS["Notifications"] then
					UIDropDownMenu_SetText(HMPTorghastPowersDropDown, L_GLOBALSTRINGS["Notifications"])
				elseif HelpMePlayOptionsDB.TorghastPowers == L_GLOBALSTRINGS["Disabled"] or HelpMePlayOptionsDB.TorghastPowers == false or HelpMePlayOptionsDB.TorghastPowers == nil then
					UIDropDownMenu_SetText(HMPTorghastPowersDropDown, L_GLOBALSTRINGS["Disabled"])
				end
			end
			
			if HelpMePlayOptionsDB.Covenant then
				if HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Kyrian"] then
					UIDropDownMenu_SetText(HMPCovenantsDropDown, addonTable.COVENANT_ICONS["Kyrian"] .. " " .. L_GLOBALSTRINGS["Kyrian"])
				elseif HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Necrolord"] then
					UIDropDownMenu_SetText(HMPCovenantsDropDown, addonTable.COVENANT_ICONS["Necrolord"] .. " " .. L_GLOBALSTRINGS["Necrolord"])
				elseif HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Night Fae"] then
					UIDropDownMenu_SetText(HMPCovenantsDropDown, addonTable.COVENANT_ICONS["Night Fae"] .. " " .. L_GLOBALSTRINGS["Night Fae"])
				elseif HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Venthyr"] then
					UIDropDownMenu_SetText(HMPCovenantsDropDown, addonTable.COVENANT_ICONS["Venthyr"] .. " " .. L_GLOBALSTRINGS["Venthyr"])
				else
					UIDropDownMenu_SetText(HMPCovenantsDropDown, L_GLOBALSTRINGS["Disabled"])
				end
			end
			
			if HelpMePlayOptionsDB.BFAZoneSelection then
				if HelpMePlayOptionsDB.BFAZoneSelection == L_GLOBALSTRINGS["Drustvar"] then
					UIDropDownMenu_SetText(HMPBFAZoneSelDropDown, addonTable.ZONE_ICONS["Drustvar"] .. " " .. L_GLOBALSTRINGS["Drustvar"])
				elseif HelpMePlayOptionsDB.BFAZoneSelection == L_GLOBALSTRINGS["Nazmir"] then
					UIDropDownMenu_SetText(HMPBFAZoneSelDropDown, addonTable.ZONE_ICONS["Nazmir"] .. " " .. L_GLOBALSTRINGS["Nazmir"])
				elseif HelpMePlayOptionsDB.BFAZoneSelection == L_GLOBALSTRINGS["Stormsong Valley"] then
					UIDropDownMenu_SetText(HMPBFAZoneSelDropDown, addonTable.ZONE_ICONS["Stormsong Valley"] .. " " .. L_GLOBALSTRINGS["Stormsong Valley"])
				elseif HelpMePlayOptionsDB.BFAZoneSelection == L_GLOBALSTRINGS["Tiragarde Sound"] then
					UIDropDownMenu_SetText(HMPBFAZoneSelDropDown, addonTable.ZONE_ICONS["Tiragarde Sound"] .. " " .. L_GLOBALSTRINGS["Tiragarde Sound"])
				elseif HelpMePlayOptionsDB.BFAZoneSelection == L_GLOBALSTRINGS["Vol'dun"] then
					UIDropDownMenu_SetText(HMPBFAZoneSelDropDown, addonTable.ZONE_ICONS["Vol'dun"] .. " " .. L_GLOBALSTRINGS["Vol'dun"])
				elseif HelpMePlayOptionsDB.BFAZoneSelection == L_GLOBALSTRINGS["Zuldazar"] then
					UIDropDownMenu_SetText(HMPBFAZoneSelDropDown, addonTable.ZONE_ICONS["Zuldazar"] .. " " .. L_GLOBALSTRINGS["Zuldazar"])
				elseif HelpMePlayOptionsDB.BFAZoneSelection == L_GLOBALSTRINGS["Random"] then
					UIDropDownMenu_SetText(HMPBFAZoneSelDropDown, L_GLOBALSTRINGS["Random"])
				elseif HelpMePlayOptionsDB.BFAZoneSelection == L_GLOBALSTRINGS["Disabled"] or HelpMePlayOptionsDB.BFAZoneSelection == false or HelpMePlayOptionsDB.BFAZoneSelection == nil then
					UIDropDownMenu_SetText(HMPBFAZoneSelDropDown, L_GLOBALSTRINGS["Disabled"])
				end
			end
			
			if HelpMePlayOptionsDB.SLZoneSelection then
				if HelpMePlayOptionsDB.SLZoneSelection == L_GLOBALSTRINGS["Ardenweald"] then
					UIDropDownMenu_SetText(HMPSLZoneSelDropDown, addonTable.ZONE_ICONS["Ardenweald"] .. " " .. L_GLOBALSTRINGS["Ardenweald"])
				elseif HelpMePlayOptionsDB.SLZoneSelection == L_GLOBALSTRINGS["Bastion"] then
					UIDropDownMenu_SetText(HMPSLZoneSelDropDown, addonTable.ZONE_ICONS["Bastion"] .. " " .. L_GLOBALSTRINGS["Bastion"])
				elseif HelpMePlayOptionsDB.SLZoneSelection == L_GLOBALSTRINGS["Maldraxxus"] then
					UIDropDownMenu_SetText(HMPSLZoneSelDropDown, addonTable.ZONE_ICONS["Maldraxxus"] .. " " .. L_GLOBALSTRINGS["Maldraxxus"])
				elseif HelpMePlayOptionsDB.SLZoneSelection == L_GLOBALSTRINGS["Revendreth"] then
					UIDropDownMenu_SetText(HMPSLZoneSelDropDown, addonTable.ZONE_ICONS["Revendreth"] .. " " .. L_GLOBALSTRINGS["Revendreth"])
				elseif HelpMePlayOptionsDB.SLZoneSelection == L_GLOBALSTRINGS["Torghast"] then
					UIDropDownMenu_SetText(HMPSLZoneSelDropDown, addonTable.ZONE_ICONS["Torghast"] .. " " .. L_GLOBALSTRINGS["Torghast"])
				elseif HelpMePlayOptionsDB.SLZoneSelection == L_GLOBALSTRINGS["Random"] then
					UIDropDownMenu_SetText(HMPSLZoneSelDropDown, L_GLOBALSTRINGS["Random"])
				elseif HelpMePlayOptionsDB.SLZoneSelection == L_GLOBALSTRINGS["Disabled"] or HelpMePlayOptionsDB.SLZoneSelection == false or HelpMePlayOptionsDB.SLZoneSelection == nil then
					UIDropDownMenu_SetText(HMPSLZoneSelDropDown, L_GLOBALSTRINGS["Disabled"])
				end
			end
			
			if HelpMePlayOptionsDB.Junker.Rarity ~= nil then
				if HelpMePlayOptionsDB.Junker.Rarity == 0 then
					UIDropDownMenu_SetText(HMPJunkerRarityDropDown, L_GLOBALSTRINGS["Rarity: Poor"])
				elseif HelpMePlayOptionsDB.Junker.Rarity == 1 then
					UIDropDownMenu_SetText(HMPJunkerRarityDropDown, L_GLOBALSTRINGS["Rarity: Common"])
				elseif HelpMePlayOptionsDB.Junker.Rarity == 2 then
					UIDropDownMenu_SetText(HMPJunkerRarityDropDown, L_GLOBALSTRINGS["Rarity: Uncommon"])
				elseif HelpMePlayOptionsDB.Junker.Rarity == 3 then
					UIDropDownMenu_SetText(HMPJunkerRarityDropDown, L_GLOBALSTRINGS["Rarity: Rare"])
				elseif HelpMePlayOptionsDB.Junker.Rarity == 4 then
					UIDropDownMenu_SetText(HMPJunkerRarityDropDown, L_GLOBALSTRINGS["Rarity: Epic"])
				end
			end
			
			-- Disable All Check Button
			HMPDisableAllCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Disable All Check Button"])
			end)
			HMPDisableAllCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPDisableAllCB:SetScript("OnClick", function(self)
				if self:GetChecked() then
					-- Create an empty table to store the current
					-- state of the settings. We'll use the current
					-- states to return the settings back to their
					-- original state when the button is unchecked.
					HelpMePlayOptionsDB["TempSettings"] = {}
					HelpMePlayOptionsDB["TempSettings"].Dialog = HelpMePlayOptionsDB.Dialog
					HelpMePlayOptionsDB["TempSettings"].Emotes = HelpMePlayOptionsDB.Emotes
					HelpMePlayOptionsDB["TempSettings"].GarrisonTables = HelpMePlayOptionsDB.GarrisonTables
					HelpMePlayOptionsDB["TempSettings"].Merchants = HelpMePlayOptionsDB.Merchants
					HelpMePlayOptionsDB["TempSettings"].Trainers = HelpMePlayOptionsDB.Trainers
					HelpMePlayOptionsDB["TempSettings"].Speech = HelpMePlayOptionsDB.Speech
					HelpMePlayOptionsDB["TempSettings"].WarMode = HelpMePlayOptionsDB.WarMode
					HelpMePlayOptionsDB["TempSettings"].Quests = HelpMePlayOptionsDB.Quests
					HelpMePlayOptionsDB["TempSettings"].ThreadsOfFate = HelpMePlayOptionsDB.ThreadsOfFate
					HelpMePlayOptionsDB["TempSettings"].Notes = HelpMePlayOptionsDB.Notes
					HelpMePlayOptionsDB["TempSettings"].Talents = HelpMePlayOptionsDB.Talents
					HelpMePlayOptionsDB["TempSettings"].Cinematics = HelpMePlayOptionsDB.Cinematics
					HelpMePlayOptionsDB["TempSettings"].Queues = HelpMePlayOptionsDB.Queues
					HelpMePlayOptionsDB["TempSettings"].Vehicles = HelpMePlayOptionsDB.Vehicles
					HelpMePlayOptionsDB["TempSettings"].Waypoints = HelpMePlayOptionsDB.Waypoints
					HelpMePlayOptionsDB["TempSettings"].Weights = HelpMePlayOptionsDB.Weights
					HelpMePlayOptionsDB["TempSettings"].PartyPlay = HelpMePlayOptionsDB.PartyPlay
					HelpMePlayOptionsDB["TempSettings"].PartyPlayAnnounce = HelpMePlayOptionsDB.PartyPlayAnnounce
					HelpMePlayOptionsDB["TempSettings"].PartyPlayAutoShare = HelpMePlayOptionsDB.PartyPlayAutoShare
					HelpMePlayOptionsDB["TempSettings"].Logging = HelpMePlayOptionsDB.Logging
					HelpMePlayOptionsDB["TempSettings"].Junker = HelpMePlayOptionsDB.Junker.Enabled
					HelpMePlayOptionsDB["TempSettings"].ChromieTimeExpansion = HelpMePlayOptionsDB.ChromieTimeExpansion
					HelpMePlayOptionsDB["TempSettings"].TorghastPowers = HelpMePlayOptionsDB.TorghastPowers
					HelpMePlayOptionsDB["TempSettings"].Covenant = HelpMePlayOptionsDB.Covenant
					HelpMePlayOptionsDB["TempSettings"].BFAZoneSelection = HelpMePlayOptionsDB.BFAZoneSelection
					HelpMePlayOptionsDB["TempSettings"].SLZoneSelection = HelpMePlayOptionsDB.SLZoneSelection
					
					-- Flag the settings as false.
					HelpMePlayOptionsDB.Dialog = false
					HelpMePlayOptionsDB.Emotes = false
					HelpMePlayOptionsDB.GarrisonTables = false
					HelpMePlayOptionsDB.Merchants = false
					HelpMePlayOptionsDB.Trainers = false
					HelpMePlayOptionsDB.Speech = false
					HelpMePlayOptionsDB.WarMode = false
					HelpMePlayOptionsDB.Quests = false
					HelpMePlayOptionsDB.ThreadsOfFate = false
					HelpMePlayOptionsDB.Notes = false
					HelpMePlayOptionsDB.Talents = false
					HelpMePlayOptionsDB.Cinematics = false
					HelpMePlayOptionsDB.Queues = false
					HelpMePlayOptionsDB.Vehicles = false
					HelpMePlayOptionsDB.Waypoints = false
					HelpMePlayOptionsDB.Weights = false
					HelpMePlayOptionsDB.PartyPlay = false
					HelpMePlayOptionsDB.PartyPlayAnnounce = false
					HelpMePlayOptionsDB.PartyPlayAutoShare = false
					HelpMePlayOptionsDB.Logging = false
					HelpMePlayOptionsDB.Junker.Enabled = false
					HelpMePlayOptionsDB.ChromieTimeExpansion = 0
					HelpMePlayOptionsDB.TorghastPowers = L_GLOBALSTRINGS["Disabled"]
					HelpMePlayOptionsDB.Covenant = L_GLOBALSTRINGS["Disabled"]
					HelpMePlayOptionsDB.BFAZoneSelection = L_GLOBALSTRINGS["Disabled"]
					HelpMePlayOptionsDB.SLZoneSelection = L_GLOBALSTRINGS["Disabled"]
					
					-- Uncheck the buttons.
					HMPDialogCB:SetChecked(false)
					HMPEmotesCB:SetChecked(false)
					HMPGarrTblCB:SetChecked(false)
					HMPMerchantsCB:SetChecked(false)
					HMPTrainersV2CB:SetChecked(false)
					HMPSpeechCB:SetChecked(false)
					HMPWarModeCB:SetChecked(false)
					HMPQuestsCB:SetChecked(false)
					HMPToFCB:SetChecked(false)
					HMPNotesCB:SetChecked(false)
					HMPTalentsCB:SetChecked(false)
					HMPCinematicsCB:SetChecked(false)
					HMPQueuesCB:SetChecked(false)
					HMPVehiclesCB:SetChecked(false)
					HMPWaypointsCB:SetChecked(false)
					HMPWeightsCB:SetChecked(false)
					HMPPartyPlayCB:SetChecked(false)
					HMPPartyPlayAnnounceCB:SetChecked(false)
					HMPPartyPlayAutoShareCB:SetChecked(false)
					HMPLoggingCB:SetChecked(false)
					HMPEnableJunkerCB:SetChecked(false)
					UIDropDownMenu_SetSelectedValue(HMPChromieTimeDropDown, L_GLOBALSTRINGS["Battle for Azeroth"])
					UIDropDownMenu_SetSelectedValue(HMPTorghastPowersDropDown, L_GLOBALSTRINGS["Disabled"])
					UIDropDownMenu_SetSelectedValue(HMPCovenantsDropDown, L_GLOBALSTRINGS["Disabled"])
					UIDropDownMenu_SetSelectedValue(HMPBFAZoneSelDropDown, L_GLOBALSTRINGS["Disabled"])
					UIDropDownMenu_SetSelectedValue(HMPSLZoneSelDropDown, L_GLOBALSTRINGS["Disabled"])
					
				else
					-- Return the settings to their original
					-- states.
					--
					-- Recheck the buttons that were previously
					-- checked.
					HelpMePlayOptionsDB.Dialog = HelpMePlayOptionsDB["TempSettings"].Dialog
					HelpMePlayOptionsDB.Emotes = HelpMePlayOptionsDB["TempSettings"].Emotes
					HelpMePlayOptionsDB.GarrisonTables = HelpMePlayOptionsDB["TempSettings"].GarrisonTables
					HelpMePlayOptionsDB.Merchants = HelpMePlayOptionsDB["TempSettings"].Merchants
					HelpMePlayOptionsDB.Trainers = HelpMePlayOptionsDB["TempSettings"].Trainers
					HelpMePlayOptionsDB.Speech = HelpMePlayOptionsDB["TempSettings"].Speech
					HelpMePlayOptionsDB.WarMode = HelpMePlayOptionsDB["TempSettings"].WarMode
					HelpMePlayOptionsDB.Quests = HelpMePlayOptionsDB["TempSettings"].Quests
					HelpMePlayOptionsDB.ThreadsOfFate = HelpMePlayOptionsDB["TempSettings"].ThreadsOfFate
					HelpMePlayOptionsDB.Notes = HelpMePlayOptionsDB["TempSettings"].Notes
					HelpMePlayOptionsDB.Talents = HelpMePlayOptionsDB["TempSettings"].Talents
					HelpMePlayOptionsDB.Cinematics = HelpMePlayOptionsDB["TempSettings"].Cinematics
					HelpMePlayOptionsDB.Queues = HelpMePlayOptionsDB["TempSettings"].Queues
					HelpMePlayOptionsDB.Vehicles = HelpMePlayOptionsDB["TempSettings"].Vehicles
					HelpMePlayOptionsDB.Waypoints = HelpMePlayOptionsDB["TempSettings"].Waypoints
					HelpMePlayOptionsDB.Weights = HelpMePlayOptionsDB["TempSettings"].Weights
					HelpMePlayOptionsDB.PartyPlay = HelpMePlayOptionsDB["TempSettings"].PartyPlay
					HelpMePlayOptionsDB.PartyPlayAnnounce = HelpMePlayOptionsDB["TempSettings"].PartyPlayAnnounce
					HelpMePlayOptionsDB.PartyPlayAutoShare = HelpMePlayOptionsDB["TempSettings"].PartyPlayAutoShare
					HelpMePlayOptionsDB.Logging = HelpMePlayOptionsDB["TempSettings"].Logging
					HelpMePlayOptionsDB.Junker.Enabled = HelpMePlayOptionsDB["TempSettings"].Junker
					HelpMePlayOptionsDB.ChromieTimeExpansion = HelpMePlayOptionsDB["TempSettings"].ChromieTimeExpansion
					HelpMePlayOptionsDB.TorghastPowers = HelpMePlayOptionsDB["TempSettings"].TorghastPowers
					HelpMePlayOptionsDB.Covenant = HelpMePlayOptionsDB["TempSettings"].Covenant
					HelpMePlayOptionsDB.BFAZoneSelection = HelpMePlayOptionsDB["TempSettings"].BFAZoneSelection
					HelpMePlayOptionsDB.SLZoneSelection = HelpMePlayOptionsDB["TempSettings"].SLZoneSelection
					
					HMPDialogCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Dialog)
					HMPEmotesCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Emotes)
					HMPGarrTblCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].GarrisonTables)
					HMPMerchantsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Merchants)
					HMPTrainersV2CB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Trainers)
					HMPSpeechCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Speech)
					HMPWarModeCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].WarMode)
					HMPQuestsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Quests)
					HMPToFCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].ThreadsOfFate)
					HMPNotesCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Notes)
					HMPTalentsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Talents)
					HMPCinematicsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Cinematics)
					HMPQueuesCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Queues)
					HMPVehiclesCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Vehicles)
					HMPWaypointsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Waypoints)
					HMPWeightsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Weights)
					HMPPartyPlayCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].PartyPlay)
					HMPPartyPlayAnnounceCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].PartyPlayAnnounce)
					HMPPartyPlayAutoShareCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].PartyPlayAutoShare)
					HMPLoggingCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Logging)
					HMPEnableJunkerCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].Junker.Enabled)
					UIDropDownMenu_SetSelectedValue(HMPChromieTimeDropDown, GetChromieTimeExpansionName(HelpMePlayOptionsDB.ChromieTimeExpansion))
					UIDropDownMenu_SetSelectedValue(HMPTorghastPowersDropDown, HelpMePlayOptionsDB.TorghastPowers)
					UIDropDownMenu_SetSelectedValue(HMPCovenantsDropDown, HelpMePlayOptionsDB.Covenant)
					UIDropDownMenu_SetSelectedValue(HMPBFAZoneSelDropDown, HelpMePlayOptionsDB.BFAZoneSelection)
					UIDropDownMenu_SetSelectedValue(HMPSLZoneSelDropDown, HelpMePlayOptionsDB.SLZoneSelection)
				end
				HelpMePlayOptionsDB.DisableAll = self:GetChecked()
			end)

			-- Dialog Check Button
			HMPDialogCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Dialog Check Button"])
			end)
			HMPDialogCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPDialogCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Dialog = self:GetChecked()
			end)

			-- Emotes Check Button
			HMPEmotesCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Emotes Check Button"])
			end)
			HMPEmotesCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPEmotesCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Emotes = self:GetChecked()
			end)

			-- Garrison Tables Check Button
			HMPGarrTblCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Garrison Tables Check Button"])
			end)
			HMPGarrTblCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPGarrTblCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.GarrisonTables = self:GetChecked()
			end)

			-- Merchants Check Button
			HMPMerchantsCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Merchants Check Button"])
			end)
			HMPMerchantsCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPMerchantsCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Merchants = self:GetChecked()
			end)

			-- Trainers Check Button
			HMPTrainersV2CB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Trainers Check Button"])
			end)
			HMPTrainersV2CB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPTrainersV2CB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Trainers = self:GetChecked()
			end)

			-- Speech Check Button
			HMPSpeechCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Speech Check Button"])
			end)
			HMPSpeechCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPSpeechCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Speech = self:GetChecked()
			end)

			-- War Mode Check Button
			HMPWarModeCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["War Mode Check Button"])
			end)
			HMPWarModeCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPWarModeCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.WarMode = self:GetChecked()
			end)

			-- Quests Check Button
			HMPQuestsCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Quests Check Button"])
			end)
			HMPQuestsCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPQuestsCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Quests = self:GetChecked()
			end)

			-- Threads of Fate Check Button
			HMPToFCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Threads of Fate Check Button"])
			end)
			HMPToFCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPToFCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.ThreadsOfFate = self:GetChecked()
			end)
			
			-- Notes Check Button
			HMPNotesCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Notes Check Button"])
			end)
			HMPNotesCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPNotesCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Notes = self:GetChecked()
			end)
			
			-- Talents Check Button
			HMPTalentsCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Talents Check Button"])
			end)
			HMPTalentsCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPTalentsCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Talents = self:GetChecked()
			end)
			
			-- Cinematics Check Button
			HMPCinematicsCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Cinematics Check Button"])
			end)
			HMPCinematicsCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPCinematicsCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Cinematics = self:GetChecked()
			end)
			
			-- Queues Check Button
			HMPQueuesCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Queues Check Button"])
			end)
			HMPQueuesCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPQueuesCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Queues = self:GetChecked()
			end)
			
			-- Vehicles Check Button
			HMPVehiclesCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Vehicles Check Button"])
			end)
			HMPVehiclesCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPVehiclesCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Vehicles = self:GetChecked()
			end)
			
			-- Waypoints Check Button
			HMPWaypointsCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Waypoints Check Button"])
			end)
			HMPWaypointsCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPWaypointsCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Waypoints = self:GetChecked()
			end)
			
			-- Weights Check Button
			HMPWeightsCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Weights Check Button"])
			end)
			HMPWeightsCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPWeightsCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Weights = self:GetChecked()
			end)
			
			-- Party Play Check Button
			HMPPartyPlayCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Party Play Check Button"])
			end)
			HMPPartyPlayCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPPartyPlayCB:SetScript("OnClick", function(self)
				if self:GetChecked() then
					HMPPartyPlayAnnounceCB:Show()
					HMPPartyPlayAutoShareCB:Show()
				else
					HMPPartyPlayAnnounceCB:Hide()
					HMPPartyPlayAutoShareCB:Hide()
				end
				HelpMePlayOptionsDB.PartyPlay = self:GetChecked()
			end)
			
			-- Party Play Announce Check Button
			HMPPartyPlayAnnounceCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Party Play Announce Check Button"])
			end)
			HMPPartyPlayAnnounceCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPPartyPlayAnnounceCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.PartyPlayAnnounce = self:GetChecked()
			end)
			
			-- Party Play Auto Share Check Button
			HMPPartyPlayAutoShareCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Party Play Auto Share Check Button"])
			end)
			HMPPartyPlayAutoShareCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPPartyPlayAutoShareCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.PartyPlayAutoShare = self:GetChecked()
			end)
			
			-- Minimap Icon Check Button
			HMPMinimapIconCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Minimap Icon Check Button"])
			end)
			HMPMinimapIconCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPMinimapIconCB:SetScript("OnClick", function(self)
				if self:GetChecked() then
					HelpMePlayShowMinimapIcon(true)
				else
					HelpMePlayShowMinimapIcon(false)
				end
				HelpMePlayOptionsDB.MinimapIcon = self:GetChecked()
			end)
			
			-- Logging Check Button
			HMPLoggingCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Logging Check Button"])
			end)
			HMPLoggingCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPLoggingCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB.Logging = self:GetChecked()
			end)
			
			-- Junker Check Button
			HMPEnableJunkerCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Junker Check Button"])
			end)
			HMPEnableJunkerCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPEnableJunkerCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB["Junker"]["Enabled"] = self:GetChecked()
			end)
			
			-- Junker Safe Mode Check Button
			HMPJunkerSafeModeCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Junker Safe Mode Check Button"])
			end)
			HMPJunkerSafeModeCB:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			HMPJunkerSafeModeCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB["Junker"]["isSafeModeEnabled"] = self:GetChecked()
			end)
			
			-- Junker Armor Check Button
			HMPJunkerItemTypeArmorCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB["Junker"]["Armor"] = self:GetChecked()
			end)
			
			-- Junker Consumable Check Button
			HMPJunkerItemTypeConsumableCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB["Junker"]["Consumable"] = self:GetChecked()
			end)
			
			-- Junker Recipe Check Button
			HMPJunkerItemTypeRecipeCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB["Junker"]["Recipe"] = self:GetChecked()
			end)
			
			-- Junker Gem Check Button
			HMPJunkerItemTypeGemCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB["Junker"]["Gem"] = self:GetChecked()
			end)
			
			-- Junker Tradeskill Check Button
			HMPJunkerItemTypeTradeskillCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB["Junker"]["Tradeskill"] = self:GetChecked()
			end)
			
			-- Junker Weapon Check Button
			HMPJunkerItemTypeWeaponCB:SetScript("OnClick", function(self)
				HelpMePlayOptionsDB["Junker"]["Weapon"] = self:GetChecked()
			end)
			
			-- Chromie Time DropDown
			HMPChromieTimeDropDown:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Chromie Time DropDown"])
			end)
			HMPChromieTimeDropDown:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			UIDropDownMenu_Initialize(HMPChromieTimeDropDown, DropDownMenu_Initialize)
			
			-- Torghast Powers DropDown
			HMPTorghastPowersDropDown:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Torghast Powers DropDown"])
			end)
			HMPTorghastPowersDropDown:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			UIDropDownMenu_Initialize(HMPTorghastPowersDropDown, DropDownMenu_Initialize)
			
			-- Covenants DropDown
			HMPCovenantsDropDown:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Covenants DropDown"])
			end)
			HMPCovenantsDropDown:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			UIDropDownMenu_Initialize(HMPCovenantsDropDown, DropDownMenu_Initialize)
			
			-- BFA Zone Selection DropDown
			HMPBFAZoneSelDropDown:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["BFA Zone Selection DropDown"])
			end)
			HMPBFAZoneSelDropDown:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			UIDropDownMenu_Initialize(HMPBFAZoneSelDropDown, DropDownMenu_Initialize)
			
			-- Shadowlands Zone Selection DropDown
			HMPSLZoneSelDropDown:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["SL Zone Selection DropDown"])
			end)
			HMPSLZoneSelDropDown:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			UIDropDownMenu_Initialize(HMPSLZoneSelDropDown, DropDownMenu_Initialize)
			
			-- Junker Rarity DropDown
			HMPJunkerRarityDropDown:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Junker: Rarity DropDown"])
			end)
			HMPJunkerRarityDropDown:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			UIDropDownMenu_Initialize(HMPJunkerRarityDropDown, DropDownMenu_Initialize)
			
			-- Junker Import Button
			HMPJunkerImportButton:SetScript("OnClick", function(self)
				StaticPopupDialogs["HELPMEPLAY_JUNKER_IMPORT"] = {
					text = L_GLOBALSTRINGS["Junker Import Message"],
					button1 = L_GLOBALSTRINGS["Import from AddOn"],
					button2 = L_GLOBALSTRINGS["Import from List"],
					button3 = CANCEL,
					-- This is confusing, but I don't want Cancel
					-- as the second button. Thus, OnAlt is used
					-- for cancels and OnCancel is used for loading
					-- an item ID list.
					OnButton1 = function(self, data)
						if IsAddOnLoaded("Dejunk") then
							for id, _ in pairs(__DEJUNK_SAVED_VARIABLES__["Global"]["sell"]["inclusions"]) do
								ImportToJunker(tonumber(id))
							end
							print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Imported To Junker Text"], "Dejunk"))
						elseif IsAddOnLoaded("AutoVendor") then
							if AutoVendorDB["profiles"]["Default"] then
								for id, _ in pairs(AutoVendorDB["profiles"]["Default"]["junk"]) do
									ImportToJunker(id)
								end
							end
							print(string.format(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["Imported To Junker Text"], "AutoVendor"))
						else
							print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["No Auto Sell AddOn Enabled"])
						end
					end,
					OnCancel = function(self, data)
					end,
					OnAlt = function() end,
					showAlert = true,
					whileDead = false,
					hideOnEscape = true,
					preferredIndex = 3,
				}
				StaticPopup_Show("HELPMEPLAY_JUNKER_IMPORT")
			end)
			
			-- Tab 1
			HMPOptionsFrameTab1:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Tab Description: Automations"])
			end)
			HMPOptionsFrameTab1:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			
			-- Tab 2
			HMPOptionsFrameTab2:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Tab Description: Systems"])
			end)
			HMPOptionsFrameTab2:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			
			-- Tab 3
			HMPOptionsFrameTab3:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Tab Description: General"])
			end)
			HMPOptionsFrameTab3:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
			
			-- Tab 4
			HMPOptionsFrameTab4:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Tab Description: Junker"])
			end)
			HMPOptionsFrameTab4:SetScript("OnLeave", function(self)
				HideTooltip(self)
			end)
		end
	end
end