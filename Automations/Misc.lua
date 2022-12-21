local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

-- Random and miscellaneous automations.
e:RegisterEvent("PLAYER_TARGET_CHANGED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_TARGET_CHANGED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		
		local randomNum = math.random(0, 1)
		if randomNum == 1 then
			local GUID = UnitGUID("target")
			if GUID then
				local type = string.split("-", GUID)
				if type == "Player" then
					DoEmote("wave", nil)
				end
			end
		end
	end
end)