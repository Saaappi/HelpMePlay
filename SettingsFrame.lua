local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local icon = ""

local function Tab_OnClick(self)
	PanelTemplates_SetTab(self:GetParent())
end

local function SetTabs(frame, numTabs, ...)
	--frame.numTabs = numTabs
	local contents = {}
	
	local frameName = frame:GetName()
	
	for i=1, numTabs do
		local tab = CreateFrame("Button", frameName.."Tab"..i, frame, "CharacterFrameTabButtonTemplate")
		tab:SetID(i)
		tab:SetText(select(i, ...))
		tab:SetScript("OnClick", Tab_OnClick)
		
		if i == 1 then
			tab:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 5, 2)
		elseif i == 2 then
			tab:SetPoint("TOPLEFT", _G[frameName.."Tab"..(i-1)], "TOPRIGHT", -14, 0)
		end
	end
	
	Tab_OnClick(_G[frameName.."Tab1"])
	
	return unpack(contents)
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

local automationsTab, systemsTab = SetTabs(HMPOptionsFrame, 2, L_GLOBALSTRINGS["Tab: Automations"], L_GLOBALSTRINGS["Tab: Systems"])

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
		--
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
		--
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
		--
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
		--
		-- Self explanatory.
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
		--
		-- Automatically selects the Kyrian Covenant.
		info.text = L_GLOBALSTRINGS["Kyrian"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L_GLOBALSTRINGS["Kyrian"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Kyrian"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Kyrian"]
		info.tooltipText = L_GLOBALSTRINGS["Kyrian"]
		UIDropDownMenu_AddButton(info)
		
		-- Necrolord
		--
		-- Automatically selects the Necrolord Covenant.
		info.text = L_GLOBALSTRINGS["Necrolord"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L_GLOBALSTRINGS["Necrolord"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Necrolord"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Necrolord"]
		info.tooltipText = L_GLOBALSTRINGS["Necrolord"]
		UIDropDownMenu_AddButton(info)
		
		-- Night Fae
		--
		-- Automatically selects the Night Fae Covenant.
		info.text = L_GLOBALSTRINGS["Night Fae"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L_GLOBALSTRINGS["Night Fae"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Night Fae"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Night Fae"]
		info.tooltipText = L_GLOBALSTRINGS["Night Fae"]
		UIDropDownMenu_AddButton(info)
		
		-- Venthyr
		--
		-- Automatically selects the Venthyr Covenant.
		info.text = L_GLOBALSTRINGS["Venthyr"]
		info.func = function(self)
			HelpMePlayOptionsDB.Covenant = L_GLOBALSTRINGS["Venthyr"]
			UIDropDownMenu_SetSelectedValue(menuName, self.value)
		end
		info.value = L_GLOBALSTRINGS["Venthyr"]
		if info.value == selectedValue then
			info.checked = true
		else
			info.checked = false
		end
		info.tooltipTitle = L_GLOBALSTRINGS["Venthyr"]
		info.tooltipText = L_GLOBALSTRINGS["Venthyr"]
		UIDropDownMenu_AddButton(info)
		
		-- Disabled
		--
		-- Self explanatory.
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
			HMPCRText:SetText(L_GLOBALSTRINGS["Copyright Text"])
			HMPDisableAllText:SetText(L_GLOBALSTRINGS["Disable All"])
			HMPVersionText:SetText(GetAddOnMetadata(addonName, "Version"))
			HMPAdvMapsText:SetText(L_GLOBALSTRINGS["Adventure Maps"])
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
			HMPPartyPlayText:SetText(L_GLOBALSTRINGS["Party Play"])
			HMPMinimapIconText:SetText(L_GLOBALSTRINGS["Minimap Icon"])

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
					UIDropDownMenu_SetText(HMPCovenantsDropDown, L_GLOBALSTRINGS["Kyrian"])
				elseif HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Necrolord"] then
					UIDropDownMenu_SetText(HMPCovenantsDropDown, L_GLOBALSTRINGS["Necrolord"])
				elseif HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Night Fae"] then
					UIDropDownMenu_SetText(HMPCovenantsDropDown, L_GLOBALSTRINGS["Night Fae"])
				elseif HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Venthyr"] then
					UIDropDownMenu_SetText(HMPCovenantsDropDown, L_GLOBALSTRINGS["Venthyr"])
				else
					UIDropDownMenu_SetText(HMPCovenantsDropDown, L_GLOBALSTRINGS["Disabled"])
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
					HelpMePlayOptionsDB.PartyPlay = false
					HelpMePlayOptionsDB.MinimapIcon = false
					HelpMePlayOptionsDB.ChromieTimeExpansion = 0
					HelpMePlayOptionsDB.TorghastPowers = L_GLOBALSTRINGS["Disabled"]
					HelpMePlayOptionsDB.Covenant = L_GLOBALSTRINGS["Disabled"]
					
					-- Uncheck the buttons.
					HMPAdvMapsCB:SetChecked(false)
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
					HMPPartyPlayCB:SetChecked(false)
					HMPMinimapIconCB:SetChecked(false)
					UIDropDownMenu_SetSelectedValue(HMPChromieTimeDropDown, L_GLOBALSTRINGS["Battle for Azeroth"])
					UIDropDownMenu_SetSelectedValue(HMPTorghastPowersDropDown, L_GLOBALSTRINGS["Disabled"])
					UIDropDownMenu_SetSelectedValue(HMPCovenantsDropDown, L_GLOBALSTRINGS["Disabled"])
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
					HelpMePlayOptionsDB.PartyPlay = HelpMePlayOptionsDB["TempSettings"].PartyPlay
					HelpMePlayOptionsDB.MinimapIcon = HelpMePlayOptionsDB["TempSettings"].MinimapIcon
					HelpMePlayOptionsDB.ChromieTimeExpansion = HelpMePlayOptionsDB["TempSettings"].ChromieTimeExpansion
					HelpMePlayOptionsDB.TorghastPowers = HelpMePlayOptionsDB["TempSettings"].TorghastPowers
					HelpMePlayOptionsDB.Covenant = HelpMePlayOptionsDB["TempSettings"].Covenant
					
					HMPAdvMapsCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].AdventureMaps)
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
					HMPPartyPlayCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].PartyPlay)
					HMPMinimapIconCB:SetChecked(HelpMePlayOptionsDB["TempSettings"].MinimapIcon)
					UIDropDownMenu_SetSelectedValue(HMPChromieTimeDropDown, GetChromieTimeExpansionName(HelpMePlayOptionsDB.ChromieTimeExpansion))
					UIDropDownMenu_SetSelectedValue(HMPTorghastPowersDropDown, HelpMePlayOptionsDB.TorghastPowers)
					UIDropDownMenu_SetSelectedValue(HMPCovenantsDropDown, HelpMePlayOptionsDB.Covenant)
				end
			end)

			-- Adventure Maps Check Button
			HMPAdvMapsCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Adventure Maps Check Button"])
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
				ShowTooltip(self, L_GLOBALSTRINGS["Dialog Check Button"])
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
				ShowTooltip(self, L_GLOBALSTRINGS["Emotes Check Button"])
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
				ShowTooltip(self, L_GLOBALSTRINGS["Garrison Tables Check Button"])
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

			-- Merchants Check Button
			HMPMerchantsCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Merchants Check Button"])
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
				ShowTooltip(self, L_GLOBALSTRINGS["Trainers Check Button"])
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
				ShowTooltip(self, L_GLOBALSTRINGS["Speech Check Button"])
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
				ShowTooltip(self, L_GLOBALSTRINGS["War Mode Check Button"])
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
				ShowTooltip(self, L_GLOBALSTRINGS["Quests Check Button"])
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

			-- Threads of Fate Check Button
			HMPToFCB:SetScript("OnEnter", function(self)
				ShowTooltip(self, L_GLOBALSTRINGS["Threads of Fate Check Button"])
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
				ShowTooltip(self, L_GLOBALSTRINGS["Notes Check Button"])
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
				ShowTooltip(self, L_GLOBALSTRINGS["Talents Check Button"])
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
				ShowTooltip(self, L_GLOBALSTRINGS["Cinematics Check Button"])
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
				ShowTooltip(self, L_GLOBALSTRINGS["Queues Check Button"])
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
				ShowTooltip(self, L_GLOBALSTRINGS["Party Play Check Button"])
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
				ShowTooltip(self, L_GLOBALSTRINGS["Minimap Icon Check Button"])
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
		end
	end
end

SLASH_HelpMePlay1 = L_GLOBALSTRINGS["Slash HMP"]
SlashCmdList["HelpMePlay"] = function(command, editbox)
	local _, _, command, arguments = string.find(command, "%s?(%w+)%s?(.*)") -- Using pattern matching the addon will be able to interpret subcommands.
	if not command or command == "" then
		if HMPOptionsFrame:IsVisible() then
			HMPOptionsFrame:Hide()
		else
			HelpMePlayLoadSettings()
		end
	elseif command == L_GLOBALSTRINGS["Dialog Command"] and arguments ~= "" then
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
	elseif command == L_GLOBALSTRINGS["Quest Command"] or command == L_GLOBALSTRINGS["Q"] and arguments ~= "" then
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