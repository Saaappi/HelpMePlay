local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local animaPowers = {
	-- Only supports S Tier powers!
	[3] = { -- Hunter
		[331367] = "", -- Sigil of Skoldus
		[331197] = "", -- Soulforge Embers
		[335541] = "", -- Sling of the Unseen
		[319280] = "", -- Elethium Beacon
		[331370] = "", -- Soulsteel Pinion
		[305052] = "", -- Lens of Elchaver
	},
}

e:RegisterEvent("PLAYER_CHOICE_UPDATE")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_CHOICE_UPDATE" then
		local choiceOptionInfo = ""
		local mapId = C_Map.GetBestMapForUnit("player")
		local mapName = C_Map.GetMapInfo(mapId).name
		if mapName == L["Torghast"] then
			local choiceInfo = C_PlayerChoice.GetPlayerChoiceInfo()
			if choiceInfo then
				local _, _, classId = UnitClass("player")
				--local currentSpecIndex = GetSpecialization()
				for i = 1, choiceInfo.numOptions do
					choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(i)
					for class, tbl in pairs(animaPowers) do
						if class == classId then
							if tbl[choiceOptionInfo.spellID] then
								local _, _, spellIcon = GetSpellInfo(choiceOptionInfo.spellID)
								print("|cff00CCFF" .. addonName .. "|r: |T" .. spellIcon .. ":0|t" .. GetSpellLink(choiceOptionInfo.spellID) .. " " .. L["Torghast Power is S Tier"])
								--SendPlayerChoiceResponse(choiceOptionInfo.buttons[1].id)
								--HideUIPanel(PlayerChoiceFrame)
							end
						end
					end
				end
			end
		end
	end
end)