local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("CHAT_MSG_MONSTER_SAY")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_MONSTER_SAY" then
		local msg, monster = ...
		if monster == "Playful Trickster" then
			-- Quest: The Games We Play (Ardenweald)
			if string.find(msg, L["Playful Trickster: Praise"]) then
				DoEmote("praise", nil)
			elseif string.find(msg, L["Playful Trickster: Cheer"]) then
				DoEmote("cheer", nil)
			elseif string.find(msg, L["Playful Trickster: Dance"]) then
				DoEmote("dance", nil)
			elseif string.find(msg, L["Playful Trickster: Introduce"]) then
				DoEmote("bow", nil)
			elseif string.find(msg, L["Playful Trickster: Thank"]) then
				DoEmote("thank", nil)
			elseif string.find(msg, L["Playful Trickster: Flex"]) then
				DoEmote("flex", nil)
			end
		end
	end
end)