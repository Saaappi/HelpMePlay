local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("CHAT_MSG_MONSTER_SAY")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_MONSTER_SAY" then
		if HelpMePlayOptionsDB.Speech == false then return end
		local msg, monster = ...
		if monster == L["Playful Trickster"] then
			-- Quest: The Games We Play (Ardenweald)
			if string.find(string.lower(msg), string.lower(L["Playful Trickster: Praise"])) then
				DoEmote("praise", nil)
			elseif string.find(string.lower(msg), string.lower(L["Playful Trickster: Cheer"])) then
				DoEmote("cheer", nil)
			elseif string.find(string.lower(msg), string.lower(L["Playful Trickster: Dance"])) then
				DoEmote("dance", nil)
			elseif string.find(string.lower(msg), string.lower(L["Playful Trickster: Introduce"])) then
				DoEmote("bow", nil)
			elseif string.find(string.lower(msg), string.lower(L["Playful Trickster: Thank"])) then
				DoEmote("thank", nil)
			elseif string.find(string.lower(msg), string.lower(L["Playful Trickster: Flex"])) then
				DoEmote("flex", nil)
			end
		elseif monster == L["Al'dalil"] then
			-- Quest: Dead Drop (Bastion)
			if string.find(string.lower(msg), string.lower(L["Al'dalil: Buttons 1"])) or string.find(string.lower(msg), string.lower(L["Al'dalil: Buttons 2"])) then
				ActionButton_ShowOverlayGlow(OverrideActionBarButton1)
				C_Timer.After(3, function()
					ActionButton_HideOverlayGlow(OverrideActionBarButton1)
				end)
			elseif string.find(string.lower(msg), string.lower(L["Al'dalil: Lever 1"])) or string.find(string.lower(msg), string.lower(L["Al'dalil: Lever 2"])) then
				ActionButton_ShowOverlayGlow(OverrideActionBarButton2)
				C_Timer.After(3, function()
					ActionButton_HideOverlayGlow(OverrideActionBarButton2)
				end)
			elseif string.find(string.lower(msg), string.lower(L["Al'dalil: Bonk 1"])) or string.find(string.lower(msg), string.lower(L["Al'dalil: Bonk 2"])) then
				ActionButton_ShowOverlayGlow(OverrideActionBarButton3)
				C_Timer.After(3, function()
					ActionButton_HideOverlayGlow(OverrideActionBarButton3)
				end)
			end
		elseif monster == L["Trainer Ikaros"] then
			-- World Quest: We'll Make an Aspirant Out of You (Bastion)
			if string.find(string.lower(msg), string.lower(L["Trainer Ikaros: Jab"])) or string.find(string.lower(msg), string.lower(L["Trainer Ikaros: Strike"])) then
				ActionButton_ShowOverlayGlow(OverrideActionBarButton1)
				C_Timer.After(3, function()
					ActionButton_HideOverlayGlow(OverrideActionBarButton1)
				end)
			elseif string.find(string.lower(msg), string.lower(L["Trainer Ikaros: Kick"])) or string.find(string.lower(msg), string.lower(L["Trainer Ikaros: Sweep"])) then
				ActionButton_ShowOverlayGlow(OverrideActionBarButton2)
				C_Timer.After(3, function()
					ActionButton_HideOverlayGlow(OverrideActionBarButton2)
				end)
			elseif string.find(string.lower(msg), string.lower(L["Trainer Ikaros: Dodge"])) or string.find(string.lower(msg), string.lower(L["Trainer Ikaros: Parry"])) then
				ActionButton_ShowOverlayGlow(OverrideActionBarButton3)
				C_Timer.After(3, function()
					ActionButton_HideOverlayGlow(OverrideActionBarButton3)
				end)
			end
		end
	end
end)