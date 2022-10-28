local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local tooltip = _G.CreateFrame("GameTooltip", "HMPQuestTooltip", nil, "GameTooltipTemplate")

local function AddIconToNameplate(unit)
	unit.questIcon = _G.CreateFrame("Frame", nil, unit)
	unit.questIcon:SetSize(16, 16)
	unit.questIcon:SetPoint("TOP", 0, 10)   

	unit.questIconTexture = unit.questIcon:CreateTexture(nil, "OVERLAY")                                   
	unit.questIconTexture:SetTexture("Interface\\Garrison\\MobileAppIcons")
	unit.questIconTexture:SetTexCoord(0.381836, 0.506836, 0.254883, 0.379883)
	unit.questIconTexture:SetAllPoints()
	
	unit.questIcon:Show()
end

local function RemoveIconFromNameplate(unit)
	unit.questIcon:Hide()
end

hooksecurefunc(NamePlateDriverFrame, "OnNamePlateCreated", function(base)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
	
	if base.UnitFrame then
		local unitFrame = base.UnitFrame
		if unitFrame.unit then
			if not UnitIsPlayer(unitFrame.unit) then
				tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
				tooltip:SetHyperlink("unit:" .. UnitGUID(base.UnitFrame.unit))
				for i = 3, tooltip:NumLines() do
					local line = _G["HMPQuestTooltipTextLeft" .. i]
					local text = line:GetText()
					local unitIsForQuest = string.match(text, "\%\)$") or string.match(text, "^[%d](\/)[%d]")
					if unitIsForQuest then
						AddIconToNameplate(base.UnitFrame)
					end
				end
			end
		end
	end
end)

hooksecurefunc(NamePlateDriverFrame, "OnNamePlateAdded", function(base)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
	
	if base.UnitFrame then
		local unitFrame = base.UnitFrame
		if unitFrame.unit then
			if not UnitIsPlayer(unitFrame.unit) then
				tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
				tooltip:SetHyperlink("unit:" .. UnitGUID(base.UnitFrame.unit))
				for i = 3, tooltip:NumLines() do
					local line = _G["HMPQuestTooltipTextLeft" .. i]
					local text = line:GetText()
					local unitIsForQuest = string.match(text, "\%\)$") or string.match(text, "^[%d](\/)[%d]")
					if unitIsForQuest then
						AddIconToNameplate(base.UnitFrame)
					end
				end
			end
		end
	end
end)

hooksecurefunc(NamePlateDriverFrame, "OnNamePlateRemoved", function(base)
	if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
	if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
	
	if base.UnitFrame then
		local unitFrame = base.UnitFrame
		if unitFrame.unit then
			if not UnitIsPlayer(unitFrame.unit) then
				tooltip:SetOwner(WorldFrame, "ANCHOR_NONE")
				tooltip:SetHyperlink("unit:" .. UnitGUID(base.UnitFrame.unit))
				for i = 3, tooltip:NumLines() do
					local line = _G["HMPQuestTooltipTextLeft" .. i]
					local text = line:GetText()
					local unitIsForQuest = string.match(text, "\%\)$") or string.match(text, "^[%d](\/)[%d]")
					if unitIsForQuest then
						RemoveIconFromNameplate(base.UnitFrame)
					end
				end
			end
		end
	end
end)