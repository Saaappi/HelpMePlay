local addonName, addon = ...
local e = CreateFrame("Frame")

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addonLoaded)
	if (event == "ADDON_LOADED") and (addonLoaded == "Blizzard_GenericTraitUI") then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		
		local dragonridingTraitButton = _G.CreateFrame(
			"Button",
			"HMPDragonridingTraitButton",
			GenericTraitFrame.Currency,
			"UIPanelButtonTemplate"
		)
		
		HMPDragonridingTraitButton:SetSize(50, 20)
		HMPDragonridingTraitButton:SetText("Learn")

		HMPDragonridingTraitButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
		
		HMPDragonridingTraitButton:HookScript("OnClick", function(self)
			local configID = C_Traits.GetConfigIDByTreeID(672)
			C_Timer.After(0.5, function()
				for _, node in ipairs(addon.DRAGONRIDING_TRAITS) do
					local nodeInfo = C_Traits.GetNodeInfo(configID, node.nodeID)
					if (#nodeInfo.entryIDs > 1) then
						C_Traits.SetSelection(configID, node.nodeID, node.entryID)
					else
						C_Traits.PurchaseRank(configID, node.nodeID)
					end
				end
				C_Traits.CommitConfig(configID)
			end)
		end)

		HMPDragonridingTraitButton:HookScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
			GameTooltip:SetText("Automatically learns all possible dragonriding traits.\n\n" ..
			"|cffADD8E6Added by HelpMePlay|r")
			GameTooltip:Show()
		end)

		HMPDragonridingTraitButton:HookScript("OnLeave", function(self)
			if (GameTooltip:GetOwner() == self) then
				GameTooltip:Hide()
			end
		end)
		
		if (HelpMePlayDB.DragonridingButtonEnabled) then
			HMPDragonridingTraitButton:SetPoint("RIGHT", GenericTraitFrame.Currency, "RIGHT", 0, -30)
			HMPDragonridingTraitButton:Show()
		end
	end
end)