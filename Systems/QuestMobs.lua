local name, addon = ...
local e = CreateFrame("Frame")
local iconKey = name.."Icon"
local textKey = name.."Text"

local function UpdateNamePlate(plate)
	local icon = plate:CreateTexture(nil, "OVERLAY")
	local fontString = plate:CreateFontString(nil, "OVERLAY")
	
	fontString:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
	fontString:SetTextColor(1, 1, 1)
	
	if (HelpMePlayDB.QuestMobIconID > 0) then
		fontString:SetPoint("LEFT", icon, "RIGHT", 5, 0)
	else
		fontString:SetPoint("LEFT", icon, "RIGHT")
	end
	
	plate[iconKey] = icon
	plate[textKey] = fontString
	
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
					TooltipUtil.SurfaceArgs(line)
					
					if (line.leftText:match("(%d+)/(%d+)")) then -- Enemy counts toward a kill count
						local numDone, numRequired = line.leftText:match("(%d+)/(%d+)"); numDone = tonumber(numDone); numRequired = tonumber(numRequired)
						if (not (numDone == numRequired)) then -- The player still needs to kill the enemy
							criteria = criteria+(numRequired-numDone)
						end
					end
					
					if (line.leftText:match("(%d+)%%")) then -- Enemy counts toward a % progress bar
						local percent = line.leftText:match("(%d+)%%"); percent = tonumber(percent)
						if (not (percent == 100)) then
							percentCriteria = 100-percent
						end
					end
				end
				
				icon:ClearAllPoints()
				icon:SetSize(20, 20)
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
					icon:SetTexCoord(0.272461, 0.303711, 0.834961, 0.866211)
				elseif (HelpMePlayDB.QuestMobIconID == 1) then
					icon:SetTexture(HelpMePlayDB.QuestMobIcon)
				elseif (HelpMePlayDB.QuestMobIconID == 2) then
					icon:SetTexture("Interface\\Garrison\\MobileAppIcons")
					icon:SetTexCoord(0.381836, 0.506836, 0.254883, 0.379883)
				end
				
				if (percentCriteria ~= 0) then
					fontString:SetText(criteria.." - "..percentCriteria.."%")
				else
					fontString:SetText(criteria)
				end
				
				icon:Show()
			else
				if (plate[iconKey]) then
					plate[iconKey]:Hide()
					plate[iconKey] = nil
				end
				if (plate[textKey]) then
					plate[textKey] = nil
				end
			end
		end
	end
end

local function UpdateTextKey(plate)
	local unit = plate.namePlateUnitToken
	local criteria = 0
	if (not UnitIsPlayer(unit)) then
		if (C_QuestLog.UnitIsRelatedToActiveQuest(unit)) then
			local shouldAddIconToNamePlate = true
			local tooltipData = C_TooltipInfo.GetUnit(unit)
			
			for i=1,(#tooltipData.lines) do
				local line = tooltipData.lines[i]
				TooltipUtil.SurfaceArgs(line)
				
				if (line.leftText:match("(%d+)/(%d+)")) then -- Enemy counts toward a kill count
					local numDone, numRequired = line.leftText:match("(%d+)/(%d+)"); numDone = tonumber(numDone); numRequired = tonumber(numRequired)
					if (not (numDone == numRequired)) then -- The player still needs to kill the enemy
						criteria = criteria+(numRequired-numDone)
					else
						shouldAddIconToNamePlate = false
					end
				end
				
				if (line.leftText:match("(%d+)%%")) then -- Enemy counts toward a % progress bar
					local percent = line.leftText:match("(%d+)%%"); percent = tonumber(percent)
					if (not (percent == 100)) then
						criteria = criteria.." - "..(100-percent)
					else
						shouldAddIconToNamePlate = false
					end
				end
				
				if (plate[textKey]) then
					plate[textKey]:SetText(criteria)
				end
			end
		else
			if (plate[iconKey]) then
				plate[iconKey]:Hide()
				plate[iconKey] = nil
			end
			if (plate[textKey]) then
				plate[textKey]:Hide()
				plate[textKey] = nil
			end
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
		
        if (plate[iconKey]) then
            plate[iconKey]:Hide()
            plate[iconKey] = nil
        end
		if (plate[textKey]) then
			plate[textKey]:Hide()
			plate[textKey] = nil
		end
	end
	if (event == "UI_INFO_MESSAGE") then
		local _, message = ...
		if (message == "Objective Complete.") then
			local namePlates = C_NamePlate.GetNamePlates()
			for i = 1, #namePlates do
				local plate = C_NamePlate.GetNamePlateForUnit(namePlates[i].namePlateUnitToken)
				
				if (C_QuestLog.UnitIsRelatedToActiveQuest(namePlates[i].namePlateUnitToken) == false) then
					if (plate[iconKey]) then
						plate[iconKey]:Hide()
						plate[iconKey] = nil
					end
					if (plate[textKey]) then
						plate[textKey]:Hide()
						plate[textKey] = nil
					end
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
				if (plate[iconKey]) then
					plate[iconKey]:Hide()
					plate[iconKey] = nil
					
				end
				if (plate[textKey]) then
					plate[textKey]:Hide()
					plate[textKey] = nil
				end
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

