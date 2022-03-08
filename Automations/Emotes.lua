local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local creatures = {
	-- gossip: false if we don't want to process
	-- the GOSSIP_SHOW event for a particular NPC.
	-- true, otherwise.
	--
	-- emote: The emote to perform in game.
	[33224]		= { gossip=false, emote="kiss" }, 		-- Lake Frog
	[41539]		= { gossip=false, emote="whistle" }, 	-- Stolen Ram
	[162553] 	= { gossip=true, emote="flex" }, 		-- Runestone of Constructs
	[162559] 	= { gossip=true, emote="kneel" }, 		-- Runestone of Rituals
	[162562] 	= { gossip=true, emote="bleed" }, 		-- Runestone of Plague
	[162584] 	= { gossip=true, emote="sneak" }, 		-- Runestone of Eyes
	[162592] 	= { gossip=true, emote="salute" }, 		-- Runestone of Chosen
}

e:RegisterEvent("GOSSIP_SHOW")
e:RegisterEvent("PLAYER_TARGET_CHANGED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_SHOW" then
		if HelpMePlayOptionsDB.Emotes == false or HelpMePlayOptionsDB.Emotes == nil then return end
		local guid = UnitGUID("target")
		if guid then
			local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
			for id, t in pairs(creatures) do
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
			for id, t in pairs(creatures) do
				if id == npcId then
					DoEmote(t.emote, nil)
				end
			end
		end
	end
end)