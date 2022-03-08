local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

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
				HelpMePlayOptionsDB.TorghastPowers = L["Disabled"]
			end
			if HelpMePlayOptionsDB.Covenant == nil or HelpMePlayOptionsDB.Covenant == false then
				HelpMePlayOptionsDB.Covenant = L["Disabled"]
			end
			if HelpMePlayPlayerDialogDB == nil then
				HelpMePlayPlayerDialogDB = {}
			end
			if HelpMePlayQuestObjectivesDB == nil then
				HelpMePlayQuestObjectivesDB = {}
			end
			if HelpMePlaySavesDB == nil then
				HelpMePlaySavesDB = {}
			end
			if HelpMePlayCharacterQuestsDB == nil then
				HelpMePlayCharacterQuestsDB = {}
			end
			if HelpMePlayCreaturesDB == nil then
				HelpMePlayCreaturesDB = {}
			end
			if HelpMePlayOptionsDB.MinimapIcon then
				HelpMePlayShowMinimapIcon(false)
			end
		end
	end
end)