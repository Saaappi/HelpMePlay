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
	if event == "ADDON_LOADED" and addon == "Blizzard_GenericTraitUI" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		
		local dragonridingTraitButton = _G.CreateFrame(
			"Button",
			"HMPDragonridingTraitButton",
			GenericTraitFrame.Currency,
			"UIPanelButtonTemplate"
		)
		
		HMPDragonridingTraitButton:SetSize(50, 20)
		HMPDragonridingTraitButton:SetText(L_GLOBALSTRINGS["UI.Button.Learn"])

		HMPDragonridingTraitButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		
		HMPDragonridingTraitButton:HookScript("OnClick", function(self)
			--[[local configID = C_ClassTalents.GetActiveConfigID()
			if configID then
				local specIndex = GetSpecialization()
				local specID = GetSpecializationInfo(specIndex)
				local _, class = UnitClass("player")
				
				if class == "WARRIOR" then
					PurchaseTalents(configID, addonTable.WARRIOR_TALENTS, specID)
				end
			end]]
			print("[PH]")
		end)

		HMPDragonridingTraitButton:HookScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:SetText(L_GLOBALSTRINGS["UI.Button.Dragonriding.Desc"])
			GameTooltip:Show()
		end)

		HMPDragonridingTraitButton:HookScript("OnLeave", function(self)
			if GameTooltip:GetOwner() == self then
				GameTooltip:Hide()
			end
		end)
		
		if HelpMePlayDB.DragonridingButtonEnabled then
			HMPDragonridingTraitButton:SetPoint("RIGHT", GenericTraitFrame.Currency, "RIGHT", 0, -30)
			HMPDragonridingTraitButton:Show()
		end
	end
end)