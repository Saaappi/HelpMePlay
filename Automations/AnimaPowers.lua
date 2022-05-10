local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

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
		if HelpMePlayOptionsDB.TorghastPowers == "Disabled" or HelpMePlayOptionsDB.TorghastPowers == false or HelpMePlayOptionsDB.TorghastPowers == nil then return end
		local choiceOptionInfo = ""
		local mapId = C_Map.GetBestMapForUnit("player")
		if mapId then
			local mapName = C_Map.GetMapInfo(mapId).name
			if mapName == L_GLOBALSTRINGS["Torghast"] then
				local choiceInfo = C_PlayerChoice.GetPlayerChoiceInfo()
				if choiceInfo then
					-- Anima Powers are sectioned off by
					-- class and specialization, so get
					-- the player's class and specialization
					-- IDs.
					local _, _, classId = UnitClass("player")
					local specIndex = GetSpecialization()
					local specId = GetSpecializationInfo(specIndex)
					
					-- The stack count is how many stacks
					-- of the spell the player has applied.
					local stackCount = 0
					
					-- Highest priority is based on the
					-- spell's tier. This means the spell
					-- with the lowest number is more
					-- important.
					--
					-- There aren't 9 tiers to Anima Powers
					-- so set the default to 9 as a starting
					-- value.
					local highestPriority = 9
					
					-- The response ID is the number
					-- that represents which option
					-- needs to be selected based on
					-- the highest priority.
					local responseId = 0
					
					-- All the info about a spell is stored
					-- in this variable.
					local option = ""
					
					-- We need something to hold the best option
					-- in memory.
					local bestPower = ""
					
					for i=1,choiceInfo.numOptions do
						option = C_PlayerChoice.GetPlayerChoiceOptionInfo(i)
						if choiceInfo.numOptions == 1 then
							responseId = option.buttons[1].id
							SendPlayerChoiceResponse(option.buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						end
						if option then
							if AnimaPowerExistsForClass(classId, specId, option.spellID) then
								-- The spell exists in the table, so
								-- let's check its assigned priority.
								local priority = addonTable.ANIMAPOWERS[classId][specId][option.spellID]
								
								-- We have to take into consideration
								-- if the player is using the
								-- "Automatic (No Epic)" setting.
								--
								-- If the priority is higher than the
								-- previous spell, then assign the
								-- highest priority for selection.
								--
								-- If the priority is the same as the
								-- highest priority, then the current
								-- Anima Power is on the same tier
								-- as the previous. In this situation
								-- the addon must determine which
								-- spell has the higher current stack
								-- count. The stack count needs to be
								-- set to the new count in case a
								-- future power, if available, is also
								-- on the same tier.
								if HelpMePlayOptionsDB.TorghastPowers == "Automatic (No Epic)" then
									if option.rarity == 3 then
										-- 1 is Green, 2 is Blue, etc.
										-- Epic powers should be given
										-- a low priority here. 1 is Best
										-- 10 is Worst.
										priority = 10
									end
								end
								if priority < highestPriority then
									highestPriority = priority
									responseId = option.buttons[1].id
									bestPower = option
									for j=1,44 do
										local _, icon, count, _, _, _, _, _, _, spellId = UnitAura("player", i, "MAW")
										if spellId == option.spellID then
											stackCount = count
											break
										end
									end
								elseif priority == highestPriority then
									for j=1,44 do
										local _, icon, count, _, _, _, _, _, _, spellId = UnitAura("player", i, "MAW")
										if spellId == option.spellID then
											if count < stackCount then
												stackCount = count
												responseId = option.buttons[1].id
												bestPower = option
												break
											end
										end
									end
								end
							end
						end
					end
					-- Select the power that should be chosen
					-- by index, hide the player choice UI, then
					-- print the chosen power to the chat frame.
					--
					-- Reset the highest priority back to 10 to
					-- prevent taint between Anima Powers.
					if responseId ~= 0 then
						if HelpMePlayOptionsDB.Logging then
							if bestPower then
								-- There will be times when a "best" power isn't available.
								-- These circumstances will likely be when a power isn't
								-- in the database.
								if HelpMePlayOptionsDB.TorghastPowers == "Notifications" then
									print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": |T" .. bestPower.choiceArtID .. ":0|t" .. GetSpellLink(bestPower.spellID))
									highestPriority = 9
								else
									SendPlayerChoiceResponse(responseId)
									HideUIPanel(PlayerChoiceFrame)
									print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": |T" .. bestPower.choiceArtID .. ":0|t" .. GetSpellLink(bestPower.spellID))
									highestPriority = 9
								end
							else
								print(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. L_GLOBALSTRINGS["No Best Anima Power Available"])
							end
						end
					end
				end
			end
		end
	end
end)