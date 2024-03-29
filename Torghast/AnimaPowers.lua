local addonName, addon = ...
local events = CreateFrame("Frame")

local function ShowPower(text, artID, spellLink, spellDescription)
	local ret = string.format("%s: |T%s:0|t %s (|cffFFD100%s|r)", text, artID, spellLink, spellDescription)
	print(ret)
	return
end

local function GetChoices()
	if ( UnitAffectingCombat("player") ) then
		C_Timer.After(addon.CONSTANTS["ONE_SECOND"], function()
			GetChoices()
		end)
	else
		local choices = C_PlayerChoice.GetCurrentPlayerChoiceInfo().options
		local unrankedPowers = {}
		local numChoices = #choices
		if ( numChoices == 1 ) then
			C_PlayerChoice.SendPlayerChoiceResponse(choices[1].buttons[1].id)
			HideUIPanel(PlayerChoiceFrame)
			ShowPower(addon.CONSTANTS.COLORED_ADDON_NAME, choices[1].choiceArtID, GetSpellLink(choices[1].spellID), GetSpellDescription(choices[1].spellID))
		else
			local _, _, classID = UnitClass("player")
			local specIndex = GetSpecialization()
			local specID = GetSpecializationInfo(specIndex)
			
			local bestPowerIndex = 0
			local highestPriority = 9
			local priority = 9 -- 1 = HIGHEST, 9 = LOWEST
			for i = 1, numChoices do
				if ( addon.ANIMAPOWERS[classID][specID][choices[i].spellID] ) then
					priority = addon.ANIMAPOWERS[classID][specID][choices[i].spellID]
					if ( priority < highestPriority ) then
						highestPriority = priority
						bestPowerIndex = i
					end
				else
					table.insert(unrankedPowers, i)
				end
			end
			
			if ( bestPowerIndex == 0 ) then
				bestPowerIndex = math.random(1, #unrankedPowers)
			end
			
			if ( HelpMePlayDB.TorghastPowersId == 1 ) then -- NOTIFY
				ShowPower(addon.CONSTANTS.COLORED_ADDON_NAME, choices[bestPowerIndex].choiceArtID, GetSpellLink(choices[bestPowerIndex].spellID), GetSpellDescription(choices[bestPowerIndex].spellID)) 
				highestPriority = 9
			elseif ( HelpMePlayDB.TorghastPowersId == 2 ) then -- AUTOMATIC
				ShowPower(addon.CONSTANTS.COLORED_ADDON_NAME, choices[bestPowerIndex].choiceArtID, GetSpellLink(choices[bestPowerIndex].spellID), GetSpellDescription(choices[bestPowerIndex].spellID)) 
				C_PlayerChoice.SendPlayerChoiceResponse(choices[bestPowerIndex].buttons[1].id)
				HideUIPanel(PlayerChoiceFrame)
				highestPriority = 9
			end
		end
	end
end

events:RegisterEvent("PLAYER_CHOICE_UPDATE")
events:SetScript("OnEvent", function(self, event, ...)
	if ( event == "PLAYER_CHOICE_UPDATE" ) then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.TorghastPowersId == 0 or HelpMePlayDB.TorghastPowersId == false or HelpMePlayDB.TorghastPowersId == nil then return end
		
		local mapID = C_Map.GetBestMapForUnit("player")
		if ( mapID ) then
			if ( C_Map.GetMapInfo(mapID).name == "Torghast" ) then
				GetChoices()
			end
		end
	end
end)