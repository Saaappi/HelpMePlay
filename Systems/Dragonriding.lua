local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

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
			StaticPopupDialogs["HELPMEPLAY_DRAGONRIDING"] = {
				text = L_GLOBALSTRINGS["UI.Button.Dragonriding.Popup.Desc"],
				button1 = YES,
				button2 = CANCEL,
				OnAccept = function(self, data)
					local configID = C_Traits.GetConfigIDByTreeID(addonTable.CONSTANTS["DRAGONRIDING_TREE_ID"])
					C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
						for _, node in ipairs(addonTable.DRAGONRIDING_TRAITS) do
							if C_Traits.CanPurchaseRank(configID, node.nodeID, node.entryID) then
								local nodeInfo = C_Traits.GetNodeInfo(configID, node.nodeID)
								if #nodeInfo.entryIDs > 1 then
									C_Traits.SetSelection(configID, node.nodeID, node.entryID)
								else
									C_Traits.PurchaseRank(configID, node.nodeID)
								end
							end
						end
						C_Traits.CommitConfig(configID)
					end)
				end,
				timeout = 15,
				showAlert = true,
				whileDead = false,
				hideOnEscape = true,
				enterClicksFirstButton = false,
				preferredIndex = 3,
			}
			StaticPopup_Show("HELPMEPLAY_DRAGONRIDING")
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