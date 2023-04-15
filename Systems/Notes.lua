local addonName, addonTable = ...
local e = CreateFrame("Frame")

local function NumKeys(tbl)
	local numKeys = 0
	for _ in pairs(tbl) do
		numKeys = numKeys + 1
	end
	return numKeys
end

e:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "UPDATE_MOUSEOVER_UNIT" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.NotesEnabled == false or HelpMePlayDB.NotesEnabled == nil then return false end
		if UnitGUID("mouseover") then
			local guid = UnitGUID("mouseover")
			if guid then
				local _, _, _, _, _, npcID = strsplit("-", guid); npcID = tonumber(npcID)
				for id, data in pairs(addonTable.NOTES) do
					if id == npcID then
						-- Check to see if the tooltip change has already been made.
						for i = 1, GameTooltip:NumLines() do
							if string.find(_G[GameTooltip:GetName().."TextLeft"..i]:GetText(), addonName) then return end
						end
						
						if data.conditions ~= false then
							local numConditions = NumKeys(data.conditions)
							for condition, criteria in pairs(data.conditions) do
								if condition == "level.lower" then
									if UnitLevel("player") < criteria then
										numConditions = numConditions - 1
									end
								elseif condition == "quests.incomplete" then
									local numQuests = #criteria
									for i = 1, numQuests do
										if not C_QuestLog.IsQuestFlaggedCompleted(criteria[i]) then
											numQuests = numQuests - 1
										end
									end
									
									if numQuests == 0 then
										numConditions = numConditions - 1
									end
								end
							end
							
							if numConditions == 0 then
								GameTooltip:AddLine("\n" .. data.note)
								GameTooltip:Show()
							end
						else
							GameTooltip:AddLine("\n" .. data.note)
							GameTooltip:Show()
						end
					end
				end
			end
		end
	end
end)