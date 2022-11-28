local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addon)
	if event == "ADDON_LOADED" and addon == "Blizzard_ClassTalentUI" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		
		for i=1, #addonTable.WARRIOR_TALENTS do
			print(addonTable.WARRIOR_TALENTS[i]["t"])
			LearnTalent(addonTable.WARRIOR_TALENTS[i]["t"])
		end
	end
end)