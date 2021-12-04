local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("CHAT_MSG_MONSTER_SAY")
e:RegisterEvent("RAID_BOSS_WHISPER")

local function AddGlowToActionBarButton(button, glowTimer)
	ActionButton_ShowOverlayGlow(button)
	button:SetScript("OnClick", function()
		ActionButton_HideOverlayGlow(button)
	end)
	C_Timer.After(glowTimer, function()
		ActionButton_HideOverlayGlow(button)
	end)
end

e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_MONSTER_SAY" then
		if HelpMePlayOptionsDB.Speech == false or HelpMePlayOptionsDB.Speech == nil then return end
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
			if HelpMePlayOptionsDB.Speech == false then return end
			if string.find(string.lower(msg), string.lower(L["Al'dalil: Buttons 1"])) or string.find(string.lower(msg), string.lower(L["Al'dalil: Buttons 2"])) then
				AddGlowToActionBarButton(OverrideActionBarButton1, 2)
			elseif string.find(string.lower(msg), string.lower(L["Al'dalil: Lever 1"])) or string.find(string.lower(msg), string.lower(L["Al'dalil: Lever 2"])) then
				AddGlowToActionBarButton(OverrideActionBarButton2, 2)
			elseif string.find(string.lower(msg), string.lower(L["Al'dalil: Bonk 1"])) or string.find(string.lower(msg), string.lower(L["Al'dalil: Bonk 2"])) then
				AddGlowToActionBarButton(OverrideActionBarButton3, 2)
			end
		elseif monster == L["Trainer Ikaros"] then
			-- World Quest: We'll Make an Aspirant Out of You (Bastion)
			if HelpMePlayOptionsDB.Speech == false then return end
			if string.find(string.lower(msg), string.lower(L["Trainer Ikaros: Jab"])) or string.find(string.lower(msg), string.lower(L["Trainer Ikaros: Strike"])) then
				AddGlowToActionBarButton(OverrideActionBarButton1, 2)
			elseif string.find(string.lower(msg), string.lower(L["Trainer Ikaros: Kick"])) or string.find(string.lower(msg), string.lower(L["Trainer Ikaros: Sweep"])) then
				AddGlowToActionBarButton(OverrideActionBarButton2, 2)
			elseif string.find(string.lower(msg), string.lower(L["Trainer Ikaros: Dodge"])) or string.find(string.lower(msg), string.lower(L["Trainer Ikaros: Parry"])) then
				AddGlowToActionBarButton(OverrideActionBarButton3, 2)
			end
		end
	end
	if event == "RAID_BOSS_WHISPER" then
		if HelpMePlayOptionsDB.Speech == false or HelpMePlayOptionsDB.Speech == nil then return end
		local msg = ...
		if string.find(string.lower(msg), string.lower(L["Taloned Flayedwing: Scared"])) then
			AddGlowToActionBarButton(OverrideActionBarButton1, 2)
		elseif string.find(string.lower(msg), string.lower(L["Taloned Flayedwing: Shake"])) then
			AddGlowToActionBarButton(OverrideActionBarButton2, 2)
		elseif string.find(string.lower(msg), string.lower(L["Taloned Flayedwing: Praise"])) then
			AddGlowToActionBarButton(OverrideActionBarButton3, 2)
		end
	end
end)