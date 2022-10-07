local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function AnimaPowerExistsForClass(classId, specId, desiredSpellId)
	--[[
		Description:
			Determines if the current power has been transcribed
			in the anima power table.
			
			If so, its tier (1-n) is collected for later comparison.
			
			If not, it's ignored.
	]]--
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
				-- powerInfo holds all the information
				-- about an individual power in the
				-- current list of options.
				--
				-- The response ID is the number
				-- that represents which option
				-- needs to be selected based on
				-- the highest priority.
				--
				-- choiceInfo holds the entire
				-- anima power table from the
				-- current selection. The number
				-- of choices, info about the
				-- choices themselves, etc.
				--
				-- bestPower holds the power information
				-- for what's been determined to be the
				-- best (current) power.
				--
				-- unrankedPowers holds the index of a
				-- power that isn't in the table.
				-- These are then randomly selected at
				-- the end if all powers are unranked.
				--
				-- If choiceInfo is valid, then
				-- check the number of options
				-- available to pick. If 1, then
				-- simply take the power. We don't
				-- need to concern ourselves with
				-- other checks since there aren't
				-- other choices.
				--
				-- If there is more than 1 choice,
				-- then get the player's class and
				-- spec ID. These will be used against
				-- the Anima Power table where all
				-- powers are stored.
				--
				-- stackCount is used to consider
				-- whether power A or B or C should be
				-- taken if 2 or more powers are equal.
				-- The power with the lowest stack
				-- count will be the winner.
				--
				-- highestPriority is how powers are
				-- compared based on tier. An S-Tier power
				-- would have a priority value of 1, whereas
				-- a C-Tier power would have a priority
				-- value of 4. This defaults to 9 since
				-- there aren't 9 tiers of powers for
				-- any class/spec.
				--
				-- priority holds the priority value from
				-- the Anima Power table for the current
				-- power in the selections.
				--
				-- maxBuffs is the maximum number of buffs
				-- a player can have active. This is used
				-- to get the spell stack count later on.
				--
				-- If the current power is in the Anima
				-- Power table, then continue.
				--
				-- Grab the priority from the Anima Power
				-- table and assign it to the priority
				-- variable.
				--
				-- If the player is using the "Automatic (No Epic)"
				-- option for Torghast powers, then we need
				-- to ignore epic powers in the list when they
				-- show up. We do this by setting the priority
				-- of the power to 10 to guarantee it's never
				-- selected.
				--
				-- If the priority of the current power is less
				-- than the current HIGHEST priority (meaning
				-- the current power is better), then set the
				-- new highestPriority value, set the new responseId,
				-- and set bestPower to the current power. Also,
				-- get the stack count for the current power.
				--
				-- If the priority is equal to the current HIGHEST
				-- priority, then we'll attempt to use the stack
				-- count to break the tie. Remember, the power with
				-- the LOWEST stack count wins the tie.
				--
				-- If the bestPower variable is still equal to ""
				-- then all powers in the current selection are
				-- unranked powers.
				--
				-- If responseId has been set (meaning it's not the
				-- default value of 0), then let's continue.
				--
				-- If the player is using Notifications mode, then
				-- we shouldn't select the power. We should simply return
				-- it to the chat frame. Otherwise, pick it.
				local powerInfo = ""
				local responseId = 0
				local choiceInfo = C_PlayerChoice.GetPlayerChoiceInfo()
				local bestPower = ""
				local unrankedPowers = {}
				if choiceInfo then
					if choiceInfo.numOptions == 1 then
						bestPower = C_PlayerChoice.GetCurrentPlayerChoiceInfo()
						responseId = bestPower.options[1].buttons[1].id
						SendPlayerChoiceResponse(responseId)
						HideUIPanel(PlayerChoiceFrame)
					else
						local _, _, classId = UnitClass("player")
						local specIndex = GetSpecialization()
						local specId = GetSpecializationInfo(specIndex)
						local stackCount = 0
						local highestPriority = 9
						local priority = 0
						local maxBuffs = 44
						
						for i = 1, choiceInfo.numOptions do
							powerInfo = C_PlayerChoice.GetCurrentPlayerChoiceInfo()
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
							responseId = bestPower.options[randomNum].buttons[1].id
						end
					end

					if responseId ~= 0 then
						if HelpMePlayDB.TorghastPowersId == 1 then
							addonTable.Print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": |T" .. bestPower.options[1].choiceArtID .. ":0|t" .. GetSpellLink(bestPower.options[1].spellID))
							highestPriority = 9
						else
							SendPlayerChoiceResponse(responseId)
							HideUIPanel(PlayerChoiceFrame)
							addonTable.Print(L_GLOBALSTRINGS["Text.Output.ColoredAddOnName"] .. ": |T" .. bestPower.options[1].choiceArtID .. ":0|t" .. GetSpellLink(bestPower.options[1].spellID))
							highestPriority = 9
						end
					end
				end
			end
		end
	end
end)