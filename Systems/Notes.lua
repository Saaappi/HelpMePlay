local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local creatureDb = {
	[170080] = L_NOTES["Note: CLICK ME!"],		-- Exposed Boggart
	[159915] = L_NOTES["Note: CLICK ME!"],		-- Gatamatos
	[173806] = L_NOTES["Note: CLICK ME!"],		-- Gatamatos
	[161726] = L_NOTES["Note: CLICK ME!"],		-- Kael'thas Sunstrider (Sin #1)
	[161734] = L_NOTES["Note: CLICK ME!"],		-- Kael'thas Sunstrider (Sin #2)
	[161737] = L_NOTES["Note: CLICK ME!"],		-- Kael'thas Sunstrider (Sin #3)
	[164675] = L_NOTES["Note: Torghast Lever"],	-- Lever (Torghast Chest)
}

e:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "UPDATE_MOUSEOVER_UNIT" then
		if HelpMePlayOptionsDB.Notes == false or HelpMePlayOptionsDB.Notes == nil then return end
		if UnitGUID("mouseover") then
			local guid = UnitGUID("mouseover")
			if guid then
				local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
				for k,v in pairs(creatureDb) do
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