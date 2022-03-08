local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("GARRISON_ARCHITECT_OPENED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GARRISON_ARCHITECT_OPENED" then
		if HelpMePlayOptionsDB.GarrisonTables == false or HelpMePlayOptionsDB.GarrisonTables == nil then return end
		local garrisonLevel = C_Garrison.GetGarrisonInfo(2)
		if garrisonLevel == 1 then
			local plotsForBuilding = C_Garrison.GetPlotsForBuilding(26)
			if HelpMePlaySavesDB["isGarrisonBarracksPlaced"] == false or HelpMePlaySavesDB["isGarrisonBarracksPlaced"] == nil then
				for i=1,#plotsForBuilding do
					local buildingId = C_Garrison.GetOwnedBuildingInfo(plotsForBuilding[i])
					if buildingId ~= nil then
						HelpMePlaySavesDB["isGarrisonBarracksPlaced"] = true
						return
					end
					C_Garrison.PlaceBuilding(plotsForBuilding[i], 26)
					PlaySound(SOUNDKIT.UI_GARRISON_ARCHITECT_TABLE_UPGRADE_START)
					GarrisonBuildingFrame.CloseButton:Click()
					HelpMePlaySavesDB["isGarrisonBarracksPlaced"] = true
				end
			end
		end
	end
end)