local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local creatureDb = {
	[170080] = { -- Exposed Boggart
		["t"] = "note",
		["n"] = L_NOTES["Note: Exposed Boggart"],
	},
	[159915] = { -- Gatamatos
		["t"] = "note",
		["n"] = L_NOTES["Note: CLICK ME!"],
	},
	[173806] = { -- Gatamatos
		["t"] = "note",
		["n"] = L_NOTES["Note: CLICK ME!"],
	},
	[161726] = { -- Kael'thas Sunstrider (Sin #1)
		["t"] = "note",
		["n"] = L_NOTES["Note: CLICK ME!"],
	},
	[161734] = { -- Kael'thas Sunstrider (Sin #2)
		["t"] = "note",
		["n"] = L_NOTES["Note: CLICK ME!"],
	},
	[161737] = { -- Kael'thas Sunstrider (Sin #3)
		["t"] = "note",
		["n"] = L_NOTES["Note: CLICK ME!"],
	},
	[164675] = { -- Lever (Torghast Chest)
		["t"] = "note",
		["n"] = L_NOTES["Note: Torghast Lever"],
	},
}

e:RegisterEvent("UPDATE_MOUSEOVER_UNIT")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "UPDATE_MOUSEOVER_UNIT" then
		if HelpMePlayOptionsDB.Notes == false or HelpMePlayOptionsDB.Notes == nil then return end
		if UnitGUID("mouseover") then
			local guid = UnitGUID("mouseover")
			if guid then
				local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
				for nameOrId, data in pairs(creatureDb) do
					if nameOrId == npcId then
						local tooltipString = ""
						for i=1,GameTooltip:NumLines() do
							if string.find(_G[GameTooltip:GetName().."TextLeft"..i]:GetText(), addonName) then return end
						end
						if data.t == "note" then
							GameTooltip:AddLine("|cffFFFFFF" .. addonName .. "|r: " .. data.n)
							GameTooltip:Show()
						end
					end
				end
			end
		end
	end
end)