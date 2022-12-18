local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function GetConfigs()
	return C_ClassTalents.GetConfigIDsBySpecID(PlayerUtil.GetCurrentSpecID())
end

local function PurchaseTalents(configID, tbl, specID)
	C_Timer.After(0.25, function()
		for _, traits in ipairs(tbl[specID]) do
			if C_Traits.CanPurchaseRank(configID, traits.n, traits.e) then
				local nodeInfo = C_Traits.GetNodeInfo(configID, traits.n)
				local entryInfo = C_Traits.GetEntryInfo(configID, traits.e)
				local spellID = C_Traits.GetDefinitionInfo(entryInfo.definitionID).spellID
				if #nodeInfo.entryIDs > 1 then
					C_Traits.SetSelection(configID, traits.n, traits.e)
				else
					C_Traits.PurchaseRank(configID, traits.n)
				end
				
				if spellID then
					print(string.format("%s: %s %s", L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"], L_GLOBALSTRINGS["Learned"], (GetSpellLink(spellID))))
				end
			end
		end
		C_Traits.CommitConfig(configID)
		ClassTalentFrame.TalentsTab.ApplyButton:Click("LeftButton")
	end)
end

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addon)
	if event == "ADDON_LOADED" and addon == "Blizzard_ClassTalentUI" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		
		local talentButton = _G.CreateFrame(
			"Button",
			"HMPTalentButton",
			ClassTalentFrame.TalentsTab.ApplyButton,
			"UIPanelButtonTemplate"
		)
		
		ClassTalentFrame.TalentsTab.ApplyButton:SetPoint("BOTTOM", 0, 15)
		
		HMPTalentButton:SetSize(50, 20)
		HMPTalentButton:SetText(L_GLOBALSTRINGS["UI.Button.Learn"])

		HMPTalentButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		
		HMPTalentButton:HookScript("OnClick", function(self)
			local configID = 0 -- Set the config ID to 0 to start
			if HelpMePlaySavesDB.TalentConfigID then
				-- If the config ID was created in an earlier
				-- session, then load it, if necessary.
				C_ClassTalents.LoadConfig(HelpMePlaySavesDB.TalentConfigID, true)
				configID = C_ClassTalents.GetActiveConfigID()
				ClassTalentHelper.SwitchToLoadoutByName(L_GLOBALSTRINGS["PlayerTalents.Config.Name"])
			else
				-- The talent automation is being used for the
				-- first time, so request a new config and get
				-- the config ID.
				--
				-- Save the new config ID to the main table.
				local isConfigCreated = false
				local configIDs = GetConfigs()
				for _, id in ipairs(configIDs) do
					local configInfo = C_Traits.GetConfigInfo(id)
					if configInfo.name == L_GLOBALSTRINGS["PlayerTalents.Config.Name"] then
						isConfigCreated = true
						break
					end
				end
				
				if isConfigCreated == false then
					C_ClassTalents.RequestNewConfig(L_GLOBALSTRINGS["PlayerTalents.Config.Name"])
					C_Timer.After(addonTable.CONSTANTS["ONE_SECOND"], function()
						configIDs = GetConfigs()
						for _, id in ipairs(configIDs) do
							local configInfo = C_Traits.GetConfigInfo(id)
							if configInfo.name == L_GLOBALSTRINGS["PlayerTalents.Config.Name"] then
								C_ClassTalents.LoadConfig(id, true)
								HelpMePlaySavesDB.TalentConfigID = id
							end
						end
					end)
				end
				configID = C_ClassTalents.GetActiveConfigID()
			end
			
			if configID then
				local specID = PlayerUtil.GetCurrentSpecID()
				local _, _, classID = UnitClass("player")
				
				if classID == 1 then
					PurchaseTalents(configID, addonTable.WARRIOR_TALENTS, specID)
				elseif classID == 2 then
					PurchaseTalents(configID, addonTable.PALADIN_TALENTS, specID)
				elseif classID == 3 then -- Hunter
				elseif classID == 4 then -- Rogue
				elseif classID == 5 then -- Priest
				elseif classID == 6 then -- Death Knight
				elseif classID == 7 then -- Shaman
				elseif classID == 8 then -- Mage
				elseif classID == 9 then -- Warlock
				elseif classID == 10 then -- Monk
				elseif classID == 11 then
					PurchaseTalents(configID, addonTable.DRUID_TALENTS, specID)
				elseif classID == 12 then
					PurchaseTalents(configID, addonTable.DEMON_HUNTER_TALENTS, specID)
				elseif classID == 13 then -- Evoker
				end
			end
		end)

		HMPTalentButton:HookScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:SetText(L_GLOBALSTRINGS["UI.Button.Talents.Desc"])
			GameTooltip:Show()
		end)

		HMPTalentButton:HookScript("OnLeave", function(self)
			if GameTooltip:GetOwner() == self then
				GameTooltip:Hide()
			end
		end)
		
		if HelpMePlayDB.TalentButtonEnabled then
			HMPTalentButton:SetPoint("CENTER", ClassTalentFrame.TalentsTab.ApplyButton, "CENTER", 0, 30)
			HMPTalentButton:Show()
		end
	end
end)