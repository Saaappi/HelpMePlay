local name, addon = ...
local e = CreateFrame("Frame")

local function UpdateNamePlate(plate)
	local icon = plate:CreateTexture(nil, "OVERLAY")
	local fontString = plate:CreateFontString(nil, "OVERLAY")
	
	fontString:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
	fontString:SetTextColor(1, 1, 1)
	
	local plateHorizontalScale = C_CVar.GetCVar("NamePlateHorizontalScale")
	if (plateHorizontalScale == "1") then
		fontString:SetPoint("LEFT", plate, "RIGHT", 0, -5)
	else
		fontString:SetPoint("LEFT", plate, "RIGHT")
	end
	
	plate[name.."Icon"] = icon
	plate[name.."Text"] = fontString
	
	local unit = plate.namePlateUnitToken
	local criteria = 0
	local percentCriteria = 0
	if (unit) then
		if (not UnitIsPlayer(unit)) then
			if (C_QuestLog.UnitIsRelatedToActiveQuest(unit)) then
				local shouldAddIconToNamePlate = true
				local tooltipData = C_TooltipInfo.GetUnit(unit)
				for i=1,(#tooltipData.lines) do
					local line = tooltipData.lines[i]
					if (line.leftText:match("(%d+)/(%d+)")) then
						local numDone, numRequired = line.leftText:match("(%d+)/(%d+)"); numDone = tonumber(numDone); numRequired = tonumber(numRequired)
						if (not (numDone == numRequired)) then
							criteria = criteria+(numRequired-numDone)
						end
					end
					if (line.leftText:match("(%d+)%%")) then
						local percent = line.leftText:match("(%d+)%%"); percent = tonumber(percent)
						if (not (percent == 100)) then
							percentCriteria = 100-percent
						end
					end
				end
				
				icon:ClearAllPoints()
				icon:SetSize(16, 16)
				if (HelpMePlayDB.QuestMobIconPosition == 0) then
					icon:SetPoint("TOP", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
				elseif (HelpMePlayDB.QuestMobIconPosition == 1) then
					icon:SetPoint("BOTTOM", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
				elseif (HelpMePlayDB.QuestMobIconPosition == 2) then
					icon:SetPoint("LEFT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
				elseif (HelpMePlayDB.QuestMobIconPosition == 3) then
					icon:SetPoint("RIGHT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
				elseif (HelpMePlayDB.QuestMobIconPosition == 4) then
					icon:SetPoint("TOPLEFT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
				elseif (HelpMePlayDB.QuestMobIconPosition == 5) then
					icon:SetPoint("TOPRIGHT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
				elseif (HelpMePlayDB.QuestMobIconPosition == 6) then
					icon:SetPoint("BOTTOMLEFT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
				elseif (HelpMePlayDB.QuestMobIconPosition == 7) then
					icon:SetPoint("BOTTOMRIGHT", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
				elseif (HelpMePlayDB.QuestMobIconPosition == 8) then
					icon:SetPoint("CENTER", HelpMePlayDB.QuestMobIconXOffset, HelpMePlayDB.QuestMobIconYOffset)
				end
				if (HelpMePlayDB.QuestMobIconID == 0) then
					icon:SetTexture("Interface\\Minimap\\ObjectIconsAtlas")
					icon:SetTexCoord(0.3046875, 0.3359375, 0.875, 0.90625)
				elseif (HelpMePlayDB.QuestMobIconID == 1) then
					icon:SetTexture(HelpMePlayDB.QuestMobIcon)
				elseif (HelpMePlayDB.QuestMobIconID == 2) then
					icon:SetTexture("Interface\\Garrison\\MobileAppIcons")
					icon:SetTexCoord(0.3818359375, 0.5068359375, 0.2548828125, 0.3798828125)
				end
				if (percentCriteria ~= 0) then
					fontString:SetText(criteria.." - "..percentCriteria.."%")
				else
					fontString:SetText(criteria)
				end
				icon:Show()
			else
				plate[name.."Icon"]:Hide()
				plate[name.."Text"]:Hide()
			end
		end
	end
end

local function UpdateTextKey(plate)
	local unit = plate.namePlateUnitToken
	local criteria = 0
	local percentCriteria = 0
	if (not UnitIsPlayer(unit)) then
		if (C_QuestLog.UnitIsRelatedToActiveQuest(unit)) then
			if (plate[name.."Text"]) then
				plate[name.."Text"]:Hide()
				
				local shouldAddIconToNamePlate = true
				local tooltipData = C_TooltipInfo.GetUnit(unit)
				for i=1,(#tooltipData.lines) do
					local line = tooltipData.lines[i]
					if (line.leftText:match("(%d+)/(%d+)")) then
						local numDone, numRequired = line.leftText:match("(%d+)/(%d+)"); numDone = tonumber(numDone); numRequired = tonumber(numRequired)
						if (not (numDone == numRequired)) then
							criteria = criteria+(numRequired-numDone)
						end
					end
					if (line.leftText:match("(%d+)%%")) then
						local percent = line.leftText:match("(%d+)%%"); percent = tonumber(percent)
						if (not (percent == 100)) then
							percentCriteria = 100-percent
						end
					end
					if (percentCriteria ~= 0) then
						plate[name.."Text"]:SetText(criteria.." - "..percentCriteria.."%")
					else
						plate[name.."Text"]:SetText(criteria)
					end
				end
				
				plate[name.."Text"]:Show()
			end
		else
			plate[name.."Icon"]:Hide()
			plate[name.."Text"]:Hide()
		end
	end
end

e:RegisterEvent("NAME_PLATE_UNIT_ADDED")
e:RegisterEvent("NAME_PLATE_UNIT_REMOVED")
e:RegisterEvent("UI_INFO_MESSAGE")
e:RegisterEvent("QUEST_ACCEPTED")
e:RegisterEvent("QUEST_REMOVED")
e:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "NAME_PLATE_UNIT_ADDED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
		
		local unit = ...
		local plate = C_NamePlate.GetNamePlateForUnit(unit)
		C_Timer.After(0.25, function()
			UpdateNamePlate(plate)
		end)
	end
	if event == "NAME_PLATE_UNIT_REMOVED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
		
		local unit = ...
		local plate = C_NamePlate.GetNamePlateForUnit(unit)
        
		plate[name.."Icon"]:Hide()
		plate[name.."Text"]:Hide()
	end
	if (event == "UI_INFO_MESSAGE") then
		local _, message = ...
		if (message == "Objective Complete.") then
			local namePlates = C_NamePlate.GetNamePlates()
			for i = 1, #namePlates do
				local plate = C_NamePlate.GetNamePlateForUnit(namePlates[i].namePlateUnitToken)
				if (C_QuestLog.UnitIsRelatedToActiveQuest(namePlates[i].namePlateUnitToken) == false) then
					plate[name.."Icon"]:Hide()
					plate[name.."Text"]:Hide()
				end
			end
		end
	end
	if (event == "QUEST_ACCEPTED") then
		local namePlates = C_NamePlate.GetNamePlates()
		for i = 1, #namePlates do
			local plate = C_NamePlate.GetNamePlateForUnit(namePlates[i].namePlateUnitToken)
			UpdateNamePlate(plate)
		end
	end
	if (event == "QUEST_REMOVED") then
		local namePlates = C_NamePlate.GetNamePlates()
		for i = 1, #namePlates do
			local plate = C_NamePlate.GetNamePlateForUnit(namePlates[i].namePlateUnitToken)
			if (C_QuestLog.UnitIsRelatedToActiveQuest(namePlates[i].namePlateUnitToken) == false) then
				plate[name.."Icon"]:Hide()
				plate[name.."Text"]:Hide()
			end
		end
	end
	if (event == "UNIT_QUEST_LOG_CHANGED") then
		local namePlates = C_NamePlate.GetNamePlates()
		for i = 1, #namePlates do
			local plate = C_NamePlate.GetNamePlateForUnit(namePlates[i].namePlateUnitToken)
			UpdateTextKey(plate)
		end
	end
end)

