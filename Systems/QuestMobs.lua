local addonName, addon = ...
local e = CreateFrame("Frame")
local fontStrings = {}
local positions = {
	[0] = "TOP",
	[1] = "BOTTOM",
	[2] = "LEFT",
	[3] = "RIGHT",
	[4] = "TOPLEFT",
	[5] = "TOPRIGHT",
	[6] = "BOTTOMLEFT",
	[7] = "BOTTOMRIGHT",
	[8] = "CENTER",
}

local function GetCriteria(plate)
	local killCollectCriteriaText, percentCriteriaText = 0, 0
	local unit = plate.namePlateUnitToken
	local tooltipData = C_TooltipInfo.GetUnit(unit)
	for i=1,#tooltipData.lines do
		local line = tooltipData.lines[i]
		if (line.leftText:match("(%d+)/(%d+)")) then
			local numDone, numRequired = line.leftText:match("(%d+)/(%d+)"); numDone = tonumber(numDone); numRequired = tonumber(numRequired)
			if (not (numDone == numRequired)) then
				killCollectCriteriaText = killCollectCriteriaText+(numRequired-numDone)
			end
		end
		if (line.leftText:match("(%d+)%%")) then
			local percent = line.leftText:match("(%d+)%%"); percent = tonumber(percent)
			if (not (percent == 100)) then
				percentCriteriaText = 100-percent
			end
		end
	end
	return killCollectCriteriaText, percentCriteriaText
end

local function Wipe()
	local plates = C_NamePlate.GetNamePlates()
	for i=1,#plates do
		local plate = C_NamePlate.GetNamePlateForUnit(plates[i].namePlateUnitToken)
		if (plate[addonName.."Icon"]) then
			plate[addonName.."Icon"]:Hide()
		end
		if (plate[addonName.."Text"]) then
			plate[addonName.."Text"]:Hide()
		end
	end
end

