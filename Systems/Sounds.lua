local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, addonLoaded)
	if event == "ADDON_LOADED" then
		if addonLoaded == addonName then
			if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
			if HelpMePlayDB.SoundsEnabled == false or HelpMePlayDB.SoundsEnabled == nil then return false end
			
			for soundID, _ in pairs(HelpMePlayDB.Sounds) do
				MuteSoundFile(soundID)
			end
		end
	end
end)