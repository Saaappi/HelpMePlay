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
				PlayerChoiceFrame:Hide()
			end
		end
	end
end)