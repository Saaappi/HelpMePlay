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
			if HelpMePlayOptionsDB.QuestRewards == nil or HelpMePlayOptionsDB.QuestRewards == false then
				HelpMePlayOptionsDB.QuestRewards = L_GLOBALSTRINGS["Disabled"]
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
			if HelpMePlayIgnoredCreaturesDB == nil then
				HelpMePlayIgnoredCreaturesDB = {}
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
			if HelpMePlayJunkerDB == nil then
				HelpMePlayJunkerDB = {}
				HelpMePlayOptionsDB["Junker"] = {}
			end
			if HelpMePlayJunkerBlacklistDB == nil then
				HelpMePlayJunkerBlacklistDB = {}
			end
			if HelpMePlayJunkerGlobalDB == nil then
				HelpMePlayJunkerGlobalDB = {}
			end
			if HelpMePlayJunkerGlobalBlacklistDB == nil then
				HelpMePlayJunkerGlobalBlacklistDB = {}
			end
			if HelpMePlayOptionsDB["Junker"]["Rarity"] == nil then
				HelpMePlayOptionsDB["Junker"]["Rarity"] = 0
			end
			if HelpMePlayOptionsDB["Junker"]["isSafeModeEnabled"] == nil then
				HelpMePlayOptionsDB["Junker"]["isSafeModeEnabled"] = true
			end
			if HelpMePlayOptionsDB.MinimapIcon then
				HelpMePlayShowMinimapIcon(true)
			end
		end
	end
end)