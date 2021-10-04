local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("PLAYER_CHOICE_UPDATE")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_CHOICE_UPDATE" then
		if PlayerChoiceFrame:IsVisible() then
			local mapId = C_Map.GetBestMapForUnit("player")
			local choiceOptionInfo = ""
			local unitGuid = UnitGUID("target") or UnitGUID("mouseover")
			if unitGuid then
				local _, _, _, _, _, npcId = strsplit("-", unitGuid); npcId = tonumber(npcId)
				if mapId == 1670 then
					-- Oribos
					if npcId == 159478 then
						-- Tal-Inara (Covenant Selection)
						-- Do nothing. Let the player select their covenant.
						-- Perhaps in the future there will be a setting
						-- to control the selection of the covenant.
					elseif npcId == 174871 then
						-- Fatescribe Roh-Tahl (Threads of Fate or Story Mode Selection)
						if HelpMePlayOptionsDB.ThreadsOfFate then
							choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(1) -- Threads of Fate
							SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						else
							choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(2) -- Story
							SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						end
					end
				end
			else
				-- Not every player choice is associated
				-- with an NPC, so these will be the
				-- player choices prompted by objects.
				if mapId == 84 or mapId == 85 then
					-- Orgrimmar / Stormwind City
					if HelpMePlayOptionsDB.AdventureMaps == false then return end
					for i = 1, 3 do
						choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(i)
						if choiceOptionInfo.choiceArtID == 1851147 then -- This is the Dark Portal option for Draenor
							SendPlayerChoiceResponse(choiceOptionInfo.buttons[i].id)
							HideUIPanel(PlayerChoiceFrame)
							break
						end
					end
				elseif mapId == 535 then
					-- Talador
					if HelpMePlayOptionsDB.GarrisonTables then
						-- Choose the Arsenal, otherwise
						-- choose nothing.
						choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(1)
						SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					end
				elseif mapId == 542 then
					-- Spires of Arak
					if HelpMePlayOptionsDB.GarrisonTables then
						-- Choose the Brewery, otherwise
						-- choose nothing.
						choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(1)
						SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					end
				elseif mapId == 543 then
					-- Gorgrond
					if HelpMePlayOptionsDB.GarrisonTables then
						-- Choose the Sparring Arena, otherwise
						-- choose nothing.
						choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(2)
						SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					end
				end
			end
		end
	end
end)