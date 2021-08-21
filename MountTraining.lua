local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L

e:RegisterEvent("TRAINER_SHOW")

e:SetScript("OnEvent", function(self, event, ...)
	if event == "TRAINER_SHOW" then
	
	end
end)