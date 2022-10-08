local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addon, ...)
	if event == "ADDON_LOADED" and addon == "Blizzard_Soulbinds" then
		local soulbindButton = _G.CreateFrame(
			"Button",
			"HMPSoulbindButton",
			SoulbindViewer,
			"UIPanelButtonTemplate"
		)
		
		HMPSoulbindButton:SetSize(80, 22)
		HMPSoulbindButton:SetText(L_GLOBALSTRINGS["Soulbind.UI.Button.Setup.Text"])
		HMPSoulbindButton:SetPoint("TOPLEFT", SoulbindViewer, "TOPLEFT", 60, -200)

		HMPSoulbindButton:SetScript("OnEnter", function(self)
			addonTable.ShowTooltip(self, L_GLOBALSTRINGS["Soulbind.UI.Button.Setup.Desc"])
		end)
		HMPSoulbindButton:SetScript("OnLeave", function(self)
			addonTable.HideTooltip(self)
		end)
		HMPSoulbindButton:SetScript("OnClick", function(self)
			if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
			print("I WAS CLICKED!")
		end)
	end
end)