local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

--e:RegisterEvent("ADDON_LOADED")

-- Currently unused, but may be used in the future.
--[[e:SetScript("OnEvent", function(self, event, ...)
	if event == "ADDON_LOADED" then
		local addonLoaded = ...
		if addonLoaded == "Blizzard_CovenantSanctum" then
			CovenantSanctumFrame.UpgradesTab.DepositButton:Click()
		end
	end
end)]]