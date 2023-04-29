local addonName, addonTable = ...
local e = CreateFrame("Frame")

-- Random and miscellaneous automations.
e:RegisterEvent("CHAT_MSG_WHISPER")
e:RegisterEvent("CHAT_MSG_BN_WHISPER")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "CHAT_MSG_WHISPER" or event == "CHAT_MSG_BN_WHISPER" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.AutoInviteEnabled == false or HelpMePlayDB.AutoInviteEnabled == nil then return false end
		
		local msg, player, _, _, _, _, _, _, _, _, _, _, bnSenderID = ...
		msg = string.lower(msg)
		if msg == HelpMePlayDB.InviteKeyword or (msg == "invite" or msg == "inv") then
			if C_PartyInfo.CanInvite() then
				if C_PartyInfo.IsPartyFull() == false then
					if bnSenderID ~= nil and bnSenderID ~= "" then
						local accountInfo = C_BattleNet.GetAccountInfoByID(bnSenderID)
						if accountInfo then
							local gameAccountInfo = accountInfo.gameAccountInfo
							player = gameAccountInfo.characterName .. "-" .. gameAccountInfo.realmName
						end
					end
					C_PartyInfo.InviteUnit(player)
				end
			end
		end
	end
end)