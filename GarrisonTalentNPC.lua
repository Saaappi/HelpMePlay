local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local boxOfManyThingsTalents = {
	[1783] = {}, -- Blessing of the Ancients
	[1784] = {}, -- Freed from Torment
	[1785] = {}, -- Empowered Perseverence
	[1786] = {}, -- Inexplicable Power
	[1787] = {}, -- Empowered Swiftness
	[1788] = {}, -- The Adamant Vaults
	[1789] = {}, -- Enduring Souls
	[1790] = {}, -- Good Reflexes
	[1791] = {}, -- Death Denied
	[1792] = {}, -- Discovered Cache
	[1793] = {}, -- Undeterred
	[1794] = {}, -- Efficient Looter
	[1861] = {}, -- Unflinching
	[1863] = {}, -- Elite Slayer
	[1864] = {}, -- Meddle With Fate
	[1865] = {}, -- Anima Plunderer
	[1878] = {}, -- Empowered Nova
}

e:RegisterEvent("GARRISON_TALENT_NPC_OPENED")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "GARRISON_TALENT_NPC_OPENED" then
		local _, talentTreeId = ...
		if talentTreeId == 461 then
			-- The Box of Many Things
			local talentRank = 0
			local talents = C_Garrison.GetTalentTreeInfo(talentTreeId).talents
			--[[for _, t in ipairs(talents) do
				talentRank = C_Garrison.GetTalentInfo(t.id).talentRank
				print(C_Garrison.GetTalentInfo(t.id).name .. ": " .. t.id)
			end]]
		end
	end
end)