local addonName, t = ...
local e = CreateFrame("Frame")

e:RegisterEvent("CHAT_MSG_MONSTER_SAY")

e:SetScript("OnEvent", function(self, event, ...)
	if (event == "CHAT_MSG_MONSTER_SAY") then
		local msg, monster = ...
		if (monster == "Playful Trickster") then
			if (string.find(msg, "Not so much as a word of praise! Hmph!")) then
				DoEmote("praise", nil)
			elseif (string.find(msg, "The other spriggans were all cheering my name for days!")) then
				DoEmote("cheer", nil)
			elseif (string.find(msg, "Dance with me!")) then
				DoEmote("dance", nil)
			elseif (string.find(msg, "Introductions are an important part of first impressions!")) then
				DoEmote("bow", nil)
			elseif (string.find(msg, "Some ask permission")) then
				DoEmote("thanks", nil)
			elseif (string.find(msg, "How strong he must have been!")) then
				DoEmote("flex", nil)
			end
		end
	end
end)