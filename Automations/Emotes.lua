local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("PLAYER_TARGET_CHANGED")

local creatures = {
	[41539]		= "whistle", 	-- Stolen Ram
	[162553] 	= "flex", 		-- Runestone of Constructs
	[162559] 	= "kneel", 		-- Runestone of Rituals
	[162562] 	= "bleed", 		-- Runestone of Plague
	[162584] 	= "sneak", 		-- Runestone of Eyes
	[162592] 	= "salute", 	-- Runestone of Chosen
}

e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_SHOW" then
		if HelpMePlayOptionsDB.Emotes == false or HelpMePlayOptionsDB.Emotes == nil then return end
		local guid = UnitGUID("target")
		if guid then
			local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
			for id, emote in pairs(creatures) do
				if id == npcId then
					DoEmote(emote, nil)
					GossipFrame:Hide()
				end
			end
		end
	end
	if event == "PLAYER_TARGET_CHANGED" then
		if HelpMePlayOptionsDB.Emotes == false or HelpMePlayOptionsDB.Emotes == nil then return end
		local guid = UnitGUID("target")
		if guid then
			local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
			for id, emote in pairs(creatures) do
				if id == npcId then
					DoEmote(emote, nil)
				end
			end
		end
	end
end)