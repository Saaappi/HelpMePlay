local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("PLAYER_CHOICE_UPDATE")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_CHOICE_UPDATE" then
		if PlayerChoiceFrame:IsVisible() then
			local mapId = C_Map.GetBestMapForUnit("player")
			local choiceOptionInfo = ""
			if mapId == 1670 then
				-- Player is in Oribos
				if IsModifierKeyDown() then return end
				choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(1) -- Threads of Fate
				SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
				HideUIPanel(PlayerChoiceFrame)
			elseif mapId == 84 or mapId == 85 then
				-- Player is in Orgrimmar or Stormwind City.
				for i = 1, 3 do
					choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(i)
					if choiceOptionInfo.choiceArtID == 1851147 then -- This is the Dark Portal option for Draenor
						SendPlayerChoiceResponse(choiceOptionInfo.buttons[i].id)
						HideUIPanel(PlayerChoiceFrame)
						break
					end
				end
			elseif mapId == 543 then
				-- Player is in Gorgrond.
				choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(2) -- Savage Fight Club/Highpass Sparring Ring
				SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
				HideUIPanel(PlayerChoiceFrame)
			end
		end
	end
end)