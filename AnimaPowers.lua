local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

local animaPowers = {
	[3] = { -- Hunter
		-- S Tier
		[331637] = L["PICK"], -- Sigil of Skoldus
		[336745] = L["PICK"], -- Soulforge Embers
		[335541] = L["PICK"], -- Sling of the Unseen
		[319280] = L["PICK"], -- Elethium Beacon
		[331370] = L["PICK"], -- Soulsteel Pinion
		[308193] = L["PICK"], -- Lens of Elchaver
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
				local classId = UnitClass("player").classIndex
				for i = 1, choiceInfo.numOptions do
					choiceOptionInfo = C_PlayerChoice.GetPlayerChoiceOptionInfo(i)
					for spellId, text in pairs(animaPowers) do
						if spellId == choiceOptionInfo.spellID then
							choiceOptionInfo.description = choiceOptionInfo.description .. " |cff5A93CC" .. text .. "|r"
						end
					end
				end
			end
		end
	end
end)