local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("PLAYER_LEVEL_CHANGED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_LEVEL_CHANGED" then
		if HelpMePlayOptionsDB.Talents == false or HelpMePlayOptionsDB.Talents == nil then return end
		local _, newLevel = ...
		if newLevel % 5 == 0 then
			-- The player's level is evenly divisible
			-- by 5, so let's see if they have unspent
			-- talents.
			if GetNumUnspentTalents() > 0 then
				-- The player has an unspent talent,
				-- so let's get their class and spec.
				local _, _, classId = UnitClass("player")
				local specIndex = GetSpecialization()
				local specId = GetSpecializationInfo(specIndex)
				
				-- Congratulate the player for reaching a talent
				-- level, then print the suggested talent.
				if HelpMePlayOptionsDB.Logging then
					print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. string.format(L_GLOBALSTRINGS["Level Congrats Text"], newLevel, GetSpellLink(addonTable.TALENTS[classId][specId][newLevel])))
				end
			end
		end
	end
end)