local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function ShowPower(text, artID, spellLink)
	local ret = string.format("%s: %s %s", text, artID, spellLink)
	print(ret)
	return
end

local function GetChoices()
	C_Timer.After(addonTable.CONSTANTS["HALF_SECOND"], function()
		if UnitAffectingCombat("player") then
			GetChoices()
		end
		local choices = C_PlayerChoice.GetCurrentPlayerChoiceInfo().options
		return choices
	end)
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
		local mapId = C_Map.GetBestMapForUnit("player")
		if mapId then
			local mapName = C_Map.GetMapInfo(mapId).name
			if mapName == L_GLOBALSTRINGS["Torghast"] then
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
				end
				------- END
				if choices then
					local numOptions = #choiceInfo.options
					if numOptions == 1 then
						bestPower = C_PlayerChoice.GetCurrentPlayerChoiceInfo()
						responseId = bestPower.options[1].buttons[1].id
						C_PlayerChoice.SendPlayerChoiceResponse(responseId)
						HideUIPanel(PlayerChoiceFrame)
						addonTable.Print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": |T" .. bestPower[1].choiceArtID .. ":0|t" .. GetSpellLink(bestPower[1].spellID))
					else
						local _, _, classId = UnitClass("player")
						local specIndex = GetSpecialization()
						local specId = GetSpecializationInfo(specIndex)
						local stackCount = 0
						local highestPriority = 9
						local priority = 0
						local maxBuffs = 44
						
						for i = 1, numOptions do
							powerInfo = choiceInfo
							if powerInfo then
								if addonTable.ANIMAPOWERS[classId][specId][powerInfo.options[i].spellID] then
									local priority = addonTable.ANIMAPOWERS[classId][specId][powerInfo.options[i].spellID]
									
									if HelpMePlayDB.TorghastPowersId == 2 then
										if powerInfo.options[i].rarity == 3 then
											priority = 10
										end
									end
									
									if priority < highestPriority then
										highestPriority = priority
										responseId = powerInfo.options[i].buttons[1].id
										bestPower = powerInfo
										bestPowerID = i
										
										for j = 1, maxBuffs do
											local _, _, count, _, _, _, _, _, _, spellId = UnitAura("player", j, "MAW")
											if spellId == powerInfo.options[i].spellID then
												stackCount = count
												break
											end
										end
									elseif priority == highestPriority then
										for j = 1, maxBuffs do
											local _, _, count, _, _, _, _, _, _, spellId = UnitAura("player", j, "MAW")
											if spellId == powerInfo.options[i].spellID then
												if count < stackCount then
													stackCount = count
													responseId = powerInfo.options[i].buttons[1].id
													bestPower = powerInfo
													bestPowerID = i
													break
												end
											end
										end
									end
								else
									table.insert(unrankedPowers, i)
								end
							end
						end
						
						if bestPower == "" then
							local randomNum = math.random(1, #unrankedPowers)
							bestPower = C_PlayerChoice.GetCurrentPlayerChoiceInfo()
							bestPowerID = randomNum
							responseId = bestPower.options[randomNum].buttons[1].id
						end
					end

					if responseId ~= 0 then
						if HelpMePlayDB.TorghastPowersId == 1 then
							addonTable.Print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": |T" .. bestPower.options[bestPowerID].choiceArtID .. ":0|t" .. GetSpellLink(bestPower.options[bestPowerID].spellID))
							highestPriority = 9
						else
							addonTable.Print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": |T" .. bestPower.options[bestPowerID].choiceArtID .. ":0|t" .. GetSpellLink(bestPower.options[bestPowerID].spellID))
							C_PlayerChoice.SendPlayerChoiceResponse(responseId)
							HideUIPanel(PlayerChoiceFrame)
							highestPriority = 9
						end
					end
				end
			end
		end
	end
end)