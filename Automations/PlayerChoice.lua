local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("PLAYER_CHOICE_UPDATE")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_CHOICE_UPDATE" then
		if PlayerChoiceFrame:IsVisible() then
			local mapId = C_Map.GetBestMapForUnit("player")
			local choiceInfo = C_PlayerChoice.GetCurrentPlayerChoiceInfo()
			if choiceInfo then
				local _, _, _, _, _, id = string.split("-", choiceInfo.objectGUID); id = tonumber(id)
				
				if id == addonTable.PLAYERCHOICE["Fatescribe Roh-Tahl"] then
					if HelpMePlayOptionsDB.ThreadsOfFate then
						SendPlayerChoiceResponse(choiceInfo.options[1].buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					else
						SendPlayerChoiceResponse(choiceInfo.options[2].buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					end
				elseif id == addonTable.PLAYERCHOICE["Shadowlands Covenant Map: Covenant Selection"] then
					if HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Kyrian"] then
						SendPlayerChoiceResponse(choiceInfo.options[1].buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					elseif HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Venthyr"] then
						SendPlayerChoiceResponse(choiceInfo.options[2].buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					elseif HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Necrolord"] then
						SendPlayerChoiceResponse(choiceInfo.options[3].buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					elseif HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Night Fae"] then
						SendPlayerChoiceResponse(choiceInfo.options[4].buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					end
				end
			end
			--[[
			if mapId == 543 then -- Gorgrond
				if HelpMePlayOptionsDB.GarrisonTables then
					-- Choose the Sparring Arena, otherwise
					-- choose nothing.
					choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(2);
					SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
					HideUIPanel(PlayerChoiceFrame)
				end
			end
			-- Not every player choice is associated
			-- with an NPC, so these will be the
			-- player choices prompted by objects.
			if mapId == 84 or mapId == 85 then -- Orgrimmar / Stormwind City
				if HelpMePlayOptionsDB.AdventureMaps == false or HelpMePlayOptionsDB.AdventureMaps == nil then return end
				for i=1,3 do
					choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(i)
					if choiceOptionInfo.id == 1014 then
						-- This is the Tanaan Jungle (Dark Portal) option.
						SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
						break
					end
				end
			]]--
		end
	end
end)