function HelpMePlay:UpdateNamePlate(plate)
	local unit = plate.namePlateUnitToken
	if (unit) then
		if (not UnitIsPlayer(unit)) then
			if (C_QuestLog.UnitIsRelatedToActiveQuest(unit)) then
				local killCollectCriteriaText, percentCriteriaText = GetCriteria(plate)
				local hmpIcon, hmpText = "", ""
				if (not fontStrings[unit]) then
					hmpIcon = plate:CreateTexture(nil, "OVERLAY")
					hmpText = plate:CreateFontString(nil, "OVERLAY")
					
					hmpText:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
					hmpText:SetTextColor(1, 1, 1)
					
					if (HelpMePlayDB.QuestMobCriteriaPosition == 0) then
						hmpText:SetPoint("BOTTOM", plate, "TOP", HelpMePlayDB.QuestMobCriteriaXOffset, HelpMePlayDB.QuestMobCriteriaYOffset)
					elseif (HelpMePlayDB.QuestMobCriteriaPosition == 1) then
						hmpText:SetPoint("TOP", plate, "BOTTOM", HelpMePlayDB.QuestMobCriteriaXOffset, HelpMePlayDB.QuestMobCriteriaYOffset)
					elseif (HelpMePlayDB.QuestMobCriteriaPosition == 2) then
						hmpText:SetPoint("RIGHT", plate, "LEFT", HelpMePlayDB.QuestMobCriteriaXOffset, HelpMePlayDB.QuestMobCriteriaYOffset)
					elseif (HelpMePlayDB.QuestMobCriteriaPosition == 3) then
						hmpText:SetPoint("LEFT", plate, "RIGHT", HelpMePlayDB.QuestMobCriteriaXOffset, HelpMePlayDB.QuestMobCriteriaYOffset)
					elseif (HelpMePlayDB.QuestMobCriteriaPosition == 4) then
						hmpText:SetPoint("BOTTOMRIGHT", plate, "TOPLEFT", HelpMePlayDB.QuestMobCriteriaXOffset, HelpMePlayDB.QuestMobCriteriaYOffset)
					elseif (HelpMePlayDB.QuestMobCriteriaPosition == 5) then
						hmpText:SetPoint("BOTTOMLEFT", plate, "TOPRIGHT", HelpMePlayDB.QuestMobCriteriaXOffset, HelpMePlayDB.QuestMobCriteriaYOffset)
					elseif (HelpMePlayDB.QuestMobCriteriaPosition == 6) then
						hmpText:SetPoint("TOPRIGHT", plate, "BOTTOMLEFT", HelpMePlayDB.QuestMobCriteriaXOffset, HelpMePlayDB.QuestMobCriteriaYOffset)
					elseif (HelpMePlayDB.QuestMobCriteriaPosition == 7) then
						hmpText:SetPoint("TOPLEFT", plate, "BOTTOMRIGHT", HelpMePlayDB.QuestMobCriteriaXOffset, HelpMePlayDB.QuestMobCriteriaYOffset)
					elseif (HelpMePlayDB.QuestMobCriteriaPosition == 8) then
						hmpText:SetPoint("CENTER", plate, "CENTER", HelpMePlayDB.QuestMobCriteriaXOffset, HelpMePlayDB.QuestMobCriteriaYOffset)
					end
					
					plate[addonName.."Icon"] = hmpIcon
					plate[addonName.."Text"] = hmpText
					
					hmpIcon:ClearAllPoints()
					hmpIcon:SetSize(16, 16)
					
					if (HelpMePlayDB.QuestMobIconPosition == 0) then
						hmpIcon:SetPoint("BOTTOM", plate, "TOP", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif (HelpMePlayDB.QuestMobIconPosition == 1) then
						hmpIcon:SetPoint("TOP", plate, "CENTER", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif (HelpMePlayDB.QuestMobIconPosition == 2) then
						hmpIcon:SetPoint("RIGHT", plate, "LEFT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif (HelpMePlayDB.QuestMobIconPosition == 3) then
						hmpIcon:SetPoint("LEFT", plate, "RIGHT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif (HelpMePlayDB.QuestMobIconPosition == 4) then
						hmpIcon:SetPoint("BOTTOMRIGHT", plate, "TOPLEFT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif (HelpMePlayDB.QuestMobIconPosition == 5) then
						hmpIcon:SetPoint("BOTTOMLEFT", plate, "TOPRIGHT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif (HelpMePlayDB.QuestMobIconPosition == 6) then
						hmpIcon:SetPoint("TOPRIGHT", plate, "BOTTOMLEFT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif (HelpMePlayDB.QuestMobIconPosition == 7) then
						hmpIcon:SetPoint("TOPLEFT", plate, "BOTTOMRIGHT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					elseif (HelpMePlayDB.QuestMobIconPosition == 8) then
						hmpIcon:SetPoint("CENTER", plate, "CENTER", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
					end

					if (HelpMePlayDB.QuestMobIconID == 0) then
						hmpIcon:SetTexture("Interface\\Minimap\\ObjectIconsAtlas")
						hmpIcon:SetTexCoord(0.3046875, 0.3359375, 0.875, 0.90625)
					elseif (HelpMePlayDB.QuestMobIconID == 1) then
						hmpIcon:SetTexture(HelpMePlayDB.QuestMobIcon)
					elseif (HelpMePlayDB.QuestMobIconID == 2) then
						hmpIcon:SetTexture("Interface\\Garrison\\MobileAppIcons")
						hmpIcon:SetTexCoord(0.3818359375, 0.5068359375, 0.2548828125, 0.3798828125)
					end
					
					if (percentCriteriaText) and (percentCriteriaText ~= 0) then
						hmpText:SetText(killCollectCriteriaText.." - "..percentCriteriaText.."%")
					else
						hmpText:SetText(killCollectCriteriaText)
					end
					fontStrings[unit] = true
				else
					if (percentCriteriaText) and (percentCriteriaText ~= 0) then
						plate[addonName.."Text"]:SetText(killCollectCriteriaText.." - "..percentCriteriaText.."%")
					else
						plate[addonName.."Text"]:SetText(killCollectCriteriaText)
					end
				end
			end
		end
	end
end

e:RegisterEvent("NAME_PLATE_UNIT_ADDED")
e:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
e:RegisterEvent("UI_INFO_MESSAGE")
e:RegisterEvent("QUEST_ACCEPTED")
e:RegisterEvent("QUEST_REMOVED")
e:RegisterEvent("QUEST_TURNED_IN")
e:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "NAME_PLATE_UNIT_ADDED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
		
		local unit = ...
		local plate = C_NamePlate.GetNamePlateForUnit(unit)
		C_Timer.After(0.10, function()
			HelpMePlay:UpdateNamePlate(plate)
		end)
	end
	if event == "NAME_PLATE_UNIT_REMOVED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
		
		local unit = ...
		local plate = C_NamePlate.GetNamePlateForUnit(unit)
        
		if (plate[addonName.."Icon"]) then
			plate[addonName.."Icon"]:Hide()
		end
		if (plate[addonName.."Text"]) then
			fontStrings[unit] = nil
			plate[addonName.."Text"]:Hide()
		end
	end
	if (event == "UI_INFO_MESSAGE") then
		local _, message = ...
		if (message == "Objective Complete.") then
			Wipe()
		end
	end
	if (event == "QUEST_ACCEPTED") then
		local plates = C_NamePlate.GetNamePlates()
		for i=1,#plates do
			local plate = C_NamePlate.GetNamePlateForUnit(plates[i].namePlateUnitToken)
			HelpMePlay:UpdateNamePlate(plate)
		end
	end
	if (event == "QUEST_REMOVED") or (event == "QUEST_TURNED_IN") then
		Wipe()
	end
	if (event == "UNIT_QUEST_LOG_CHANGED") then
		local plates = C_NamePlate.GetNamePlates()
		for i=1,#plates do
			local plate = C_NamePlate.GetNamePlateForUnit(plates[i].namePlateUnitToken)
			HelpMePlay:UpdateNamePlate(plate)
		end
	end
end)

