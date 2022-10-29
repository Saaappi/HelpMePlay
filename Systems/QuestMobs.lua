local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local tooltip = _G.CreateFrame("GameTooltip", "HMPQuestTooltip", nil, "GameTooltipTemplate")

local function AddIconToNameplate(unit)
	unit.questIcon = _G.CreateFrame("Frame", nil, unit)
	unit.questIcon:SetSize(20, 20)
	unit.questIcon:SetPoint("TOP", 0, 10)   

	unit.questIconTexture = unit.questIcon:CreateTexture(nil, "OVERLAY")                                   
	unit.questIconTexture:SetTexture("Interface\\Garrison\\MobileAppIcons")
	unit.questIconTexture:SetTexCoord(0.381836, 0.506836, 0.254883, 0.379883)
	unit.questIconTexture:SetAllPoints()
	
	unit.questIcon:Show()
end

hooksecurefunc("CompactUnitFrame_UpdateName", function(frame)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
	
	local GUID = UnitGUID(frame.unit)
	local fType = string.split("-", GUID)
	if fType ~= "Player" then
		tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
		tooltip:SetHyperlink("unit:" .. GUID)
		for i = 3, tooltip:NumLines() do
			local line = _G["HMPQuestTooltipTextLeft"..i]
			local text = line:GetText()
			if string.find(text, "\%\)") or string.find(text, "%d\/%d") then
				AddIconToNameplate(frame)
			end
		end
	end
end)

hooksecurefunc(NamePlateDriverFrame, "OnNamePlateRemoved", function(base)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
	
	base.UnitFrame.questIcon:Hide()
	base.UnitFrame.questIconTexture = nil
	base.UnitFrame.questIcon = nil
	for k,v in pairs(base.UnitFrame) do
		print(k)
	end
end)

