local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "UPDATE_MOUSEOVER_UNIT" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.NotesEnabled == false or HelpMePlayDB.NotesEnabled == nil then return false end
		if UnitGUID("mouseover") then
			local guid = UnitGUID("mouseover")
			if guid then
				local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
				for k,v in pairs(addonTable.NOTES) do
					if k == npcId then
						for i=1,GameTooltip:NumLines() do
							if string.find(_G[GameTooltip:GetName().."TextLeft"..i]:GetText(), addonName) then return end
						end
						GameTooltip:AddLine(L_GLOBALSTRINGS["Colored Addon Name"] .. ": " .. v)
						GameTooltip:Show()
					end
				end
			end
		end
	end
end)