local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local animaPowers = {
	-- Only supports S Tier powers!
	--
	-- Hunter Only?
	331367, -- Sigil of Skoldus
	331197, -- Soulforge Embers
	335541, -- Sling of the Unseen
	319280, -- Elethium Beacon
	331370, -- Soulsteel Pinion
	305052, -- Lens of Elchaver
}

local function AnimaPowerExistsForClass(classId, desiredSpellId)
	for i = 1, #animaPowers do
		if animaPowers[i] == desiredSpellId then
			--print("|cff00CCFF" .. addonName .. "|r: |T" .. option.choiceArtID .. ":0|t" .. GetSpellLink(option.spellID) .. " " .. L["Torghast Power is S Tier"])
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
					local _, _, classId = UnitClass("player")
					for i = 1, choiceInfo.numOptions do
						local option = C_PlayerChoice.GetPlayerChoiceOptionInfo(i)
						if choiceInfo.numOptions == 1 then
							SendPlayerChoiceResponse(option.buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						end
						if option then
							if AnimaPowerExistsForClass(classId, option.spellID) then
								SendPlayerChoiceResponse(option.buttons[1].id)
								HideUIPanel(PlayerChoiceFrame)
								print("|cff00CCFF" .. addonName .. "|r: |T" .. option.choiceArtID .. ":0|t" .. GetSpellLink(option.spellID))
							end
						end
					end
				end
			end
		end
	end
end)