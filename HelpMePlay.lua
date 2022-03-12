local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "ADDON_LOADED" then
		local addonLoaded = ...
		if addonLoaded == addonName then
			if HelpMePlayOptionsDB == nil then
				HelpMePlayOptionsDB = {}
			end
			if HelpMePlayOptionsDB.ChromieTimeExpansion == nil then
				HelpMePlayOptionsDB.ChromieTimeExpansion = 0
			end
			if HelpMePlayOptionsDB.TorghastPowers == nil or HelpMePlayOptionsDB.TorghastPowers == false then
				HelpMePlayOptionsDB.TorghastPowers = L_GLOBALSTRINGS["Disabled"]
			end
			if HelpMePlayOptionsDB.Covenant == nil or HelpMePlayOptionsDB.Covenant == false then
				HelpMePlayOptionsDB.Covenant = L_GLOBALSTRINGS["Disabled"]
			end
			if HelpMePlayOptionsDB.BFAZoneSelection == nil or HelpMePlayOptionsDB.BFAZoneSelection == false then
				HelpMePlayOptionsDB.BFAZoneSelection = L_GLOBALSTRINGS["Disabled"]
			end
			if HelpMePlayOptionsDB.SLZoneSelection == nil or HelpMePlayOptionsDB.SLZoneSelection == false then
				HelpMePlayOptionsDB.SLZoneSelection = L_GLOBALSTRINGS["Disabled"]
			end
			if HelpMePlayPlayerDialogDB == nil then
				HelpMePlayPlayerDialogDB = {}
			end
			if HelpMePlaySavesDB == nil then
				HelpMePlaySavesDB = {}
			end
			if HelpMePlayCharacterQuestsDB == nil then
				HelpMePlayCharacterQuestsDB = {}
			end
			if HelpMePlayOptionsDB.MinimapIcon then
				HelpMePlayShowMinimapIcon(false)
			end
		end
	end
end)