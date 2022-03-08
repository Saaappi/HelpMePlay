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
			local choiceOptionInfo = ""
			local unitGuid = UnitGUID("target") or UnitGUID("mouseover")
			if unitGuid then
				local _, _, _, _, _, npcId = strsplit("-", unitGuid); npcId = tonumber(npcId)
				if mapId == 1670 then -- Oribos
					if npcId == 174871 then -- Fatescribe Roh-Tahl (Threads of Fate or Story Mode Selection)
						if HelpMePlayOptionsDB.ThreadsOfFate then
							choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(1) -- Threads of Fate
							SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						else
							choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(2) -- Story Mode
							SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						end
					end
				elseif mapId == 543 then -- Gorgrond
					if HelpMePlayOptionsDB.GarrisonTables then
						-- Choose the Sparring Arena, otherwise
						-- choose nothing.
						choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(2);
						SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					end
				end
			else
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
				elseif mapId == 535 then -- Talador
					if HelpMePlayOptionsDB.GarrisonTables then
						-- Choose the Arsenal, otherwise
						-- choose nothing.
						choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(1)
						SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					end
				elseif mapId == 542 then -- Spires of Arak
					if HelpMePlayOptionsDB.GarrisonTables then
						-- Choose the Brewery, otherwise
						-- choose nothing.
						choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(1)
						SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					end
				elseif mapId == 1670 then -- Oribos
					if HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Kyrian"] then
						choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(1)
						SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					elseif HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Venthyr"] then
						choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(3)
						SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					elseif HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Necrolord"] then
						choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(5)
						SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					elseif HelpMePlayOptionsDB.Covenant == L_GLOBALSTRINGS["Night Fae"] then
						choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(7)
						SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					end
				end
			end
		end
	end
end)