local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("PLAYER_CHOICE_UPDATE")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_CHOICE_UPDATE" then
		if PlayerChoiceFrame:IsVisible() then
			local mapId = C_Map.GetBestMapForUnit("player")
			if mapId == 1670 then
				-- Player is in Oribos
				local choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(1) -- Threads of Fate
				SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
				HideUIPanel(PlayerChoiceFrame)
			elseif mapId == 85 or mapId == 86 then
				-- Player is in Orgrimmar or Stormwind City.
				local choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(1) -- Enter the Dark Portal (Hopefully?)
				if choiceOptionInfo.choiceArtID == 1851147 then -- This is the Dark Portal option for Draenor
					SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
					HideUIPanel(PlayerChoiceFrame)
				end
			end
		end
	end
end)