local addonName, addonTable = ...
local lib = _G.LibStub("LibObjectiveProgress-1.0")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function AddWeightToTooltip(self)
	if HelpMePlayOptionsDB.Weights == false or HelpMePlayOptionsDB.Weights == nil then return end
	C_Timer.After(0.1, function()
		if not self or not self.NumLines or self:NumLines() == 0 then return end

		local name, unit = self:GetUnit()
		if not unit then return end

		local GUID = UnitGUID(unit)
		if not GUID or GUID == "" then return end

		local npcID = select(6, ("-"):split(GUID))
		if not npcID or npcID == "" then return end

		local weightsTable = lib:GetNPCWeightByCurrentQuests(tonumber(npcID))
		if not weightsTable then return end

		for questID, npcWeight in next, weightsTable do
			local questTitle = QuestUtils_GetQuestName(questID)
			for j = 1, self:NumLines() do
				if _G["GameTooltipTextLeft" .. j] and _G["GameTooltipTextLeft" .. j]:GetText() == questTitle then
					_G["GameTooltipTextLeft" .. j]:SetText(_G["GameTooltipTextLeft" .. j]:GetText() .. " - " .. tostring(math.floor((npcWeight * 100) + 0.5) / 100) .. "%")
				end
			end
		end
	end)
	
end

GameTooltip:HookScript("OnTooltipSetUnit", AddWeightToTooltip)