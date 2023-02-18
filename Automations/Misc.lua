local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

-- Random and miscellaneous automations.
e:RegisterEvent("CHAT_MSG_WHISPER")
e:RegisterEvent("PLAYER_TARGET_CHANGED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_WHISPER" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.AutoInviteEnabled == false or HelpMePlayDB.AutoInviteEnabled == nil then return false end
		
		local msg, player = ...
		msg = string.lower(msg)
		if msg == HelpMePlayDB.InviteKeyword or (msg == "invite" or msg == "inv") then
			if C_PartyInfo.CanInvite() then
				if C_PartyInfo.IsPartyFull() == false then
					C_PartyInfo.InviteUnit(player)
				end
			end
		end
	end
	if event == "PLAYER_TARGET_CHANGED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.WaveAtPlayersEnabled == false or HelpMePlayDB.WaveAtPlayersEnabled == nil then return false end
		
		local randomNum = math.random(1, 3333)
		if randomNum <= 5 then
			local GUID = UnitGUID("target")
			if GUID and (GUID ~= UnitGUID("player")) then
				local type = string.split("-", GUID)
				if type == "Player" then
					DoEmote("wave", nil)
				end
			end
		end
	end
end)