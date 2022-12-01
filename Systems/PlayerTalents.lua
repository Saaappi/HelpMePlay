local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function PurchaseTalents(configID, tbl, specID)
	C_Timer.After(0.25, function()
		for _, traits in ipairs(tbl[specID]) do
			if C_Traits.CanPurchaseRank(configID, traits.n, traits.e) then
				local nodeInfo = C_Traits.GetNodeInfo(configID, traits.n)
				if #nodeInfo.entryIDs > 1 then
					C_Traits.SetSelection(configID, traits.n, traits.e)
				else
					C_Traits.PurchaseRank(configID, traits.n)
				end
			end
		end
		C_Traits.CommitConfig(configID)
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
		
		local normalTexture = e:CreateTexture()
		local highlightTexture = e:CreateTexture()
		
		normalTexture:SetTexture("Interface\\Garrison\\GarrisonBuildingUI")
		normalTexture:SetTexCoord(0.0908203, 0.123047, 0.757812, 0.833984)
		highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square")
		HMPTalentButton:SetNormalTexture(normalTexture)
		HMPTalentButton:SetHighlightTexture(highlightTexture, "ADD")

		HMPTalentButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		
		normalTexture:SetSize(24, 24)
		highlightTexture:SetSize(24, 24)
		HMPTalentButton:SetSize(24, 24)
		
		HMPTalentButton:HookScript("OnClick", function(self)
			local configID = C_ClassTalents.GetActiveConfigID()
			if configID then
				local specIndex = GetSpecialization()
				local specID = GetSpecializationInfo(specIndex)
				local _, class = UnitClass("player")
				
				if class == "WARRIOR" then
					PurchaseTalents(configID, addonTable.WARRIOR_TALENTS, specID)
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
			HMPTalentButton:SetPoint("RIGHT", ClassTalentFrame.TalentsTab.ApplyButton, "LEFT", -50, 0)
			HMPTalentButton:Show()
		end
	end
end)