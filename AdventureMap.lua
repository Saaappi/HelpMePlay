local addonName, addonTable = ...
local e = CreateFrame("Frame")

e:RegisterEvent("ADVENTURE_MAP_OPEN")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "ADVENTURE_MAP_OPEN" then
		local mapID = C_AdventureMap.GetMapID()
		if mapID == 1011 then
			-- Player is in Zandalar (The Great Seal)
			C_AdventureMap.StartQuest(47514) -- Zuldazar
		end
	end
end)