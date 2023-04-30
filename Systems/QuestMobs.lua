local addonName, addonTable = ...
local e = CreateFrame("Frame")
local iconKey = addonName .. "Icon"
local textKey = addonName .. "Text"

local function UpdateNamePlate(namePlate, unit)
	local tooltipData = C_TooltipInfo.GetUnit(unit)
	local icon = namePlate:CreateTexture(nil, "OVERLAY")
	local fontString = namePlate:CreateFontString(nil, "OVERLAY")
	
	fontString:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
	fontString:SetTextColor(1, 1, 1)
	
	if (HelpMePlayDB.QuestMobIconID > 0) then
		fontString:SetPoint("LEFT", icon, "RIGHT", 5, 0)
	else
		fontString:SetPoint("LEFT", icon, "RIGHT")
	end
	
	namePlate[iconKey] = icon
	namePlate[textKey] = fontString
	
	if (not UnitIsPlayer(unit)) then
		for i = 3, #tooltipData.lines do
			local line = tooltipData.lines[i]
			TooltipUtil.SurfaceArgs(line)
			
			if (line.id) then
				local text = GetQuestObjectiveInfo(line.id, 1, false)
				if (text:match("(%d+)%%")) or (text:match("(%d+)/(%d+)")) then
					local continue = true
					local minProgress, maxProgress = text:match("(%d+)/(%d+)")
					local percentProgress = text:match("(%d+)%%")
					if (minProgress) and (maxProgress) then
						minProgress = tonumber(minProgress)
						maxProgress = tonumber(maxProgress)
						if (minProgress == maxProgress) then
							continue = false
						end
					end
					
					if (percentProgress) then
						percentProgress = tonumber(percentProgress)
						if (percentProgress == 100) then
							continue = false
						end
					end
					
					if (continue) then
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
						
						fontString:SetText(maxProgress - minProgress)
						
						icon:Show()
						return
					end
				end
			end
		end
	end
	if (icon) then
		icon:Hide()
	end
end

local function UpdateTextKey(namePlate)
	local tooltipData = C_TooltipInfo.GetUnit(namePlate)
	for i = 3, #tooltipData.lines do
		local line = tooltipData.lines[i]
		TooltipUtil.SurfaceArgs(line)
		
		local plate = C_NamePlate.GetNamePlateForUnit(namePlate)
		if (line.id) then
			local text = GetQuestObjectiveInfo(line.id, 1, false)
			if (text:match("(%d+)%%")) or (text:match("(%d+)/(%d+)")) then
				local continue = true
				local minProgress, maxProgress = text:match("(%d+)/(%d+)")
				local percentProgress = text:match("(%d+)%%")
				if (minProgress) and (maxProgress) then
					minProgress = tonumber(minProgress)
					maxProgress = tonumber(maxProgress)
					if (minProgress == maxProgress) then
						continue = false
					end
				end
				
				if (percentProgress) then
					percentProgress = tonumber(percentProgress)
					if (percentProgress == 100) then
						continue = false
					end
				end
				
				if (continue) then
					if (plate[textKey]) then
						if (minProgress) and (maxProgress) then
							plate[textKey]:SetText(maxProgress - minProgress)
						elseif (percentProgress) and (percentProgress < 100) then
							plate[textKey]:SetText(percentProgress .. "%")
						end
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
e:RegisterEvent("UNIT_QUEST_LOG_CHANGED")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "NAME_PLATE_UNIT_ADDED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
		
		local unit = ...
		local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
		
		UpdateNamePlate(namePlate, unit)
	end
	if event == "NAME_PLATE_UNIT_REMOVED" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.QuestMobsEnabled == false or HelpMePlayDB.QuestMobsEnabled == nil then return false end
		
		local unit = ...
		local namePlate = C_NamePlate.GetNamePlateForUnit(unit)
		
        if (namePlate[iconKey]) then
            namePlate[iconKey]:Hide()
        end
		if (namePlate[textKey]) then
			namePlate[textKey]:Hide()
		end
	end
	if (event == "UI_INFO_MESSAGE") then
		local _, message = ...
		if (message == "Objective Complete.") then
			local namePlates = C_NamePlate.GetNamePlates()
			for i = 1, #namePlates do
				local namePlate = C_NamePlate.GetNamePlateForUnit(namePlates[i].namePlateUnitToken)
				
				if (C_QuestLog.UnitIsRelatedToActiveQuest(namePlates[i].namePlateUnitToken) == false) then
					if (namePlate[iconKey]) then
						namePlate[iconKey]:Hide()
					end
					if (namePlate[textKey]) then
						namePlate[textKey]:Hide()
					end
				end
			end
		end
	end
	if (event == "QUEST_ACCEPTED") then
		local namePlates = C_NamePlate.GetNamePlates()
		for i = 1, #namePlates do
			local namePlate = C_NamePlate.GetNamePlateForUnit(namePlates[i].namePlateUnitToken)
			UpdateNamePlate(namePlate, namePlates[i].namePlateUnitToken)
		end
	end
	if (event == "QUEST_REMOVED") then
		local namePlates = C_NamePlate.GetNamePlates()
		for i = 1, #namePlates do
			local namePlate = C_NamePlate.GetNamePlateForUnit(namePlates[i].namePlateUnitToken)
			
			if (C_QuestLog.UnitIsRelatedToActiveQuest(namePlates[i].namePlateUnitToken) == false) then
				if (namePlate[iconKey]) then
					namePlate[iconKey]:Hide()
					
				end
				if (namePlate[textKey]) then
					namePlate[textKey]:Hide()
				end
			end
		end
	end
	if (event == "UNIT_QUEST_LOG_CHANGED") then
		local namePlates = C_NamePlate.GetNamePlates()
		for i = 1, #namePlates do
			UpdateTextKey(namePlates[i].namePlateUnitToken)
		end
	end
end)

