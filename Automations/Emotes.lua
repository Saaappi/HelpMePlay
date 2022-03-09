local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("PLAYER_TARGET_CHANGED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_SHOW" then
		if HelpMePlayOptionsDB.Emotes == false or HelpMePlayOptionsDB.Emotes == nil then return end
		local guid = UnitGUID("target")
		if guid then
			local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
			for id, t in pairs(addonTable.EMOTES) do
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
		if HelpMePlayOptionsDB.Emotes == false or HelpMePlayOptionsDB.Emotes == nil then return end
		local guid = UnitGUID("target")
		if guid then
			local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
			for id, t in pairs(addonTable.EMOTES) do
				if id == npcId then
					DoEmote(t.emote, nil)
				end
			end
		end
	end
end)