local addonName, t = ...
local e = CreateFrame("Frame")

e:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")

e:SetScript("OnEvent", function(self, event, ...)
	if (event == "CHAT_MSG_MONSTER_EMOTE") then
		local msg, monster = ...
		if (monster == "Gunn Gorgebone") then
			if (string.find(msg, "Look at that form!")) then
				--ExtraActionButton1:Click()
			end
		end
	end
end)