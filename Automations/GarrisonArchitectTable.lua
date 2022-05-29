local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

--[[
	Description:
		The architect table in the Garrison is only automated for
		level 1 garrisons.
		
		We get the available plots for the Barracks building (ID: 26).
		We only want to try to place the Barracks once per character.
		We accomplish this by using the HelpMePlaySavesDB table and the
		"isGarrisonBarracksPlaced" key. If true, the Barracks has already
		been placed by the addon.
		
		If the Barracks hasn't already been placed, then place the building,
		play the default sound, then close the architect UI. We then save
		the placement so the addon doesn't continuously attempt to place it
		later.
]]--
e:RegisterEvent("GARRISON_ARCHITECT_OPENED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GARRISON_ARCHITECT_OPENED" then
		if HelpMePlayOptionsDB.GarrisonTables == false or HelpMePlayOptionsDB.GarrisonTables == nil then return end
		local garrisonLevel = C_Garrison.GetGarrisonInfo(2)
		if garrisonLevel == 1 then
			local plotsForBuilding = C_Garrison.GetPlotsForBuilding(26)
			if HelpMePlaySavesDB["isGarrisonBarracksPlaced"] == false or HelpMePlaySavesDB["isGarrisonBarracksPlaced"] == nil then
				for i = 1, #plotsForBuilding do
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