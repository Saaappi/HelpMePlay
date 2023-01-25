local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function TalentPurchased(entryInfo)
	local _, _, icon = GetSpellInfo(C_Traits.GetDefinitionInfo(entryInfo.definitionID).spellID)
	local spellLink = GetSpellLink(C_Traits.GetDefinitionInfo(entryInfo.definitionID).spellID)
	print(string.format(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": " .. L_GLOBALSTRINGS["Text.Output.TalentLearned"] .. " |T%s:0|t %s", icon, spellLink))
end

local function PurchaseTalents(configID, tbl, specID)
	C_Timer.After(0.25, function()
		for _, traits in ipairs(tbl[specID]) do
			if C_Traits.CanPurchaseRank(configID, traits.n, traits.e) then
				local nodeInfo = C_Traits.GetNodeInfo(configID, traits.n)
				local entryInfo = C_Traits.GetEntryInfo(configID, traits.e)
				if #nodeInfo.entryIDs > 1 then
					local success = C_Traits.SetSelection(configID, traits.n, traits.e)
					if success then
						TalentPurchased(entryInfo)
					end
				else
					local success = C_Traits.PurchaseRank(configID, traits.n)
					if success then
						TalentPurchased(entryInfo)
					end
				end
			end
		end
		C_Traits.StageConfig(configID)
		C_Traits.CommitConfig(configID)
	end)
end

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addon)
	if event == "ADDON_LOADED" and addon == "Blizzard_ClassTalentUI" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.TalentButtonEnabled == false or HelpMePlayDB.TalentButtonEnabled == nil then return false end
		
		ClassTalentFrame:HookScript("OnShow", function()
			local talentButton = _G.CreateFrame(
				"Button",
				"HMPTalentButton",
				ClassTalentFrame.TalentsTab.ApplyButton,
				"UIPanelButtonTemplate"
			)
		
			HMPTalentButton:SetSize(50, 20)
			HMPTalentButton:SetText(L_GLOBALSTRINGS["UI.Button.Learn"])

			HMPTalentButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
			
			HMPTalentButton:HookScript("OnClick", function(self)
				local configID = C_ClassTalents.GetActiveConfigID()
				local specID = PlayerUtil.GetCurrentSpecID()
				local _, _, classID = UnitClass("player")
				
				if classID == 1 then -- Warrior
					PurchaseTalents(configID, addonTable.WARRIOR_TALENTS, specID)
				elseif classID == 2 then -- Paladin
					PurchaseTalents(configID, addonTable.PALADIN_TALENTS, specID)
				elseif classID == 3 then -- Hunter
					PurchaseTalents(configID, addonTable.HUNTER_TALENTS, specID)
				elseif classID == 4 then -- Rogue
					PurchaseTalents(configID, addonTable.ROGUE_TALENTS, specID)
				elseif classID == 5 then -- Priest
					PurchaseTalents(configID, addonTable.PRIEST_TALENTS, specID)
				elseif classID == 6 then -- Death Knight
					PurchaseTalents(configID, addonTable.DEATH_KNIGHT_TALENTS, specID)
				elseif classID == 7 then -- Shaman
					PurchaseTalents(configID, addonTable.SHAMAN_TALENTS, specID)
				elseif classID == 8 then -- Mage
					PurchaseTalents(configID, addonTable.MAGE_TALENTS, specID)
				elseif classID == 9 then -- Warlock
					PurchaseTalents(configID, addonTable.WARLOCK_TALENTS, specID)
				elseif classID == 10 then -- Monk
					PurchaseTalents(configID, addonTable.MONK_TALENTS, specID)
				elseif classID == 11 then -- Druid
					PurchaseTalents(configID, addonTable.DRUID_TALENTS, specID)
				elseif classID == 12 then -- Demon Hunter
					PurchaseTalents(configID, addonTable.DEMON_HUNTER_TALENTS, specID)
				elseif classID == 13 then -- Evoker
					PurchaseTalents(configID, addonTable.EVOKER_TALENTS, specID)
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
				HMPTalentButton:SetPoint("RIGHT", ClassTalentFrame.TalentsTab.ApplyButton, "LEFT", -20, 0)
				HMPTalentButton:Show()
			end
		end)
	end
end)