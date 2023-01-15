local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function ShowPower(text, artID, spellLink)
	local ret = string.format("%s: %s %s", text, artID, spellLink)
	print(ret)
	return
end

local function GetChoices()
	if UnitAffectingCombat("player") then
		C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
			GetChoices()
		end)
	end
	local choices = C_PlayerChoice.GetCurrentPlayerChoiceInfo().options
	return choices
end

local function AnimaPowerExistsForClass(classId, specId, desiredSpellId)
	for spellId, spellTier in pairs(addonTable.ANIMAPOWERS[classId][specId]) do
		if spellId == desiredSpellId then
			return true
		end
	end
	return false
end

e:RegisterEvent("PLAYER_CHOICE_UPDATE")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_CHOICE_UPDATE" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.TorghastPowersId == 0 or HelpMePlayDB.TorghastPowersId == false or HelpMePlayDB.TorghastPowersId == nil then return end
		
		local mapID = C_Map.GetBestMapForUnit("player")
		if mapID then
			if (C_Map.GetMapInfo(mapID).name) == "Torghast" then
				local powerInfo = ""
				local responseId = 0
				local bestPower = ""
				local bestPowerID = 0
				local unrankedPowers = {}
				
				------- REWRITTEN CODE
				local choices = GetChoices()
				local numChoices = #choices
				if numChoices == 1 then
					C_PlayerChoice.SendPlayerChoiceResponse(choices[1].buttons[1].id)
					HideUIPanel(PlayerChoiceFrame)
					ShowPower(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"], choices[1].choiceArtID, GetSpellLink(choices[1].spellID))
				else
					local _, _, classID = UnitClass("player")
					local specIndex = GetSpecialization()
					local specID = GetSpecializationInfo(specIndex)
					
					local bestPower = {}
					local highestPriority = 9
					local priority = 9 -- 1 = HIGHEST, 9 = LOWEST
					for i = 1, numChoices do
						if addonTable.ANIMAPOWERS[classID][specID][choices[i].spellID] then
							priority = addonTable.ANIMAPOWERS[classID][specID][choices[i].spellID]
							if priority < highestPriority then
								highestPriority = priority
								bestPower = choices[i]
							else
								table.insert(unrankedPowers, i)
							end
						end
					end
					
					if bestPower == {} then
						local randomNum = math.random(1, #unrankedPowers)
						bestPower = choices[math.random(1, #unrankedPowers)]
					end
					
					if HelpMePlayDB.TorghastPowersId == 1 then -- NOTIFY
						ShowPower(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"], bestPower.choiceArtID, GetSpellLink(bestPower.spellID)) 
						highestPriority = 9
					else
						ShowPower(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"], bestPower.choiceArtID, GetSpellLink(bestPower.spellID)) 
						C_PlayerChoice.SendPlayerChoiceResponse(bestPower.buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
						highestPriority = 9
					end
				end
				------- END
			end
		end
	end
end)