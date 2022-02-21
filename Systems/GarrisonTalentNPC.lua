local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local titanResearchArchiveTalents = {
	-- Corrupted Mementos: 1744
	791, -- Orb Operation Manual (Rank 1) (100 CM)
	798, -- Expansive Mind (Rank 1) (150 CM)
	798, -- Expansive Mind (Rank 2) (250 CM)
	798, -- Expansive Mind (Rank 3) (400 CM)
	802, -- Clear Sight (Rank 1) (750 CM)
	802, -- Clear Sight (Rank 2) (900 CM)
	802, -- Clear Sight (Rank 3) (1100 CM)
	805, -- Elite Extermination (Rank 1) (1350 CM)
	806, -- Vision Hunter (Rank 1) (1800 CM)
	806, -- Vision Hunter (Rank 2) (2200 CM)
	806, -- Vision Hunter (Rank 3) (2700 CM)
	792, -- Gift of the Titans (Rank 1) (3300 CM)
	794, -- Singular Sanitation Expertise (Rank 1) (4200 CM)
	794, -- Singular Sanitation Expertise (Rank 2) (4800 CM)
	794, -- Singular Sanitation Expertise (Rank 3) (5500 CM)
	795, -- Emergency Cranial Defibrillation (Rank 1) (6500 CM)
	804, -- Experimental Destabilization (Rank 1) (6500 CM)
	804, -- Experimental Destabilization (Rank 2) (6500 CM)
	804, -- Experimental Destabilization (Rank 3) (6500 CM)
	800, -- Synchronized Mind Stabilizer (Rank 1) (6500 CM)
}
local boxOfManyThingsTalents = {
	-- Tower Knowledge: 1904
	1783, -- Blessing of the Ancients (Rank 1) (20 TK)
	1783, -- Blessing of the Ancients (Rank 2) (80 TK)
	1784, -- Freed from Torment (Rank 1) (40 TK)
	1794, -- Efficient Looter (Rank 1) (60 TK)
	1785, -- Empowered Perseverence (Rank 1) (40 TK)
	1787, -- Empowered Swiftness (Rank 1) (20 TK)
	1788, -- The Adamant Vaults (Rank 1) (100 TK)
	1783, -- Blessing of the Ancients (Rank 3) (200 TK)
	1789, -- Enduring Souls (Rank 1) (50 TK)
	1784, -- Freed from Torment (Rank 2) (200 TK)
	1785, -- Empowered Perseverence (Rank 2) (100 TK)
	1787, -- Empowered Swiftness (Rank 2) (60 TK)
	1790, -- Good Reflexes (Rank 1) (30 TK)
	1863, -- Elite Slayer (Rank 1) (40 TK)
	1861, -- Unflinching (Rank 1) (20 TK)
	1865, -- Anima Plunderer (Rank 1) (50 TK)
	1861, -- Unflinching (Rank 2) (100 TK)
	1861, -- Unflinching (Rank 3) (150 TK)
	1790, -- Good Reflexes (Rank 2) (80 TK)
	1786, -- Inexplicable Power (Rank 1) (20 TK)
	1786, -- Inexplicable Power (Rank 2) (40 TK)
	1865, -- Anima Plunderer (Rank 2) (200 TK)
	1864, -- Meddle With Fate (Rank 1) (40 TK)
	1878, -- Empowered Nova (Rank 1) (250 TK)
	1864, -- Meddle With Fate (Rank 2) (80 TK)
	1864, -- Meddle With Fate (Rank 3) (150 TK)
	1786, -- Inexplicable Power (Rank 3) (70 TK)
	1786, -- Inexplicable Power (Rank 4) (100 TK)
	1786, -- Inexplicable Power (Rank 5) (150 TK)
	1792, -- Discovered Cache (Rank 1) (20 TK)
	1792, -- Discovered Cache (Rank 2) (50 TK)
	1792, -- Discovered Cache (Rank 3) (80 TK)
	1793, -- Undeterred (Rank 1) (20 TK)
	1793, -- Undeterred (Rank 2) (40 TK)
	1793, -- Undeterred (Rank 3) (70 TK)
	1791, -- Death Denied (Rank 1) (20 TK)
	1791, -- Death Denied (Rank 2) (40 TK)
	1791, -- Death Denied (Rank 2) (70 TK)
	1793, -- Undeterred (Rank 4) (100 TK)
	1793, -- Undeterred (Rank 5) (150 TK)
}
local cypherOfTheFirstOnesTalents = {
	-- Cyphers of the First Ones: 1979
	1901, -- Metrial Understanding (Grants the ability to summon our friend, Pocopoc)
	1972, -- Cachial Understanding (Unlocks the 3rd World Quest of Zereth Mortis)
	1904, -- Aealic Understanding (Access to Enhancement Consoles in the zone for temporary buffs)
	1902, -- Altonian Understanding (Unlocks new quests, which means bonus currency from the zone)
	1932, -- Dealic Understanding (Unlocks Protoform Synthesis for battle pets)
	1931, -- Sopranian Understanding (Unlocks Protoform Synthesis for mounts)
}

local function PrintLine(text)
	print(L["Colored Addon Name"] .. ": " .. text)
end

local function CheckTalents(talentTree, currencyId)
	local currency = 0
	local talentInfo = ""
	for k, v in ipairs(talentTree) do
		talentInfo = C_Garrison.GetTalentInfo(v)
		if talentInfo.researched == false then
			-- The player doesn't have the talent
			-- researched, so let's move forward.
			currency = C_CurrencyInfo.GetCurrencyInfo(currencyId).quantity
			if currency > talentInfo["researchCurrencyCosts"][1].currencyQuantity then
				-- The player has enough currency
				-- to purchase the talent.
				if talentInfo.perkSpellID ~= 0 then
					if talentInfo.perkSpellID ~= 0 then
						PrintLine(L["Talent Purchase Text"] .. "\n" .. GetSpellLink(talentInfo.perkSpellID))
					else
						PrintLine(L["Talent Purchase Text"] .. talentInfo.name)
					end
					break
				end
			else
				-- Print to the chat frame how much
				-- currency the player
				-- will need for the next talent,
				-- then break from the loop.
				PrintLine(L["Talent Not Enough Currency Text"] .. talentInfo["researchCurrencyCosts"][1].currencyQuantity-currency .. " " .. "|T" .. talentInfo.icon .. ":0|t (" .. talentInfo.name .. ")")
				break
			end
		end
	end
end

local function GetTalentTreeInfo(talentTreeId)
	if talentTreeId == 271 then
		-- Titan Research Archive
		CheckTalents(titanResearchArchiveTalents, 1744)
	elseif talentTreeId == 461 then
		-- The Box of Many Things
		CheckTalents(boxOfManyThingsTalents, 1904)
	elseif talentTreeId == 474 then
		-- Cypher Research Console
		CheckTalents(cypherOfTheFirstOnesTalents, 1979)
	end
end

e:RegisterEvent("GARRISON_TALENT_NPC_OPENED")
e:RegisterEvent("GARRISON_TALENT_RESEARCH_STARTED")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "GARRISON_TALENT_NPC_OPENED" then
		if HelpMePlayOptionsDB.Talents == false or HelpMePlayOptionsDB.Talents == nil then return end
		local _, talentTreeId = ...
		GetTalentTreeInfo(talentTreeId)
	end
	
	if event == "GARRISON_TALENT_RESEARCH_STARTED" then
		if HelpMePlayOptionsDB.Talents == false or HelpMePlayOptionsDB.Talents == nil then return end
		local _, talentTreeId = ...
		GetTalentTreeInfo(talentTreeId)
	end
end)