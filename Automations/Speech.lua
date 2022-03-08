local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function AddGlowToActionBarButton(button, glowTimer)
	ActionButton_ShowOverlayGlow(button)
	button:SetScript("OnClick", function()
		ActionButton_HideOverlayGlow(button)
	end)
	C_Timer.After(glowTimer, function()
		ActionButton_HideOverlayGlow(button)
	end)
end

e:RegisterEvent("CHAT_MSG_MONSTER_SAY")
e:RegisterEvent("RAID_BOSS_EMOTE")
e:RegisterEvent("RAID_BOSS_WHISPER")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_MONSTER_SAY" then
		if HelpMePlayOptionsDB.Speech == false or HelpMePlayOptionsDB.Speech == nil then return end
		local msg, monster = ...
		if monster == L_GLOBALSTRINGS["Playful Trickster"] then
			-- Quest: The Games We Play (Ardenweald)
			if string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Playful Trickster: Praise"])) then
				DoEmote("praise", nil)
			elseif string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Playful Trickster: Cheer"])) then
				DoEmote("cheer", nil)
			elseif string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Playful Trickster: Dance"])) then
				DoEmote("dance", nil)
			elseif string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Playful Trickster: Introduce"])) then
				DoEmote("bow", nil)
			elseif string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Playful Trickster: Thank"])) then
				DoEmote("thank", nil)
			elseif string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Playful Trickster: Flex"])) then
				DoEmote("flex", nil)
			end
		elseif monster == L_GLOBALSTRINGS["Al'dalil"] then
			-- Quest: Dead Drop (Bastion)
			if HelpMePlayOptionsDB.Speech == false then return end
			if string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Al'dalil: Buttons 1"])) or string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Al'dalil: Buttons 2"])) then
				AddGlowToActionBarButton(OverrideActionBarButton1, 2)
			elseif string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Al'dalil: Lever 1"])) or string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Al'dalil: Lever 2"])) then
				AddGlowToActionBarButton(OverrideActionBarButton2, 2)
			elseif string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Al'dalil: Bonk 1"])) or string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Al'dalil: Bonk 2"])) then
				AddGlowToActionBarButton(OverrideActionBarButton3, 2)
			end
		elseif monster == L_GLOBALSTRINGS["Trainer Ikaros"] then
			-- World Quest: We'll Make an Aspirant Out of You (Bastion)
			if HelpMePlayOptionsDB.Speech == false then return end
			if string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Trainer Ikaros: Jab"])) or string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Trainer Ikaros: Strike"])) then
				AddGlowToActionBarButton(OverrideActionBarButton1, 2)
			elseif string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Trainer Ikaros: Kick"])) or string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Trainer Ikaros: Sweep"])) then
				AddGlowToActionBarButton(OverrideActionBarButton2, 2)
			elseif string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Trainer Ikaros: Dodge"])) or string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Trainer Ikaros: Parry"])) then
				AddGlowToActionBarButton(OverrideActionBarButton3, 2)
			end
		end
	end
	if event == "RAID_BOSS_WHISPER" then
		if HelpMePlayOptionsDB.Speech == false or HelpMePlayOptionsDB.Speech == nil then return end
		local msg = ...
		if string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Taloned Flayedwing: Scared"])) then
			AddGlowToActionBarButton(OverrideActionBarButton1, 2)
		elseif string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Taloned Flayedwing: Shake"])) then
			AddGlowToActionBarButton(OverrideActionBarButton2, 2)
		elseif string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Taloned Flayedwing: Praise"])) then
			AddGlowToActionBarButton(OverrideActionBarButton3, 2)
		end
	end
	if event == "RAID_BOSS_EMOTE" then
		if HelpMePlayOptionsDB.Speech == false or HelpMePlayOptionsDB.Speech == nil then return end
		local msg = ...
		if string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Soul Eater: Shake"])) then
			AddGlowToActionBarButton(OverrideActionBarButton2, 2)
		elseif string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Soul Eater: Veer"])) then
			AddGlowToActionBarButton(OverrideActionBarButton1, 2)
		elseif string.find(string.lower(msg), string.lower(L_GLOBALSTRINGS["Soul Eater: Writhe"])) then
			AddGlowToActionBarButton(OverrideActionBarButton3, 2)
		end
	end
end)