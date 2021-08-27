local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("GARRISON_ARCHITECT_OPENED")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "GARRISON_ARCHITECT_OPENED" then
		local _, _, _, _, _, isActive = C_Garrison.GetBuildingTooltip(26)
		if isActive == false then
			local plots = C_Garrison.GetPlots(1)
			for i = 1, #plots do
				if plots[i].size == 3 then
					-- This is a large plot. Place the Barracks here.
					C_Garrison.PlaceBuilding(plots[i].id, 26)
					PlaySound(SOUNDKIT.UI_GARRISON_ARCHITECT_TABLE_UPGRADE_START)
				end
			end
		end
	end
end)