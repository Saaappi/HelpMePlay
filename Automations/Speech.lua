local name, addon = ...
local e = CreateFrame("Frame")

--[[
	Description:
		Adds the action button glow effect to the vehicle
		button that should be used, depending on what
		speech was used by the NPC.
]]--
local function AddGlowToActionBarButton(button)
	ActionButton_ShowOverlayGlow(button)
	button:SetScript("OnClick", function()
		ActionButton_HideOverlayGlow(button)
	end)
	C_Timer.After(addon.CONSTANTS["ONE_SECOND"], function()
		ActionButton_HideOverlayGlow(button)
	end)
end

e:RegisterEvent("CHAT_MSG_MONSTER_SAY")
e:RegisterEvent("RAID_BOSS_EMOTE")
e:RegisterEvent("RAID_BOSS_WHISPER")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_MONSTER_SAY" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.SpeechEnabled == false or HelpMePlayDB.SpeechEnabled == nil then return false end
		local msg = ...
		for k,v in pairs(addon.SPEECH) do
			if string.find(string.lower(msg), string.lower(k)) then
				if v.type == "emote" then
					DoEmote(v.emote, nil)
				elseif v.type == "glow" then
					if v.button == 1 then
						AddGlowToActionBarButton(OverrideActionBarButton1)
					elseif v.button == 2 then
						AddGlowToActionBarButton(OverrideActionBarButton2)
					elseif v.button == 3 then
						AddGlowToActionBarButton(OverrideActionBarButton3)
					end
				end
				
				break
			end
		end
	end
	if event == "RAID_BOSS_WHISPER" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.SpeechEnabled == false or HelpMePlayDB.SpeechEnabled == nil then return false end
		local msg = ...
		for k,v in pairs(addon.SPEECH) do
			if string.find(string.lower(msg), string.lower(k)) then
				if v.type == "glow" then
					if v.button == 1 then
						AddGlowToActionBarButton(OverrideActionBarButton1)
					elseif v.button == 2 then
						AddGlowToActionBarButton(OverrideActionBarButton2)
					elseif v.button == 3 then
						AddGlowToActionBarButton(OverrideActionBarButton3)
					end
				end
				break
			end
		end
	end
	if event == "RAID_BOSS_EMOTE" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.SpeechEnabled == false or HelpMePlayDB.SpeechEnabled == nil then return false end
		local msg = ...
		for k,v in pairs(addon.SPEECH) do
			if string.find(string.lower(msg), string.lower(k)) then
				if v.type == "glow" then
					if v.button == 1 then
						AddGlowToActionBarButton(OverrideActionBarButton1)
					elseif v.button == 2 then
						AddGlowToActionBarButton(OverrideActionBarButton2)
					elseif v.button == 3 then
						AddGlowToActionBarButton(OverrideActionBarButton3)
					end
				end
				break
			end
		end
	end
end)