local addonName, addon = ...

EventRegistry:RegisterCallback("GenericTraitFrame.OnShow", function()
	if ( GenericTraitFrame.Header.Title:GetText() == "Dragonriding" ) then
	    local dragonridingTraitButton = CreateFrame("Button", "HMPDragonridingTraitButton", GenericTraitFrame.Currency, "UIPanelButtonTemplate")

		HMPDragonridingTraitButton:SetSize(50, 20)
        HMPDragonridingTraitButton:SetText("Learn")

        HMPDragonridingTraitButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")

        HMPDragonridingTraitButton:HookScript("OnClick", function(self)
            local configID = C_Traits.GetConfigIDByTreeID(672)
            C_Timer.After(0.5, function()
                for _, node in ipairs(addon.DRAGONRIDING_TRAITS) do
                    local nodeInfo = C_Traits.GetNodeInfo(configID, node.nodeID)
                    if ( #nodeInfo.entryIDs > 1 ) then
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
            GameTooltip:SetText("Automatically learns all possible dragonriding traits. (Added by HelpMePlay)", 1, 1, 1, true)
            GameTooltip:Show()
        end)

        HMPDragonridingTraitButton:HookScript("OnLeave", function(self)
            if ( GameTooltip:GetOwner() == self ) then
                GameTooltip:Hide()
            end
        end)

        if ( HelpMePlayDB.DragonridingButtonEnabled ) then
            HMPDragonridingTraitButton:SetPoint("TOPRIGHT", HMPDragonridingTraitButton:GetParent(), "BOTTOMRIGHT", 0, -15)
            HMPDragonridingTraitButton:Show()
        end
	end
end)