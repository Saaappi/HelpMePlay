local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local animaPowers = {
	[3] = { -- Hunter
		-- S Tier Powers
		[331367] = 1, -- Sigil of Skoldus
		[331197] = 1, -- Soulforge Embers
		[335541] = 1, -- Sling of the Unseen
		[319280] = 1, -- Elethium Beacon
		[331370] = 1, -- Soulsteel Pinion
		[305052] = 1, -- Lens of Elchaver
		-- A Tier Powers
		[331369] = 2, -- Acrobat's Razor
		[331455] = 2, -- Amplifying Mirror
		[331187] = 2, -- Cadaverous Cleats
		[331300] = 2, -- Chelonian Crest
		[331192] = 2, -- Necrotic Venom
		[314243] = 2, -- Deadsoul Aspect (Kyrian)
		[314247] = 2, -- Pact of the Soulstalkers (Kyrian, Group)
		[314245] = 2, -- Super Soul Scope (Kyrian)
		[314242] = 2, -- Deathwire (Kyrian)
		[335566] = 2, -- Bag of Munitions (Necrolord)
		[342818] = 2, -- Mask of Withering (Venthyr)
		[342779] = 2, -- Crystallized Dreams (Night Fae)
		[308194] = 2, -- Finger of Frozen Fury)
		[319287] = 2, -- Elethium Lantern
		[319041] = 2, -- Elethium Weights
		[285479] = 2, -- Flame Jet
		-- B Tier Powers
		[331179] = 3, -- Acrobat's Rations
		[331338] = 3, -- Petrified Pet Food
		[331355] = 3, -- Craven Strategem
		[331365] = 3, -- Deadeye Satchel
		[331283] = 3, -- Peltsman's Grit
		[331183] = 3, -- Piercing Scope
		[313882] = 3, -- Huntmaster's Gift
		[313886] = 3, -- Huntmaster's Mythos
		[313887] = 3, -- Huntmaster's Ultimatum
		[335611] = 3, -- Capsule of Pure Moonlight (Night Fae)
		[335608] = 3, -- Majestic Antler Fragment (Night Fae)
		[325867] = 3, -- Parliament Stone (Kyrian)
		[342799] = 3, -- Gnarled Key (Venthyr)
		[342789] = 3, -- Smuggled Wildseed (Night Fae)
		[337613] = 3, -- Erratic Howler
		[319288] = 3, -- Elethium Censer
		[319056] = 3, -- Elethium Veil
		-- C Tier Powers
		[331186] = 4, -- Beaststalker's Signet
		[331476] = 4, -- Bag of Mawrat Eyes
		[331287] = 4, -- Bursting Tar
		[331190] = 4, -- Euphoria Emblem
		[331463] = 4, -- Fogged Crystal
		[331296] = 4, -- Forsworn Feather
		[335632] = 4, -- Deathdealer's Scope (Venthyr)
		[335620] = 4, -- Serrated Arrowhead (Venthyr)
		[335557] = 4, -- Pendulum of Impending Doom (Necrolord)
		[342632] = 4, -- Malevolent Stitching (Necrolord)
		[342664] = 4, -- Musophobic Femur (Necrolord)
		[342710] = 4, -- Volatile Flesh (Necrolord)
		[319279] = 4, -- Elethium Alembic
		[315288] = 4, -- Frostbite Wand
		-- D Tier Powers
		[331357] = 5, -- Hateful Shard-Ring 
		[322852] = 5, -- Hunter's Spoils
		[331181] = 5, -- Sticky Tar
		[342556] = 5, -- Stuffed on Mawrats
		[313881] = 5, -- Huntmaster's Cypher
		[313885] = 5, -- Huntmaster's Legacy
		[335562] = 5, -- Chakram Throwers (Necrolord)
		[335600] = 5, -- Glowing Pollen Satchel (Night Fae)
		[325890] = 5, -- Darksight Orbs (Kyrian)
		[325830] = 5, -- Bottomless Chalice (Kyrian)
		[325800] = 5, -- Phial of Light (Kyrian)
		[325801] = 5, -- Phial of Pain (Kyrian)
		[325887] = 5, -- Strigidium (Kyrian)
		[342793] = 5, -- Murmuring Shawl (Venthyr)
		[300793] = 5, -- Open Doors (Venthyr)
		[342757] = 5, -- Clinging Fog (Night Fae)
		[338512] = 5, -- Gaze of Death
		[304996] = 5, -- Frostchipper
		-- E Tier Powers
		[331185] = 6, -- Bone Barbs
		[331193] = 6, -- Feline Femur
		[313884] = 6, -- Huntmaster's Invocation
		[313883] = 6, -- Huntmaster's Lesson
		[335630] = 6, -- Blood-soaked Bow String (Venthyr)
		-- F Tier Powers
		[342540] = 7, -- Neural Pet Enhancer
		[331194] = 7, -- Scaredy Rat
		[314247] = 7, -- Pact of the Soulstalkers (Kyrian, Solo)
		[306609] = 7, -- Disemboweler's Hook
		[319276] = 7, -- Elethium Muzzle
	},
}

local function AnimaPowerExistsForClass(classId, desiredSpellId)
	for spellId, spellTier in pairs(animaPowers[classId]) do
		if spellId == desiredSpellId then
			return true
		end
	end
	return false
end

e:RegisterEvent("PLAYER_CHOICE_UPDATE")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_CHOICE_UPDATE" then
		if HelpMePlayOptionsDB.TorghastPowers == false then return end
		local choiceOptionInfo = ""
		local mapId = C_Map.GetBestMapForUnit("player")
		if mapId then
			local mapName = C_Map.GetMapInfo(mapId).name
			if mapName == L["Torghast"] then
				local choiceInfo = C_PlayerChoice.GetPlayerChoiceInfo()
				if choiceInfo then
					-- Anima Powers are sectioned off by
					-- class, so get the player's class
					-- ID.
					local _, _, classId = UnitClass("player")
					
					-- The stack count is how many stacks
					-- of the spell the player has applied.
					local stackCount = 0
					
					-- Highest priority is based on the
					-- spell's tier. This means the spell
					-- with the lowest number is more
					-- important.
					--
					-- There aren't 10 tiers to Anima Powers
					-- so set the default to 10 as a starting
					-- value.
					local highestPriority = 10
					
					-- The response ID is the number
					-- that represents which option
					-- needs to be selected based on
					-- the highest priority.
					local responseId = 0
					
					-- All the info about a spell is stored
					-- in this variable.
					local option = ""
					
					for i = 1, choiceInfo.numOptions do
						option = C_PlayerChoice.GetPlayerChoiceOptionInfo(i)
						if choiceInfo.numOptions == 1 then
							responseId = option.buttons[1].id
							SendPlayerChoiceResponse(option.buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						end
						if option then
							if AnimaPowerExistsForClass(classId, option.spellID) then
								-- The spell exists in the table, so
								-- let's check its assigned priority.
								local priority = animaPowers[classId][option.spellID]
								
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
								if priority < highestPriority then
									highestPriority = priority
									responseId = option.buttons[1].id
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
						SendPlayerChoiceResponse(responseId)
						HideUIPanel(PlayerChoiceFrame)
						print("|cff00CCFF" .. addonName .. "|r: |T" .. option.choiceArtID .. ":0|t" .. GetSpellLink(option.spellID))
						highestPriority = 10
					end
				end
			end
		end
	end
end)