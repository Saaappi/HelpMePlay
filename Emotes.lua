local addonName, t = ...
local e = CreateFrame("Frame")

e:RegisterEvent("GOSSIP_SHOW")

local creatures = {
	[162553] = "flex", -- Runestone of Constructs
	[162559] = "kneel", -- Runestone of Rituals
	[162562] = "bleed", -- Runestone of Plague
	[162584] = "sneak", -- Runestone of Eyes
	[162592] = "salute", -- Runestone of Chosen
}

e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_SHOW" then
		local guid = UnitGUID("target")
		if guid then
			local _, _, _, _, _, creatureID = strsplit("-", guid); creatureID = tonumber(creatureID)
			for id, emote in pairs(creatures) do
				if id == creatureID then
					DoEmote(emote, nil)
				end
			end
		end
	end
end)