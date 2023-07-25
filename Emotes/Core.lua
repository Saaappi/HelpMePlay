local addonName, addon = ...
local events = CreateFrame("Frame")

events:RegisterEvent("PLAYER_TARGET_CHANGED")
events:SetScript("OnEvent", function(self, event, ...)
	if ( event == "PLAYER_TARGET_CHANGED" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.EmotesEnabled == false or HelpMePlayDB.EmotesEnabled == nil then return false end

		local GUID = UnitGUID("target")
		if ( GUID ) then
			local _, _, _, _, _, npcID = strsplit("-", guid); npcID = tonumber(npcID)
			for id, t in pairs(addon.EMOTES) do
				if ( id == npcID ) then
					if ( t.emote == "dismount" ) then
						Dismount()
					else
						DoEmote(t.emote, nil)
					end
					break
				end
			end
		end
	end
end)