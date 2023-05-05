local addonName, addon = ...
local e = CreateFrame("Frame")

e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("PLAYER_TARGET_CHANGED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.EmotesEnabled == false or HelpMePlayDB.EmotesEnabled == nil then return false end
		local guid = UnitGUID("target")
		if guid then
			local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
			for id, t in pairs(addon.EMOTES) do
				if t.gossip then
					if id == npcId then
						DoEmote(t.emote, nil)
						GossipFrame:Hide()
					end
				end
			end
		end
	end
	if event == "PLAYER_TARGET_CHANGED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.EmotesEnabled == false or HelpMePlayDB.EmotesEnabled == nil then return false end
		local guid = UnitGUID("target")
		if guid then
			local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
			for id, t in pairs(addon.EMOTES) do
				if id == npcId then
					if t.emote == "dismount" then
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