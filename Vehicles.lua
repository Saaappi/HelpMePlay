local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("UNIT_ENTERED_VEHICLE")

local vehicles = {
	89619, -- Murky (Highmountain)
}

e:SetScript("OnEvent", function(self, event, ...)
	if event == "UNIT_ENTERED_VEHICLE" then
		local guid = ...
		if guid then
			local _, _, _, _, _, npcId = strsplit("-", guid); npcId = tonumber(npcId)
			if npcId then
				for _, id in ipairs(vehicles) do
					if id == npcId then
						OverrideActionBarLeaveFrameLeaveButton:Click()
						break
					end
				end
			end
		end
	end
end)